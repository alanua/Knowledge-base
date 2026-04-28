# Knowledge Base

Canonical knowledge repository for project architecture, workflows, decisions, tasks, and handoff notes.

## Structure

- `projects/` — project-specific knowledge
- `_templates/` — reusable templates for new projects

## Canonical working model

- User = owner/final approver
- ChatGPT = architect/reviewer/queue planner
- Codex or another agent = executor
- GitHub Issues = central task queue and runner report location
- Hetzner = primary daemon lane for queued agent work
- Local WSL = reserve/local execution lane
- Runtime = target platform of the project

Work mode:
- task-driven
- explicit review loop
- GREEN tasks may run autonomously inside predefined scope
- YELLOW tasks may prepare draft PRs only
- RED tasks require explicit user approval before execution
- runner reports go to GitHub Issues
- no role mixing
- user is not a command runner or log courier
- architecture decisions must be written down

## Standard project files

Each project should have:
- `overview.md`
- `architecture.md`
- `workflow.md`
- `decisions.md`
- `tasks.md`
- `handoff.md`
