# Fresh-Origin Gate Implementation Decision Record - 2026-05-04

Status: decision record only
Scope: ChatGPT exoskeleton runner safety, Knowledge-base docs lane
Repository: `alanua/Knowledge-base`

This is a docs-only consolidation. It does not implement the fresh-origin gate,
does not edit live host runner scripts, does not edit `/home/agent/agent-dev/bin/*`,
does not change services, and does not authorize deployment, merge, secrets
access, runner authority expansion, or Jeeves runtime authority expansion.

## Source Relationship

This record consolidates the current source-controlled evidence for the
fresh-origin gate decision point.

Read-before-write sources present in this checkout:

```text
projects/jeeves/host_wrapper_fresh_origin_gate_design_2026_05_03.md
projects/jeeves/host_wrapper_fresh_origin_gate_insertion_point_2026_05_03.md
projects/jeeves/yellow_host_wrapper_source_control_normalization_2026_05_03.md
projects/jeeves/agent_department_host_smoke_validation_2026_05_03.md
```

Read-before-write sources absent in this checkout:

```text
projects/jeeves/runner_github_dns_fresh_origin_blocker_2026_05_03.md
projects/jeeves/runner_host_dns_socket_diagnostics_2026_05_03.md
projects/jeeves/agent_department_fresh_origin_smoke_validation_2026_05_03.md
scripts/agent-host-wrapper-reference/README.md
scripts/agent-host-wrapper-reference/agent-run-next-yellow.reference.sh
scripts/agent-host-wrapper-reference/agent-run-yellow-loop.reference.sh
scripts/agent-host-wrapper-reference/agent-yellow-setup.reference.sh
```

The `scripts/agent-host-wrapper-reference/*` files are absent in this checkout.
This appears consistent with the prior normalization report describing those
files as a recommended future destination, not as files already present here.
Their contents are not inferred or invented in this record.

## Current Known Facts

The fresh-origin problem is narrower than a host-wide GitHub outage based on the
available public-safe evidence. Prior documentation reports that an interactive
host shell could resolve `github.com`, reach GitHub HTTPS endpoints, and run a
`git ls-remote` check against the public Knowledge-base repository, while the
controlled runner or Codex context failed to prove freshness.

The safest design direction already identified is to prove freshness before
Codex starts. The host wrapper should prepare the checkout from `origin/main`,
record the resulting commit SHA and dirty state, then pass only minimal
public-safe metadata into Codex for comparison and reporting.

