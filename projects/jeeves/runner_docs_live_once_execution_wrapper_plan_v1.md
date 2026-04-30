# Runner Docs Live Once Execution Wrapper Plan v1

Date: 2026-04-30
Repository: `alanua/Knowledge-base`
Status: planning artifact only

## Purpose

This document defines the safest implementation path for a first minimal live
runner-docs execution wrapper. The wrapper is intended to process exactly one
Knowledge-base `lane:docs` `risk:yellow` issue after the lane docs verifier has
accepted the task.

This plan does not approve implementation. It does not edit live runner scripts,
services, deployment paths, production/runtime state, secrets, or environment
values.

## Read Context

This plan is based on the following existing artifacts:

```text
projects/jeeves/runner_docs_once_wrapper_dry_run_result_v1.md
scripts/agent-dept/agent-dept-runner-docs-once
scripts/agent-dept/agent-dept-verify-lane-docs
projects/jeeves/agent_runner_lane_docs_route_spec_v1.md
projects/jeeves/agent_runner_lane_docs_verifier_test_result_v1.md
```

The current once wrapper is read-only. It can select one eligible candidate and
route it through the lane docs verifier, but it intentionally does not claim an
issue, mutate labels, create a branch, commit, push, create a PR, merge, deploy,
start services, install services, call live runners, edit live runners, or touch
secrets.

## Exact Scope

The first live execution wrapper must be limited to:

```text
repository = alanua/Knowledge-base
issue_count = exactly one explicit issue number
lane = lane:docs
risk = risk:yellow
output = draft PR only
file_scope = markdown under projects/jeeves/
optional_file_scope = projects/_index.md only when the issue body explicitly requires index maintenance
```

The wrapper must not discover, batch, queue, or process multiple issues. It must
receive one issue number as input and stop if any input implies more than one
task.

The issue body cannot widen this scope. If the issue body and wrapper policy
conflict, the narrower and safer constraint wins.

## Verifier Before Claim

Verifier approval is required before any issue claim or label mutation.

The live wrapper must run the existing lane docs verifier with:

```text
--repo alanua/Knowledge-base
--label lane:docs
--risk risk:yellow
--output draft-pr
--changed-file ...
```

The wrapper may proceed only when the verifier exits `0` and reports:

```text
ACCEPT route=lane:docs
reason_codes=ACCEPT_LANE_DOCS_ROUTE
required_output=draft-pr
```

If the verifier rejects, errors, is missing, is unreadable, or returns ambiguous
output, the wrapper must stop before claiming the issue or changing labels.

## Labels That May Be Changed

After verifier approval, the minimal live wrapper may change only execution-state
labels that are needed to make one-at-a-time operation auditable.

Allowed label mutations:

```text
add: status:claimed
add: status:in-progress
add: status:blocked
add: status:done
add: pr:draft
remove: status:claimed
remove: status:in-progress
remove: status:blocked
```

The first implementation should prefer the smallest useful set:

```text
add: status:claimed
add: status:in-progress
add: pr:draft
remove: status:in-progress
```

Label mutation must happen only for the single verified issue. Every mutation
must be included in the final report.

## Labels That Must Never Be Changed

The wrapper must never add, remove, rename, or reinterpret routing, risk,
authority, repository, or review labels.

Forbidden label mutations:

```text
lane:docs
any other lane:* label
risk:green
risk:yellow
risk:red
department:* labels
manager:* labels
authority:* labels
review:* labels
security:* labels
deploy:* labels
production:* labels
```

The wrapper must also stop if the issue contains conflicting lane or risk labels,
such as multiple `lane:*` labels, multiple `risk:*` labels, or any label that
would imply non-docs routing or broader authority.

## Safe Execution Path Options

### Option A: Delegate To Current YELLOW Runner

This option uses the current controlled YELLOW task runner after the once
wrapper verifies and claims exactly one issue.

Advantages:

- reuses the current reviewed YELLOW execution workflow
- keeps implementation small
- avoids creating another executor surface

Required constraints:

- pass the exact issue number and body as the task specification
- pass the verified file allowlist to the runner
- require draft PR output
- disallow commits, pushes, and PR creation outside the runner's existing
  controlled path
- capture the runner result in the wrapper report

Primary risk:

- the current YELLOW runner may have broader capabilities than this docs-only
  route needs, so the wrapper must constrain inputs before delegation and reject
  any attempt to widen scope.

### Option B: Separate Bounded Docs Execution Path

This option creates a docs-only execution path for the wrapper after verifier
approval.

Advantages:

- smaller runtime authority surface
- easier to prove that only docs files can be changed
- clearer one-issue lifecycle and report format

Required constraints:

