# Host-Wrapper Fresh-Origin Gate Insertion Point - 2026-05-03

Status: discovery and patch-plan report only
Scope: ChatGPT exoskeleton runner infrastructure implementation prep
Repository: `alanua/Knowledge-base`
Task: GitHub Issue #168

This report is docs-only. It does not authorize live runner script edits,
service changes, systemd changes, deployment, merge, secret access, automatic
rerun of issue #147, runner authority expansion, or live development department
expansion.

## Source Relationship

This report follows merged PR #166:

```text
projects/jeeves/host_wrapper_fresh_origin_gate_design_2026_05_03.md
```

That design says the next implementation must identify the exact host-wrapper
insertion point before editing anything. This report identifies that point and
keeps the implementation patch as an unapplied outline.

## Evidence Status

Evidence status: sufficient for a minimal implementation plan, but not sufficient
to edit live runner scripts from this task.

The checkout contains source-controlled runner docs and support scripts. The
observed live YELLOW execution boundary is host-local under
`/home/agent/agent-dev/bin`, not version-controlled in this repository. The
source-controlled scripts under `scripts/agent-dept/` provide dry-run,
verification, and once/live-once helper behavior, but they are not the host
wrapper that currently calls `codex exec` for generic Knowledge-base
`lane:docs` tasks.

## Files And Scripts Inspected

Required design and runner context:

```text
projects/jeeves/host_wrapper_fresh_origin_gate_design_2026_05_03.md
projects/jeeves/runner_health_status_2026_05_02_v1.md
projects/jeeves/runner_lane_docs_next_step_plan_2026_05_02_v1.md
projects/jeeves/handoff.md
```

Additional source-controlled runner docs and scripts inspected by targeted
search/read:

```text
scripts/agent-dept/
scripts/agent-dept/agent-dept-dry-doctor
scripts/agent-dept/agent-dept-dry-run
scripts/agent-dept/agent-dept-dry-status
scripts/agent-dept/agent-dept-dry-tail
scripts/agent-dept/agent-dept-runner-docs-dry-run
scripts/agent-dept/agent-dept-runner-docs-live-once
scripts/agent-dept/agent-dept-runner-docs-once
scripts/agent-dept/agent-dept-runner-main-dry-run
scripts/agent-dept/agent-dept-runner-tests-dry-run
scripts/agent-dept/agent-dept-status
scripts/agent-dept/agent-dept-verify-lane-docs
scripts/agent-dept/agent-dept-watchdog-dry-run
projects/jeeves/agent_runner_read_only_host_inventory_v1.md
projects/jeeves/agent_runner_source_of_truth_inventory_v1.md
projects/jeeves/agent_runner_hotfix_normalization_v1.md
projects/jeeves/runner_autonomous_loop_recovery_2026_05_02.md
projects/jeeves/agent_department_host_smoke_validation_2026_05_03.md
```

Optional host-side public-safe inspection:

```text
/home/agent/agent-dev/bin
/home/agent/agent-dev/bin/agent-run-yellow-loop
/home/agent/agent-dev/bin/agent-run-next-yellow
```

Host-side inspection was limited to the public-safe wrapper names requested by
the task. No env files, tokens, SSH configs, credential helpers, secret values,
private host inventory, repo settings, service state, or deployment paths were
read.

## Version-Control Status

The wrapper implementation that currently prepares the repository and starts
Codex appears host-local only:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
/home/agent/agent-dev/bin/agent-run-yellow-loop
```

The version-controlled repository contains related runner support scripts under
`scripts/agent-dept/`, including `agent-dept-runner-docs-live-once`, but the
current generic Knowledge-base `lane:docs` path that calls `prepare_branch`,
`run_codex_yellow`, `validate_kb`, and `create_draft_pr` was observed in the
host-local `agent-run-next-yellow` script.

Therefore, the fresh-origin gate cannot be safely implemented solely by a normal
Knowledge-base runner PR unless a later task first moves or mirrors the active
host wrapper into reviewed source control and updates the host from that source
through an approved manual process.

## Proposed Exact Insertion Point

Proposed executable insertion point:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
function: prepare_branch()
boundary: after cd "$repo_dir" and before git switch main / git pull / branch creation
```

