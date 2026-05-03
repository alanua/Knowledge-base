# ChatGPT Exoskeleton Morning Review Checklist 2026-05-04

Status: draft operational checklist
Scope: morning review after a night of controlled YELLOW runner tasks
Audience: Oleksii and ChatGPT

This is a docs-only checklist. It is not automation code, not runner
implementation, not live service work, and not Jeeves runtime work.

## Source Review Status

Required source paths from the task were checked.

Read successfully from available Jeeves context:

```text
projects/jeeves/agent_department_current_status_v1.md
projects/jeeves/agent_department_rollout_checklist_v1.md
projects/jeeves/agent_runner_lane_docs_route_spec_v1.md
projects/jeeves/runner_docs_live_once_execution_wrapper_plan_v1.md
```

Required source paths not present at the requested locations in this checkout:

```text
knowledge_base/CHATGPT_EXOSKELETON.md
knowledge_base/CHATGPT_EXOSKELETON_RUNBOOK.md
knowledge_base/WORKING_PROTOCOL.md
knowledge_base/assistant_diary.md
projects/jeeves/runner_memory_dev_workstream_inventory_2026_05_04.md
```

The absent optional inventory file should be treated as unavailable for this
morning review until a later task adds it or points to its current location.

## 1. First Actions In The Morning

Start with review, not execution.

```text
- [ ] Do not merge, apply, deploy, or run follow-up automation first.
- [ ] Identify every overnight YELLOW runner report.
- [ ] Identify every overnight draft PR created by a runner.
- [ ] Confirm each report has a matching GitHub issue and draft PR, if expected.
- [ ] Confirm each task stayed within its issue body and file allowlist.
- [ ] Confirm no task claims to have touched services, secrets, production paths, deployment paths, or live runner scripts.
- [ ] Confirm the runner reported validation results.
- [ ] Prepare a short summary for Oleksii before requesting any approval.
```

If anything looks broader than docs-only or broader than the issue body, stop
and mark that item for Oleksii review before touching the PR.

## 2. Review Completed Runner Reports

For each completed report, verify the report as an audit artifact before
reviewing the code diff.

Required report checks:

```text
- [ ] Task issue number is stated.
- [ ] Risk lane is stated as YELLOW.
- [ ] Runner lane is stated, such as lane:docs.
- [ ] Files read are listed.
- [ ] Files changed are listed.
- [ ] Non-authorizations are stated.
- [ ] Validation command and result are stated.
- [ ] Draft PR link is present when the task required one.
- [ ] No merge, deploy, service action, secret access, or production access is claimed.
```

Treat a report as incomplete if it omits the changed file list, validation
result, or non-authorizations. Incomplete reports are not merge-ready.

## 3. Review Draft PRs Safely

Draft PR review is read-only until Oleksii gives explicit approval.

Safe review steps:

```text
- [ ] Confirm the PR is still draft.
- [ ] Confirm the PR branch is task-specific and not a shared branch.
- [ ] Confirm the diff touches only files allowed by the issue body.
- [ ] Confirm the diff is docs-only for docs-lane work.
- [ ] Confirm no generated, secret, env, service, deployment, or runtime files were changed.
- [ ] Read the changed markdown for operational accuracy and scope discipline.
- [ ] Compare the PR body against the runner report.
- [ ] Confirm validation includes git diff --check.
```

Do not use the existence of a draft PR as approval to merge. A draft PR is only
the review package.

## 4. Merge Readiness Checks

A YELLOW runner PR is merge-ready only after all review gates pass.

Merge readiness checklist:

```text
- [ ] The original issue allowed the changed file.
- [ ] The final diff contains only the expected docs-only change.
- [ ] The content does not grant Jeeves department-management authority.
- [ ] The content does not approve live multi-daemon operation.
- [ ] The content does not approve service start, stop, restart, enablement, or systemd creation.
- [ ] The content does not approve secret, SSH key, token, env value, production, or deployment access.
- [ ] The content does not create an automation implementation plan disguised as a checklist.
- [ ] Validation passed, including git diff --check.
- [ ] ChatGPT review found no blocking issue.
- [ ] Oleksii explicitly approves merge.
```

If any item fails, leave the PR unmerged and request a runner correction or a
new scoped follow-up issue.

## 5. What Requires Oleksii Approval

Oleksii approval is required before:

```text
- merging any YELLOW runner PR
- applying any runner-produced recommendation outside the PR diff
- adding queue labels for follow-up work
- converting a draft PR to ready-for-review
- starting any live runner mode
- expanding from lane:docs to any other lane
- changing label taxonomy or runner authority
- touching host scripts, services, systemd units, production paths, deployment paths, secrets, SSH keys, tokens, or env values
```

ChatGPT may review, summarize, and recommend. Oleksii remains the final
approver.

## 6. What Must Not Be Merged Or Applied Automatically

Do not automatically merge or apply anything that:

```text
- changes code, scripts, services, runners, systemd units, deployment files, or production runtime behavior
- touches secrets, SSH keys, tokens, env values, private data, or private Drive material
- changes files outside the issue allowlist
- broadens Jeeves authority or describes Jeeves as department manager
- introduces live daemon startup, watchdog behavior, or local reserve validator behavior
- mutates GitHub labels outside an explicitly approved runner task
- skips ChatGPT review or Oleksii approval
- has missing validation results
- has an incomplete or inconsistent runner report
- depends on absent source files without calling that limitation out
```

For docs-lane YELLOW work, the correct overnight output is a draft PR and a
report, not an automatic merge.

## 7. Private Material Handling

Private material must remain out of runner execution unless a separate explicit
task approves the exact access.

Handling rules:

```text
- [ ] Do not open private Drive material during this morning review.
- [ ] Do not ask a runner to fetch private Drive material retroactively.
- [ ] Do not paste secrets, tokens, SSH keys, env values, or private records into reports or PR comments.
- [ ] If a runner claims private access, treat it as a scope concern and escalate to Oleksii.
- [ ] If a checklist needs private context, record only the need for Oleksii-provided review, not the private contents.
- [ ] Keep public Knowledge-base docs free of raw private material.
```

Summaries may mention that private approval is needed. They must not expose the
private material itself.

## 8. Ukrainian Morning Summary Template

Use this short user-facing template after reviewing the overnight runner output:

```text
Доброго ранку. За ніч runner підготував такі YELLOW-результати:

- Завершені звіти: <кількість>.
- Draft PR для перегляду: <кількість>.
- Файли змінено: <короткий список або "лише очікувані markdown-файли">.
- Валідація: <результат git diff --check та інших перевірок, якщо були>.
- Порушення межі задачі: <немає / є, коротко>.
- Потрібне рішення Oleksii: <що саме можна або не можна мерджити>.

Я не бачу підстав для автоматичного merge/apply. Наступний безпечний крок:
переглянути draft PR і дати явне рішення щодо merge або правок.
```

## 9. Morning Stop Conditions

Stop review and ask Oleksii before proceeding if:

```text
- [ ] A runner changed an unapproved file.
- [ ] A runner report is missing or contradicts the PR diff.
- [ ] A PR is not draft when the task required draft PR only.
- [ ] Validation failed or is missing.
- [ ] The task appears to require forbidden source files or private material.
- [ ] The change touches services, runtime behavior, live runner scripts, secrets, production, deployment, or systemd.
- [ ] The change would make Jeeves a department manager.
```

The morning review should preserve the current operating model:

```text
User -> ChatGPT -> bounded issue -> runner draft PR/report -> ChatGPT review -> Oleksii final approval
```
