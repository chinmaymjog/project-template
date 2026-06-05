# <Project Name>

One-line summary of what this project does and why it exists.

Template note: remove or replace all "Example" content in this file after your first real draft.

## Start Here (First Day)

Use this checklist in order:

- [ ] Update project name and summary in this README.
- [ ] Fill docs/project-spec.md with problem, goals, and requirement IDs.
- [ ] Fill docs/architecture.md with component flow and first ADR decisions.
- [ ] Fill docs/tasks.md with T-001 to T-00N linked to requirement IDs.
- [ ] Add real files to src/, infra/, scripts/, tests/, and config/.
- [ ] Configure CI workflows in .github/workflows/.

Suggested first commits:

1. chore: initialize project structure
2. docs: define project spec and scope
3. docs: add architecture baseline and ADRs
4. docs: seed task backlog with verification plan

## Problem Statement

Write one short paragraph:

- Current pain (what is broken or slow)
- Who is affected
- Why it matters now

Example:

"Provisioning a new Kubernetes environment takes 3 days and requires manual approvals across teams, delaying service onboarding and increasing configuration drift risk."

## Key Features

List 3 to 6 core capabilities this project delivers.

Example:

- Self-service environment requests
- Automated policy and security checks before infra apply
- GitOps rollout with drift visibility

## High Level Architecture

Summarize main components and flow in 4 to 8 lines. Link details in docs/architecture.md.

Example:

- API accepts environment requests.
- Controller triggers Terraform plan and policy checks.
- Approved changes apply through CI with environment protections.
- Status service exposes rollout and drift state.

## Technology Stack

List runtime, IaC, CI/CD, observability, and cloud provider.

Example:

- Runtime: Go
- IaC: Terraform
- CI/CD: GitHub Actions
- Observability: Prometheus + Grafana
- Cloud: Azure

## Repository Structure

Keep this tree aligned with the real repo.

```text
project-root/
|-- .github/
|   `-- workflows/
|-- config/
|-- docs/
|   |-- architecture.md
|   |-- project-spec.md
|   `-- tasks.md
|-- infra/
|-- scripts/
|-- src/
|-- tests/
|-- .gitignore
`-- README.md
```

Directory intent:

- docs/: planning and execution source of truth
- infra/: IaC, environment stacks, and platform definitions
- scripts/: automation utilities and helper scripts
- src/: application or service implementation
- tests/: integration/e2e/infrastructure validation suites
- config/: non-secret defaults and configuration templates
- .github/workflows/: CI/CD workflows and policy checks

## Installation

Document prerequisites and local setup steps.

Example:

1. Install Terraform >= 1.8 and required language runtime.
2. Authenticate cloud CLI for your target subscription/account.
3. Run bootstrap command (for example: make bootstrap).

## Usage

Document common day-to-day workflow.

Example:

1. Create task in docs/tasks.md.
2. Open PR and run CI plan checks.
3. Approve and apply changes.
4. Validate rollout and update verification evidence.

## Roadmap

List near-term milestones.

Example:

- Q3: Staging rollout and hardening
- Q4: Production rollout and SLO automation

## Documentation

Link core project docs:

- docs/project-spec.md: scope, goals, and requirements source of truth
- docs/architecture.md: design decisions and requirement mapping
- docs/tasks.md: execution tracker and verification evidence