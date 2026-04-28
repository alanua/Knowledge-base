# Controlled Agent Development Workflow

Status: canonical workflow v1
Scope: all software projects unless a project-specific document overrides it.
Applies to: Jeeves, BauClock, Lavalamp software work, and future code projects.

## Core decision

Use the OpenClaw/Codex workflow as a development accelerator, not as the product architecture.

```text
User -> ChatGPT -> GitHub Issue queue -> Hetzner daemon -> Codex -> branch -> tests/lint/format -> issue report -> draft PR when allowed -> ChatGPT review -> User final decision
```

## Roles

```text
User      = owner / final approver
ChatGPT   = architect / tech lead / reviewer / queue planner
OpenClaw  = optional dev-runner / launcher, not product core
agentctl  = local reserve macrocommand layer
Codex     = primary coding executor
GitHub    = source of truth, task queue, reports, review, PR history
Hetzner   = primary daemon runner for queued agent work
WSL       = reserve/local execution lane
Project   = real product codebase
```

OpenClaw must stay replaceable. It must not become:

```text
- product architecture base
- memory core
- policy engine
- production runtime
- autonomous project manager
- direct main-branch writer
```

## Working mode

For normal development, prefer this mode:

```text
1. User states the goal or decision in ChatGPT.
2. ChatGPT translates it into bounded GitHub Issues with color, scope, and acceptance criteria.
3. Hetzner daemon reads the GitHub Issue queue and runs eligible tasks.
4. Codex modifies only explicitly allowed files on task branches.
5. Tests/lint/format run in the task lane where applicable.
6. Runner posts the execution report, validation, risks, and links back to the GitHub Issue.
7. GREEN tasks may finish autonomously inside predefined scope.
8. YELLOW tasks may prepare draft PRs only.
9. RED tasks stop until the user explicitly approves execution.
10. ChatGPT reviews issues, PRs, and reports, then adjusts the queue.
11. User gives final approval for merge/rework/reject decisions.
```

The user is not a command runner or log courier. The system should move task state, logs, reports, and PR links through GitHub Issues and PRs. The user should not manually copy large diffs, terminal logs, or Codex prompts unless debugging.

## GitHub Issues queue

GitHub Issues are the central task queue. Every executable task should have:

```text
- clear title
- GREEN/YELLOW/RED classification
- allowed files or directories
- forbidden actions
- acceptance criteria
- validation requirements
- expected report format
```

Runner reports go back to the originating GitHub Issue as comments or linked PR notes. A report must include changed files, commands run, validation result, risks, and next recommended queue state.

## Task color rules

```text
GREEN  = predefined low-risk scope; daemon may run autonomously and report back.
YELLOW = bounded change with review risk; daemon may prepare a branch and draft PR only.
RED    = high-risk, production, secrets, policy, data, or broad-scope work; requires explicit user approval before execution.
```

RED approval must be recorded before execution begins. A YELLOW task must not be marked ready for merge without ChatGPT review and user approval.

## Macrocommand rules

Each project should have project-specific `agentctl` commands:

```text
agentctl <project>-main
agentctl <project>-audit
agentctl <project>-validate
agentctl <project>-<bounded-task>
```

Examples:

```text
agentctl jeeves-main
agentctl jeeves-audit
agentctl jeeves-drift-audit
agentctl bauclock-main
agentctl bauclock-audit
agentctl bauclock-validate
```

## Safety rules

Allowed:

```text
- create task branches
- edit explicitly scoped files
- run tests/lint/format
- create commits on task branches
- push task branches
- create draft PRs
- update docs when accepted decisions change
```

Forbidden by default:

```text
- direct writes to main
- production deployment
- production secrets
- production database access
- unrelated refactors
- hidden tool installation inside task scripts
- changing security/policy core without explicit task scope
- live external side effects
```

## Hetzner daemon role

Hetzner is the primary daemon lane for queued agent development work:

```text
GitHub Issues -> Hetzner daemon -> scoped branch -> validation -> issue report -> draft PR if allowed
```

The Hetzner daemon may run GREEN tasks autonomously within predefined scope and may prepare draft PRs for YELLOW tasks. It must not execute RED tasks until explicit user approval is recorded.

## WSL/Ubuntu role

WSL/Ubuntu is the reserve/local execution lane for development tasks that should not run on Hetzner or need direct local inspection:

```text
git + gh + Codex CLI + Python/Node tests + OpenClaw gateway + agentctl
```

It is not the user's main working interface or default queue runner. The user works in ChatGPT and GitHub; WSL runs bounded reserve tasks when needed.

## OpenClaw dashboard role

The OpenClaw dashboard may later become a command launcher, but it is not the primary development interface until it reliably supports runbook-style commands.

Target dashboard command style:

```text
run jeeves audit
run jeeves action-contracts
run bauclock audit
run bauclock validate
```

Until that is stable, use ChatGPT -> GitHub Issue queue -> Hetzner daemon, with WSL as the reserve/local lane.

## PR review rules

ChatGPT review checks:

```text
- only allowed files changed
- no secrets touched
- no production/deploy changes unless explicitly requested
- tests/lint/format results are clear
- architecture remains compatible with canonical project model
- PR body explains scope, validation, and risks
```

Only after review should a PR be marked ready and merged.

## Project adoption pattern

For each software project, the first adoption tasks are:

```text
1. clone/pull repo
2. read-only audit
3. validate current tests/lint/format
4. reconcile project docs with actual code
5. create project-specific agentctl commands
6. start small feature slices through draft PRs
```

For BauClock, the same workflow should be adopted before new feature work:

```text
agentctl bauclock-main
agentctl bauclock-audit
agentctl bauclock-validate
agentctl bauclock-<task>
```

The BauClock workflow must also respect its canonical legal/security constraints: role isolation, audit logging, manual correction traceability, retention/privacy, dashboard token security, and DATEV/export boundary control.

## Canonical decision

This workflow is canonical for all current software projects. Project-specific constraints may narrow it, but should not weaken the core safety model.
