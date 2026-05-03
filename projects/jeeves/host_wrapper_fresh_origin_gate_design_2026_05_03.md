# Host-Wrapper Fresh-Origin Gate Design - 2026-05-03

Status: design artifact only
Scope: ChatGPT exoskeleton runner infrastructure design for fresh-origin validation
Repository: `alanua/Knowledge-base`

This is not Jeeves runtime work. This is not live development department
expansion. This document does not approve runner authority expansion, live runner
script edits, service changes, network changes, deployment, or secret access.

## Source Relationship

This design follows the evidence trail from:

```text
issue #147 - fresh-origin smoke gate rerun task
PR #148 - dry-run wrappers stayed inert, but fresh-origin validation failed
issue #151 / PR #157 - constrained runner-context DNS/socket blocker evidence
issue #160 / PR #161 - attempted host-side diagnostics still ran in constrained context
issue #162 - runner report plus manual host-shell follow-up summary from Oleksii
```

Manual host-shell follow-up reported that an interactive Hetzner runner host
shell can resolve `github.com`, reach `https://github.com` and
`https://api.github.com`, and run:

```bash
git ls-remote https://github.com/alanua/Knowledge-base.git HEAD
```

Canon/evidence status: the public-safe summary above narrows the blocker to the
YELLOW runner/Codex sandbox/wrapper context. It does not show a host-wide DNS or
GitHub outage.

## Problem Statement

Fresh-origin validation currently depends on a context that may have restricted
DNS, sockets, or git metadata writes. When the Codex sandbox cannot fetch from
GitHub, it cannot prove that docs-only validation ran from current `origin/main`.
That failure blocks confidence in YELLOW runner results even when the host itself
has working GitHub access.

The design goal is to move GitHub freshness proof outside the constrained Codex
sandbox. A host wrapper should prepare and verify a fresh checkout first, record
the exact checkout state, and only then start Codex with that already prepared
workspace for docs-only validation.

## Evidence Summary

Host shell evidence:

```text
interactive host shell can resolve github.com
interactive host shell can reach https://github.com
interactive host shell can reach https://api.github.com
interactive host shell can run git ls-remote against alanua/Knowledge-base.git
```

Codex sandbox / runner-context evidence:

```text
fresh-origin validation failed in the controlled runner context
dry-run wrappers stayed inert while freshness proof failed
host-side diagnostics attempted from the same constrained context did not prove host reachability
the constrained context may not be a reliable place to prove network freshness
```

Conclusion: the fresh-origin gate should not ask Codex to prove GitHub freshness
when Codex may be running with restricted sockets. Codex should validate the
already prepared checkout and report the host-provided freshness metadata.

## Proposed Host-Wrapper Gate Sequence

The host wrapper should run before the Codex sandbox starts.

Preferred sequence:

```text
1. Select the intended local checkout for alanua/Knowledge-base.
2. Confirm the checkout remote is the expected public repository URL.
3. Fetch or update from origin/main from the host context.
4. Move only by fast-forward update.
5. Record the resulting commit SHA.
6. Record clean/dirty state.
7. Stop if the checkout is not at the verified fresh origin commit.
8. Stop if dirty state is not allowed for the lane.
9. Start the Codex sandbox with the prepared checkout.
10. Pass the recorded freshness metadata into the sandbox as read-only run context.
11. Require Codex to run docs-only validation against that checkout.
12. Require final runner reporting to include the host freshness metadata and Codex validation result.
```

Preferred host-side commands:

```bash
git fetch origin main
git checkout main
git pull --ff-only origin main
git rev-parse HEAD
git status --short
```

For a disposable checkout, the wrapper may instead use a fresh clone and then
record the same metadata:

```bash
git clone https://github.com/alanua/Knowledge-base.git <controlled-workdir>
git -C <controlled-workdir> checkout main
git -C <controlled-workdir> pull --ff-only origin main
git -C <controlled-workdir> rev-parse HEAD
git -C <controlled-workdir> status --short
```

Codex sandbox responsibility:

```text
run docs-only validation against the already prepared checkout
read and report the host-provided commit SHA and clean/dirty state
avoid treating sandbox network access as freshness proof
stop if required host freshness metadata is missing or malformed
```

## Data Passed Into Codex Sandbox

The host wrapper should pass only minimal public-safe metadata:

```text
repository=alanua/Knowledge-base
remote_url=https://github.com/alanua/Knowledge-base.git
branch=main
host_freshness_checked_at_utc=<ISO-8601 timestamp>
host_freshness_command_set=fetch_or_clone_plus_ff_only_update
host_verified_head_sha=<40-character commit SHA>
host_status_short=<empty string or redacted line count plus allowed public paths>
host_worktree_clean=yes|no
host_update_mode=existing_checkout|fresh_clone
codex_allowed_scope=docs-only
codex_allowed_files=<issue allowlist>
source_issue=<issue number>
runner_lane=lane:docs
risk=risk:yellow
```

The wrapper must not pass secrets, tokens, SSH keys, credential helper output,
private host paths beyond the controlled checkout identity, environment dumps,
repository settings, or raw network diagnostics.

If `git status --short` is non-empty, the safest default is to stop before
starting Codex. If a future reviewed implementation permits known untracked
runner artifacts, the wrapper should pass only a public-safe summary such as:

