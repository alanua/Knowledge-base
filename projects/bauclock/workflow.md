# Workflow

User → ChatGPT → GitHub Issue queue → Hetzner daemon → Codex → issue report / draft PR → ChatGPT review → User final approval

## Rules
- all changes via tasks
- review after each execution
- no direct production edits
- GitHub Issues are the central task queue and report location
- Hetzner is the primary daemon lane
- Local WSL is the reserve/local lane
- GREEN tasks may run autonomously inside predefined scope
- YELLOW tasks may prepare draft PRs only
- RED tasks require explicit user approval before execution
- user is owner/final approver, not command runner or log courier
