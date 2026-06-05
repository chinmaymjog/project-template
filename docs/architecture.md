# Architecture and Decisions

Template note: remove or replace all "Example" and "Mini example" content after your first real draft.

## Document Control

- Project:
- Owner:
- Last updated:
- Version:

## How To Use This File

- Explain design choices so a new engineer can understand trade-offs quickly.
- Keep each section tied to requirement IDs from docs/project-spec.md.
- Add one ADR entry whenever a non-trivial decision is made.

Mini example:

- Requirement FR-001 -> Component Provisioning Controller -> ADR-001 GitOps pull model.

## System Context

### Business and Technical Context

Summarize the environment and boundaries in which this system operates.

Example:

"The system provisions cloud environments from approved templates. It runs in a private network and integrates with centralized IAM and audit controls."

### Architecture Goals

- Goal 1
- Goal 2

Example:

- Process incoming events within 30 seconds at p95.
- Isolate provider failures so one cloud account does not block others.

## High-Level Design

### Component Overview

| Component | Responsibility | Owner |
| --------- | -------------- | ----- |
|           |                |       |

Example row:

| Provisioning Controller | Validate requests and execute Terraform workflows | Platform Team |

### Interaction Diagram

Add diagram link or embedded image.

```md
![Architecture](images/architecture.png)
```

## Data and Control Flow

### Request/Response Flow

Describe the main runtime path step-by-step.

Example:

1. Client submits payload to API.
2. API validates request policy and auth.
3. Controller triggers Terraform plan and policy checks.
4. Approved changes are applied via CI runner.
5. Status endpoint returns rollout and drift status.

### State and Data Model Notes

Important entities, lifecycle, and storage boundaries.

Example:

- Entities: EnvironmentRequest, PipelineRun, DriftReport.
- Storage: State in remote backend, logs/metrics in observability stack.

### Failure Paths

How errors/timeouts/retries are handled.

Example:

- Retry transient failures up to 3 times with exponential backoff.
- Route persistent apply failures to incident queue with runbook link.

## Deployment Architecture

### Environments

- Local
- Review
- Staging
- Production

### Runtime Topology

Compute, networking, storage, and security boundaries.

Example:

- API and workers run in private subnets.
- Database has no public ingress.
- Egress restricted to approved cloud control-plane endpoints.

### Release and Rollback Strategy

Match your release flow and artifact rollback policy.

Example:

- Blue/green deployment in staging.
- Rollback by redeploying previous artifact tag.
- Infrastructure rollback by re-applying last known-good Terraform state version.

## Security and Compliance

- AuthN/AuthZ model:
- Secret management:
- Input validation boundaries:
- Audit/logging requirements:

Example:

- AuthN/AuthZ model: OAuth2 service-to-service with RBAC.
- Secret management: cloud secret manager only.
- Input validation boundaries: API gateway + service validation.
- Audit/logging requirements: immutable audit log for all apply and policy decisions.

## Observability Strategy

- Logs:
- Metrics:
- Traces:
- Alerts/SLOs:

Example:

- Logs: structured JSON with correlation IDs.
- Metrics: plan/apply duration p50/p95, failure rate, drift count.
- Traces: end-to-end from API to worker.
- Alerts/SLOs: p95 latency > 2s for 10 minutes.

## External Dependencies

| Dependency | Purpose | SLA/Risk | Backup Plan |
| ---------- | ------- | -------- | ----------- |
|            |         |          |             |

Example row:

| Cloud Provider API | Provision and update infrastructure | Throttling and quota risk | Backoff, retries, and staged rollouts |

## Architecture Decision Records (ADR-lite)

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

Example:

- ID: ADR-001
- Title: Use GitOps pull model for cluster configuration
- Status: Accepted
- Date: 2026-06-05
- Context: Direct push deploys caused inconsistent cluster states.
- Decision: Cluster agents pull approved configuration from Git.
- Requirement links: FR-001, NFR-002
- Alternatives considered: Direct push from CI.
- Consequences: Better auditability, slower emergency hotfix path.
- Review trigger: Mean time to recovery exceeds 30 minutes for 3 incidents.

## Requirement to Design Mapping

Use this table to show where each requirement is realized in architecture.

| Requirement ID | Architectural Element | ADR ID | Notes |
| -------------- | --------------------- | ------ | ----- |
| FR-001 | Component/Flow/... | ADR-... | ... |
| NFR-001 | Deployment/Control/... | ADR-... | ... |

Tip: do not leave a requirement unmapped. Add one row per requirement ID.

## Lessons Learned

- Lesson 1
- Lesson 2

## Pending Decisions

- Decision needed:
- Owner:
- Due date:
