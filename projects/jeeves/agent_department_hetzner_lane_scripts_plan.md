# Hetzner Lane Daemon Script Plan

Status: draft implementation plan
Scope: docs-only proposal for a future implementation task
Related issue: Knowledge-base #13, "Propose Hetzner lane daemon script plan"

## Goal

Split the current Hetzner agent runner into a lightweight development department with separate lane daemons while preserving the existing safety model:

```text
Hetzner:
- runner-main
- runner-docs
- runner-tests
- watchdog

Local WSL:
- reserve validator
```

This plan does not change live scripts, services, labels, secrets, deployments, or production/runtime behavior. It is a proposal for a later user-approved implementation PR.

## Current runner scripts to inspect

The implementation task should first inspect the live runner setup before editing anything. Expected targets to inspect:

```text
Hetzner:
- current agent runner entrypoint script
- current queue polling script
- current task claim/lock script
- current branch/PR creation script
- current status/log tail script
- current stop/restart script or systemd user service
- any existing runner environment file

Local WSL:
- current local GREEN/YELLOW daemon script
- current reserve validation script
- current agentctl commands
- current status/log tail command
```

The exact file paths must be discovered from the current Hetzner and WSL runner checkout during the implementation task. Do not infer paths from memory and do not edit any live script until ChatGPT review and user approval are complete.

## Proposed script names

Keep the scripts small and lane-specific. The proposed names are intentionally boring so startup, status, and rollback are easy to reason about.

```text
scripts/agent-dept/hetzner-runner-main
scripts/agent-dept/hetzner-runner-docs
scripts/agent-dept/hetzner-runner-tests
scripts/agent-dept/hetzner-watchdog
scripts/agent-dept/local-reserve-validator

scripts/agent-dept/agent-dept-start
scripts/agent-dept/agent-dept-status
scripts/agent-dept/agent-dept-stop
scripts/agent-dept/agent-dept-tail
scripts/agent-dept/agent-dept-doctor
```

If the current repo already has a different script namespace, keep that namespace and map these names onto the existing pattern instead of creating a second control surface.

## Runner labels

Target runner labels:

```text
runner:hetzner-main
runner:hetzner-docs
runner:hetzner-tests
runner:local
```

Compatibility labels that must keep working:

```text
runner:hetzner
runner:any
runner:local
```

Compatibility behavior:

```text
runner:hetzner = eligible for any Hetzner lane, subject to lane labels and capacity
runner:any     = eligible for Hetzner or Local WSL, subject to lane labels and capacity
runner:local   = eligible only for Local WSL reserve validation
```

## Lane labels

Target lane labels:

```text
lane:docs
lane:tests
lane:validate
lane:implementation
lane:recovery
```

Initial lane ownership:

```text
runner-main:
- lane:implementation
- lane:recovery
- compatibility fallback for runner:hetzner + no specific lane

runner-docs:
- lane:docs
- Knowledge-base docs-only tasks
- report/review/documentation tasks

runner-tests:
- lane:tests
- lane:validate when Hetzner validation is acceptable
- test-only or validation-only tasks

local-reserve-validator:
- lane:validate
- runner:local
- local-only checks that should not run on Hetzner
```

## Concurrency limits

Initial limits:

```text
Total active heavy jobs across Hetzner: 2
runner-main active jobs: 1
runner-docs active jobs: 1
runner-tests active jobs: 1
BauClock full pytest active jobs: 1
Local WSL reserve validator active jobs: 1
Parallel PRs editing the same files: 0 allowed
```

Heavy job classification:

```text
heavy =
- full test suite
- BauClock full pytest
- dependency install/build
- broad repository audit
- multi-repo validation
- task expected to run longer than 20 minutes

light =
- docs-only edit
- single-file Knowledge-base edit
- read-only issue/PR triage
- targeted lint or unit test
```

The shared scheduler must refuse to claim a heavy task if two Hetzner heavy jobs are already active. It must refuse to claim a BauClock full pytest task if any other BauClock full pytest lock is active.

## Exact queue selection logic

Each lane daemon should use the same selection algorithm with different lane eligibility. The queue source remains GitHub Issues until a later approved design changes it.

Selection order:

```text
1. List open GitHub Issues in approved repositories.
2. Keep only issues with a runnable risk label:
   - GREEN
   - YELLOW
3. Reject RED or missing risk labels.
4. Reject issues with any blocking label:
   - blocked
   - needs:user
   - needs:chatgpt-review
   - needs:manual-approval
   - do-not-run
5. Reject issues already claimed by another active runner.
6. Reject issues whose declared allowed files overlap with an active PR or active claimed issue.
7. Reject issues requiring secrets, deploys, merges, production access, or runtime behavior changes unless the issue explicitly authorizes that scope.
8. Apply runner compatibility labels.
9. Apply lane labels.
10. Apply concurrency locks.
11. Prefer oldest eligible issue by creation time unless a priority label is present.
12. Claim exactly one issue.
```

Runner compatibility filter:

