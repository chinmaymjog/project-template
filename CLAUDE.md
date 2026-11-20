# <project>

<One line: what this is and what it runs on.>

## Layout
- `<dir>/` — <what lives here>

## Working on issues
- Verify before finishing: `<commands>` (same as CI in `.github/workflows/ci.yml`).
- Add or update tests for every bug fix.
- Keep changes minimal and scoped to the issue; one issue per PR.
- Open a PR against `main` that references the issue (`Fixes #N`). Never push to `main` directly.
- Don't touch `.github/workflows/` unless the issue asks for it.

## Hard rules
- You have no cloud credentials. Never run deploy, apply, destroy or migration commands against real systems; the owner deploys after review.
- Never commit secrets, tokens, `.env`, state files or real tenant/host identifiers. Use placeholders.
- Pin versions; never use `latest`.
