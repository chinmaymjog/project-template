# <Project Name>

Short summary of what this project does and why it exists.

This template reflects how I usually start a repo when I know I will be working with AI during planning and implementation.

## Start Here

Use this as a starting point, not a ceremony checklist.

Pick what is useful and delete the rest.

- [ ] Set project name and summary in this README.
- [ ] Pick a repo shape: usually `infrastructure/platform` or `tool/app`.
- [ ] Review `CONTRIBUTING.md` and `LICENSE` and replace template placeholders.
- [ ] Fill only the docs that will actually help the project move faster.
- [ ] Add implementation files in `src/`, `infra/`, `scripts/`, `tests/`, and `config/` as needed.
- [ ] Add scripts people can run after cloning if that is enough for the repo.
- [ ] Keep GitLab CI only if the repo actually needs deploy/test automation.

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
`-- .gitignore
```

Directory intent:

- `docs/`: planning and execution source of truth
- `infra/`: IaC, environment stacks, and platform definitions
- `scripts/`: automation utilities and helper scripts
- `src/`: application or service implementation
- `tests/`: integration, e2e, or infrastructure validation suites
- `config/`: non-secret defaults and configuration templates

## GitHub And GitLab

For GitHub repos, I am usually fine with scripts people run after cloning.

For GitLab repos, I sometimes keep `.gitlab-ci.yml` when the project needs deploy/test automation.

If a repo does not need CI, I do not force it in.

## Documentation

Useful docs if the project needs them:

- `docs/project-spec.md`
- `docs/architecture.md`
- `docs/ai-rules.md`
- `docs/tasks.md`

---
*Template note: replace placeholders in README, CONTRIBUTING.md, LICENSE, and docs before first release.*
