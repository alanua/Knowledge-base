# Jeeves Agent Department Current Status v1

Status: current docs-only status
Project: Jeeves
Scope: current state after merged governance, lane plan, dry-run wrapper docs, rollout checklist, and dry-run wrapper scripts.

## Summary

The Jeeves agent development department is still in controlled dry-run preparation. The governance model, lane plan, dry-run wrapper design, rollout checklist, and dry-run wrapper scripts are merged, but the live multi-daemon department is not running yet.

The current safe operating model remains:

```text
User -> ChatGPT -> GitHub Issue / bounded task -> assigned runner lane -> branch / draft PR / report -> ChatGPT review -> User final approval
```

Jeeves is not a department manager yet.

## 1. Already Merged

The following items are merged:

```text
- Governance doc:
  projects/jeeves/agent_development_department_v1.md
- Hetzner lane daemon script plan:
  projects/jeeves/agent_department_hetzner_lane_scripts_plan.md
- Dry-run wrapper plan:
  projects/jeeves/agent_department_dry_run_wrappers_v1.md
- Rollout checklist:
  projects/jeeves/agent_department_rollout_checklist_v1.md
- Dry-run wrapper scripts:
  scripts/agent-dept/agent-dept-dry-doctor
  scripts/agent-dept/agent-dept-dry-run
  scripts/agent-dept/agent-dept-dry-status
  scripts/agent-dept/agent-dept-dry-tail
```

These merged items define a future department with separate lanes for `hetzner-main`, `hetzner-docs`, `hetzner-tests`, `hetzner-watchdog`, and `local-reserve-validator`.

## 2. Tested And Confirmed

The following facts are confirmed:

```text
- agent-dept-dry-doctor passed on Hetzner.
- agent-dept-dry-run hetzner-docs selected a prepared docs-lane issue as an eligible preview.
- Dry-run output confirmed:
  would_claim=no
  would_modify_labels=no
  would_create_pr=no
  would_start_daemon=no
  would_touch_secrets=no
- Live multi-daemon department is not running yet.
```

The dry-run wrappers are designed to use read-only GitHub issue and PR inspection, apply filters in memory, print what would happen, and write only to the dry-run log namespace.

## 3. Still Dry-Run Only

The department is still dry-run only. Current dry-run wrappers may preview lane selection and status, but they must not perform live work.

Dry-run wrappers must not:

```text
- claim issues
- add, remove, or create labels
- create task branches
- edit task files
- commit
- push
- create PRs
- start daemons
- stop daemons
- enable or create systemd units
- touch secrets, SSH keys, tokens, env values, production systems, or deployment paths
```

The dry-run scripts are separate from future live start, stop, status, tail, and doctor commands. They do not approve live mode.

## 4. Must Not Be Started Yet

The following must not be started yet:

```text
- live multi-daemon department
- runner-main daemon
- runner-docs daemon
- runner-tests daemon
- watchdog daemon
- local reserve validator daemon
- systemd user services or timers for the department
- any live mode that claims issues, mutates labels, creates branches, pushes, or opens PRs
```

The docs lane pilot must remain controlled until ChatGPT review and user final approval are complete. Do not add `agent:queued` until ChatGPT explicitly says to run it.

## 5. Current Safe Command Examples

Safe dry-run commands:

```bash
scripts/agent-dept/agent-dept-dry-doctor
scripts/agent-dept/agent-dept-dry-run hetzner-docs
scripts/agent-dept/agent-dept-dry-status
scripts/agent-dept/agent-dept-dry-tail hetzner-docs
```

Safe validation command for docs-only changes:

```bash
git diff --check
```

Safe read-only review examples:

```bash
git status --short
git diff -- projects/jeeves/agent_department_current_status_v1.md
```

Commands that are not approved by the current status:

```text
agent-dept-start
agent-dept-stop
systemctl --user start ...
systemctl --user enable ...
gh issue edit ...
gh issue comment ...
gh pr create ...
git push ...
```

## 6. Next Recommended Implementation Step

The next recommended implementation step is ChatGPT review of the current docs-lane pilot result, followed by user approval before any broader rollout.

After approval, the next step is a controlled live `runner-docs` pilot. It must remain single-lane and docs-only.

The live `runner-docs` pilot should:

```text
- use one prepared Knowledge-base docs-only issue
- require explicit ChatGPT approval before adding `agent:queued`
- create one branch
- create one draft PR
- modify only the explicitly allowed docs file or files
- run git diff --check
- report back to GitHub Issues
- keep ChatGPT review and user final approval gates
```

The live `runner-docs` pilot must not:

```text
- start the full multi-daemon department
- enable systemd services or timers
- run `hetzner-main`, `hetzner-tests`, `hetzner-watchdog`, or `local-reserve-validator`
- touch secrets, production systems, deployment paths, or live service state
- give Jeeves department-management authority
```

Do not expand to `hetzner-main`, `hetzner-tests`, `hetzner-watchdog`, or `local-reserve-validator` until the live docs-only pilot has passed review.

## 7. Risks And Guardrails

Known risks:

```text
- dry-run output is mistaken for a live claim
- wrapper code accidentally imports or calls live claim helpers
- wrapper code accidentally mutates labels
- wrapper logs are written into a live daemon namespace
- status output leaks sensitive environment details
- live runner scripts combine queue, claim, branch, PR, or service startup behavior in one unsafe entrypoint
- users or agents start department services before review is complete
```

Current guardrails:

```text
- GitHub Issues remain the source of truth for queued work.
- ChatGPT remains architect, reviewer, and queue planner.
- User remains final approver.
- Jeeves is not department manager.
- Dry-run mode must remain non-mutating.
- Dry-run logs use a separate dry-run namespace.
- Dry-run wrappers must report would_claim=no and would_modify_labels=no.
- No live services, systemd units, deployments, secrets, or production paths are approved.
- No merge is allowed without ChatGPT review and user final approval.
```

