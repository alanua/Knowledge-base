# Exoskeleton Lane Expansion Readiness Matrix - 2026-05-04

Status: readiness draft only
Scope: ChatGPT exoskeleton / safe development team lane planning
Repository: `alanua/Knowledge-base`

This is a public-safe docs-only readiness analysis. It does not activate new
lanes, edit runner scripts, change services, expand authority, merge, deploy, or
authorize Jeeves runtime changes.

## Source Evidence

Required sources present and read:

```text
projects/jeeves/agent_department_dry_run_validation_2026_05_03.md
projects/jeeves/agent_department_host_smoke_validation_2026_05_03.md
projects/jeeves/yellow_host_wrapper_source_control_normalization_2026_05_03.md
projects/jeeves/host_wrapper_fresh_origin_gate_design_2026_05_03.md
projects/jeeves/host_wrapper_fresh_origin_gate_insertion_point_2026_05_03.md
```

Required sources absent at drafting time:

```text
projects/jeeves/agent_department_fresh_origin_smoke_validation_2026_05_03.md
projects/jeeves/runner_memory_dev_workstream_inventory_2026_05_04.md
projects/jeeves/chatgpt_exoskeleton_morning_review_checklist_2026_05_04.md
projects/jeeves/fresh_origin_gate_implementation_decision_record_2026_05_04.md
```

The fresh-origin decision record was absent, consistent with the possibility
that issue #198 had not merged or had not run yet. This matrix therefore uses
available evidence only and treats fresh-origin implementation as unproven.

## Status And Scope

Current status: bounded YELLOW docs-runner planning remains the only lane shape
with enough evidence to discuss as already operating. Dry-run/status wrappers
for additional lane names exist as inert validation surfaces, but evidence does
not authorize live expansion.

Scope boundaries:

```text
allowed: public-safe readiness analysis
allowed: future lane proposals as non-activated candidates
blocked: implementation, service, daemon, timer, network, secret, deploy, merge, or runtime authority changes
blocked: any self-expansion of runner permissions
requires approval: any move from proposal/dry-run into live lane operation
```

## Current Operating Model

The current YELLOW `lane:docs` path is bounded by issue labels, allowed-file
rules, runner validation, and draft-PR review. The runner may prepare a branch,
invoke Codex on a controlled prompt, validate changed files, and create a draft
PR through the existing wrapper path, but this document does not grant or change
that behavior.

The dry-run/status evidence shows inert lane wrappers for:

```text
runner-main
runner-docs
runner-tests
watchdog
status
```

Those wrappers reported:

```text
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

Fresh-origin proof remains a material blocker. Prior validations could not prove
execution from freshly updated `origin/main` because Git metadata writes failed
in the constrained checkout. The proposed solution is a host-wrapper
fresh-origin gate before Codex starts, but the active insertion point appears
host-local under the YELLOW wrapper path and is not yet normalized into reviewed
source control.

## Lane Candidates

Candidate lanes for future planning:

```text
docs: docs-only YELLOW tasks under explicit allowlists
tests: validation-only tasks that run tests and report results
implementation dry-run: non-mutating implementation planning and patch preview
reviewer/validator: read-only review of PRs, diffs, or task outputs
watchdog: health/status observation without claiming or mutating work
```

These candidates are proposals only. No lane is activated by this matrix.

## Readiness Matrix

| Lane | Current readiness | Already safe | Blocked | Requires explicit Oleksii approval |
| --- | --- | --- | --- | --- |
| Docs | Partially ready within current bounded YELLOW docs runner | Docs-only edits under issue allowlist, `git diff --check`, draft PR review, no merge/deploy authority | Fresh-origin proof gap; active wrapper remains host-local; absent #198 decision record | Any change to live wrapper behavior, authority, allowed files, labels, or approval policy |
| Tests | Dry-run/status evidence only | Inert wrapper shape can report accepted labels and non-action fields | Live test lane activation; test command policy; freshness proof; dirty-worktree policy; source-control normalization | Any live claiming, branch creation, test execution policy, PR creation, or expansion beyond reporting |
| Implementation dry-run | Concept only, with dry-run wrapper evidence for `runner-main` | Non-mutating analysis and patch plans in docs may be safe when explicitly scoped | Any code changes, runtime behavior changes, generated commits, pushing, merge/deploy, service edits | Any implementation execution, even dry-run if it creates branches, writes files, or opens PRs |
| Reviewer/validator | Concept only | Read-only review of public-safe diffs and docs can be safe if no labels or branches are changed | Authority to approve, request changes, resolve threads, mutate labels, or block/unblock work automatically | Any GitHub mutation, status posting, approval semantics, or validation gate that affects merge readiness |
| Watchdog | Dry-run/status evidence only | Health/status-only reporting with `would_* = no` and no claiming | Live observation source, privacy policy for logs, service boundaries, notification policy, stale-task action policy | Any automatic comments, labels, issue state changes, service checks, alerting, or remediation |

## Prerequisites Per Lane

Docs lane prerequisites:

```text
fresh-origin gate decision record is present and reviewed
host freshness proof succeeds before Codex starts
Codex verifies local HEAD against host-provided SHA
dirty-worktree policy is explicit and fail-closed
allowed files remain issue-scoped and markdown-only unless separately approved
draft PR body reports sources, changed file, validation, non-authorizations, and next step
```

Tests lane prerequisites:

```text
explicit list of allowed test commands
clear no-write or allowed-artifact policy
fresh-origin proof and local SHA agreement
resource and timeout boundaries
public-safe reporting format for test output
no service, network, secret, or deployment access
```

Implementation dry-run prerequisites:

```text
definition of dry-run that forbids commits, pushes, deploys, and live activation
approved output format for patch plans or review-only diffs
strict allowed-file and allowed-command policy
fresh-origin proof before analysis
manual review before any real implementation task
```

Reviewer/validator prerequisites:

```text
read-only source of PR/diff/task context
explicit rule that validator cannot approve, merge, label, or resolve threads automatically
public-safe finding format
human owner for final approval
clear handling of missing or private evidence
```

Watchdog prerequisites:

```text
health/status-only data contract
privacy boundary for logs and host paths
no claiming, labels, comments, branches, commits, pushes, PRs, merges, deploys, or remediation
explicit escalation path to Oleksii or manual review
reviewed source-controlled wrapper or approved host-side plan
```

## Blockers Per Lane

Docs lane blockers:

```text
fresh-origin decision record absent
fresh-origin smoke validation evidence absent
prior fetch/pull proof failed in constrained checkout
active wrapper insertion point appears host-local
source-control normalization not completed
```

Tests lane blockers:

```text
no approved live test lane
no approved command/resource policy
no fresh-origin implementation proof
no approved artifact cleanup or dirty-worktree policy
```

Implementation dry-run blockers:

```text
implementation authority is explicitly out of scope
no approved non-mutating patch-preview mechanism
no permission to edit code or runtime files from this readiness task
```

Reviewer/validator blockers:

```text
no approved authority model for GitHub review actions
no approved mutation policy for labels, comments, approvals, or thread resolution
no explicit separation between advisory review and blocking validation
```

Watchdog blockers:

```text
no approved live watchdog activation
no approved privacy-safe host/log observation contract
no approved automatic remediation or notification policy
```

## Safety Gates

Minimum gates before any future lane activation:

```text
fresh-origin proof happens before Codex starts
host-verified SHA is recorded as minimal public-safe metadata
Codex verifies local SHA agreement
dirty worktree fails closed unless a narrow exception is explicitly approved
changed files stay inside the issue allowlist
validation includes git diff --check
runner reports changed files and non-authorizations
no lane may expand its own permissions
no lane may bypass human review
```

Fresh-origin gate requirements remain:

```text
expected repository only
expected branch only
fast-forward only
no merge, rebase, reset, clean, or force update
minimal metadata handoff only
no secrets, tokens, SSH keys, credential helper output, env dumps, or broad host inventory
fail closed on missing, malformed, or conflicting metadata
```

## User Approval Gates

Explicit Oleksii approval is required before:

```text
editing live host wrappers or ~/agent-dev/bin/*
normalizing active wrappers into source control for later host application
installing, chmodding, symlinking, or replacing runner files
starting, stopping, enabling, restarting, creating, or installing services
activating any tests, implementation dry-run, reviewer/validator, or watchdog lane
changing allowed labels, allowed files, risk levels, or lane routing
allowing any lane to create comments, labels, branches, commits, pushes, PRs, approvals, merges, deploys, or remediation actions
granting Jeeves department-manager or runtime authority
```

ChatGPT review should precede any approval that changes live runner behavior or
authority boundaries.

## Prohibited Automatic Actions

No current or future lane should automatically:

```text
merge
deploy
edit services, timers, daemons, or systemd units
touch secrets, SSH keys, tokens, env values, credentials, or credential helpers
change firewall, network, container, or production/runtime configuration
edit BauClock canon
edit live Hetzner runner scripts without explicit approval
edit ~/agent-dev/bin/* without explicit approval
expand its own permissions
mark Jeeves as department manager
approve PRs or resolve review threads as an authority action
delete, reset, checkout, clean, or revert ambiguous dirty worktree state
rerun old issues automatically
```

## Recommended Next Safe Sequence

Recommended sequence:

1. Wait for or create the missing fresh-origin gate implementation decision
   record, explicitly noting whether issue #198 merged and ran.
2. Repeat fresh-origin smoke validation from a context where Git metadata is
   writable and `git fetch origin main`, `git checkout main`, and
   `git pull --ff-only origin main` can succeed.
3. Create a reviewed source-control normalization or inert-reference task for
   the active host wrapper path, if explicitly allowed outside this docs scope.
4. After ChatGPT review and Oleksii approval, implement the minimal
   host-wrapper fresh-origin gate or approved source-controlled equivalent.
5. Revalidate the bounded docs lane with host freshness metadata, local SHA
   agreement, clean/dirty-state reporting, allowed-file validation, and
   `git diff --check`.
6. Only after the docs lane is stable, draft separate readiness tasks for tests,
   reviewer/validator, implementation dry-run, and watchdog lanes.
7. Keep every new lane advisory or dry-run until Oleksii explicitly approves
   activation, labels, file scope, command scope, and reporting behavior.

## Draft PR Notes

Suggested draft PR summary:

```text
Files read:
- projects/jeeves/agent_department_dry_run_validation_2026_05_03.md
- projects/jeeves/agent_department_host_smoke_validation_2026_05_03.md
- projects/jeeves/yellow_host_wrapper_source_control_normalization_2026_05_03.md
- projects/jeeves/host_wrapper_fresh_origin_gate_design_2026_05_03.md
- projects/jeeves/host_wrapper_fresh_origin_gate_insertion_point_2026_05_03.md

Required files absent:
- projects/jeeves/agent_department_fresh_origin_smoke_validation_2026_05_03.md
- projects/jeeves/runner_memory_dev_workstream_inventory_2026_05_04.md
- projects/jeeves/chatgpt_exoskeleton_morning_review_checklist_2026_05_04.md
- projects/jeeves/fresh_origin_gate_implementation_decision_record_2026_05_04.md

Changed file:
- projects/jeeves/exoskeleton_lane_expansion_readiness_matrix_2026_05_04.md

Readiness summary:
- Current docs lane remains bounded and partially ready only within existing YELLOW docs scope.
- Tests, implementation dry-run, reviewer/validator, and watchdog remain proposed or dry-run-only candidates.
- Fresh-origin proof, source-control normalization, dirty-worktree policy, and explicit approval remain blockers.

Non-authorizations:
- No lane activation, runner script edits, services/systemd/timer changes, secrets access, deploy, merge, BauClock canon edit, or Jeeves runtime authority expansion.

Validation:
- git diff --check

Recommended next safe sequence:
- Resolve the missing fresh-origin decision/smoke evidence, normalize or approve the host-wrapper gate path, revalidate docs lane freshness, then draft separate lane-specific readiness tasks before any activation.
```