Observed current boundary:

```bash
prepare_branch() {
  local repo_dir="$1"
  local branch="$2"

  cd "$repo_dir"
  git switch main
  git pull --ff-only origin main
  rm -f .codex FETCH_HEAD

  if [ -n "$(git status --porcelain)" ]; then
    echo "ERROR: worktree is not clean before YELLOW task"
    git status --short
    return 1
  fi

  git switch -c "$branch"
}
```

The fresh-origin preflight should be inserted as a helper called from
`prepare_branch` after `cd "$repo_dir"` and before `git switch main`. This is the
earliest common per-task repository boundary before branch creation and before
`run_codex_yellow` starts the Codex sandbox.

The Codex handoff/check should be inserted at the prompt construction boundary:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
function: run_codex_yellow()
boundary: include host freshness metadata in the generated prompt before codex exec
```

Observed current Codex start boundary:

```bash
codex exec --full-auto --sandbox workspace-write -C "$repo_dir" -o "$CODEX_OUT" < "$PROMPT_FILE"
```

The generic Knowledge-base docs lane reaches this boundary through:

```text
run_kb_yellow_generic_docs_lane()
  -> prepare_branch "$repo_dir" "$branch"
  -> run_codex_yellow "$repo_dir" ...
```

The issue dispatcher calls `run_kb_yellow_generic_docs_lane` when the repo is
`alanua/Knowledge-base` and the issue has `lane:docs`.

## Minimal Patch Outline - Not Applied

Do not apply this patch from this task. A later reviewed implementation task
should make the smallest host-side edit:

1. Add a helper in `agent-run-next-yellow`, for example
   `fresh_origin_preflight()`.
2. Call it from `prepare_branch` immediately after `cd "$repo_dir"` and before
   `git switch main`.
3. In the helper, verify only the expected repository identity and branch:
   expected repo path, `origin` URL, `main`, and `origin/main`.
4. Run host-side freshness commands before Codex starts:

```bash
git remote get-url origin
git switch main
git fetch origin main
git pull --ff-only origin main
git rev-parse HEAD
git status --short
```

5. Fail closed on unexpected remote, non-main branch after switch, fetch/pull
   failure, malformed SHA, missing metadata, or disallowed dirty state.
6. Write minimal public-safe metadata into the run directory, for example
   `$RUN_DIR/host-freshness.env` or `$RUN_DIR/host-freshness.json`.
7. Pass only that metadata into the `run_codex_yellow` prompt.
8. Require Codex to compare local `git rev-parse HEAD` with
   `host_verified_head_sha` and report local `git status --short`.
9. Include the metadata and validation result in the draft PR/report body.
10. If `agent-yellow-setup` is a setup/template carrier for
    `agent-run-next-yellow`, update the carrier in the same reviewed host-side
    implementation path so reinstall/setup does not erase the gate.

No implementation patch was applied in this task.

## Dirty-Worktree Handling Recommendation

Default policy: stop before Codex starts if `git status --short` is non-empty.
Do not delete, reset, checkout, clean, or revert files automatically.

Special `.codex` risk: current and prior evidence show untracked `.codex` can
appear in the runner checkout. The current host-local `prepare_branch` removes
`.codex` and `FETCH_HEAD` before checking the worktree, but that is an implicit
live cleanup behavior. For the fresh-origin gate, do not silently broaden that
exception.

Recommended policy:

```text
host_worktree_clean=yes only when status is empty
host_worktree_clean=no when status is non-empty
default action: stop before Codex
optional reviewed exception: allow only an untracked .codex path, report it as
  host_status_short_allowed_paths=.codex, and remove or quarantine it only if a
  later task explicitly approves that behavior
