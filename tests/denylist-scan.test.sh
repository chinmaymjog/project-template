#!/usr/bin/env bash
# Tests the scan script embedded in .github/workflows/denylist-scan-reusable.yml
# with a made-up pattern in throwaway git repos. Also checks that a match is never
# printed. Needs only git, bash, awk and grep.
set -uo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
awk '/# --- begin script/{f=1;next} /# --- end script/{f=0} f' \
  "$root/.github/workflows/denylist-scan-reusable.yml" | sed 's/^          //' > "$work/scan.sh"
[ -s "$work/scan.sh" ] || { echo "FAIL: could not extract the script"; exit 1; }

WORD="zzforbidden"
export GIT_AUTHOR_NAME=t GIT_AUTHOR_EMAIL=t@example.invalid GIT_COMMITTER_NAME=t GIT_COMMITTER_EMAIL=t@example.invalid
fails=0
ok()   { echo "ok   $1"; }
bad()  { echo "FAIL $1"; fails=$((fails + 1)); }

new_repo() { rm -rf "$work/r"; git init -q "$work/r"; cd "$work/r" || exit 1; echo base > a.txt; git add .; git commit -qm base; }
run() { # name expected_rc [env...]; prints to $work/out
  local name="$1" want="$2"; shift 2
  env -i PATH="$PATH" HOME="$work" "$@" bash "$work/scan.sh" > "$work/out" 2>&1; local rc=$?
  if [ "$rc" = "$want" ]; then ok "$name"; else bad "$name (exit $rc, wanted $want)"; sed 's/^/     /' "$work/out"; fi
  if grep -qi "$WORD" "$work/out"; then bad "$name: output contains the matched term"; fi
}
pr_env() { echo EVENT=pull_request REPO=o/r HEAD_REPO=o/r BASE_SHA="$base" HEAD_SHA="$(git rev-parse HEAD)" "$@"; }

echo "-- diff mode"
new_repo; base="$(git rev-parse HEAD)"
echo "fine" > b.txt; git add .; git commit -qm "clean change"
run "clean diff passes" 0 $(pr_env) "DENYLIST_REGEX=$WORD|@badco"

new_repo; base="$(git rev-parse HEAD)"
printf 'one\nsee %s here\n' "$WORD" > b.txt; git add .; git commit -qm "adds a term"
run "added line fails" 1 $(pr_env) "DENYLIST_REGEX=$WORD"
grep -q "b.txt:2" "$work/out" && ok "location reported as file:line" || bad "location missing"

new_repo; base="$(git rev-parse HEAD)"
echo "$WORD" > package-lock.json; git add .; git commit -qm "lock file only"
run "excluded lock file passes" 0 $(pr_env) "DENYLIST_REGEX=$WORD"

new_repo; base="$(git rev-parse HEAD)"
echo "ok" > b.txt; git add .; git commit -qm "mentions $WORD in the message"
run "commit message fails" 1 $(pr_env) "DENYLIST_REGEX=$WORD"

new_repo; base="$(git rev-parse HEAD)"
echo "ok" > b.txt; git add .; GIT_AUTHOR_EMAIL="x@badco.example" git commit -qm "author email"
run "author email fails" 1 $(pr_env) "DENYLIST_REGEX=@badco"

new_repo; base="$(git rev-parse HEAD)"
echo "$WORD" > "$WORD.txt"; git add .; git commit -qm "path"
run "file path fails" 1 $(pr_env) "DENYLIST_REGEX=$WORD"

new_repo; base="$(git rev-parse HEAD)"
echo ok > b.txt; git add .; git commit -qm c
run "PR title fails" 1 $(pr_env) "DENYLIST_REGEX=$WORD" "PR_TITLE=about $WORD"
run "PR body fails" 1 $(pr_env) "DENYLIST_REGEX=$WORD" "PR_BODY=about $WORD"

echo "-- secret handling"
new_repo; base="$(git rev-parse HEAD)"; echo ok > b.txt; git add .; git commit -qm c
run "missing secret fails closed" 1 $(pr_env)
run "fork PR without secret is skipped" 0 EVENT=pull_request REPO=o/r HEAD_REPO=f/r BASE_SHA="$base" HEAD_SHA="$(git rev-parse HEAD)"
run "invalid regex fails" 1 $(pr_env) "DENYLIST_REGEX=(unclosed"

echo "-- full mode"
new_repo; echo "$WORD" > c.txt; git add .; git commit -qm "add"
git rm -q c.txt; git commit -qm "remove"
run "history match fails" 1 EVENT=schedule REPO=o/r "DENYLIST_REGEX=$WORD"
new_repo; echo "$WORD" > c.txt; git add .; git commit -qm "add"
run "tree match fails" 1 EVENT=workflow_dispatch REPO=o/r "DENYLIST_REGEX=$WORD"
new_repo
run "clean repo passes" 0 EVENT=schedule REPO=o/r "DENYLIST_REGEX=$WORD"

echo "-- push mode"
new_repo; before="$(git rev-parse HEAD)"; echo "$WORD" > d.txt; git add .; git commit -qm p
run "push diff fails" 1 EVENT=push REPO=o/r BEFORE_SHA="$before" AFTER_SHA="$(git rev-parse HEAD)" "DENYLIST_REGEX=$WORD"

[ "$fails" = 0 ] && echo "OK: all checks passed" || { echo "$fails check(s) failed"; exit 1; }
