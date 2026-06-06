# Contributing

Use this repository to maintain a reusable project starter that stays consistent with the engineering system.

## Workflow

1. Create a short-lived branch from `main` using `feature/*`, `bugfix/*`, or `hotfix/*`.
2. Keep each branch focused on one improvement to the template or docs.
3. Use Conventional Commits such as `docs: refine project template guidance`.
4. Validate that the template remains generic and internally consistent.
5. Open a Pull Request with summary, rationale, and validation notes.

## Repo-Specific Guidance

- Keep examples generic and reusable rather than tied to one implementation.
- Keep the repository tree in README aligned with the actual template layout.
- Keep docs placeholders useful without turning them into project-specific content.

## Guardrails

- Do not commit directly to `main`.
- Do not commit secrets or real environment values.
- Keep template changes generic and reusable.
- Avoid mixing template structure changes with unrelated example content changes.

## Validation

Before opening a Pull Request:

- review the diff for scope
- ensure examples are generic
- update docs when workflow changes

## Documentation Updates

- Update README when setup steps, repository structure, or documentation expectations change.
- Keep `docs/project-spec.md`, `docs/architecture.md`, and `docs/tasks.md` aligned as the standard starting set.