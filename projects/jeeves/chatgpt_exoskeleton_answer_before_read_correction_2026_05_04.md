# ChatGPT Exoskeleton Answer-Before-Read Correction - 2026-05-04

Status: operational correction evidence
Scope: ChatGPT exoskeleton memory hygiene and answer discipline

This is a docs-only correction note. It does not authorize new canon, live
runner edits, runner implementation work, BauClock canon edits, private data
access, service changes, deployment, merge, or any production/runtime behavior
change.

## Read-Before-Write Status

The task required these source paths to be read:

```text
knowledge_base/START_HERE_FOR_CHATGPT.md
knowledge_base/MEMORY_POLICY.md
knowledge_base/WORKING_PROTOCOL.md
knowledge_base/CHATGPT_EXOSKELETON.md
knowledge_base/CHATGPT_EXOSKELETON_RUNBOOK.md
knowledge_base/assistant_diary.md
```

In this checkout, those exact `knowledge_base/` paths are absent. A repository
search for the requested filenames also found no matching files elsewhere.
Because the required canon/runbook files are unavailable locally, this note
does not claim that canon was missing or that a new rule is required.

The task also required these optional Jeeves sources to be inspected if present:

```text
projects/jeeves/runner_memory_dev_workstream_inventory_2026_05_04.md
projects/jeeves/chatgpt_exoskeleton_morning_review_checklist_2026_05_04.md
```

Both optional files are absent in this checkout.

Additional local context read for lane/source-control distinction:

```text
projects/jeeves/agent_runner_lane_docs_route_spec_v1.md
projects/jeeves/runner_lane_docs_next_step_plan_2026_05_02_v1.md
projects/jeeves/agent_runner_source_of_truth_inventory_v1.md
projects/jeeves/yellow_host_wrapper_source_control_normalization_2026_05_03.md
```

## Failure Summary

The reported failure mode is that ChatGPT answered from weak or internal memory
before grounding the answer in the required project sources. It also confused
two different concepts:

```text
runner allowlist / lane routing
project canon layout / BauClock source organization
```

That made an operational routing constraint appear to say something about the
canonical project layout. The correction is to treat routing allowlists as
automation safety boundaries, not as evidence about the shape or location of
BauClock canon.

## Existing Rules Violated

Based on the issue body, the failure maps to existing read discipline rather
than to a proven missing rule. The exact source filenames named as the expected
rule homes are:

```text
START_HERE_FOR_CHATGPT.md
MEMORY_POLICY.md
WORKING_PROTOCOL.md
CHATGPT_EXOSKELETON.md
CHATGPT_EXOSKELETON_RUNBOOK.md
assistant_diary.md
```

Because those files are absent from this checkout, this note records the
reported violation as operational correction evidence only. It does not quote or
rewrite those sources.

## Not A New Canon Rule By Default

No new canon rule should be created from this incident by default. The reported
problem is an application failure of already expected behavior:

```text
read before answering
read before writing
do not substitute memory for source-backed project facts
do not merge unrelated source-of-truth concepts
```

A true missing-rule gap would require reading the actual boot, memory, working
protocol, exoskeleton, runbook, and diary sources and finding that they do not
already cover this behavior. That proof is not available in this checkout.

## Corrected Operational Behavior

For future ChatGPT exoskeleton answers involving project state, runner routing,
canon layout, or memory hygiene:

1. Read the named source files before answering or editing.
2. If the named files are absent, state the absence and limit conclusions to
   the evidence that is actually available.
3. Separate internal memory from source-backed facts.
4. Use runner documents only to describe runner behavior, lane eligibility,
   file allowlists, and forbidden operations.
5. Use project canon documents only to describe project layout, product canon,
   and domain source organization.
6. If evidence conflicts, stop and report the conflict instead of reconciling it
   from memory.

## Project Layout Versus Runner Allowlist Conflicts

When project-layout evidence and runner-allowlist evidence appear to conflict,
the safe handling is:

```text
- Treat the runner allowlist as an execution boundary for automation.
- Treat project canon layout as a documentation/source-of-truth boundary.
- Do not infer BauClock canon structure from Jeeves runner routing.
- Do not infer runner permissions from BauClock canon structure.
- Apply the narrower operational constraint for the current task.
- Ask for or read the missing source before making broader claims.
```

For the Knowledge-base `lane:docs` route, local Jeeves docs identify the allowed
automation file scope as:

```text
projects/jeeves/**/*.md
projects/_index.md when explicitly required
```

That file scope limits what the runner may edit in this lane. It does not define
where BauClock canon lives or authorize edits to BauClock canon.

## Safe Remediation State For #180, #181, And #183

If issues #180, #181, or #183 are mentioned in follow-up discussion, this task
does not remediate, close, merge, deploy, reroute, or implement them. The safe
state is:

```text
- leave any existing branches and draft PRs intact for review
- do not infer their status from memory
- read the issue and PR sources before summarizing them
- do not edit runner scripts, services, secrets, or BauClock canon as part of
  this correction note
- treat any remediation as a separate explicitly authorized task
```

## Next Recommended Action

The next recommended action is to use this note as evidence in the ChatGPT
exoskeleton review and then, in a separate review step, read the actual
`knowledge_base/` boot, memory, working protocol, exoskeleton, runbook, and diary
files from the environment where they exist. If those files already cover the
behavior, keep this as a duplicate-rule correction. If they do not, open a
separate narrowly scoped canon update for review.

## Draft PR Body Notes

A draft PR for this task should state:

```text
Files read:
- required knowledge_base/* sources were requested but absent in this checkout
- optional 2026-05-04 Jeeves sources were absent in this checkout
- local Jeeves lane/source-control context files listed in this note were read

Changed file:
- projects/jeeves/chatgpt_exoskeleton_answer_before_read_correction_2026_05_04.md

Summary:
- records the answer-before-read failure mode
- distinguishes runner allowlists from project canon layout
- treats the incident as duplicate-rule correction evidence, not a proven
  missing-rule gap

Non-authorizations:
- no new canon
- no BauClock canon edits
- no live runner edits
- no service/systemd/network changes
- no secrets or private data access
- no deploy
- no merge

Validation:
- git diff --check
```
