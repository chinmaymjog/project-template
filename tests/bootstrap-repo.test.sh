#!/usr/bin/env bash
# Runs scripts/bootstrap-repo.sh against a stub `gh` that records its calls and
# request bodies, and checks what would be applied. Touches no real repository.
set -uo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
mkdir "$work/bin"

cat > "$work/bin/gh" <<'STUB'
#!/usr/bin/env bash
echo "gh $*" >> "$STUB_LOG"
case "$*" in
  *"--input -"*) n=$(wc -l < "$STUB_LOG"); cat > "$STUB_BODIES/$n.json" ;;
esac
case "$*" in
  "api users/"*) echo 4242 ;;
  "api repos/o/r/rulesets -q"*) [ -n "${STUB_EXISTING_RULESET:-}" ] && echo "$STUB_EXISTING_RULESET" ;;
esac
case "$*" in *private-vulnerability-reporting*) [ -n "${STUB_FAIL_PVR:-}" ] && exit 1 ;; esac
exit 0
STUB
chmod +x "$work/bin/gh"
export PATH="$work/bin:$PATH" STUB_LOG="$work/calls.log" STUB_BODIES="$work/bodies"
mkdir "$work/bodies"

fails=0
ok()  { echo "ok   $1"; }
bad() { echo "FAIL $1"; fails=$((fails + 1)); }
reset() { : > "$STUB_LOG"; rm -f "$work"/bodies/*; }
body_of() { f="$(grep -l "$1" "$work"/bodies/*.json 2>/dev/null | head -1)"; cat "${f:-/dev/null}"; }

reset; out="$("$root/scripts/bootstrap-repo.sh" o/r 2>&1)"
grep -q 'secret_scanning_push_protection\]\[status\]=enabled' "$STUB_LOG" && ok "push protection enabled" || bad "push protection"
grep -q 'vulnerability-alerts' "$STUB_LOG" && ok "Dependabot alerts enabled" || bad "Dependabot alerts"
grep -q 'default_workflow_permissions=read' "$STUB_LOG" && ok "read-only workflow token" || bad "workflow token"
grep -q 'approval_policy=all_external_contributors' "$STUB_LOG" && ok "fork PR approval" || bad "fork approval"
env_body="$(body_of reviewers)"
[ "$(echo "$env_body" | jq -r '.reviewers[0].id')" = 4242 ] && ok "agent environment has the owner as reviewer" || bad "environment reviewer"
rs="$(body_of protect-main)"
[ "$(echo "$rs" | jq -r '.name')" = protect-main ] && ok "ruleset created" || bad "ruleset body"
echo "$rs" | jq -e '[.rules[].type] | contains(["deletion","non_fast_forward","pull_request","required_status_checks"])' >/dev/null && ok "ruleset blocks deletion and force-push, requires PR and checks" || bad "ruleset rules"
[ "$(echo "$rs" | jq -c '[.rules[] | select(.type=="required_status_checks") | .parameters.required_status_checks[].context]')" = '["test","Gitleaks"]' ] && ok "default required checks" || bad "default checks"
[ "$(echo "$rs" | jq -r '.bypass_actors | length')" = 0 ] && ok "no bypass actors" || bad "bypass actors"
bad_calls="$(grep -vE 'repos/o/r|users/o' "$STUB_LOG" || true)"
[ -z "$bad_calls" ] && ok "only the named repo is touched" || bad "unexpected calls: $bad_calls"
echo "$out" | grep -q "CLAUDE_CODE_OAUTH_TOKEN" && ok "token is left to the user" || bad "next steps missing"
! grep -q "secret set" "$STUB_LOG" && ok "no secret is ever set" || bad "a secret was set"

reset; "$root/scripts/bootstrap-repo.sh" o/r ci build >/dev/null 2>&1
[ "$(body_of protect-main | jq -c '[.rules[] | select(.type=="required_status_checks") | .parameters.required_status_checks[].context]')" = '["ci","build"]' ] && ok "custom required checks" || bad "custom checks"

reset; STUB_EXISTING_RULESET=99 "$root/scripts/bootstrap-repo.sh" o/r >/dev/null 2>&1
grep -q 'api -X PUT repos/o/r/rulesets/99' "$STUB_LOG" && ok "existing ruleset is updated, not duplicated" || bad "ruleset update"

reset; out="$(STUB_FAIL_PVR=1 "$root/scripts/bootstrap-repo.sh" o/r 2>&1)"; rc=$?
[ "$rc" = 0 ] && echo "$out" | grep -q "skipped  private vulnerability reporting" && grep -q 'rulesets' "$STUB_LOG" && ok "a failing step is reported and the rest still runs" || bad "failure handling"

"$root/scripts/bootstrap-repo.sh" >/dev/null 2>&1 && bad "missing argument accepted" || ok "repo argument is required"

[ "$fails" = 0 ] && echo "OK: all checks passed" || { echo "$fails check(s) failed"; exit 1; }