The proposed active insertion point is host-local, not source-controlled in
this repository:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
function: prepare_branch()
boundary: after cd "$repo_dir" and before git switch main / git pull / branch creation
```

The proposed metadata handoff point is also host-local:

```text
/home/agent/agent-dev/bin/agent-run-next-yellow
function: run_codex_yellow()
boundary: include host freshness metadata in the generated prompt before codex exec
```

The setup/template carrier may need to stay in sync with any future live
wrapper change:

```text
/home/agent/agent-dev/bin/agent-yellow-setup
```

The source-controlled normalization report recommends inert reference material
under `scripts/agent-host-wrapper-reference/`, but those files are not present
in this checkout.

The host smoke validation report also records that fresh-origin update commands
failed in that checkout because Git metadata writes were blocked by read-only
filesystem errors. That report therefore did not prove validation against a
freshly updated `origin/main`.

## Blockers

The active wrapper implementation is host-local under
`/home/agent/agent-dev/bin/*`. A normal Knowledge-base docs PR cannot safely
apply the gate to the running host wrapper unless a later task explicitly
authorizes a manual host apply path or first normalizes the active wrapper into
reviewed source control.

The inert reference scripts recommended by the normalization report are absent
from this checkout. Without those files, this task cannot review or patch a
source-controlled wrapper reference.

The dirty-worktree policy still needs an explicit implementation decision. The
safe default remains to stop when `git status --short` is non-empty before Codex
starts, unless a later reviewed task approves a narrow exception such as a
public-safe `.codex` artifact policy.

The prior failed fresh-origin validations show that Codex sandbox network access
cannot be treated as the authority for freshness. Freshness proof must come from
the host wrapper before Codex execution.

## Implementation Options

Option 1: source-control normalization first.

Create inert, reviewed reference files under `scripts/agent-host-wrapper-reference/`
in a task explicitly allowed to edit that directory. The reference should mark
each script as inert, non-installed, and not executable, then add the proposed
fresh-origin gate and metadata handoff in source-controlled reference form.
This keeps review in Git before any host apply step.

Option 2: separately approved manual host apply.

Use a future task with explicit manual host approval to edit only the reviewed
host-local wrapper boundary in `agent-run-next-yellow`, plus the setup/template
carrier if needed. That task must remain narrow, must avoid secrets and service
changes, and must validate from a controlled dry run before live queue use.

Option 3: keep the current state and continue documenting the blocker.

Do not implement the gate until either the source-control reference path or the
manual host apply path is explicitly approved. This avoids live host mutation
but leaves the fresh-origin confidence gap unresolved.

## Recommended Safest Next Step

The safest next step is Option 1: create the inert source-controlled wrapper
reference first, in a new task that explicitly allows edits under
`scripts/agent-host-wrapper-reference/`.

That task should add public-safe reference material only, keep scripts
non-executable, include `INERT REFERENCE ONLY - DO NOT INSTALL OR EXECUTE` in
the reference shell files, and model the fresh-origin preflight plus metadata
handoff without applying anything to the host.

Only after that reference is reviewed should a separate manual host apply task
consider changing `/home/agent/agent-dev/bin/*`.

## Manual Host Apply Boundary

Any change to the live runner wrapper is outside this docs-only decision record.
A future manual host apply task would require explicit human approval before:

```text
editing /home/agent/agent-dev/bin/agent-run-next-yellow
editing /home/agent/agent-dev/bin/agent-yellow-setup
installing, copying, chmodding, or symlinking wrapper files
starting, stopping, enabling, restarting, or creating services or timers
running a live queue execution to validate the gate
```

The minimal future apply boundary, if separately approved, should be limited to:

```text
confirm expected repository identity and origin URL
fetch and fast-forward update origin/main from host context
record host_verified_head_sha and host_worktree_clean metadata
stop closed on unexpected remote, failed fetch, failed fast-forward update,
  malformed SHA, missing metadata, or disallowed dirty state
pass minimal public-safe metadata into Codex before codex exec
require Codex to compare local HEAD with host_verified_head_sha
```

The manual apply path must not inspect or print secrets, tokens, SSH keys,
credential helpers, env values, broad host inventory, service state, or private
deployment details.

## Validation Checklist

For a future source-controlled reference task:

```text
[ ] reference directory is explicitly allowed by the task
[ ] every reference script is marked inert and non-installable
[ ] reference scripts are non-executable
[ ] insertion point remains prepare_branch after cd "$repo_dir"
[ ] metadata handoff remains before codex exec
[ ] dirty-worktree policy is explicit and fail-closed by default
[ ] no host-local secrets or private host details are copied into source control
[ ] git diff --check passes
```

For a future manually approved host apply task:

```text
[ ] human approval for live host wrapper edit is explicit
[ ] expected repository is alanua/Knowledge-base
[ ] remote URL is https://github.com/alanua/Knowledge-base.git
[ ] branch is main before task branch creation
[ ] host git fetch origin main succeeds
[ ] host git pull --ff-only origin main succeeds
[ ] host git rev-parse HEAD records a 40-character SHA
[ ] host git status --short is captured
[ ] dirty-state policy passes or the runner stops before Codex
[ ] metadata is written only to controlled run context
[ ] Codex local HEAD matches host_verified_head_sha
[ ] Codex reports local dirty state and docs-only validation result
[ ] no service, deploy, merge, secret, or authority-expansion action occurs
```

## Rollback And Stop Conditions

Stop before Codex starts if:

```text
origin URL is unexpected
checkout cannot switch to or confirm main
host fetch fails
fast-forward update fails
HEAD SHA is missing or malformed
dirty state is present and not explicitly allowed
freshness metadata cannot be written
freshness metadata would expose private host or secret material
```

Stop validation if:

```text
Codex does not receive host freshness metadata
Codex local HEAD differs from host_verified_head_sha
changed files exceed the issue allowlist
git diff --check fails
Codex creates commits before runner validation
the task requires edits outside the approved docs/reference scope
```

Do not auto-rollback by deleting, resetting, cleaning, checking out, rebasing,
or force-updating files unless a later task explicitly approves that behavior.
For a failed live host apply, stop and require manual review against the
approved backup or recovery plan.

## Explicit Non-Authorizations

This record does not authorize:

```text
live host edits
edits under /home/agent/agent-dev/bin/*
executable wrapper changes
chmod, install, copy-over, or symlink actions
service, systemd, or timer changes
service start, stop, enable, restart, or creation
network, firewall, container, or DNS policy changes
secrets, tokens, SSH keys, env values, credentials, or credential helper access
private host inventory collection
deployment
merge
automatic rerun of prior fresh-origin tasks
runner authority expansion
Jeeves runtime authority expansion
Jeeves department-manager authority
```

This record only recommends the next safe decision point: create reviewed inert
source-controlled reference material first, then require explicit manual host
approval before any live wrapper apply.
