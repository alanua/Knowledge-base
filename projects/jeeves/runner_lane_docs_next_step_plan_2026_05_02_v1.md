# Jeeves Runner Lane Docs Next Step Plan - 2026-05-02

Reviewed source: PR #83 and report issue #84.

## Merge Safety For PR #83

PR #83 is safe to merge later after normal human/ChatGPT review and final approval. It is a draft PR, changes one docs file under `projects/jeeves/`, and issue #84 reports that `git diff --check` passed for the runner output.

Remaining merge caution: PR #83 documents observed runner health and routing state only. It does not prove daemon/loop scheduler state, does not fix the repeated Codex warning, and does not authorize live runner script edits or service changes.

## Confirmed

- Active intake for the Knowledge-base docs lane is GitHub Issues in `alanua/Knowledge-base` with labels, not markdown task files.
- YELLOW docs work is issue/label queue based and produces a branch, draft PR, and report issue.
- The current YELLOW path accounts for `/home/agent/agent-dev/bin/agent-run-next-yellow` as the live runner entrypoint candidate.
- The current YELLOW path also accounts for `/home/agent/agent-dev/bin/agent-yellow-setup` as the setup/template/reinstall carrier candidate.
- PR #83 adds only `projects/jeeves/runner_health_status_2026_05_02_v1.md`.
- Report issue #84 records the runner output for #82 and reports `git diff --check`: passed.
- The repeated Codex warning did not block branch, draft PR, or report issue output.

## Still Unconfirmed

- Whether the GREEN runner is invoked by an active daemon, scheduler, or manual loop.
- Whether the YELLOW runner is invoked by an active daemon, scheduler, or manual loop.
- The exact cause of the repeated `failed to record rollout items: thread ... not found` warning.
- Whether any other live or generated runner files duplicate the Knowledge-base `lane:docs` fallback beyond the already identified yellow entrypoint and setup carrier.
- Whether `executor_tasks/` should be kept as historical planning material, converted to examples/templates, or removed from active-looking docs.

## Why `executor_tasks/` Is Not Active Intake

The observed runner flow selects open GitHub Issues in `alanua/Knowledge-base` using labels such as `agent:task`, `agent:queued`, `lane:docs`, and `risk:yellow`. It then uses the issue body as the task specification.

The markdown task file path referenced during #82 was in the wrong intake shape for the current runner. The current evidence does not show the runner scanning `executor_tasks/` markdown files as its queue, so those files must not be treated as active runner intake.

## Recommendation For `executor_tasks/`

Document `executor_tasks/` as non-current intake before retiring or repurposing it.

Do not delete or repurpose it in the next step. The safer next step is to add or update a source-controlled note that says GitHub Issues with labels are the active intake channel, and any `executor_tasks/` material is historical, planning-only, or template material unless a later reviewed task proves otherwise.

## Next Safe Source-Controlled Step For `lane:docs`

Create a follow-up docs-only source-controlled task that normalizes the runner-docs lane contract in the Jeeves docs:

- name GitHub Issues with labels as the active intake channel
- state that `executor_tasks/` is not active intake
- preserve the required route constraints for `alanua/Knowledge-base` + `lane:docs` + docs-only changes
- explicitly account for both `/home/agent/agent-dev/bin/agent-run-next-yellow` and `/home/agent/agent-dev/bin/agent-yellow-setup`
- require ChatGPT review before any merge or later script task

The next task should remain docs-only. It should not touch runner scripts yet. A later script task, if approved separately, must update or verify both the live entrypoint and setup/template carrier together so they cannot drift.

## Exact Forbidden Changes

- Do not edit `/home/agent/agent-dev/bin/agent-run-next-yellow`.
- Do not edit `/home/agent/agent-dev/bin/agent-yellow-setup`.
- Do not edit any runner script, daemon, scheduler, service, or systemd unit.
- Do not start, stop, enable, restart, or create services.
- Do not merge PR #83 or any follow-up PR from this task.
- Do not deploy or change production/runtime behavior.
- Do not touch secrets, SSH keys, tokens, or environment values.
- Do not add agent-team features, Stage-2 implementation, or department-manager behavior.
- Do not expand routing beyond the reviewed Knowledge-base `lane:docs` docs-only scope.

## Draft PR Notes For This Task

The draft PR for this task should state:

- reviewed source: PR #83 and issue #84
- confirmed findings: issue/label intake, draft PR/report issue output, and the two yellow runner files that must be accounted for
- remaining risks: unconfirmed daemon/loop state, unresolved Codex warning cause, and non-current `executor_tasks/` status needing documentation
- next safe task: docs-only normalization of the lane-docs intake contract; no script edits yet
- files changed: `projects/jeeves/runner_lane_docs_next_step_plan_2026_05_02_v1.md`
- validation result: `git diff --check`