```

The gate should never erase unrecognized dirty files. If dirty state exists, the
wrapper should report a public-safe summary and require manual review.

## Metadata Handoff Location Recommendation

Recommended host-local metadata handoff location:

```text
$RUN_DIR/host-freshness.env
```

`$RUN_DIR` is already created by `agent-run-next-yellow` for task body, result,
log, prompt, Codex output, validation, and PR body files. Storing the freshness
metadata there keeps it per-run, avoids modifying the repository just to pass
metadata, and gives the runner report a stable source.

Recommended fields:

```text
repository=alanua/Knowledge-base
remote_url=https://github.com/alanua/Knowledge-base.git
branch=main
host_freshness_checked_at_utc=<ISO-8601 timestamp>
host_freshness_command_set=fetch_plus_ff_only_update
host_verified_head_sha=<40-character commit SHA>
host_worktree_clean=yes|no
host_status_short_allowed_entries=<integer>
host_status_short_allowed_paths=<empty or .codex>
host_update_mode=existing_checkout
runner_lane=lane:docs
risk=risk:yellow
source_issue=<issue number>
```

Do not include environment dumps, credential helper output, token-bearing URLs,
SSH config, private host inventory, or broad host paths.

## Forbidden Changes

Forbidden for this task and for the next implementation unless separately
approved:

```text
live runner script edits from this docs task
~/agent-dev/bin/* edits from this docs task
systemd/timer/service changes
service start, stop, enable, restart, or creation
firewall/network/container changes
secret, token, SSH key, credential, env value, or credential helper access
repo settings changes
deploy
merge
automatic rerun of issue #147
runner authority expansion
live development department expansion
Jeeves department-manager authority
dirty-worktree cleanup beyond an explicitly reviewed policy
```

## Later Implementation Validation Checklist

Before Codex starts:

```text
[ ] wrapper path and setup/template carrier path are confirmed
[ ] remote URL equals https://github.com/alanua/Knowledge-base.git
[ ] checkout is on main after explicit switch
[ ] host git fetch origin main succeeds
[ ] host git pull --ff-only origin main succeeds
[ ] host git rev-parse HEAD returns a 40-character SHA
[ ] host git status --short is captured
[ ] dirty-state policy passes or task stops closed
[ ] host freshness metadata is written under $RUN_DIR
[ ] metadata contains no secrets or broad host inventory
```

Inside Codex:

```text
[ ] host freshness metadata is present
[ ] host_verified_head_sha is a 40-character SHA
[ ] local git rev-parse HEAD matches host_verified_head_sha
[ ] local git status --short is reported
[ ] work remains docs-only and within the issue allowlist
[ ] git diff --check passes
[ ] final report includes sources inspected, insertion point, metadata result,
    validation result, non-authorizations, and next recommendation
```

After Codex returns:

```text
[ ] ensure_no_codex_commit still passes
[ ] changed_files are within allowed scope
[ ] validate_kb runs git diff --check and git status --short
[ ] draft PR body includes host freshness metadata summary
[ ] report issue includes host freshness metadata summary
[ ] no merge, deploy, service, secret, or authority-expansion action occurred
```

## Runner PR Or Manual Host-Side Edit

Safe implementation cannot be completed by a normal runner PR alone based on the
current evidence. The exact live insertion point is in host-local
`/home/agent/agent-dev/bin/agent-run-next-yellow`, and the setup/template carrier
`/home/agent/agent-dev/bin/agent-yellow-setup` may also need to be kept in sync.

Recommended next step: a reviewed implementation task that either:

1. first normalizes the active wrapper into reviewed source control and then
   applies it to the host through a separate approved manual host-side step; or
2. explicitly authorizes a minimal manual host-side edit to
   `agent-run-next-yellow` plus any required setup/template carrier update, with
   ChatGPT review and user approval before execution.

Until one of those paths is approved, the implementation should remain a patch
plan only.

## Draft PR Notes

The draft PR for this report should state:

```text
sources/scripts inspected: listed in this report
wrapper status: active insertion point appears host-local, not reviewed source-controlled
exact proposed insertion point: agent-run-next-yellow prepare_branch after cd "$repo_dir" and before git switch main, with metadata handoff into run_codex_yellow before codex exec
patch plan: helper fresh_origin_preflight plus $RUN_DIR metadata handoff, not applied
non-authorizations: no live runner edits, service changes, secrets, deploy, merge, rerun of #147, runner authority expansion, or Jeeves department-manager authority
validation: git diff --check
next recommendation: reviewed implementation task with manual host-side edit or source-control normalization first
```
