# Agent Runner Lane Docs Route Spec v1

Status: docs-only route specification
Date: 2026-04-30
Scope: current Knowledge-base `lane:docs` routing normalization artifact

This document defines the source-controlled specification for the current controlled Knowledge-base `lane:docs` route. It is a specification artifact only. It does not approve live runner edits, host service changes, systemd changes, deployment changes, production/runtime behavior changes, routing expansion, merges, or secret access.

## Source Context

This spec is based on the following existing source-controlled context:

```text
projects/jeeves/agent_runner_read_only_host_inventory_v1.md
projects/jeeves/agent_runner_source_of_truth_inventory_v1.md
projects/jeeves/agent_runner_hotfix_normalization_v1.md
projects/jeeves/agent_department_current_status_v1.md
```

## Route Identity

The normalized route is:

```text
repository = alanua/Knowledge-base
lane = lane:docs
purpose = controlled docs-only work for Jeeves Knowledge-base documentation
```

The route must not match any other repository, lane, risk class, file scope, or operational mode.

## Required Allowlists

Repository allowlist:

```text
alanua/Knowledge-base
```

Lane allowlist:

```text
lane:docs
```

Accepted risk labels:

```text
risk:green
risk:yellow
```

Accepted output file scope:

```text
projects/jeeves/**/*.md
projects/_index.md
```

`projects/_index.md` is optional. It may be changed only when the issue body explicitly requires index maintenance for the docs change.

## Required Rejections

The route must reject:

```text
- any repository other than alanua/Knowledge-base
- any issue without lane:docs
- any non-docs lane
- any issue without risk:green or risk:yellow
- any risk:red task
- any changed file outside projects/jeeves/**/*.md and optional projects/_index.md
- any task body requesting live runner edits
- any task body requesting /home/agent/agent-dev/bin/* edits
- any host service, daemon, systemd, timer, watchdog, or startup change
- any secret, SSH key, token, environment value, production system, or deployment path change
- any merge request or auto-merge behavior
- any routing expansion beyond this route
- any grant of department-management authority to Jeeves
```

The issue body must not be able to widen this scope. If the outer controlled task and issue body conflict, the narrower and safer constraint wins.

## YELLOW Output Contract

For `risk:yellow` docs work, the only permitted output is a draft pull request for review.

YELLOW work must remain:

```text
- docs-only
- branch-based
- draft-PR-only
- reviewed by ChatGPT before merge
- manually approved by the user before merge or live follow-up work
```

The route must not merge, deploy, start services, stop services, restart services, create services, create systemd units, edit live runner scripts, or touch secrets.

## GREEN Output Contract

For `risk:green` docs work, the route may be selected only if the same repository, lane, file-scope, and forbidden-operation constraints pass.

GREEN selection must not be used to bypass:

```text
- docs-only scope
- file allowlist checks
- forbidden host-service checks
- secret and production path prohibitions
- review and approval requirements for any later live runner normalization
```

## Review And Approval Gates

Required gates:

```text
1. Route selector confirms repository, lane, risk, and file scope.
2. Forbidden-operation scan confirms no live runner, service, secret, deployment, production, merge, or routing-expansion request is in scope.
3. Validation runs for the docs change.
4. A draft PR is opened for YELLOW work.
5. ChatGPT reviews the draft PR before merge.
6. The user gives final approval before merge or any later live runner normalization.
```

No review gate may be treated as permission for live Hetzner script edits, service actions, systemd changes, deployment, production changes, or routing expansion. Those require a separate explicitly approved task.

## Validation

Minimum validation for this docs-only route artifact:

```bash
git diff --check
```

Future implementation tasks may add read-only or dry-run selector tests, but this route spec does not approve runtime implementation changes.

## Rollback Boundary

Rollback for this specification means reverting or superseding the source-controlled route spec in a reviewed PR.

Rollback must not:

```text
- edit live runner scripts
- remove live host hotfixes
- start or stop services
- touch secrets
- deploy
- close or merge existing draft PRs automatically
```

Any live runner rollback must be handled by a separate user-approved runner maintenance task after read-only inventory confirms the active runtime and setup carriers.
