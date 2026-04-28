# Workflow

User → ChatGPT → GitHub Issue queue → Hetzner daemon → Executor → issue report / draft PR → ChatGPT review → User final approval

Rules:
- task-driven
- no direct coding by operator or architect
- mandatory review after execution
- GitHub Issues are the central task queue and report location
- Hetzner is the primary daemon lane
- Local WSL is the reserve/local lane
- GREEN tasks may run autonomously inside predefined scope
- YELLOW tasks may prepare draft PRs only
- RED tasks require explicit user approval before execution
- user is owner/final approver, not command runner or log courier
