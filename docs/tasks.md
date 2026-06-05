# Task Tracker

Template note: remove or replace all "Example" and "Mini example" content after your first real draft.

## Document Control

- Project:
- Owner:
- Last updated:
- Version:

## How To Use This File

- Track execution, not ideas. Ideas belong in docs/project-spec.md.
- Every task must reference at least one requirement ID.
- Every completed task must include validation evidence.

Mini example:

- T-003 implements FR-002 with Terraform plan report linked in Done table.

## Working Rules

- Work one task at a time.
- Keep tasks small (target less than 1 day each).
- Every task must define verification steps.
- Human approval required before merge/deploy.

## Current Sprint/Focus

- Theme:
- Start date:
- End date:
- Primary outcome:

Example:

- Theme: Self-service environment provisioning MVP
- Start date: 2026-06-10
- End date: 2026-06-21
- Primary outcome: Automated provisioning workflow for top 3 platform services

## Backlog

| ID | Task | Type | Priority | Requirement IDs | Estimate | Dependencies | Notes |
| -- | ---- | ---- | -------- | --------------- | -------- | ------------ | ----- |
| T-001 |  | feat/fix/docs/refactor/test/chore | H/M/L | FR-.../NFR-... |  |  |  |

Example row:

| T-001 | Build Terraform policy validation step | feat | H | FR-001 | 1d | None | Blocks automated apply |

## In Progress

| ID | Task | Owner | Started | Requirement IDs | Plan Summary | Validation Plan | Blockers |
| -- | ---- | ----- | ------- | --------------- | ------------ | --------------- | -------- |
| T-XXX |  | Human+AI |  | FR-.../NFR-... |  |  |  |

Example row:

| T-002 | Add GitHub Actions workflow for plan and apply | Human+AI | 2026-06-11 | FR-002,NFR-001 | Add reusable workflow and environment approvals | Dry-run in staging subscription | Waiting for IAM role mapping |

## Session Context (For AI Continuity)

### Last Session Summary

- What was completed:
- What changed in code/docs:
- What is next:

Example:

- What was completed: Added Terraform policy validation checks.
- What changed in code/docs: Updated IaC pipeline workflow and task T-001 status.
- What is next: Start T-002 CI workflow integration.

### Next Prompt Seed

Use this to restart cleanly in a new session.

```text
Implement task T-XXX only.

Allowed:
- ...

Not allowed:
- ...

Before coding:
1) Show plan
2) Wait for approval
```

## Review Queue

| ID | PR | Reviewer | Review Focus | Status |
| -- | -- | -------- | ------------ | ------ |
|    |       |          |              |        |

Example row:

| T-002 | PR-14 | Platform Lead | IAM boundaries and rollback safety | In Review |

## Done

| ID | Completed On | Requirement IDs | Verification Evidence | Docs Updated | Release Note |
| -- | ------------ | --------------- | --------------------- | ------------ | ------------ |
|    |              |                 |                       | Yes/No       |              |

Example row:

| T-001 | 2026-06-12 | FR-001 | terraform-plan-report-2026-06-12.md | Yes | Added policy checks before apply |

## Verification Matrix

Track implementation and proof against spec.

| Requirement ID | Task IDs | Verification Type | Evidence | Status |
| -------------- | -------- | ----------------- | -------- | ------ |
| FR-001 | T-... | Unit/Integration/Manual | Link/path | Not Started/In Progress/Done |
| NFR-001 | T-... | Load/Security/Observability check | Link/path | Not Started/In Progress/Done |

Tip: keep this matrix current during execution, not only at release time.

## Spec Coverage Check

- [ ] Every in-progress task references at least one requirement ID.
- [ ] Every requirement has at least one task.
- [ ] Every completed task has verification evidence.
- [ ] Every scope/requirement change is recorded in `docs/project-spec.md`.

## Blocked

| ID | Blocker | Owner | Mitigation | Next Checkpoint |
| -- | ------- | ----- | ---------- | --------------- |
|    |         |       |            |                 |

Example row:

| T-004 | Missing cloud subscription quota | Cloud Platform Team | Use smaller test node pools and staggered validation | 2026-06-14 |

## Definition of Done Checklist

- [ ] Code implemented
- [ ] Tests pass
- [ ] Review completed
- [ ] Documentation updated
- [ ] CI passes
- [ ] Ready for deploy
