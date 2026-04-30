# Agent Runner Lane Docs Verifier Plan v1

Status: docs-only verifier plan
Date: 2026-04-30
Scope: verification plan for the current Knowledge-base `lane:docs` route specification

This document defines checks for verifying the Knowledge-base `lane:docs` route constraints. It is a plan only. It does not approve live runner edits, host service changes, systemd changes, deployment changes, production/runtime behavior changes, routing expansion, merges, or secret access.

## Source Context

This verifier plan is based on:

```text
projects/jeeves/agent_runner_read_only_host_inventory_v1.md
projects/jeeves/agent_runner_source_of_truth_inventory_v1.md
projects/jeeves/agent_runner_hotfix_normalization_v1.md
projects/jeeves/agent_department_current_status_v1.md
projects/jeeves/agent_runner_lane_docs_route_spec_v1.md
```

## Verification Goals

The verifier must prove that the route:

```text
- matches the documented runtime/setup constraints
- accepts only alanua/Knowledge-base
- accepts only lane:docs
- accepts only risk:green or risk:yellow
- keeps YELLOW output draft-PR-only
- allows only projects/jeeves/**/*.md and optional projects/_index.md
- rejects host-service, live runner, secret, deployment, production, merge, and routing-expansion requests
- has clear rollback checks
```

## Runtime And Setup Constraint Match

Read-only verification should confirm that the documented route constraints match the known runtime and setup carrier findings:

```text
- active YELLOW runtime entrypoint candidate: /home/agent/agent-dev/bin/agent-run-next-yellow
- setup/reinstall carrier candidate: /home/agent/agent-dev/bin/agent-yellow-setup
- route repository guard: alanua/Knowledge-base
- route lane guard: lane:docs
- docs-only instruction guard
- file allowlist guard for projects/jeeves/**/*.md and optional projects/_index.md
- draft PR behavior for YELLOW tasks
```

This check is read-only. It must not edit `/home/agent/agent-dev/bin/*`, regenerate runner scripts, start services, stop services, restart services, enable services, create systemd units, or deploy.

## Acceptance Checks

The verifier should include positive cases that accept only:

```text
repo = alanua/Knowledge-base
lane = lane:docs
risk = risk:green
changed files = projects/jeeves/example.md
```

and:

```text
repo = alanua/Knowledge-base
lane = lane:docs
risk = risk:yellow
changed files = projects/jeeves/example.md
output = draft PR
```

Optional index maintenance case:

```text
repo = alanua/Knowledge-base
lane = lane:docs
risk = risk:yellow
changed files = projects/jeeves/example.md, projects/_index.md
output = draft PR
```

## Rejection Checks

The verifier must reject wrong repository:

```text
repo != alanua/Knowledge-base
```

The verifier must reject wrong lane:

```text
missing lane:docs
lane != lane:docs
```

The verifier must reject wrong risk:

```text
missing risk label
risk:red
any risk outside risk:green or risk:yellow
```

The verifier must reject wrong file scope:

```text
scripts/**
bin/**
.github/**
projects/jeeves/*.sh
projects/other/**
projects/jeeves/**/*.json
README.md
```

The verifier must reject task bodies requesting forbidden work:

```text
- edit live runner scripts
- edit /home/agent/agent-dev/bin/*
- start, stop, enable, restart, or create services
- create systemd units or timers
- touch secrets, SSH keys, tokens, or environment values
- touch production systems or deployment paths
- deploy
- merge
- expand routing beyond alanua/Knowledge-base
- expand routing beyond lane:docs
- grant Jeeves department-management authority
```

## Host-Service Change Rejection

Host-service rejection checks must cover:

```text
systemctl --user start
systemctl --user stop
systemctl --user restart
systemctl --user enable
systemctl --user daemon-reload
service start
service stop
timer creation
daemon creation
watchdog creation
agent-dept-start
agent-dept-stop
```

Any match must fail the route unless a later separate user-approved host-service task explicitly allows it. This docs route never grants that approval.

## Live Runner And Deployment Rejection

The verifier must reject issue bodies or diffs that touch:

```text
/home/agent/agent-dev/bin/*
~/agent-dev/bin/*
live Hetzner runner scripts
runner setup scripts
deployment paths
production systems
secret-bearing env files
SSH keys
tokens
```

Path-only read-only inventory may record that such files exist, but this route must not edit them.

## Rollback Checks

Rollback verification for source-controlled docs artifacts should confirm:

```text
- only the route spec or verifier plan is reverted or superseded
- no live runner script is edited
- no setup carrier is regenerated
- no service or systemd state is changed
- no secrets or environment values are read or changed
- existing draft PRs remain manual-review artifacts
- no merge or deployment is performed
```

Rollback verification for any future live runner normalization must be a separate approved task and should confirm:

```text
- active runtime entrypoint is identified read-only
- setup/reinstall carrier is identified read-only
- every copy of the route is found before change
- active claimed docs tasks are accounted for
- disabling or narrowing the route is verified by dry-run checks
- the rollback result is recorded in a draft PR or follow-up issue
```

## Minimum Validation

For this docs-only verifier plan artifact, the required validation is:

```bash
git diff --check
```

Future implementation tasks may add selector fixtures, dry-run checks, or doctor assertions. Those future checks must remain read-only unless a separate task explicitly authorizes broader behavior.
