# Agent Runner Hotfix Normalization v1

Status: docs-only normalization plan
Scope: Knowledge-base `lane:docs` YELLOW routing hotfix
Related docs:
- projects/jeeves/agent_department_hetzner_lane_scripts_plan.md
- projects/jeeves/agent_department_dry_run_wrappers_v1.md
- projects/jeeves/agent_department_rollout_checklist_v1.md

## Goal

Document the live Hetzner runner hotfix for generic Knowledge-base `lane:docs` routing and define how to normalize it into a durable, reviewed source-of-truth change.

This document does not approve live runner edits, service changes, systemd changes, secret access, deploys, merges, or expanded routing authority.

## Current Hotfix

The live Hetzner YELLOW runner has been manually patched with a generic docs-lane fallback:

```text
If repo is alanua/Knowledge-base and issue has lane:docs,
run a generic Knowledge-base docs-only YELLOW task using the issue body as the task spec.
```

The hotfix enabled a real controlled docs-only flow:

```text
- generic Knowledge-base lane:docs routing
- docs-only task execution through the controlled YELLOW runner
- task branch creation
- draft PR creation
- ChatGPT review
- manual user-approved merge
```

The patch is currently live-host state on Hetzner, not a reviewed source-controlled runner design.

## Why It Was Needed

Before the hotfix, the runner depended on narrow task-title mapping. That made each new Knowledge-base docs issue require explicit runner knowledge before it could execute, even when the issue already carried the correct risk and lane labels.

The generic `lane:docs` fallback was needed so controlled documentation issues could be routed by repository, lane, risk, and issue body instead of by one-off title mappings. That made docs work repeatable while still keeping it inside a YELLOW review path.

## Risk If Left Only On Hetzner

Leaving the change only on the live Hetzner host creates operational drift:

```text
- runner reinstall may remove the hotfix
- setup rerun may overwrite the patched scripts
- server migration may omit the patched behavior
- future reviewers cannot inspect the intended design in source control
- later script edits may accidentally broaden the lane or weaken constraints
- incident rollback may be unclear because the durable baseline is missing
```

The main risk is not the docs fallback itself. The risk is that an undocumented live patch becomes hidden infrastructure behavior.

## Constraints That Must Remain Forbidden

Generic docs routing must remain tightly constrained:

```text
- Knowledge-base only
- lane:docs only
- docs-only
- draft PR only
- markdown files under projects/jeeves/ and optionally projects/_index.md
- no live runner edits from task body
- no services
- no systemd
- no secrets
- no SSH keys
- no environment value changes
- no production systems
- no deploy
- no merge
- no department-management authority for Jeeves
```

The task body must never be allowed to grant broader runner authority than the outer controlled task permits.

## Recommended Source Of Truth

Normalize the hotfix by moving the behavior into reviewed source-controlled runner configuration or scripts, not by relying on manual host edits.

The source-of-truth design should define:

```text
- the exact repository allowlist: alanua/Knowledge-base
- the exact lane allowlist: lane:docs
- the accepted risk labels: GREEN or YELLOW only, with YELLOW retaining review controls
- the allowed file scope: projects/jeeves/**/*.md and optionally projects/_index.md
- the forbidden operations list
- the draft-PR-only requirement
- the required validation command list
- the required ChatGPT review and user approval gates
```

The live Hetzner runner should then be generated from, installed from, or checked against that source-controlled baseline.

## Migration Options

Option A: source-controlled allowlist config

```text
Add a reviewed config file that maps alanua/Knowledge-base + lane:docs to a docs-only YELLOW task template.
The runner reads the config and refuses any issue outside the allowlist.
```

This is the preferred shape if the runner already supports config-driven routing or can be safely adapted to it.

Option B: source-controlled routing function

```text
Move the generic docs fallback into a reviewed runner script function with explicit guards for repo, lane, risk, files, and forbidden operations.
```

This is acceptable if the current runner is script-driven and adding config would be a larger change than the normalization requires.

Option C: install-time patch verification

```text
Keep the live script structure but add an installer or doctor check that verifies the docs-lane fallback exists exactly as expected.
```

This is a weaker migration path because behavior can still depend on live script contents, but it is safer than an undocumented manual patch.

Option D: dry-run wrapper first

```text
Add dry-run-only wrappers that preview Knowledge-base lane:docs selection without claiming issues, creating branches, pushing, creating PRs, editing labels, or touching services.
```

This is the safest first implementation step when the current live scripts need read-only inventory before normalization.

## Safest Next Implementation Task

Create a separate YELLOW implementation issue for read-only inventory plus dry-run-only verification.

That task should:

```text
1. Inspect current Hetzner runner scripts in read-only mode and record exact paths.
2. Identify where the live generic docs fallback currently exists.
3. Add or update source-controlled dry-run logic only, if allowed by that implementation issue.
4. Prove the intended selector accepts only alanua/Knowledge-base issues with lane:docs.
5. Prove the selector rejects non-docs lanes, non-Knowledge-base repositories, missing risk labels, RED tasks, service changes, secrets, deploys, merges, and live runner edits requested from an issue body.
6. Run validation and open a draft PR for ChatGPT review.
```

The first implementation task should not edit live Hetzner runner scripts, start or restart services, create systemd units, touch secrets, deploy, merge, or expand generic routing beyond Knowledge-base `lane:docs`.

## Rollback Plan

For the current live hotfix:

```text
- Treat the live patch as temporary host state until normalized.
- Do not remove it during a docs-only documentation task.
- If it misroutes work, stop claiming new docs-lane tasks and report the scope violation.
- Revert only through a user-approved runner maintenance task after inspecting the exact live patch.
```

For the future normalized implementation:

```text
- Disable the source-controlled docs-lane route or remove the allowlist entry.
- Confirm no active claimed task depends on the route before changing live behavior.
- Leave existing draft PRs for manual review; do not auto-merge or auto-close them.
- Run the runner doctor or dry-run check to confirm Knowledge-base lane:docs is no longer selected.
- Record the rollback result in the implementation PR or follow-up issue.
```

Rollback must not touch secrets, production systems, deployment paths, or unrelated runner lanes.

## Review Gate

Before any merge or live runner normalization, ChatGPT review and user approval are required. The review must verify:

```text
- the route is Knowledge-base only
- the route is lane:docs only
- the route is docs-only
- output is draft PR only
- file scope is markdown under projects/jeeves/ and optionally projects/_index.md
- issue body content cannot authorize live runner edits
- services, systemd, secrets, deploys, production changes, and merges remain forbidden
- rollback is explicit and narrow
```
