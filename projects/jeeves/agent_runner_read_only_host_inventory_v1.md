# Agent Runner Read-Only Host Inventory v1

Status: read-only inventory report
Date: 2026-04-30
Scope: current Hetzner runner files relevant to normalizing the generic Knowledge-base `lane:docs` YELLOW docs fallback later

This inventory records read-only findings only. It does not approve live runner edits, service changes, systemd changes, secret access, deployment changes, production/runtime behavior changes, merges, or expanded routing authority.

## Context Read

The following source-controlled context documents were read before host inspection:

```text
projects/jeeves/agent_runner_source_of_truth_inventory_v1.md
projects/jeeves/agent_runner_hotfix_normalization_v1.md
projects/jeeves/agent_department_current_status_v1.md
projects/jeeves/agent_development_department_v1.md
projects/jeeves/agent_department_hetzner_lane_scripts_plan.md
projects/jeeves/agent_department_dry_run_wrappers_v1.md
projects/jeeves/agent_department_rollout_checklist_v1.md
```

## Exact Inspected Paths

The following requested paths were inspected read-only:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
/home/agent/agent-dev/bin/agent-yellow-setup
/home/agent/agent-dev/bin/agentctl
/home/agent/agent-dev/bin/agent-queue-status
/home/agent/agent-dev/bin/cloud-status
/home/agent/agent-dev/bin/agent-run-next-green
/home/agent/agent-dev/bin/agent-watchdog-setup
/home/agent/agent-dev/bin/agent-runner-fix-safe-loop
/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-doctor
/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-run
/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-status
/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-tail
```

All requested paths existed and were executable at inspection time.

## Required Text Search Findings

Required search commands were run against:

```text
/home/agent/agent-dev/bin
/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept
```

Current requested runner files containing the generic Knowledge-base `lane:docs` fallback:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
/home/agent/agent-dev/bin/agent-yellow-setup
```

Relevant exact findings in `/home/agent/agent-dev/bin/agent-run-next-yellow`:

```text
line 545: run_kb_yellow_generic_docs_lane() {
line 556: Execute this controlled Knowledge-base lane:docs YELLOW task.
line 560: - This is a docs-only task.
line 568: - Only modify markdown files under projects/jeeves/ unless the issue body explicitly narrows further.
line 587: validate_allowed_files '^(projects/jeeves/[A-Za-z0-9_./-]+\.md|projects/_index\.md)$' "$files"
line 634: if [ "$REPO" = "alanua/Knowledge-base" ] && gh issue view "$ISSUE" --repo "$REPO" --json labels --jq '.labels[].name' | grep -qx 'lane:docs'; then
line 635: PR_URL="$(run_kb_yellow_generic_docs_lane)"
```

Relevant exact findings in `/home/agent/agent-dev/bin/agent-yellow-setup`:

```text
line 29: cat > "$HOME/agent-dev/bin/$RUN_NEXT" <<'SCRIPT'
line 574: run_kb_yellow_generic_docs_lane() {
line 585: Execute this controlled Knowledge-base lane:docs YELLOW task.
line 589: - This is a docs-only task.
line 597: - Only modify markdown files under projects/jeeves/ unless the issue body explicitly narrows further.
line 616: validate_allowed_files '^(projects/jeeves/[A-Za-z0-9_./-]+\.md|projects/_index\.md)$' "$files"
line 663: if [ "$REPO" = "alanua/Knowledge-base" ] && gh issue view "$ISSUE" --repo "$REPO" --json labels --jq '.labels[].name' | grep -qx 'lane:docs'; then
line 664: PR_URL="$(run_kb_yellow_generic_docs_lane)"
```

