# Task Tracker

## Document Control

- Project: <PROJECT NAME>
- Owner: <OWNER>
- Last updated: <YYYY-MM-DD>
- Version: 0.1.0

## How To Use This File

- Keep this file lightweight and current.
- Track only work items that are actively planned or in progress.
- Every task must include at least one requirement ID.
- Every completed task must include validation evidence.
- Remove unused example rows once the tracker is active.

## Workflow Rules

### A task may enter Now only when:

- the scope is small enough to complete without hidden sub-projects
- requirement IDs are known
- the affected architecture area is understood
- validation is named before implementation starts

### A task may move to Done only when:

- implementation is complete
- validation evidence is recorded
- docs are updated if behavior changed
- review is complete or explicitly waived

### Acceptable validation evidence

- test command and result
- screenshot or recording
- manual verification note
- diff review note
- deployment or rollback check

## Current Focus

- Theme: <CURRENT THEME>
- Current objective: <CURRENT OBJECTIVE>
- This week target: <THIS WEEK TARGET>

## Now (Do First)

Keep this section to a maximum of 3 tasks.

| ID | Task | Requirement IDs | Owner | Verification | Status |
| -- | ---- | --------------- | ----- | ------------ | ------ |
| T-001 | <task> | FR-.../NFR-... | Human+AI | <command/link/note> | Not Started/In Progress |

## Next (Queue)

Use this for tasks planned after Now.

| ID | Task | Requirement IDs | Verification | Notes |
| -- | ---- | --------------- | ------------ | ----- |
| T-00X | <task> | FR-.../NFR-... | <command/link/note> | <notes> |

## Later (Backlog)

Use this for ideas or deferred work.

| ID | Task | Requirement IDs | Notes |
| -- | ---- | --------------- | ----- |
| T-0YY | <task> | FR-.../NFR-... | <notes> |

## Done

| ID | Completed On | Requirement IDs | Validation Evidence | Notes |
| -- | ------------ | --------------- | ------------------- | ----- |
| T-... | YYYY-MM-DD | FR-.../NFR-... | link/path/command output | <notes> |

## Blocked

| ID | Blocker | Owner | Mitigation | Next Check |
| -- | ------- | ----- | ---------- | ---------- |
| T-... | <blocker> | <owner> | <mitigation> | YYYY-MM-DD |

## Quick Coverage Check

- [ ] Every task in Now has requirement IDs.
- [ ] Every task in Now has defined validation.
- [ ] Every task in Done has validation evidence.
- [ ] `docs/project-spec.md` reflects current scope.
- [ ] `docs/architecture.md` reflects major decisions.
- [ ] `docs/ai-rules.md` reflects current AI approval rules.

## Definition of Done

- [ ] Code implemented
- [ ] Tests pass
- [ ] Review completed
- [ ] Documentation updated
- [ ] CI passes
- [ ] Ready for deploy
