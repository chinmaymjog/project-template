# Architecture and Decisions

## Document Control

- Project: <PROJECT NAME>
- Owner: <OWNER>
- Last updated: <YYYY-MM-DD>
- Version: 0.1.0

## How To Use This File

- Explain design choices so a new engineer can understand trade-offs quickly.
- Keep each section tied to requirement IDs from `docs/project-spec.md`.
- Add one decision record whenever a non-trivial decision is made.
- Replace placeholders and example rows during the first real draft.

## System Context

### Business and Technical Context

Summarize the environment and boundaries in which this system operates.

### Architecture Goals

- Goal 1
- Goal 2

## High-Level Design

### Component Overview

| Component | Responsibility | Owner |
| --------- | -------------- | ----- |
| <component> | <responsibility> | <owner> |

### Interaction Diagram

Add diagram link or embedded image.

```md
![Architecture](images/architecture.png)
```

## Data and Control Flow

### Request/Response Flow

Describe the main runtime path step-by-step.

### State and Data Model Notes

Important entities, lifecycle, and storage boundaries.

### Failure Paths

How errors, timeouts, retries, and degraded modes are handled.

## Change Boundaries and High-Risk Areas

- Identify surfaces where small code changes can have broad impact.
- Note where AI should require explicit approval before apply.

## Deployment Architecture

### Environments

- Local
- Review
- Staging
- Production

### Runtime Topology

Compute, networking, storage, and security boundaries.

### Release and Rollback Strategy

Match your release flow and artifact rollback policy.

## Security and Compliance

- AuthN/AuthZ model:
- Secret management:
- Input validation boundaries:
- Audit/logging requirements:

## Observability Strategy

- Logs:
- Metrics:
- Traces:
- Alerts/SLOs:

## External Dependencies

| Dependency | Purpose | SLA/Risk | Backup Plan |
| ---------- | ------- | -------- | ----------- |
| <dependency> | <purpose> | <risk> | <fallback> |

## Decision Records

Use one entry per meaningful decision.

Every accepted decision should reference one or more requirement IDs from `docs/project-spec.md`.

### Decision Template

- ID: ADR-00X
- Title:
- Status: Proposed | Accepted | Deprecated | Superseded
- Date:
- Context:
- Decision:
- Requirement links: FR-... | NFR-...
- Alternatives considered:
- Consequences:
- Review trigger:

## Requirement to Design Mapping

Use this table to show where each requirement is realized in architecture.

| Requirement ID | Architectural Element | ADR ID | Notes |
| -------------- | --------------------- | ------ | ----- |
| FR-001 | Component/Flow/... | ADR-... | ... |
| NFR-001 | Deployment/Control/... | ADR-... | ... |

## Pending Decisions

- Decision needed:
- Owner:
- Due date:
