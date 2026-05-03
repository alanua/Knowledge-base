# YELLOW Host Wrapper Source-Control Normalization - 2026-05-03

Status: normalization report only
Scope: ChatGPT exoskeleton YELLOW runner infrastructure preparation
Repository: `alanua/Knowledge-base`

This is a docs-only, non-live reference and apply-plan report. It does not
authorize live runner script edits, host-local script replacement, service
changes, systemd changes, deployment, merge, secret access, automatic rerun of
issue #147, runner authority expansion, live development department expansion,
or Jeeves runtime work.

## Source Relationship

This report follows merged PR #169 and the source-controlled report:

```text
projects/jeeves/host_wrapper_fresh_origin_gate_insertion_point_2026_05_03.md
```

PR #169 found that the active generic Knowledge-base `lane:docs` YELLOW wrapper
is host-local:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
/home/agent/agent-dev/bin/agent-run-yellow-loop
```

It also found that the fresh-origin gate cannot be safely implemented solely by
a normal Knowledge-base PR until the active wrapper is normalized into reviewed
source control or a separate manual host-side patch is explicitly approved.

## Evidence Status

Evidence status: sufficient to prepare a source-control normalization plan, but
not sufficient to edit live host scripts from this task.

Required read-before-write sources were read:

```text
projects/jeeves/host_wrapper_fresh_origin_gate_design_2026_05_03.md
projects/jeeves/host_wrapper_fresh_origin_gate_insertion_point_2026_05_03.md
projects/jeeves/runner_health_status_2026_05_02_v1.md
projects/jeeves/runner_lane_docs_next_step_plan_2026_05_02_v1.md
projects/jeeves/handoff.md
```

Source-controlled runner support script names under `scripts/agent-dept/` were
listed for context. No source-controlled support script was modified.

Host-side inspection was limited to the public-safe wrapper names and bounded
line ranges allowed by the task:

```bash
sed -n '1,260p' /home/agent/agent-dev/bin/agent-run-yellow-loop 2>/dev/null || true
sed -n '1,420p' /home/agent/agent-dev/bin/agent-run-next-yellow 2>/dev/null || true
sed -n '1,420p' /home/agent/agent-dev/bin/agent-yellow-setup 2>/dev/null || true
```

No env files, token files, SSH configs, credential helpers, broad host
inventory, repo settings, service state, logs containing private data, or
deployment paths were read.

## Copy And Redaction Decision

The inspected wrapper content appears structurally public-safe enough to
summarize. It contains shell control flow, public repository names, GitHub issue
label routing, local runner paths under `$HOME/agent-dev`, validation commands,
and draft-PR creation logic. It did not expose token values, SSH keys, env-file
contents, credential helper output, or secret material in the inspected ranges.

Direct script copies were not added in this task because the implementation
instruction narrowed edits to markdown files under `projects/jeeves/`, and
because direct copies would preserve host-local assumptions and live mutation
behavior that should be reviewed before becoming a reference artifact. A later
normalization task can safely add inert, redacted reference scripts if it is
explicitly allowed to edit the destination directory and marks every script:

```text
INERT REFERENCE ONLY - DO NOT INSTALL OR EXECUTE
```

Recommended decision: do not copy the host-local wrappers verbatim. Create a
reviewed inert reference with host-local paths and live behavior clearly marked,
and with any future host-specific values abstracted or documented as examples.

## Exact Wrapper Files Inspected

The exact host-local files inspected were:

```text
/home/agent/agent-dev/bin/agent-run-yellow-loop
/home/agent/agent-dev/bin/agent-run-next-yellow
/home/agent/agent-dev/bin/agent-yellow-setup
```

No live file was edited, installed, chmodded, copied over, symlinked, started,
stopped, restarted, or otherwise changed.

## Public-Safe Structural Summary

`agent-run-yellow-loop` is a small loop wrapper:

```text
sets strict bash mode
accepts an optional batch count, defaulting to 1
for each batch slot, invokes /home/agent/agent-dev/bin/agent-run-next-yellow
prints the child output
stops cleanly when the child reports NO_YELLOW_TASK
stops cleanly when the child reports YELLOW_RUNNER_BUSY
prints YELLOW_LOOP_DONE after completing the requested batch
```

The loop wrapper does not contain the fresh-origin or Codex execution boundary.
It delegates those responsibilities to `agent-run-next-yellow`.

`agent-run-next-yellow` is the active per-task YELLOW wrapper:

```text
sets strict bash mode and prepends runner bin paths to PATH
selects host mode based on hostname
sets lock file, queue label, runner label, runner display name, and search labels
creates a per-run directory under $HOME/agent-dev/agent-runs
wraps gh commands with bounded retry behavior
uses flock to prevent concurrent runner execution
searches configured repositories for open GitHub Issues with task, queue, risk,
  and runner labels
records issue body and run artifacts in the run directory
mutates issue labels from queued to claimed/running best-effort
posts a start comment best-effort
registers an interrupt trap that comments and marks the task stale best-effort
maps known repository names to local checkout paths
prepares a branch by switching to main, pulling with --ff-only, removing .codex
  and FETCH_HEAD, requiring a clean worktree, and creating a task branch
collects changed files from unstaged, staged, and untracked state
rejects direct Codex-created commits before runner validation/commit
validates changed files against route-specific allowlist regexes
constructs a controlled YELLOW Codex prompt from absolute rules, allowed files,
  issue body, and route-specific implementation instruction
starts Codex with workspace-write sandbox in the selected repo directory
removes .codex and FETCH_HEAD after Codex returns
contains route-specific setup, validation, commit, push, and draft-PR creation
  helpers for supported repositories and lanes
```

For the Knowledge-base generic `lane:docs` route, prior PR #169 identified the
important execution chain as:

```text
run_kb_yellow_generic_docs_lane()
  -> prepare_branch "$repo_dir" "$branch"
  -> run_codex_yellow "$repo_dir" ...
  -> ensure_no_codex_commit
  -> changed_files
  -> validate_allowed_files
  -> validate_kb
  -> create_draft_pr
```

The fresh-origin insertion point remains:

```text
agent-run-next-yellow
function: prepare_branch()
boundary: after cd "$repo_dir" and before git switch main / git pull / branch creation
```

The metadata handoff insertion point remains:

```text
agent-run-next-yellow
function: run_codex_yellow()
boundary: add host freshness metadata to the generated prompt before codex exec
```

## Setup Carrier Status

`agent-yellow-setup` is a setup/template carrier for the YELLOW wrapper family.
The inspected content creates `$HOME/agent-dev/bin` support directories, chooses
host-local versus local runner command names based on hostname, and writes the
`RUN_NEXT` script through a heredoc. The heredoc content mirrors the active
`agent-run-next-yellow` structure inspected above.

Conclusion: `agent-yellow-setup` needs sync with any future reviewed change to
`agent-run-next-yellow`. Updating only the live next-task wrapper would leave a
reinstall/setup path that can recreate an older wrapper and erase the gate.

## Recommended Future Source-Control Destination

Recommended destination for a future inert wrapper reference:

```text
scripts/agent-host-wrapper-reference/
```

Recommended files for that later task:

```text
scripts/agent-host-wrapper-reference/README.md
scripts/agent-host-wrapper-reference/agent-run-yellow-loop.reference.sh
scripts/agent-host-wrapper-reference/agent-run-next-yellow.reference.sh
scripts/agent-host-wrapper-reference/agent-yellow-setup.reference.sh
```

Every file in that directory should be non-executable unless a later task
explicitly approves otherwise. Every reference shell file should start with:

```text
INERT REFERENCE ONLY - DO NOT INSTALL OR EXECUTE
```

The reference should be source-controlled as review material, not as a live
install target. It should document which host-local wrapper version it mirrors,
what was redacted or abstracted, and why the reference is inert.

## Minimal Source-Control Normalization Plan

1. Add the inert reference destination under
   `scripts/agent-host-wrapper-reference/` in a future task that explicitly
   permits edits outside `projects/jeeves/`.
2. Add a README that states the directory is not installed by the repo and does
   not authorize live runner changes.
3. Add redacted `.reference.sh` files for the YELLOW loop, next-task wrapper,
   and setup carrier.
4. Mark every reference script `INERT REFERENCE ONLY - DO NOT INSTALL OR
   EXECUTE`.
5. Keep reference scripts non-executable.
6. Preserve the active structural relationship between `agent-run-yellow-loop`,
   `agent-run-next-yellow`, and `agent-yellow-setup`.
7. Add a review checklist covering freshness gate insertion, metadata handoff,
   setup-carrier sync, dirty-worktree policy, and privacy boundaries.
8. Validate with `git diff --check` and a file-mode check for the inert
   reference directory.

This normalization plan is source-control preparation only. It must not install
or apply anything to `/home/agent/agent-dev/bin`.

## Future Host Apply Plan

This section is explicitly separate from this task. It is not approved here.

A future host apply task should require separate human approval and should state
whether it will update the live host wrapper manually or through a reviewed
source-controlled install process. The minimum safe apply plan is:

1. Confirm the reviewed source-controlled reference or implementation PR has
   passed ChatGPT review.
2. Confirm the live host target files:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
/home/agent/agent-dev/bin/agent-run-yellow-loop
/home/agent/agent-dev/bin/agent-yellow-setup
```

3. Back up or otherwise record the exact current host-local wrapper content in a
   private host-side location approved for operational recovery.
4. Apply the reviewed fresh-origin gate to `agent-run-next-yellow` at
   `prepare_branch()` after `cd "$repo_dir"` and before branch preparation.
5. Add the host freshness metadata handoff to `run_codex_yellow()` before
   `codex exec`.
6. Sync `agent-yellow-setup` so future setup/reinstall recreates the same
   reviewed wrapper behavior.
7. Keep `agent-run-yellow-loop` unchanged unless the reviewed implementation
   finds it must pass new non-secret metadata or flags.
8. Validate from a controlled dry run before any live queue execution.
9. Do not automatically rerun issue #147 unless a later task explicitly
   approves that rerun.

Forbidden unless separately approved: service changes, daemon changes,
systemd changes, chmod/install/symlink operations beyond the approved wrapper
apply, deployment, merge, production/runtime changes outside the wrapper apply,
secret access, SSH key access, env-file access, credential helper inspection, or
runner authority expansion.

## Secrets And Privacy Review Notes

Inspected wrapper ranges did not show secret values, tokens, SSH keys, env-file
contents, credential helper output, private host inventory, repo settings, or
raw diagnostic logs. They did show public repository names, issue labels,
runner names, local checkout paths under `$HOME/agent-dev`, run directory
structure, and live GitHub mutation behavior.

Privacy posture:

```text
safe to summarize structurally in source-controlled docs
not recommended to copy verbatim without an explicit inert-reference task
do not include env dumps, credential helper output, SSH config, token values,
  service state, broad host inventory, logs, or deployment paths in any future
  reference
abstract host-local paths where possible, or mark them as examples only
fail closed if future inspection finds private host details or unsafe assumptions
```

Dirty-worktree behavior remains a safety concern. The current wrapper removes
`.codex` and `FETCH_HEAD` before checking cleanliness. A future gate should not
silently broaden that cleanup behavior. The default should remain: if dirty
state is ambiguous or unapproved, stop before Codex starts and report a
public-safe summary.

## Next Recommended Task

Next recommended task: create a reviewed source-controlled implementation or
inert-reference PR that is explicitly allowed to edit
`scripts/agent-host-wrapper-reference/` and, if implementation is in scope,
adds the fresh-origin gate in source-controlled reference form first.

If immediate live runner protection is required instead, use a separately
approved manual host apply task with ChatGPT review and user approval before
editing `/home/agent/agent-dev/bin/*`.

ChatGPT review and user approval remain required before any live host edit.
