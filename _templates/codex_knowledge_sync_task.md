# Codex Knowledge Sync Task

## Objective
Make the code executor use the Knowledge-base repository as a mandatory context source before implementation and as a required update target after implementation.

## Required behavior
1. Before starting any implementation task, read relevant files from the corresponding project folder in `alanua/Knowledge-base`.
2. Use at minimum:
   - `overview.md`
   - `architecture.md`
   - `workflow.md` if present
   - `decisions.md`
   - `tasks.md`
   - `handoff.md`
3. After implementation or review, update at least:
   - `tasks.md`
   - `handoff.md`
4. If the implementation introduces a canonical architectural or product change, update `decisions.md`.
5. Never store secrets, tokens, passwords, or private credentials in the Knowledge-base repository.

## Standard mapping
- `projects/bauclock/*` ↔ BauClock repo
- `projects/jeeves/*` ↔ Jeeves repo
- `projects/lavalampa/*` ↔ Lavalampa repo

## Commit policy
When knowledge files are updated, create a separate commit with a message like:
- `docs(kb): update BauClock handoff and tasks`
- `docs(kb): record Lavalampa architecture decision`

## Review rule
Implementation is not complete until code changes and corresponding knowledge-base updates are both present.