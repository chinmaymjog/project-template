# CI Notes

Most repos need very little here. The default is:

- use scripts first
- add a GitHub Actions workflow only when it earns its place (tests, builds,
  IaC validation)

## What is included

- `.github/workflows/ci.yml`: the live starter. It checks that the planning docs
  exist and has a placeholder step for the project's own checks.
- `ci/profiles/application.yml`: tests and build for a tool or app (Node, with
  Python and Go variants in comments).
- `ci/profiles/infrastructure.yml`: format and validate for Terraform, with an
  optional Helm lint job.

The profiles are inert until you copy one into `.github/workflows/`.

## Conventions

- Pin every action to a full commit SHA with the version in a comment. Renovate
  (`renovate.json`) keeps them current.
- Workflows start with `permissions: contents: read` and add more per job.
- Pull-request workflows get no cloud credentials. Anything that deploys goes in
  a separate workflow behind an environment with a required reviewer.
- Set a `timeout-minutes` on every job.

If the repo does not need CI, delete `ci/` and `.github/workflows/ci.yml`.