The broader `/home/agent/agent-dev/bin` search also found older backup copies containing similar strings, including paths with names such as:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow.bak-20260430-generic-docs-lane
/home/agent/agent-dev/bin/agent-yellow-setup.bak-20260430-generic-docs-lane
/home/agent/agent-dev/bin/agent-run-next-yellow.bak-20260430-dryrun
/home/agent/agent-dev/bin/agent-yellow-setup.bak-20260430-dryrun
```

Those backup files were found by the required directory search but were not in the explicit inspected-path list, so this report treats them as incidental evidence of multiple host-side copies to account for in a later normalization task.

In source-controlled dry-run scripts, the required search found `lane:docs` selection logic in:

```text
/home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept/agent-dept-dry-run
```

The dry-run match is lane-selection preview logic, not the live generic YELLOW fallback.

## Active Runtime Entrypoint Finding

`/home/agent/agent-dev/bin/agent-run-next-yellow` appears to be the active YELLOW runtime entrypoint for a single queued YELLOW task. Evidence:

```text
- It acquires a runner lock.
- It searches open GitHub issues with agent:task, agent:queued, risk:yellow, and runner labels.
- It removes the queue label and adds claimed/running labels.
- It prepares task branches.
- It invokes Codex.
- It validates changed files.
- It commits, pushes, and creates draft PRs.
- It creates a runner report and closes completed issues.
- It contains the current generic Knowledge-base lane:docs fallback.
```

This does not prove which scheduler, daemon, shell, or service invokes it in production, because no live process inspection or service control was performed.

## Setup Or Reinstall Carrier Finding

`/home/agent/agent-dev/bin/agent-yellow-setup` appears to be the setup/template/reinstall carrier for the YELLOW runner. Evidence:

```text
- It sets RUN_NEXT=agent-run-next-yellow on host hetzner-agent-runner-1.
- It writes "$HOME/agent-dev/bin/$RUN_NEXT" with a heredoc.
- The generated script body contains the same generic Knowledge-base lane:docs fallback.
- It also writes loop, daemon, start, status, and stop helper scripts.
```

Key setup-script generation lines:

```text
line 10: RUN_NEXT="agent-run-next-yellow"
line 11: RUN_LOOP="agent-run-yellow-loop"
line 12: RUN_DAEMON="agent-run-yellow-daemon"
line 29: cat > "$HOME/agent-dev/bin/$RUN_NEXT" <<'SCRIPT'
line 774: chmod +x "$HOME/agent-dev/bin/$RUN_NEXT"
line 776: cat > "$HOME/agent-dev/bin/$RUN_LOOP" <<SCRIPT
line 803: cat > "$HOME/agent-dev/bin/$RUN_DAEMON" <<SCRIPT
line 825: cat > "$HOME/agent-dev/bin/$START_CMD" <<SCRIPT
```

## Other Inspected Host Script Findings

`/home/agent/agent-dev/bin/agent-run-next-green` appears to be a GREEN runner entrypoint. It uses the same runner lock path, selects `risk:green` tasks, mutates issue labels, and creates reports. It did not contain `lane:docs` or `run_kb_yellow_generic_docs_lane` in the targeted search.

`/home/agent/agent-dev/bin/agent-runner-fix-safe-loop` appears to be a GREEN runner repair or rewrite helper. It writes `agent-run-next-green` and contains GREEN queue, label, and report logic. It did not contain the generic docs fallback in the targeted search.

`/home/agent/agent-dev/bin/agent-watchdog-setup` appears to be a watchdog/setup helper for labels and stale local runner recovery. It can create/edit labels and requeue local stale tasks if executed. It did not contain the generic docs fallback in the targeted search.

`/home/agent/agent-dev/bin/agent-queue-status` appears to be a read-oriented status helper that lists queued, claimed, running, blocked issues, and open PRs for the known repositories.

`/home/agent/agent-dev/bin/cloud-status` appears to be a read-oriented host/repo status helper.

`/home/agent/agent-dev/bin/agentctl` appears to be an operator helper for status, open PR listing, and selected repo commands. It did not appear to be the generic docs fallback carrier in the targeted search.

## Dry-Run Script Separation

The dry-run scripts are source-controlled:

```text
scripts/agent-dept/agent-dept-dry-doctor
scripts/agent-dept/agent-dept-dry-run
scripts/agent-dept/agent-dept-dry-status
scripts/agent-dept/agent-dept-dry-tail
```

`git ls-files` confirmed all four are tracked in the Knowledge-base repository.

The dry-run scripts appear cleanly separated from live runner scripts:

```text
- They live under /home/agent/agent-dev/repos/Knowledge-base/scripts/agent-dept.
- They use a dry-run state namespace, defaulting to ~/.local/state/jeeves-agent-dept/dry-run or a temp fallback.
- Their status output includes would_claim=no, would_modify_labels=no, would_create_pr=no, would_start_daemon=no, and would_touch_secrets=no.
- `agent-dept-dry-run` uses read-only `gh issue list` and in-memory lane/risk filtering in the inspected logic.
```

This inventory did not execute the dry-run commands, because the requested validation command for this docs-only task was `git diff --check`.

## Systemd And Env Path Findings

The required user-unit command was run:

```bash
systemctl --user list-unit-files | grep -Ei 'agent|runner|jeeves|yellow|green|watchdog' || true
```

Result:

```text
Failed to connect to bus: Operation not permitted
```

Therefore, this inventory did not prove user systemd unit names or enabled/disabled state.

The required path-only env/unit search was run:

```bash
find /home/agent/agent-dev -maxdepth 3 -type f \( -name '*.service' -o -name '*.timer' -o -name '*.env' \) -print
```

Result:

```text
No matching .service, .timer, or .env files were printed under /home/agent/agent-dev at maxdepth 3.
```

No secret values, token values, SSH keys, or environment values were printed.

## Risks Found

Risks identified from read-only inspection:

```text
- The generic Knowledge-base lane:docs fallback exists in live host scripts rather than in an obvious reviewed source-controlled runner source of truth.
- The fallback exists in both the apparent runtime entrypoint and the apparent setup/reinstall carrier, so any normalization must update or verify both in a later approved implementation task.
- Older backup copies in /home/agent/agent-dev/bin also contain similar runner logic, increasing drift and audit confusion.
- The active runtime invocation path is not proven because systemd user-unit inspection was blocked by bus access.
- The YELLOW runner combines issue selection, label mutation, branch preparation, Codex execution, validation, commit, push, draft PR creation, report creation, and issue closure in one entrypoint, which raises blast-radius risk for future edits.
- The setup script can regenerate live runner commands, so editing only the runtime entrypoint later would be fragile.
```

No evidence was found in the explicitly inspected source-controlled dry-run scripts that they call live runner scripts, create PRs, start daemons, or mutate labels.

## Recommended Next Implementation Task

Create a separate controlled YELLOW implementation task to normalize the Knowledge-base `lane:docs` fallback into source-controlled runner behavior or a source-controlled runner allowlist. The task should:

```text
1. Treat this inventory as input, not as approval for live edits.
2. Define the source-controlled route exactly for alanua/Knowledge-base + lane:docs + GREEN/YELLOW + docs-only.
3. Preserve the file allowlist of projects/jeeves/**/*.md and optional projects/_index.md for generic docs tasks.
4. Include forbidden-operation guards for live runner edits from issue bodies, services, systemd, secrets, deploys, production paths, merges, and expanded routing.
5. Account for both /home/agent/agent-dev/bin/agent-run-next-yellow and /home/agent/agent-dev/bin/agent-yellow-setup before any later live replacement.
6. Add a read-only or dry-run verification that rejects non-Knowledge-base repos, missing lane:docs, non-docs lanes, RED tasks, missing risk, forbidden files, services, secrets, deploys, merges, and production/runtime changes.
7. Require ChatGPT review and user final approval before merge or live runner changes.
```

## Not Inspected Or Not Proven

This inventory did not inspect or prove:

```text
- Any secret values, token values, SSH keys, private credentials, or environment variable values.
- Runtime process state for runner daemons.
- Which scheduler or service invokes /home/agent/agent-dev/bin/agent-run-next-yellow.
- User systemd unit names or enablement state, because systemctl --user could not connect to the bus.
- Files outside the requested inspected paths, except incidental matches from the required rg search and the required path-only find command.
- The contents of backup files found under /home/agent/agent-dev/bin.
- Whether any systemd units exist outside /home/agent/agent-dev or deeper than maxdepth 3.
- Whether external cron, tmux, shell history, or another supervisor invokes the runner.
- Whether the dry-run commands currently succeed against GitHub in this environment.
- Any GitHub issue or PR mutation state.
- Any live runner behavior by execution.
```

## Validation

Validation required for this docs-only inventory:

```bash
git diff --check
```

Result to be recorded after the file is written.

Recorded result:

```text
passed
```