```text
runner-main accepts:
- runner:hetzner-main
- runner:hetzner
- runner:any

runner-docs accepts:
- runner:hetzner-docs
- runner:hetzner when paired with lane:docs
- runner:any when paired with lane:docs

runner-tests accepts:
- runner:hetzner-tests
- runner:hetzner when paired with lane:tests or lane:validate
- runner:any when paired with lane:tests or lane:validate

local-reserve-validator accepts:
- runner:local
- runner:any when paired with lane:validate and the task is explicitly safe for local validation
```

Lane filter:

```text
runner-main accepts:
- lane:implementation
- lane:recovery
- no lane label only when runner:hetzner-main is present

runner-docs accepts:
- lane:docs

runner-tests accepts:
- lane:tests
- lane:validate

local-reserve-validator accepts:
- lane:validate
```

Tie-breaking:

```text
1. priority:urgent
2. priority:high
3. issue blocked longest by validation need
4. oldest created issue
```

Claiming:

```text
1. Re-read issue labels immediately before claim.
2. Add a runner claim marker or comment with runner name, timestamp, repo, branch name, and intended files.
3. Re-check active claims after writing the claim.
4. If a conflict appears, release the claim and exit without work.
5. One daemon claims one issue at a time.
```

## Safe command naming

Operator commands should be explicit and non-destructive:

```text
agent-dept-start hetzner-main
agent-dept-start hetzner-docs
agent-dept-start hetzner-tests
agent-dept-start hetzner-watchdog
agent-dept-start all

agent-dept-status
agent-dept-status hetzner-main
agent-dept-status hetzner-docs
agent-dept-status hetzner-tests
agent-dept-status local-reserve-validator

agent-dept-tail hetzner-main
agent-dept-tail hetzner-docs
agent-dept-tail hetzner-tests
agent-dept-tail hetzner-watchdog

agent-dept-stop hetzner-main
agent-dept-stop hetzner-docs
agent-dept-stop hetzner-tests
agent-dept-stop all

agent-dept-doctor
```

Command behavior:

```text
start  = start a named lane daemon if not already running
status = show daemon health, active claim, active branch, last log line, and lock state
tail   = follow logs for one named daemon
stop   = request graceful stop after current task boundary; do not kill active work by default
doctor = read-only checks for tools, auth, repo cleanliness, labels, locks, and config
```

No command should merge, deploy, expose secrets, rewrite git history, or force-kill a runner unless a separate user-approved emergency procedure says so.

## Watchdog responsibilities

The watchdog is read-only by default.

Allowed:

```text
- report stale claims
- report failed daemon health checks
- report lock conflicts
- report queues with no eligible runners
- report active heavy job count
- report BauClock full pytest lock state
```

Not allowed:

```text
- merge PRs
- deploy
- edit code
- edit secrets
- auto-restart repeatedly failing daemons without user approval
- override a runner claim
- clear locks without a manual approval trail
```

## Rollback plan

Rollback must be simple:

```text
1. Stop new lane daemons with agent-dept-stop all.
2. Confirm no active task is mid-edit or mid-test.
3. Disable new lane daemon services or timers.
4. Re-enable the previous single Hetzner runner command/service.
5. Remove new runner labels from queued issues only if they prevent the old runner from seeing work.
6. Keep compatibility labels runner:hetzner, runner:any, and runner:local in place.
7. Leave created branches and draft PRs intact for review unless the user explicitly asks to close them.
8. Record rollback reason and observed failure mode in the relevant issue or handoff doc.
```

The implementation PR must include a dry-run rollback checklist before any live runner change is applied.

## Manual or user-approved only

These actions must remain manual or explicitly user-approved:

```text
- merge any PR
- deploy anything
- touch production secrets or credentials
- change GitHub repository permissions
- add or remove runner host SSH keys
- change systemd services on Hetzner
- install new long-running services
- enable local LLM/Ollama on Hetzner
- clear stale locks when work may still be active
- close or delete branches created by a runner
- resolve conflicting PRs that edit the same files
- approve RED tasks
- mark ChatGPT review as complete
```

## What must not be changed yet

Do not change these in the implementation planning phase:

```text
- live Hetzner runner scripts
- live Local WSL runner scripts
- GitHub Actions workflows
- production/runtime behavior
- deployment scripts
- secrets, tokens, SSH keys, or env files
- repository permissions
- label taxonomy beyond the proposed labels
- issue queue source
- merge policy
- ChatGPT review requirement
- user final approval requirement
- local LLM/Ollama policy on Hetzner
```

## Risks

Primary risks:

```text
- two daemons claim related work at the same time
- docs/test/implementation lanes still edit overlapping files
- test runner consumes too much Hetzner capacity
- BauClock full pytest runs concurrently and starves other work
- compatibility labels route too much work to runner-main
- watchdog accidentally becomes a controller instead of a reporter
```

Mitigations:

```text
- one task = one branch = one draft PR
- active claim re-check after claim write
- shared heavy-job lock
- dedicated BauClock full pytest lock
- file overlap check before claim
- docs-first rollout
- ChatGPT review before implementation
- user remains final approver
```

## Next recommendation

Next step after ChatGPT review and user approval:

```text
Create a separate implementation task that only inspects current runner scripts and adds dry-run lane wrappers.
The first implementation PR should not enable services by default.
The first live test should run one docs-only issue through runner-docs while runner-main remains available as fallback.
```