- allow only markdown changes under `projects/jeeves/`
- allow `projects/_index.md` only when explicit index maintenance is requested
- require `git diff --check`
- create a branch, commit, push, and draft PR only for the verified issue
- perform no service, deployment, runtime, secret, or live runner action

Primary risk:

- duplicates part of the existing YELLOW runner workflow unless carefully kept
  as a narrow docs-only wrapper.

## Recommended Path

Use Option B for the first minimal live execution wrapper.

The current read-only once wrapper and verifier are already narrow and docs
specific. The first live wrapper should preserve that shape by adding only the
minimum bounded docs execution steps after verifier approval, rather than
delegating to a broader runner. Delegation to the current YELLOW runner can
remain a later option after the docs-only wrapper proves the one-issue lifecycle.

Recommended sequence:

```text
1. Accept one explicit issue number.
2. Read issue title, body, labels, and proposed changed files.
3. Reject unless repo, lane, risk, output, and file scope match this plan.
4. Run the lane docs verifier before any claim.
5. Stop unless verifier accepts.
6. Add only the minimal claim/in-progress label state.
7. Execute the docs-only change in a clean branch.
8. Run git diff --check.
9. Commit, push, and open a draft PR only for the verified docs change.
10. Add pr:draft and remove in-progress only after the draft PR exists.
11. Write a final report.
```

## Report Format

The wrapper must emit a machine-readable report with stable key-value fields.

Minimum report fields:

```text
status=completed|rejected|blocked|failed
repo=alanua/Knowledge-base
issue_number=<number>
lane=lane:docs
risk=risk:yellow
verifier_exit=<number>
verifier_decision=accepted|rejected|error
changed_files=<comma-separated paths>
labels_added=<comma-separated labels>
labels_removed=<comma-separated labels>
branch=<branch-name-or-none>
commit=<sha-or-none>
draft_pr=<url-or-none>
validation=git_diff_check_pass|git_diff_check_fail|not_run
would_merge=no
would_deploy=no
would_start_service=no
would_install_service=no
would_edit_live_runner=no
would_touch_secrets=no
```

For rejected, blocked, or failed runs, the report must include:

```text
reason_codes=<comma-separated reason codes>
recovery_action=<manual action needed>
```

## Rollback And Recovery

Rollback must be limited to source-controlled docs work and issue metadata for
the single verified issue.

Allowed recovery actions:

```text
- remove wrapper-added status labels from the single issue
- close the draft PR if it was opened by the wrapper and is invalid
- revert the wrapper-created branch commit in a follow-up reviewed docs PR
- document the failure in the issue or draft PR
```

Forbidden recovery actions:

```text
- merge automatically
- deploy
- edit live runner scripts
- start, stop, restart, enable, or disable services
- create systemd units, timers, daemons, watchdogs, or startup changes
- touch secrets, SSH keys, tokens, credentials, or environment values
- repair broad routing or department behavior as part of this wrapper
```

If failure occurs after claim but before draft PR creation, the wrapper should
mark only the single issue as blocked and report the reason. If failure occurs
after draft PR creation, the wrapper should leave the draft PR open for manual
review unless the PR itself is known to be malformed or unsafe.

## Stop Conditions

The wrapper must stop before mutation when any of these conditions is true:

```text
- repository is not alanua/Knowledge-base
- issue number is missing, invalid, or not singular
- issue is missing lane:docs
- issue has any non-docs lane label
- issue is missing risk:yellow
- issue has risk:green, risk:red, or conflicting risk labels
- requested output is not draft PR
- changed files are missing
- any changed file is outside allowed docs scope
- projects/_index.md is requested without explicit index maintenance scope
- issue body requests live runner edits
- issue body requests /home/agent/agent-dev/bin/* edits
- issue body requests service, systemd, daemon, timer, watchdog, or startup changes
- issue body requests secrets, SSH keys, tokens, credentials, or environment values
- issue body requests deployment, production, or runtime changes
- issue body requests merge or auto-merge
- issue body requests routing expansion, broad department behavior, or manager authority
- verifier rejects, errors, is unreadable, or produces ambiguous output
```

The wrapper must stop after mutation and report `blocked` if validation fails,
branch creation fails, draft PR creation fails, or local changes exceed the
verified file scope.

## Still Forbidden

The first minimal live execution wrapper must not include or authorize:

```text
- daemon mode
- service or systemd installation
- service start, stop, restart, enable, or disable
- timers, watchdogs, or startup behavior
- deployment
- production/runtime changes
- secret, SSH key, token, credential, or environment value access
- broad routing
- multi-repository routing
- non-docs lanes
- full department behavior
- Jeeves department-manager authority
- merge or auto-merge
```

Any future work in those areas requires a separate explicitly approved task with
its own scope, validation, and review.

## Validation For This Plan

Validation for this planning artifact:

```bash
git diff --check
```
