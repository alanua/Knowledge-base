# Knowledge Base

Canonical knowledge repository for project architecture, workflows, decisions, tasks, and handoff notes.

## Structure

- `projects/` — project-specific knowledge
- `_templates/` — reusable templates for new projects

## Canonical working model

- User = operator
- ChatGPT = architect/reviewer
- Codex or another agent = executor
- Runtime = target platform of the project

Work mode:
- task-driven
- explicit review loop
- no role mixing
- architecture decisions must be written down

## Standard project files

Each project should have:
- `overview.md`
- `architecture.md`
- `workflow.md`
- `decisions.md`
- `tasks.md`
- `handoff.md`
