# Jeeves Agent Department Dry-Run Wrappers v1

Status: draft implementation plan
Scope: docs-only plan for later dry-run wrapper implementation
Related docs:
- projects/jeeves/agent_development_department_v1.md
- projects/jeeves/agent_department_hetzner_lane_scripts_plan.md

## Goal

Prepare dry-run lane wrappers for the Jeeves agent development department without enabling services, starting daemons, changing live runner scripts, touching secrets, deploying, or changing production/runtime behavior.

Target department:

```text
Hetzner:
- runner-main
- runner-docs
- runner-tests
- watchdog

Local WSL:
- reserve validator
```

The first implementation task must create wrappers that can inspect queue eligibility and print what would happen. Dry-run mode must not claim issues, edit labels, create branches, edit files, commit, push, create PRs, start services, or write to production paths.

## Current Scripts To Inspect

The implementation task must inspect the live Hetzner runner checkout in read-only mode and record the exact paths before creating wrappers. The exact current scripts to inspect are:

```text
Hetzner:
- current agent runner entrypoint script
- current queue polling script
- current task claim/lock script
- current branch/PR creation script
- current status/log tail script
- current stop/restart script or systemd user service
- any current runner environment file

Local WSL:
- current local GREEN/YELLOW daemon script
- current reserve validation script
- current agentctl command implementation
- current status/log tail command
```

Read-only discovery commands for the later implementation task:

```text
pwd
find . -maxdepth 4 -type f \( -name '*agent*' -o -name '*runner*' -o -name '*queue*' -o -name '*claim*' -o -name '*agentctl*' \) -print
find . -maxdepth 4 -type f \( -name '*.service' -o -name '*.timer' -o -name '*.env' \) -print
rg -n 'claim|label|runner:|lane:|gh issue|gh pr|systemctl|agentctl|queue|lock' .
systemctl --user list-unit-files
```

The implementation PR must include an inventory table populated from the live host:

```text
script_role | discovered_path | read_only_inspection_result | wrapper_dependency
agent runner entrypoint | TBD from Hetzner | TBD | yes/no
queue polling script | TBD from Hetzner | TBD | yes/no
task claim/lock script | TBD from Hetzner | TBD | yes/no
branch/PR creation script | TBD from Hetzner | TBD | yes/no
status/log tail script | TBD from Hetzner | TBD | yes/no
stop/restart service script | TBD from Hetzner | TBD | no in dry-run
runner env file | TBD from Hetzner | path only, no secret values | no secret reads
```

Do not infer missing paths. If a path cannot be found read-only, stop and report the gap.

## Proposed Wrapper Commands

Dry-run wrapper command names:

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

Optional later file names, subject to the current repo layout discovered on Hetzner:

```text
scripts/agent-dept/agent-dept-dry-run
scripts/agent-dept/agent-dept-dry-status
scripts/agent-dept/agent-dept-dry-tail
scripts/agent-dept/agent-dept-dry-doctor
```

These commands are separate from live start/stop commands. They must not call `agent-dept-start`, `agent-dept-stop`, systemd start/restart commands, live claim functions, branch creation helpers, PR creation helpers, or label mutation helpers.

## Dry-Run Behavior

Each lane wrapper should:

```text
1. Read configuration needed to identify repositories and labels.
2. List candidate GitHub Issues.
3. Apply risk, blocking-label, runner-label, lane-label, concurrency, and file-overlap filters in memory.
4. Select the issue that would be claimed by the live lane.
5. Print the planned claim, branch name, intended files, validation commands, and refusal reasons for skipped issues.
6. Write a local dry-run log.
7. Exit without changing GitHub, git state, service state, files, labels, locks, or secrets.
```

Dry-run mode must be the default. A future live mode must require a separate user-approved task and an explicit non-default flag. This document does not approve live mode.

## Status Output Format

`agent-dept-dry-run <lane>` should print one text block and one machine-readable JSON line.

Text block:

```text
DRY-RUN lane=<lane> status=<eligible|no_eligible_issue|blocked|error>
timestamp_utc=<YYYY-MM-DDTHH:MM:SSZ>
host=<hostname>
repo=<owner/repo or none>
issue=<number or none>
risk=<GREEN|YELLOW|missing|rejected>
runner_labels=<comma-separated labels>
lane_labels=<comma-separated labels>
eligible_action=<select_issue|none>
would_claim=no
would_modify_labels=no
would_create_branch=<branch name or no>
would_create_pr=no
would_start_daemon=no
would_touch_secrets=no
log=<path>
reason=<short reason>
```

JSON line:

```json
{"mode":"dry-run","lane":"hetzner-docs","status":"eligible","repo":"alanua/Knowledge-base","issue":123,"eligible_action":"select_issue","would_claim":false,"would_modify_labels":false,"would_create_branch":"agent/hetzner-docs/issue-123-dry-run-preview","would_create_pr":false,"would_start_daemon":false,"would_touch_secrets":false,"reason":"eligible preview only"}
```

The status output must never include token values, SSH key material, environment variable values that may be secret, or full private paths to secret files.

## No Claiming In Dry-Run

Dry-run wrappers avoid claiming issues by using read-only GitHub operations only:

```text
Allowed:
- gh issue list
- gh issue view
- gh pr list
- read-only GraphQL queries

Forbidden:
- gh issue comment
- gh issue edit
- gh pr create
- gh pr edit
- git push
- git checkout -b for a real task branch
- writing claim files or locks used by live daemons
```

The wrapper may compute and display a hypothetical claim marker:

```text
[dry-run only] would claim alanua/Knowledge-base#123 as runner-docs at 2026-04-30T00:00:00Z
```

It must not post that marker to GitHub, add a lock, or update a shared claim store.

## No Label Modification In Dry-Run

Dry-run wrappers avoid modifying labels by separating label reads from mutations:

```text
Read labels:
- list issue labels
- apply lane filters in memory
- print missing or incompatible labels

Do not modify labels:
- do not add runner labels
- do not remove compatibility labels
- do not add claimed/in-progress labels
- do not clear blocked labels
- do not create new labels
```

If an issue needs labels before it can run, the wrapper reports:

```text
status=blocked
would_modify_labels=no
reason=missing lane:docs; dry-run will not add labels
```

## Logs

Dry-run logs should be written under a separate dry-run namespace, not live daemon logs:

```text
~/.local/state/jeeves-agent-dept/dry-run/<lane>.log
~/.local/state/jeeves-agent-dept/dry-run/<YYYY-MM-DD>/<lane>-<timestamp>.jsonl
```

Each log line should be JSONL:

```json
{"timestamp_utc":"2026-04-30T00:00:00Z","mode":"dry-run","lane":"hetzner-docs","event":"candidate_selected","repo":"alanua/Knowledge-base","issue":123,"would_claim":false,"would_modify_labels":false,"reason":"eligible preview only"}
```

Logs may include issue numbers, public labels, command names, and refusal reasons. Logs must not include secret values, full token-bearing command lines, SSH key paths, or raw environment dumps.

## Safe Docs Lane Test

The first safe test should exercise one docs lane only:

```text
1. Confirm no live service changes are part of the task.
2. Confirm the target issue is docs-only, GREEN or YELLOW, and scoped to Knowledge-base.
3. Confirm labels include runner:hetzner-docs or runner:any plus lane:docs.
4. Run: agent-dept-dry-doctor
5. Run: agent-dept-dry-run hetzner-docs
6. Confirm output says would_claim=no and would_modify_labels=no.
7. Confirm no branch was created: git branch --list '*issue-<number>*'
8. Confirm no PR was created: gh pr list --search '<issue number>'
9. Confirm the dry-run log exists under the dry-run log namespace.
10. Attach the status output and log path to the implementation PR for ChatGPT review.
```

The test must not run `agent-dept-start`, enable systemd units, create a branch, push, open a PR from the wrapper, or alter labels.

## Rollback And No-Op Procedure

Dry-run rollback should be a no-op:

```text
1. Stop. There should be no daemon to stop.
2. Confirm no service was created, started, enabled, or restarted.
3. Confirm no GitHub issue comment, label change, claim marker, branch, or PR was created by the wrapper.
4. Remove only dry-run wrapper files from the implementation branch if the implementation is rejected.
5. Remove local dry-run logs if they are noisy and contain no needed review evidence.
6. Leave live runner scripts and live services untouched.
7. Record the reason for rejection or rollback in the PR or runner report.
```

If any live mutation occurred, treat it as a scope violation, stop immediately, and ask for user review before attempting cleanup.

## Next Implementation Task Recommendation

Create a separate YELLOW implementation issue with this exact scope:

```text
Add dry-run-only lane wrapper scripts for Jeeves agent department.
Allowed: inspect current Hetzner runner scripts read-only, add wrapper scripts in the approved repository path, add tests or shellcheck if already available, run one docs-lane dry-run.
Forbidden: edit live runner scripts, start services, create systemd units, enable daemons, touch secrets, claim issues, modify labels, create task branches from the wrapper, create PRs from the wrapper, deploy, merge.
Validation: agent-dept-dry-doctor; agent-dept-dry-run hetzner-docs; git diff --check.
Output: draft PR for ChatGPT review and user approval.
```
