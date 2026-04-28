# Architect → Codex Task

## Read first
- Knowledge-base project folder
- architecture.md
- decisions.md
- current tasks.md

## Task type
GREEN / YELLOW / RED

feature / refactor / bugfix / infra

## Objective
Clear implementation goal

## Scope
What is included
What is NOT included

GREEN tasks may run autonomously only inside predefined scope.
YELLOW tasks may prepare a branch and draft PR only.
RED tasks require explicit user approval before execution.

## Technical constraints
- runtime
- performance
- memory limits
- dependencies

## Files to change
Explicit file list

## Expected result
- behavior
- API shape
- output format

## Tests
What must be validated

## Knowledge-base sync
- update tasks.md
- update handoff.md
- update decisions.md if needed

## Queue and reporting
- GitHub Issue is the central task record
- Hetzner daemon is the primary execution lane
- Local WSL is the reserve/local lane
- post changed files, validation, risks and next recommendation back to the Issue
- user is owner/final approver, not command runner or log courier
