# Setup (delete this file when done)

This repo is a GitHub template: **Use this template**, or
`gh repo create <name> --template chinmaymjog/project-template --public`.

## 1. Make it yours
- [ ] Replace `<project>` and the other placeholders in `README.md`, `CLAUDE.md` and `CONTRIBUTING.md`.
- [ ] Replace `OWNER/REPO` in `SECURITY.md`; set your name in `LICENSE`; check `.github/CODEOWNERS`.
- [ ] Fill in `docs/` (or delete what you don't need) and add your code.
- [ ] Put the project's checks in `.github/workflows/ci.yml` (job `test`). Delete the `scripts/` and `tests/` here if you don't keep them.

## 2. Apply the standard GitHub settings
```sh
scripts/bootstrap-repo.sh <owner>/<repo>
```
Secret scanning with push protection, Dependabot alerts, private vulnerability
reporting, read-only workflow tokens, fork PR approval, the `agent` environment
(you as the only reviewer) and a `protect-main` ruleset requiring a PR plus the
`test` and `Gitleaks` checks. Use `DRY_RUN=1` to see the calls first. Then
install the Renovate app on the repo (`renovate.json` is already here).

## 3. Optional workflows
`workflow-templates/` holds proven workflows from the other repos. Copy the ones
you want to `.github/workflows/`: `image-scan.yml` (Trivy on the built image),
`iac-scan.yml` (Trivy for Terraform/Kubernetes/Dockerfiles), `vuln-scan-go.yml`
or `vuln-scan-python.yml` (dependency advisories).

## 4. The agent (optional)
`claude-agent.yml` runs Claude only when the repository owner mentions `@claude`.
Run `gh secret set CLAUDE_CODE_OAUTH_TOKEN --env agent -R <owner>/<repo>`
yourself, then fill in the stack's tool steps and `--allowedTools` in the
workflow. Never give it cloud credentials. Delete it and `CLAUDE.md` if the repo
has no agent.
