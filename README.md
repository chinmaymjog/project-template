# <Project Name>

Short summary of what this project does and why it exists.

This template reflects how I usually start a repo when I know I will be working with AI during planning and implementation. See `CONTRIBUTING.md` for the full default working style, project profiles, and repo standards this template is built around.

## Start Here

This is a GitHub template: click **Use this template**, or run
`gh repo create <name> --template chinmaymjog/project-template --public`.

Use it as a starting point, not a ceremony checklist. Pick what is useful and
delete the rest.

**The project**

- [ ] Set project name and summary in this README.
- [ ] Pick a repo shape: usually `infrastructure/platform` or `tool/app`.
- [ ] Decide who this is for: just me, or someone else picking it up? If someone else, hold it to the three tests in `CONTRIBUTING.md` ("Repos for other people") and consider the `main`/`advanced` branch split from day one rather than retrofitting it later.
- [ ] Review `CONTRIBUTING.md` and `LICENSE` and replace template placeholders.
- [ ] Fill only the docs that will actually help the project move faster.
- [ ] Add implementation files in `src/`, `infra/`, `scripts/`, `tests/`, and `config/` as needed.
- [ ] Add scripts people can run after cloning if that is enough for the repo.

**GitHub settings**

- [ ] Replace `OWNER/REPO` in `SECURITY.md` and `.github/ISSUE_TEMPLATE/config.yml`, and check `.github/CODEOWNERS`.
- [ ] Enable private vulnerability reporting, secret scanning with push protection, and Dependabot alerts. `renovate.json` keeps dependencies and pinned actions current once the Renovate app is installed.
- [ ] Add a `main` ruleset: require a pull request and passing checks, block force-push.

**CI**

- [ ] Keep `.github/workflows/ci.yml` and add the project's checks, or copy a starter from `ci/profiles/`. Delete both if the repo does not need CI. See `ci/README.md`.

**Agent (optional)**

- [ ] Create an `agent` environment (you as required reviewer), run `gh secret set CLAUDE_CODE_OAUTH_TOKEN --env agent -R <owner>/<repo>`, then fill in the TODOs in `.github/workflows/claude-agent.yml` and `CLAUDE.md`. Delete both if you do not want an agent on this repo.

## Project Profile

The two profiles I expect to use most:

- infrastructure / platform
- tool / app

## Problem Statement

Describe:

- what is currently broken, slow, or risky
- who is affected
- why this matters now

## High-Level Architecture

Summarize the main components and flow in a few lines.
Reference details in `docs/architecture.md` if the project needs it.

## Technology Stack

Document:

- runtime/language
- infrastructure-as-code tool
- hosting or cloud target
- anything important for setup or deployment

## Repository Structure

Keep this tree aligned with the actual repository, but do not keep folders just because the template had them:

```text
project-root/
|-- .github/
|   |-- ISSUE_TEMPLATE/
|   |-- workflows/
|   |-- CODEOWNERS
|   `-- PULL_REQUEST_TEMPLATE.md
|-- ci/
|-- config/
|-- docs/
|   |-- ai-rules.md
|   |-- architecture.md
|   |-- project-spec.md
|   `-- tasks.md
|-- infra/
|-- scripts/
|-- src/
|-- tests/
|-- CONTRIBUTING.md
|-- LICENSE
|-- README.md
|-- SECURITY.md
|-- renovate.json
`-- .gitignore
```

Directory intent:

- `.github/`: workflows, issue and PR templates, code owners
- `ci/`: starter workflows to copy into `.github/workflows/` (see `ci/README.md`)
- `docs/`: planning and execution source of truth
- `infra/`: IaC, environment stacks, and platform definitions
- `scripts/`: automation utilities and helper scripts
- `src/`: application or service implementation
- `tests/`: integration, e2e, or infrastructure validation suites
- `config/`: non-secret defaults and configuration templates

## CI

Scripts people run after cloning are often enough. When a repo needs automation,
use GitHub Actions: `.github/workflows/ci.yml` is the starter and `ci/profiles/`
has ready-made checks for apps and infrastructure. If a repo does not need CI,
do not force it in.

## Documentation

Useful docs if the project needs them:

- `docs/project-spec.md`
- `docs/architecture.md`
- `docs/ai-rules.md`
- `docs/tasks.md`

---
*Template note: replace placeholders in README, CONTRIBUTING.md, LICENSE, and docs before first release.*
