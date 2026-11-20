# Denylist scan

A reusable workflow that fails a pull request or push when it adds a term from
a deny-list. The terms live in one repository secret, `DENYLIST_REGEX` (an
extended regular expression, case-insensitive), never in a repository.

## What it checks

- Pull requests and pushes: added lines, changed file paths, commit messages,
  author and committer names and emails, and the PR title and description.
- Weekly and on demand: the whole tree and the whole history.

Matches are reported as `path:line` (or a commit hash) and never as text, so the
terms do not end up in public logs. A path that itself matches is shown as
`[path hidden]`. Lock files and other hash-heavy files are skipped.

A repository without the secret fails the check instead of passing silently.
Pull requests from forks cannot read the secret, so the scan is skipped for them.

## Use it in a repository

1. Keep the pattern in a file outside every repository, for example
   `~/.denylist` (one line, `a|b|c`; use `\b` to avoid matches inside hashes).
2. Store it as a secret: `gh secret set DENYLIST_REGEX -R <owner>/<repo> < ~/.denylist`
3. Add `.github/workflows/denylist-scan.yml`:

```yaml
name: Denylist scan

on:
  pull_request:
  push:
    branches: [main]
  schedule:
    - cron: "41 5 * * 1"
  workflow_dispatch:

permissions:
  contents: read

jobs:
  scan:
    uses: chinmaymjog/project-template/.github/workflows/denylist-scan-reusable.yml@<full commit SHA>
    secrets:
      DENYLIST_REGEX: ${{ secrets.DENYLIST_REGEX }}
```

Pin the SHA of the template's `main`; Renovate keeps it current.

## Tests

`tests/denylist-scan.test.sh` runs the embedded script against throwaway
repositories with a made-up pattern, including a check that no match is printed.
