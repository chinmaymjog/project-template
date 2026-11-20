#!/usr/bin/env bash
# Applies the standard GitHub settings to a repository created from this
# template: secret scanning with push protection, Dependabot alerts, private
# vulnerability reporting, read-only workflow tokens, fork PR approval, the
# `agent` environment (you as the only reviewer) and a protect-main ruleset.
# Run it once, as the repo owner. Safe to re-run.
#
#   scripts/bootstrap-repo.sh <owner/repo> [required-check ...]
#   DRY_RUN=1 scripts/bootstrap-repo.sh <owner/repo>    # print the calls only
#
# Required checks default to "test" and "Gitleaks" (the job names in ci.yml and
# secret-scan.yml). Pass your own to replace them. Environments and rulesets need
# a public repo or a plan that supports them; unsupported steps are reported and
# skipped. Secrets (CLAUDE_CODE_OAUTH_TOKEN) are never set here.
set -euo pipefail

repo="${1:?usage: scripts/bootstrap-repo.sh <owner/repo> [required-check ...]}"
shift
checks=("$@")
[ "${#checks[@]}" -gt 0 ] || checks=(test Gitleaks)
owner="${repo%%/*}"

command -v jq >/dev/null || { echo "jq is required" >&2; exit 1; }
if [ "${DRY_RUN:-0}" = "1" ]; then
  gh() { printf '+ gh %s\n' "$*" >&2; }
fi

step() { # description, command...
  desc="$1"; shift
  if [ "${DRY_RUN:-0}" = "1" ]; then echo "dry-run  $desc"; "$@" || true; [ -t 0 ] || cat; return 0; fi
  if "$@" >/dev/null 2>&1; then echo "ok       $desc"; else echo "skipped  $desc (no permission, or not supported on this plan)"; fi
}

step "repo settings and secret scanning with push protection" \
  gh api -X PATCH "repos/$repo" \
    -F delete_branch_on_merge=true -F has_wiki=false -F allow_auto_merge=false \
    -f 'security_and_analysis[secret_scanning][status]=enabled' \
    -f 'security_and_analysis[secret_scanning_push_protection][status]=enabled' \
    -f 'security_and_analysis[dependabot_security_updates][status]=enabled'
step "Dependabot alerts" gh api -X PUT "repos/$repo/vulnerability-alerts"
step "private vulnerability reporting" gh api -X PUT "repos/$repo/private-vulnerability-reporting"
step "read-only workflow token, no PR approval by workflows" \
  gh api -X PUT "repos/$repo/actions/permissions/workflow" \
    -f default_workflow_permissions=read -F can_approve_pull_request_reviews=false
step "approval required for workflows from outside contributors" \
  gh api -X PUT "repos/$repo/actions/permissions/fork-pr-contributor-approval" \
    -f approval_policy=all_external_contributors

if [ "${DRY_RUN:-0}" = "1" ]; then owner_id=0; else owner_id="$(gh api "users/$owner" -q .id)"; fi

jq -n --argjson id "$owner_id" \
  '{reviewers:[{type:"User",id:$id}],prevent_self_review:false,deployment_branch_policy:null}' |
  step "agent environment, $owner as required reviewer" \
    gh api -X PUT "repos/$repo/environments/agent" --input -

# Same ruleset as the other repos: pull request required (no approval count, so
# you can merge your own), conversations resolved, required checks, and no
# deletion or force-push of the default branch.
ruleset="$(printf '%s\n' "${checks[@]}" | jq -R '{context:.}' | jq -s '
  {name:"protect-main",target:"branch",enforcement:"active",bypass_actors:[],
   conditions:{ref_name:{include:["~DEFAULT_BRANCH"],exclude:[]}},
   rules:[
     {type:"deletion"},
     {type:"non_fast_forward"},
     {type:"pull_request",parameters:{
        required_approving_review_count:0,dismiss_stale_reviews_on_push:true,
        require_code_owner_review:false,require_last_push_approval:false,
        required_review_thread_resolution:true,
        allowed_merge_methods:["merge","squash","rebase"]}},
     {type:"required_status_checks",parameters:{
        strict_required_status_checks_policy:false,do_not_enforce_on_create:false,
        required_status_checks:.}}]}')"
if [ "${DRY_RUN:-0}" = "1" ]; then existing=""; else
  existing="$(gh api "repos/$repo/rulesets" -q '.[] | select(.name=="protect-main") | .id' 2>/dev/null || true)"
fi
if [ -n "$existing" ]; then
  printf '%s\n' "$ruleset" | step "protect-main ruleset (updated)" gh api -X PUT "repos/$repo/rulesets/$existing" --input -
else
  printf '%s\n' "$ruleset" | step "protect-main ruleset (created)" gh api -X POST "repos/$repo/rulesets" --input -
fi

cat <<NEXT

Still to do by hand:
  - gh secret set CLAUDE_CODE_OAUTH_TOKEN --env agent -R $repo   (only if you use the agent)
  - install the Renovate app on the repo
  - replace OWNER/REPO in SECURITY.md, then follow SETUP.md
NEXT
