# Problem

Template note: remove or replace all "Example" and "Mini example" content after your first real draft.

## Document Control

- Project:
- Owner:
- Last updated:
- Version:

## How To Use This File

- Keep each section short and concrete.
- Prefer measurable statements over vague goals.
- Add requirement IDs you can trace into architecture and tasks.

Mini example:

- Problem: Provisioning new Kubernetes environments is manual and inconsistent.
- Goal: Provision 95 percent of environments in less than 45 minutes.
- Requirement ID: FR-001 run policy and security checks before `terraform apply`.

# Goals

Expected:

- List 3 to 5 outcomes this project must achieve.
- Use measurable language where possible.

Example:

- Reduce platform onboarding time from 3 days to 45 minutes.

# Non Goals

Expected:

- Explicitly list what this project will not solve.

Example:

- No multi-cloud support in v1.
- No custom UI dashboard in v1.

# Success Criteria

Expected:

- Define objective checks for success.

Example:

- 99.9 percent availability for platform automation API over 30 days.
- Less than 2 percent failed infrastructure pipeline runs after rollout.

# Stakeholders

Expected:

- Name business and technical owners.

Example:

- Product: Internal Developer Platform Lead
- Engineering: Platform Engineering Team

# Assumptions

Expected:

- Capture assumptions that could change scope or timeline.

Example:

- Cloud accounts and IAM roles are pre-created and accessible.

# Risks

Expected:

- List top risks and a one-line mitigation for each.

Example:

- Risk: Terraform provider API throttling during peak deploy windows.
- Mitigation: Concurrency limits and retry with exponential backoff.

# Scope Summary

Expected:

- Summarize in-scope and out-of-scope boundaries.

Example:

- In scope: environment provisioning, policy checks, and deployment status reporting.
- Out of scope: legacy cluster migration and cross-cloud standardization.

# References

Expected:

- Link related RFCs, tickets, docs, and external constraints.

Example:

- RFC-12: platform provisioning standardization
- Ticket EPIC-203: self-service environment automation