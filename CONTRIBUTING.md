# Contributing

This template is here to make starting a repo easier for me.

It should stay light and easy to adapt.

## Good Changes

- making the template clearer
- reducing friction
- keeping the docs useful
- keeping the structure flexible

## Bad Changes

- adding process that only looks good on paper
- making every repo pretend to need the same level of rigor
- forcing CI/CD structure into repos that only need scripts

## Validation

When I change this template, I mainly check:

- would I still want to start a real repo from this
- is it easier to trim down, not harder
- does it help AI-assisted work without turning into ceremony

---

## My Default Way Of Working With AI

This is intentionally lightweight.

**Core rule:** AI helps me think, plan, and build. I keep control of
scope, architecture, risk, and final decisions.

### What I usually give the AI

When I want good output, I usually make these things clear:

- what I am trying to do
- what files or areas are in scope
- what should stay untouched
- how much risk I am willing to take
- what kind of validation I want back

I do not force a rigid format every time, but the clearer I am, the
better the result.

### My default modes

- `Explore` — read, trace, summarize, and suggest options.
- `Build` — make changes inside the scoped area.
- `High-Risk Build` — prepare changes for infra, CI, auth, secrets,
  migrations, or release flows, but slow down and review more carefully.

### When I slow down

I usually pause and review more carefully when the change touches:

- infrastructure
- CI/CD
- security-sensitive code
- auth
- secrets
- data migrations
- public interfaces
- deploy or release automation

### What I expect back

I want AI work to leave behind:

- a clear diff
- enough reasoning to understand the change
- validation notes or commands when relevant
- doc updates if the behavior or architecture changed

### Practical rule

If the AI starts widening scope, making hidden decisions, or producing a
messy diff, I narrow the task and try again. That is usually better than
trying to rescue a bad broad change.

## Project Profiles I Use

I do not need a lot of profiles. Almost everything I build falls into one
of these two buckets.

### Infrastructure / Platform

The default for me. Use it for Terraform, Pulumi, Helm, Kubernetes,
platform automation, cloud foundation work.

Things I usually care about here: blast radius, environment differences,
rollout and rollback, secrets and identity, keeping AI changes scoped.

Optional GitLab CI starter: `ci/profiles/infrastructure.md`

### Tool / App

Use this for internal tools, small APIs, utility apps, dashboards,
helper services around the platform.

Things I usually care about here: clear problem framing, fast iteration,
simple architecture notes, build and test feedback.

Optional checks starter: `ci/profiles/application.md`

## Repo Standards I Keep

These are not strict rules for every repo. They are the habits I keep
coming back to because they help me work well with AI without turning
the codebase into chaos.

### What I care about

- clear scope before broad implementation
- small enough changes that I can still review them properly
- enough documentation to preserve context
- enough validation to trust the result
- not letting AI quietly widen the problem

### Branching

I usually prefer:

- `main` as the stable branch
- short-lived feature or fix branches
- small, focused changes

I do not care about policing branch names for the sake of it. I care
that the branch represents one clear piece of work.

### Commits

I generally use Conventional Commits because they keep history readable:

```text
feat: add cluster bootstrap check
fix: handle missing workload identity binding
docs: update deployment notes
```

If I drift from that occasionally, it is not the end of the world. The
point is clarity, not ceremony.

### Reviews

My review standard is simple:

- can I understand the change quickly
- is the scope still what I intended
- did AI make hidden decisions for me
- do I have enough validation to trust it

For infra and platform work, I slow down more here than I do for normal
app code.

### Docs

I like having a few predictable files:

- `docs/project-spec.md`
- `docs/architecture.md`
- `docs/ai-rules.md`
- `docs/tasks.md`

Not every repo needs all of them to be fully developed on day one. I
just want enough written down so the next AI pass does not start from
nothing.

### Scripts and CI

I prefer to keep things as simple as possible. Usually that means:

- use scripts when scripts are enough
- add GitLab CI only when deploy/test automation is genuinely useful
- keep host-specific files thin

I do not want CI to become theater.

### Riskier work

I naturally review more carefully when a change touches infrastructure,
CI/CD, auth, secrets, migrations, or deploy/release flows.

That does not mean "never let AI touch it." It means I want clearer
scope, better review, and better validation.

### Practical definition of done

For me, a task is usually done when:

- the change does what I wanted
- the diff is understandable
- the validation is good enough for the risk
- the docs are updated if they need to be

That is enough.

### Repos for other people

Some repos are not just for me. They are meant to teach something, or to
be a starting point someone else picks up without already knowing the
stack.

I keep making the same mistake here: I start simple, then every
follow-up session adds one more "useful" thing, and a few months later
the repo is a reference architecture instead of a starting point. Nobody
who does not already know the stack can look at it and understand how it
works, or trust that they can run it without breaking something.

For anything meant for someone else to pick up, I hold it to three tests:

- **Can they set it up themselves?** Clone, read the top of the README,
  run one or two commands, it works. No mode selection, no "choose your
  own adventure" before the first run.
- **Can they maintain it?** Updating a version or a password is one
  obvious command, not a multi-file trail to follow.
- **Can they extend it?** Adding one more piece follows a documented
  pattern they can copy, not something they have to reverse-engineer
  from the existing code.

If a repo fails any of these, it has drifted from "starting point" to
"reference architecture" - useful to me, not to someone starting out.
That drift is a signal to simplify, not a reason to add more docs
explaining the complexity.

#### Public / advanced split

When a project genuinely serves two audiences - people learning the
stack, and me running my own real setup - I keep them on separate
branches of the same repo rather than trying to make one version serve
both:

- `main` - the small, obvious, beginner path. Nothing here that is not
  needed to understand the core idea.
- `advanced` (or similarly named) - my own working setup, with whatever
  real complexity my actual use needs.

I do not try to keep these merged. They diverge in shape, not just
content, so I branch `advanced` once from a known-good point and then
treat the two as separate lines of work going forward. A genuine bug fix
that applies to both gets cherry-picked deliberately, not auto-merged.
