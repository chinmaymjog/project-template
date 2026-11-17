# <Project Name>

<One-line summary. Replace placeholders when you create a repo from this template.>

Read `docs/ai-rules.md` and `CONTRIBUTING.md` first: they define scope, review
areas and the working style for this repo.

## Hard rules

- You have no cloud credentials. Never run deploy, apply, destroy or migration
  commands against real systems; the owner deploys after review.
- Never commit secrets, tokens, `.env`, state files or real tenant/host
  identifiers. Use placeholders.
- Pin versions; never use `latest`.
- Don't change `.github/workflows/` unless the issue asks for it.

## Working on issues

- Verify with: `<fill in the repo's test/lint/validate commands>`.
- Keep changes minimal and scoped to the issue; one issue per PR.
- Update `README.md` and `docs/` when behavior or setup changes.
- Open a PR against `main` that references the issue (`Fixes #N`). Never push
  to `main` directly.
