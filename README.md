# <Project Name>

Short summary of what this project does and why it exists.

## Start Here

Complete this checklist before implementation work:

- [ ] Set project name and summary in this README.
- [ ] Complete docs/project-spec.md with goals, scope, and requirement IDs.
- [ ] Complete docs/architecture.md with component flow and initial ADRs.
- [ ] Complete docs/tasks.md with task IDs linked to requirement IDs.
- [ ] Add implementation files in src/, infra/, scripts/, tests/, and config/.
- [ ] Configure CI in .github/workflows/.

## Problem Statement

Describe:

- What is currently broken, slow, or risky.
- Who is affected.
- Why this matters now.

## Key Features

List 3 to 6 core capabilities this project will deliver.

## High-Level Architecture

Summarize the primary components and request/data flow in 4 to 8 lines.
Reference details in docs/architecture.md.

## Technology Stack

Document:

- Runtime/language
- Infrastructure-as-Code tool
- CI/CD platform
- Observability tooling
- Cloud or platform target

## Repository Structure

Keep this tree aligned with the actual repository:

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

Document local prerequisites and setup steps.

## Usage

Document the day-to-day workflow for development and delivery.

## Roadmap

List upcoming milestones and target outcomes.

## Documentation

Link core docs:

- docs/project-spec.md: requirements and scope source of truth
- docs/architecture.md: design decisions and requirement mapping
- docs/tasks.md: execution tracker and verification evidence