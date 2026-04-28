# Codex Knowledge Sync Task

## Objective
Make the code executor use the Knowledge-base repository as a mandatory context source before implementation and as a required update target after implementation.

## Required behavior
1. Start from the originating GitHub Issue. GitHub Issues are the central task queue and report location.
2. Confirm GREEN/YELLOW/RED classification before execution:
   - GREEN may run autonomously inside predefined scope.
   - YELLOW may prepare a branch and draft PR only.
   - RED requires explicit user approval before execution.
3. Before starting any implementation task, read relevant files from the corresponding project folder in `alanua/Knowledge-base`.
4. Use at minimum:
   - `overview.md`
   - `architecture.md`
   - `workflow.md` if present
   - `decisions.md`
   - `tasks.md`
   - `handoff.md`
5. After implementation or review, update scoped knowledge files when the task allows it, usually:
   - `tasks.md`
   - `handoff.md`
6. If an accepted implementation introduces a canonical architectural or product change, update `decisions.md`.
7. Post runner reports, validation results and risks back to the GitHub Issue.
8. Never store secrets, tokens, passwords, or private credentials in the Knowledge-base repository.

## Standard mapping
- `projects/bauclock/*` ↔ BauClock repo
- `projects/jeeves/*` ↔ Jeeves repo
- `projects/lavalampa/*` ↔ Lavalampa repo

## Commit policy
When knowledge files are updated, create a separate commit with a message like:
- `docs(kb): update BauClock handoff and tasks`
- `docs(kb): record Lavalampa architecture decision`

## Review rule
Implementation is not complete until code changes, required knowledge-base updates, and the GitHub Issue report are all present. ChatGPT reviews the result before user approval or merge.