```text
host_worktree_clean=no
host_status_short_allowed_entries=1
host_status_short_allowed_paths=.codex
```

That exception must be explicitly reviewed before implementation.

## Allowed Commands And Forbidden Commands

Allowed for the host-wrapper freshness gate:

```text
git fetch origin main
git clone https://github.com/alanua/Knowledge-base.git <controlled-workdir>
git checkout main
git pull --ff-only origin main
git rev-parse HEAD
git status --short
read-only logging of the recorded freshness metadata
starting the existing controlled Codex sandbox after the gate passes
```

Allowed for Codex after the gate passes:

```text
docs-only validation requested by the issue
git rev-parse HEAD for local comparison against host_verified_head_sha
git status --short for local dirty-state reporting
git diff --check
markdown-only edits within the issue allowlist
```

Forbidden for this design and for the first implementation task:

```text
live Hetzner runner script edits
~/agent-dev/bin/* edits
systemd unit creation or changes
service start, stop, enable, restart, or install actions
firewall or network policy changes
Docker or Podman changes
secret, SSH key, token, credential, or environment-secret access
repository settings changes
automatic rerun of issue #147
runner authority expansion
live development department expansion
merge, deploy, or production/runtime behavior changes
```

## Safety And Privacy Boundaries

The host wrapper should prove only that the repository checkout is fresh. It
should not become a general host diagnostic tool.

Required boundaries:

```text
Use only the expected repository and branch.
Use only public GitHub repository network checks needed for git freshness.
Do not print credentials, helper configuration, environment values, tokens, SSH config, or private host inventory.
Do not expose broad host paths or unrelated filesystem state.
Do not mutate labels, create branches, commit, push, create PRs, merge, deploy, or manage services as part of the freshness gate.
Treat Codex sandbox network success as optional telemetry, not authority.
Fail closed when freshness, SHA agreement, branch identity, or dirty-state policy is ambiguous.
```

## Validation Checklist

Before starting Codex:

```text
[ ] remote URL matches https://github.com/alanua/Knowledge-base.git
[ ] branch is main
[ ] host fetch/clone succeeded
[ ] host fast-forward update succeeded
[ ] host commit SHA was recorded with git rev-parse HEAD
[ ] host dirty state was recorded with git status --short
[ ] dirty-state policy passed
[ ] freshness metadata was written to the controlled run context
```

Inside Codex:

```text
[ ] host freshness metadata is present
[ ] host_verified_head_sha is a 40-character SHA
[ ] local git rev-parse HEAD matches host_verified_head_sha
[ ] local git status --short is reported
[ ] validation stays within docs-only issue scope
[ ] git diff --check passes
[ ] final report includes host freshness metadata, changed file, validation result, non-authorizations, remaining risk, and next recommendation
```

## Failure Modes And Mitigations

Host fetch or clone fails:

```text
mitigation: stop before Codex starts; report that host freshness proof failed
```

Fast-forward update fails:

```text
mitigation: stop; do not merge, rebase, reset, or force update automatically
```

Unexpected remote or branch:

```text
mitigation: stop; require manual review of checkout identity
```

Dirty worktree before Codex starts:

```text
mitigation: stop by default; do not delete or revert files automatically
```

Codex local SHA differs from host-verified SHA:

```text
mitigation: stop validation; report possible checkout handoff or workspace mismatch
```

Codex cannot reach GitHub:

```text
mitigation: do not treat this as freshness failure if host proof passed; report that sandbox network remains constrained
```

Freshness metadata missing or malformed:

```text
mitigation: stop before docs validation; require wrapper fix
```

Wrapper logs too much host data:

```text
mitigation: redact to the minimal metadata contract and require review before rerun
```

## Next Implementation Task Recommendation

Open a small reviewed implementation task for the host-wrapper fresh-origin gate.
That task should add the minimal wrapper-side freshness preflight and sandbox
metadata handoff only. It should not edit live runner behavior beyond inserting
the gate at the reviewed wrapper boundary, and it should not expand runner
authority.

Recommended implementation acceptance criteria:

```text
host wrapper proves origin/main freshness outside Codex
host wrapper records commit SHA and clean/dirty state
Codex receives only the minimal metadata contract
Codex compares local HEAD to host_verified_head_sha
Codex runs docs-only validation from the prepared checkout
failure paths stop closed
no secrets, service changes, network policy changes, deploys, merges, or authority expansion
ChatGPT review and user approval happen before any implementation or authority expansion
```

Draft PR body should state:

```text
files/issues read: issue #147, PR #148, issue #151 / PR #157, issue #160 / PR #161, issue #162, and this design task body
changed file: projects/jeeves/host_wrapper_fresh_origin_gate_design_2026_05_03.md
proposed design summary: host proves fresh origin before Codex starts; Codex validates the prepared checkout and reports host-provided SHA/dirty-state metadata
explicit non-authorizations: no live runner edits, no service changes, no network/firewall/container changes, no secrets, no deploy, no merge, no automatic rerun of #147, no runner authority expansion
validation result: git diff --check
remaining risk: the exact host-wrapper insertion point and dirty-worktree exception policy still need reviewed implementation design
next recommendation: small reviewed implementation task for host-wrapper fresh-origin gate
```
