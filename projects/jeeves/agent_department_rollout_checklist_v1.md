# Jeeves Agent Department Rollout Checklist v1

Status: draft rollout checklist
Scope: dry-run wrappers first; no live daemon rollout approved
Related docs:
- projects/jeeves/agent_development_department_v1.md
- projects/jeeves/agent_department_hetzner_lane_scripts_plan.md
- projects/jeeves/agent_department_dry_run_wrappers_v1.md

## Phase 0: This Docs-Only Task

Required checks:

```text
- [ ] Only allowed Knowledge-base docs files changed.
- [ ] No live Hetzner scripts edited.
- [ ] No services started, created, enabled, or restarted.
- [ ] No secrets, SSH keys, tokens, env values, or production systems touched.
- [ ] No labels changed.
- [ ] No issue claims created.
- [ ] No branch, commit, push, merge, deploy, or PR created by this task.
- [ ] git diff --check run and result recorded.
```

Because the controlling rules forbid creating a PR in this task, the output is a local docs change plus report. A later user-approved task may create a draft PR.

## Phase 1: Read-Only Inventory

Before adding wrapper scripts, inspect and record the exact current scripts on Hetzner:

```text
- [ ] current agent runner entrypoint script
- [ ] current queue polling script
- [ ] current task claim/lock script
- [ ] current branch/PR creation script
- [ ] current status/log tail script
- [ ] current stop/restart script or systemd user service
- [ ] any current runner environment file, path only
```

Read-only commands:

```text
pwd
find . -maxdepth 4 -type f \( -name '*agent*' -o -name '*runner*' -o -name '*queue*' -o -name '*claim*' -o -name '*agentctl*' \) -print
find . -maxdepth 4 -type f \( -name '*.service' -o -name '*.timer' -o -name '*.env' \) -print
rg -n 'claim|label|runner:|lane:|gh issue|gh pr|systemctl|agentctl|queue|lock' .
systemctl --user list-unit-files
```

Stop conditions:

```text
- [ ] A required path cannot be found.
- [ ] A command would reveal secret values instead of paths or names.
- [ ] Existing scripts perform label mutation in unexpected places.
- [ ] Existing scripts mix claim, branch, and service startup behavior in one unsafe entrypoint.
```

## Phase 2: Dry-Run Wrapper Implementation

Allowed behavior:

```text
- [ ] Add dry-run wrapper commands only.
- [ ] Use read-only GitHub issue and PR queries.
- [ ] Apply runner and lane filters in memory.
- [ ] Print would-run status.
- [ ] Write dry-run logs under a separate dry-run log namespace.
- [ ] Exit without mutation.
```

Forbidden behavior:

```text
- [ ] Do not claim issues.
- [ ] Do not add, remove, or create labels.
- [ ] Do not create task branches.
- [ ] Do not commit or push.
- [ ] Do not create PRs from wrappers.
- [ ] Do not start or stop live daemons.
- [ ] Do not create or enable systemd units.
- [ ] Do not touch secrets, SSH keys, env values, production systems, or deployment paths.
```

Required command names:

```text
agent-dept-dry-run hetzner-main
agent-dept-dry-run hetzner-docs
agent-dept-dry-run hetzner-tests
agent-dept-dry-run hetzner-watchdog
agent-dept-dry-run local-reserve-validator
agent-dept-dry-status
agent-dept-dry-tail <lane>
agent-dept-dry-doctor
```

## Phase 3: Status Format Review

Each dry-run command must show:

```text
- [ ] mode=dry-run
- [ ] lane name
- [ ] status
- [ ] timestamp UTC
- [ ] selected repo, or none
- [ ] selected issue, or none
- [ ] risk label state
- [ ] runner labels
- [ ] lane labels
- [ ] would_claim=no
- [ ] would_modify_labels=no
- [ ] would_create_branch=<hypothetical branch or no>
- [ ] would_create_pr=no
- [ ] would_start_daemon=no
- [ ] would_touch_secrets=no
- [ ] log path
- [ ] short reason
```

Required refusal examples:

```text
missing risk label -> status=blocked, would_claim=no
RED risk label -> status=blocked, would_claim=no
missing lane:docs for docs runner -> status=blocked, would_claim=no
blocked label present -> status=blocked, would_claim=no
active claim detected -> status=blocked, would_claim=no
file overlap detected -> status=blocked, would_claim=no
```

## Phase 4: One Docs Lane Safe Test

Use only one docs lane for the first test:

```text
- [ ] Select one docs-only Knowledge-base issue.
- [ ] Confirm it has GREEN or YELLOW risk.
- [ ] Confirm it has runner:hetzner-docs or runner:any.
- [ ] Confirm it has lane:docs.
- [ ] Run agent-dept-dry-doctor.
- [ ] Run agent-dept-dry-run hetzner-docs.
- [ ] Confirm would_claim=no.
- [ ] Confirm would_modify_labels=no.
- [ ] Confirm no branch was created.
- [ ] Confirm no PR was created.
- [ ] Confirm dry-run log was written only under ~/.local/state/jeeves-agent-dept/dry-run/.
- [ ] Attach command output and log path to the draft PR or runner report.
```

Do not test `hetzner-main`, `hetzner-tests`, `hetzner-watchdog`, or `local-reserve-validator` until the docs lane result has passed ChatGPT review and user approval.

## Phase 5: Review Gate

ChatGPT review required before any live mode:

```text
- [ ] Verify wrapper code cannot call label mutation commands.
- [ ] Verify wrapper code cannot call claim/comment commands.
- [ ] Verify wrapper code cannot call branch, commit, push, or PR creation commands.
- [ ] Verify wrapper code cannot start, stop, enable, or restart services.
- [ ] Verify logs exclude secrets and raw environment dumps.
- [ ] Verify status output is understandable to the user.
- [ ] Verify rollback is a no-op.
- [ ] Verify user remains final approver.
```

## Rollback And No-Op Procedure

For dry-run wrappers:

```text
- [ ] Do not stop services; none should have been started.
- [ ] Do not clear claims; none should have been created.
- [ ] Do not restore labels; none should have been changed.
- [ ] Do not close PRs; none should have been created by wrappers.
- [ ] Remove or revert only the dry-run wrapper implementation branch if rejected.
- [ ] Keep dry-run logs long enough for review, then delete them if desired.
- [ ] Report any unexpected mutation as a scope violation.
```

## Risks

Known risks:

```text
- wrapper accidentally imports live claim or label mutation helper
- wrapper writes logs into the live daemon log namespace
- dry-run output is mistaken for a real claim
- discovered live scripts have combined behavior that is hard to wrap safely
- status output leaks sensitive environment details
```

Mitigations:

```text
- separate dry-run command names
- separate dry-run log namespace
- read-only GitHub command allowlist
- explicit forbidden command checks in review
- one docs lane test before any broader lane testing
- ChatGPT review and user final approval before live implementation
```

## Next Recommendation

Next task:

```text
Create a YELLOW implementation issue that adds dry-run-only wrapper scripts and runs exactly one docs-lane dry-run on Hetzner.
```

The next task should still forbid live daemon edits, service creation, service enablement, issue claiming, label mutation, secrets access, deployment, merge, and production/runtime behavior changes.
