# Jeeves Agent Department Dry-Run Wrappers v1

Status: draft wrapper contract for Issue #107
Scope: docs-only stabilization note for the next safe implementation PR

Related docs:

```text
projects/jeeves/agent_development_department_v1.md
projects/jeeves/agent_department_hetzner_lane_scripts_plan.md
projects/jeeves/runner_health_status_2026_05_02_v1.md
projects/jeeves/runner_lane_docs_next_step_plan_2026_05_02_v1.md
```

## Current State

The current repository already contains older `scripts/agent-dept/` helpers:

```text
scripts/agent-dept/agent-dept-dry-run
scripts/agent-dept/agent-dept-dry-status
scripts/agent-dept/agent-dept-dry-tail
scripts/agent-dept/agent-dept-dry-doctor
scripts/agent-dept/agent-dept-runner-docs-once
scripts/agent-dept/agent-dept-runner-docs-live-once
scripts/agent-dept/agent-dept-verify-lane-docs
```

Issue #107 asks for the first safe implementation PR from current `main` to add or update dry-run lane wrappers and status checks only. This docs-only lane records the target contract but does not edit scripts, live runner paths, services, secrets, labels, branches, commits, pushes, PRs, or deployments.

Current live entrypoint candidate, for read-only context only:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
```

This document does not approve editing that path or any live Hetzner runner script.

## Target Department

```text
Hetzner:
- runner-main
- runner-docs
- runner-tests
- watchdog

Local WSL:
- reserve validator
```

GitHub Issues in `alanua/Knowledge-base` are the current intake source. The department must not use `executor_tasks/` markdown files as the source of truth for this implementation.

## Preferred Wrapper Files

The next implementation PR should prefer these exact files:

```text
scripts/agent-dept/agent-dept-runner-main-dry-run
scripts/agent-dept/agent-dept-runner-docs-dry-run
scripts/agent-dept/agent-dept-runner-tests-dry-run
scripts/agent-dept/agent-dept-watchdog-dry-run
scripts/agent-dept/agent-dept-status
```

If the implementation keeps the existing single-command interface, it must explain why the exact filenames differ and validate the actual changed scripts.

## Required No-Effect Output

Each dry-run wrapper must print/report at least:

```text
lane name
repo target
accepted runner labels
accepted lane labels
risk labels accepted
blocking labels
would_claim=no
would_modify_labels=no
would_create_branch=no
would_commit=no
would_push=no
would_create_pr=no
would_merge=no
would_deploy=no
would_start_service=no
would_install_service=no
would_touch_secrets=no
```

Dry-run wrappers must not claim issues, edit labels, create branches, commit, push, create PRs, merge, deploy, start services, install services, touch secrets, or change live runner behavior.

The status script must be read-only. It may report dry-run configuration and local dry-run log/status locations, but it must not mutate GitHub, git state, service state, labels, locks, secrets, or live runner behavior.

## Lane Label Contract

Shared accepted risk labels:

```text
risk:green
risk:yellow
```

Shared blocking labels:

```text
blocked
needs:user
needs:chatgpt-review
needs:manual-approval
do-not-run
agent:claimed
agent:running
agent:blocked
```

Runner-main dry-run:

```text
lane name: runner-main
repo target: alanua/Knowledge-base
accepted runner labels: runner:hetzner-main, runner:hetzner, runner:any
accepted lane labels: lane:implementation, lane:recovery
risk labels accepted: risk:green, risk:yellow
```

Runner-docs dry-run:

```text
lane name: runner-docs
repo=alanua/Knowledge-base
required labels: agent:task, agent:queued, risk:yellow, lane:docs
compat runner label: runner:hetzner
accepted runner labels: runner:hetzner-docs, runner:hetzner, runner:any
accepted lane labels: lane:docs
risk labels accepted: risk:green, risk:yellow
```

Runner-tests dry-run:

```text
lane name: runner-tests
repo target: alanua/Knowledge-base
accepted runner labels: runner:hetzner-tests, runner:hetzner, runner:any
accepted lane labels: lane:tests, lane:validate
risk labels accepted: risk:green, risk:yellow
```

Watchdog dry-run:

```text
lane name: watchdog
repo target: alanua/Knowledge-base
accepted runner labels: none for claiming
accepted lane labels: none for claiming
risk labels accepted: none for claiming
```

The watchdog dry-run should report health/status checks only. It must not claim issues or start, stop, install, enable, restart, or replace services.

## Validation For Implementation PR

The implementation PR should run and report:

```bash
git diff --check
bash -n scripts/agent-dept/agent-dept-runner-main-dry-run scripts/agent-dept/agent-dept-runner-docs-dry-run scripts/agent-dept/agent-dept-runner-tests-dry-run scripts/agent-dept/agent-dept-watchdog-dry-run scripts/agent-dept/agent-dept-status
```

It should also run and report the dry-run output for each wrapper if safe:

```bash
scripts/agent-dept/agent-dept-runner-main-dry-run
scripts/agent-dept/agent-dept-runner-docs-dry-run
scripts/agent-dept/agent-dept-runner-tests-dry-run
scripts/agent-dept/agent-dept-watchdog-dry-run
scripts/agent-dept/agent-dept-status
```

Expected output must include every `would_*` field listed above with `no`.

## Draft PR Body Checklist

The implementation draft PR must clearly state:

```text
- changed files
- dry-run behavior
- what was not changed
- validation result
- risks
- next recommended live-test task
```

Recommended next live-test task:

```text
After ChatGPT review and user approval, run one read-only docs-lane wrapper validation against `alanua/Knowledge-base` and attach output. Do not enable daemons, install services, mutate labels, claim issues, create branches, push, create PRs from the wrapper, merge, deploy, or touch secrets.
```

ChatGPT review is required before any live runner or daemon change. The user remains the final approver.
