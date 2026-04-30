# Agent Runner Source Of Truth Inventory v1

Status: docs-only inventory and normalization plan
Scope: current Hetzner runner source-of-truth planning for the generic Knowledge-base `lane:docs` YELLOW hotfix
Related docs:
- projects/jeeves/agent_runner_hotfix_normalization_v1.md
- projects/jeeves/agent_department_current_status_v1.md
- projects/jeeves/agent_development_department_v1.md
- projects/jeeves/agent_department_hetzner_lane_scripts_plan.md
- projects/jeeves/agent_department_dry_run_wrappers_v1.md
- projects/jeeves/agent_department_rollout_checklist_v1.md

## Purpose

This document records the current known runner files to inspect and defines the safest path for normalizing the live Hetzner Knowledge-base `lane:docs` hotfix into a reviewed source of truth.

This document does not approve live runner edits, service changes, systemd changes, secret access, deployment changes, production/runtime behavior changes, merges, or expanded routing authority.

This inventory is based on the task-provided observed live paths and the existing Knowledge-base docs listed above. It is not a full read-only Hetzner host inventory. Any future implementation task must verify the live host paths read-only before making live changes.

## Current Known Live Runner Files To Inspect

Known observed live files and their likely roles:

| Path | Likely role | Evidence level | Inspection priority |
| --- | --- | --- | --- |
| `/home/agent/agent-dev/bin/agent-run-next-yellow` | Active YELLOW runner entrypoint or queue executor | Task-provided observed live file | highest |
| `/home/agent/agent-dev/bin/agent-yellow-setup` | Setup or install script for YELLOW runner behavior | Task-provided observed live file | high |
| `/home/agent/agent-dev/bin/agentctl` | Operator control/status command | Task-provided observed live file | high |
| `/home/agent/agent-dev/bin/agent-queue-status` | Queue/status inspection command | Task-provided observed live file | medium |
| `/home/agent/agent-dev/bin/cloud-status` | Host/cloud status helper | Task-provided observed live file | medium |
| `/home/agent/agent-dev/bin/agent-run-next-green` | Active GREEN runner entrypoint or queue executor | Task-provided observed live file | medium |
| `/home/agent/agent-dev/bin/agent-watchdog-setup` | Watchdog setup or template script | Task-provided observed live file | medium |
| `/home/agent/agent-dev/bin/agent-runner-fix-safe-loop` | Runner repair or safety-loop helper | Task-provided observed live file | medium |
| `/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-doctor` | Source-controlled dry-run doctor | Existing current-status doc and task-provided observed file | high for validation only |
| `/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-run` | Source-controlled dry-run lane preview | Existing current-status doc and task-provided observed file | high for validation only |
| `/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-status` | Source-controlled dry-run status helper | Existing current-status doc and task-provided observed file | medium |
| `/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-tail` | Source-controlled dry-run log tail helper | Existing current-status doc and task-provided observed file | medium |

The future read-only inventory should also discover, by path only where secrets may be involved:

```text
- current queue polling logic
- current task claim or lock logic
- current branch and draft PR creation logic
- current status and log tail logic
- current stop, restart, watchdog, or service control logic
- runner environment file paths, without reading or printing secret values
- systemd user unit and timer names, without creating or changing units
```

## Files Currently Known To Contain The Hotfix

Known hotfix behavior:

```text
If repo is alanua/Knowledge-base and issue has lane:docs,
run a generic Knowledge-base docs-only YELLOW task using the issue body as the task spec.
```

Based on the task-provided observed commands/logs and existing docs, the hotfix is known to be present in the live Hetzner YELLOW runner behavior. The strongest candidate carrier is:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
```

The likely setup or reinstall carrier to inspect next is:

```text
/home/agent/agent-dev/bin/agent-yellow-setup
```

This document does not independently verify either file's live contents and does not claim that no other live file contains copied or generated hotfix logic. A future read-only inventory must search for the exact `alanua/Knowledge-base` and `lane:docs` fallback in the live runner files before any normalization change.

Minimum read-only searches for the future inventory:

```bash
rg -n 'alanua/Knowledge-base|lane:docs|Knowledge-base|docs-only|projects/jeeves|draft PR' /home/agent/agent-dev/bin
rg -n 'alanua/Knowledge-base|lane:docs|Knowledge-base|docs-only|projects/jeeves|draft PR' /home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept
```

If those searches reveal additional hotfix copies, generated script bodies, or setup templates, the implementation task must update the inventory before editing anything.

## Likely Setup Or Templates Versus Active Runtime Scripts

Likely active runtime scripts:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
/home/agent/agent-dev/bin/agent-run-next-green
/home/agent/agent-dev/bin/agentctl
/home/agent/agent-dev/bin/agent-queue-status
/home/agent/agent-dev/bin/cloud-status
```

Likely setup, repair, template, or installer scripts:

```text
/home/agent/agent-dev/bin/agent-yellow-setup
/home/agent/agent-dev/bin/agent-watchdog-setup
/home/agent/agent-dev/bin/agent-runner-fix-safe-loop
```

Source-controlled dry-run scripts:

```text
/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-doctor
/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-run
/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-status
/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-tail
```

These roles are likely, not proven by this docs-only task. The future implementation task must confirm each role from file contents and observed command usage in read-only mode.

## Temporary Host State

Temporary host state includes:

```text
- the manual live Hetzner `lane:docs` hotfix
- any patched copy of the fallback in `/home/agent/agent-dev/bin/*`
- any generated script produced by setup or repair helpers
- runner queue state, claims, locks, branch names, and draft PR state
- dry-run logs under `~/.local/state/jeeves-agent-dept/dry-run/`
- live daemon logs, if present
- systemd user unit state, if present
```

Temporary host state must not become the long-term definition of allowed runner behavior. It may be used as evidence for inventory, but the durable behavior should be reviewed in source control.

## Recommended Source Of Truth Target

Preferred target:

```text
source-controlled runner routing config or script logic that maps exactly:
repo = alanua/Knowledge-base
lane = lane:docs
risk = GREEN or YELLOW
scope = docs-only
output = draft PR only for YELLOW work
allowed files = projects/jeeves/**/*.md and optionally projects/_index.md
```

If the runner supports configuration-driven routing, use a source-controlled allowlist config. If the runner is still script-driven and a config layer would be too broad, use a small reviewed routing function with explicit guards.

The source of truth must define:

```text
- repository allowlist: alanua/Knowledge-base only
- lane allowlist: lane:docs only
- risk allowlist: GREEN or YELLOW only
- file allowlist: projects/jeeves/**/*.md and optionally projects/_index.md
- forbidden operations list
- draft-PR-only behavior for YELLOW docs work
- required validation commands
- ChatGPT review gate
- user final approval gate
- rollback procedure
```

The live Hetzner scripts should later be installed from, generated from, or checked against that reviewed source-controlled baseline.

## Exact Safest Implementation Path

1. Create a new controlled YELLOW runner-normalization issue after ChatGPT review of this inventory.
2. Start with read-only live inventory only. Record exact paths, file roles, and whether each file contains `alanua/Knowledge-base`, `lane:docs`, or docs-only file-scope checks.
3. Do not print secret values. For env files, record paths and names only, not contents.
4. Identify the active runtime entrypoint and any setup or repair scripts that would overwrite it.
5. Identify every copy of the hotfix fallback. Stop if the logic appears in multiple places with conflicting constraints.
6. Add or update source-controlled normalization code only in a separately approved implementation task.
7. Prefer a config allowlist if the current runner can safely consume it. Otherwise add the smallest reviewed routing function.
8. Add a doctor or dry-run check that verifies the live docs route accepts only `alanua/Knowledge-base` + `lane:docs`.
9. Prove rejection cases before live replacement: non-Knowledge-base repo, missing lane, non-docs lane, RED task, missing risk, service changes, secrets, deploys, merges, production changes, and live runner edits requested from an issue body.
10. Open a draft PR for ChatGPT review.
11. Wait for user final approval before any live runner script update, service action, merge, or deploy.

## Validation And Doctor Checks Before Live Changes

Required validation before any live change:

```bash
git diff --check
agent-dept-dry-doctor
agent-dept-dry-run hetzner-docs
```

Required read-only checks for the future normalization task:

```text
- exact active YELLOW runner entrypoint path found
- exact setup or installer path found
- every hotfix copy found by text search
- setup script behavior understood before runtime script replacement
- no secret values printed in logs or PR body
- dry-run output reports would_claim=no
- dry-run output reports would_modify_labels=no
- dry-run output reports would_create_pr=no
- dry-run output reports would_start_daemon=no
- dry-run output reports would_touch_secrets=no
```

Required selector tests or doctor assertions:

```text
- accepts alanua/Knowledge-base with lane:docs and GREEN or YELLOW
- rejects non-Knowledge-base repositories
- rejects missing lane:docs
- rejects non-docs lanes
- rejects RED tasks
- rejects missing risk labels
- rejects issue bodies asking for live runner edits
- rejects services, systemd, secrets, deploys, production paths, and merges
- refuses files outside projects/jeeves/**/*.md and optional projects/_index.md
```

## What Must Remain Forbidden

The following remain forbidden unless a later explicit user-approved task changes the boundary:

```text
- editing live Hetzner runner scripts during docs-only inventory
- editing `/home/agent/agent-dev/bin/*` during docs-only inventory
- starting, stopping, enabling, restarting, or creating services
- creating systemd units or timers
- touching secrets, SSH keys, tokens, env values, production systems, or deployment paths
- expanding generic routing beyond alanua/Knowledge-base
- expanding generic routing beyond lane:docs
- allowing non-docs file changes through the docs lane
- allowing a task body to authorize live runner edits
- granting Jeeves department-management authority
- claiming issues from dry-run wrappers
- modifying labels from dry-run wrappers
- creating branches, commits, pushes, or PRs from dry-run wrappers
- merging any PR
- deploying anything
```

## Rollback And Recovery Notes

For the current live hotfix:

```text
- Treat it as temporary host state until normalized.
- Do not remove it from a docs-only inventory task.
- If it misroutes work, stop claiming new docs-lane tasks and report the scope violation.
- Revert or replace it only through a user-approved runner maintenance task after read-only inspection.
```

For a future normalized implementation:

```text
- Disable the source-controlled docs-lane allowlist entry or route.
- Confirm no active claimed docs-lane task depends on the route before changing live behavior.
- Leave existing branches and draft PRs intact for review unless the user explicitly asks otherwise.
- Run the doctor or dry-run selector check to confirm Knowledge-base lane:docs is no longer selected.
- Record the rollback result in the implementation PR or follow-up issue.
```

If a setup script overwrites the runtime script during rollback, recover from the reviewed source-controlled baseline, not from memory. If live behavior diverges from the reviewed baseline, stop and ask for user review before further changes.

Rollback must not touch secrets, production systems, deployment paths, unrelated runner lanes, unrelated services, or unrelated branches.

## Next Recommendation

The next task should be a separate controlled YELLOW implementation issue for read-only host inventory and source-controlled normalization design. It should not edit live runner scripts until ChatGPT review and user final approval are complete.

The first live-facing implementation should be a doctor or dry-run verification step that proves the intended Knowledge-base `lane:docs` route is narrow before replacing or reinstalling any active Hetzner runner behavior.
