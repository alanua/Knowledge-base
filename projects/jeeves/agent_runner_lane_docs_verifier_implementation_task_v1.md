# Agent Runner Lane Docs Verifier Implementation Task v1

Status: docs-only future verifier implementation task
Date: 2026-04-30
Scope: future read-only verification for the Knowledge-base `lane:docs` route

This document defines a future verifier task for the current Knowledge-base `lane:docs` route. It is a planning artifact only. It does not approve live runner edits, host service changes, systemd changes, executable script creation, deployment changes, production/runtime behavior changes, merges, routing expansion, or secret access.

## Source Context

This task is based on:

```text
projects/jeeves/agent_runner_lane_docs_route_spec_v1.md
projects/jeeves/agent_runner_lane_docs_verifier_plan_v1.md
projects/jeeves/agent_runner_read_only_host_inventory_v1.md
```

## Target Path

The future verifier should target only the documented Knowledge-base route:

```text
repository = alanua/Knowledge-base
lane = lane:docs
accepted risks = risk:green, risk:yellow
allowed changed files = projects/jeeves/**/*.md, projects/_index.md when explicitly required
YELLOW output = draft PR only
```

The verifier must not select, normalize, or validate any other repository, lane, risk class, department authority model, runtime path, or production behavior.

## Test Matrix

Positive cases:

```text
1. repo=alanua/Knowledge-base, lane=lane:docs, risk=risk:green, files=projects/jeeves/example.md, result=accept
2. repo=alanua/Knowledge-base, lane=lane:docs, risk=risk:yellow, files=projects/jeeves/example.md, result=accept as draft-PR-only
3. repo=alanua/Knowledge-base, lane=lane:docs, risk=risk:yellow, files=projects/jeeves/example.md and projects/_index.md, issue body explicitly requires index maintenance, result=accept as draft-PR-only
```

Negative cases:

```text
1. repo is not alanua/Knowledge-base, result=reject
2. lane:docs label is missing, result=reject
3. lane is any non-docs lane, result=reject
4. risk label is missing, result=reject
5. risk is risk:red, result=reject
6. risk is any value outside risk:green or risk:yellow, result=reject
7. changed files include scripts/**, bin/**, .github/**, README.md, projects/other/**, projects/jeeves/**/*.json, or projects/jeeves/*.sh, result=reject
8. changed files include projects/_index.md without explicit issue-body index maintenance scope, result=reject
9. task body requests live runner edits, service changes, systemd changes, secrets, production paths, deployment, merge, routing expansion, or Jeeves department-management authority, result=reject
```

## File-Scope Checks

The verifier should check the proposed changed-file list before any branch output is treated as valid.

Allowed file patterns:

```text
projects/jeeves/**/*.md
projects/_index.md
```

`projects/_index.md` is allowed only when the issue body explicitly requires index maintenance for the same docs task.

Forbidden file patterns and file types include:

```text
/home/agent/agent-dev/bin/*
~/agent-dev/bin/*
scripts/**
bin/**
.github/**
projects/jeeves/*.sh
projects/jeeves/**/*.json
projects/other/**
README.md
*.service
*.timer
*.env
```

Path-only inventory may mention live host paths, but the verifier task must not edit them or require reading secret-bearing values.

## Forbidden-Operation Checks

The verifier must reject issue bodies, generated instructions, or diffs that request or perform:

```text
- live Hetzner runner edits
- edits to /home/agent/agent-dev/bin/*
- edits to ~/agent-dev/bin/*
- service start, stop, restart, enable, disable, or creation
- systemd unit, timer, daemon, watchdog, or startup changes
- executable script creation
- secret, SSH key, token, or environment value access
- production system or deployment path changes
- deployment
- merge or auto-merge
- routing expansion beyond alanua/Knowledge-base
- routing expansion beyond lane:docs
- department-management authority for Jeeves
```

The verifier should treat the outer controlled task, issue body, and route spec as cumulative constraints. If they conflict, the narrower and safer constraint wins.

## Safe Logs

Safe verifier logs may include:

```text
- repository name
- issue number
- label names
- risk label names
- changed file paths
- accept or reject result
- reject reason codes
- validation command names
- draft PR requirement for accepted YELLOW cases
```

Safe logs must not include:

```text
- secret values
- token values
- SSH private key contents
- environment variable values
- production credentials
- service unit contents that expose secrets
- full live runner script bodies from /home/agent/agent-dev/bin/*
```

If a path inspection is needed later, log only the path and a high-level finding unless a separate approved task explicitly allows broader disclosure.

## Later Runner Allowlist Needs

A later separately approved implementation may need a source-controlled allowlist or equivalent selector fixture for:

```text
repository = alanua/Knowledge-base
lane = lane:docs
risk = risk:green, risk:yellow
file scope = projects/jeeves/**/*.md, optional projects/_index.md
YELLOW output = draft PR only
forbidden operations = live runner edits, services, systemd, secrets, production paths, deploys, merges, routing expansion
```

That later work must account for both known host-side carriers before any live replacement is proposed:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
/home/agent/agent-dev/bin/agent-yellow-setup
```

Accounting for those paths does not authorize editing them. Any live runner normalization must be a separate user-approved task with its own scope, rollback plan, and review gates.

## Safest Next Execution Step

The safest next execution step is to create read-only selector fixtures or a dry-run verifier design in source-controlled documentation, then validate the docs-only change with:

```bash
git diff --check
```

No live runner script, service, systemd unit, deployment path, production system, secret, or executable script should be changed as part of this verifier implementation task.

