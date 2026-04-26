# Controlled Agent Development Workflow

Status: canonical workflow v1
Scope: all software projects unless a project-specific document overrides it.
Applies to: Jeeves, BauClock, Lavalamp software work, and future code projects.

## Core decision

Use the OpenClaw/Codex workflow as a development accelerator, not as the product architecture.

```text
User -> ChatGPT -> one macrocommand -> agentctl -> Codex -> branch -> tests/lint/format -> draft PR -> ChatGPT review -> User merge/rework decision
```

## Roles

```text
User      = operator / owner / final decision
ChatGPT   = architect / tech lead / reviewer / task boundary author
OpenClaw  = optional dev-runner / launcher, not product core
agentctl  = local macrocommand layer
Codex     = primary coding executor
GitHub    = source of truth, review, PR history
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
1. User describes the goal in ChatGPT.
2. ChatGPT defines the bounded task and the safe scope.
3. ChatGPT gives one macrocommand or one script.
4. User runs it in WSL/Ubuntu.
5. agentctl creates a branch and runs Codex.
6. Codex modifies only allowed files.
7. Tests/lint/format run locally.
8. agentctl commits, pushes, and creates a draft PR.
9. ChatGPT reviews the PR through GitHub.
10. User approves merge or requests rework.
```

The user should not manually copy large diffs, terminal logs, or Codex prompts unless debugging.

## User output contract

After running a macrocommand, the user should report only one of these:

```text
PR created: <GitHub PR URL>
```

or

```text
No changes
```

or the final 20-40 lines of the error if the command failed.

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

## WSL/Ubuntu role

WSL/Ubuntu is the local execution container for the development toolchain:

```text
git + gh + Codex CLI + Python/Node tests + OpenClaw gateway + agentctl
```

It is not the user's main working interface. The user works in ChatGPT; WSL runs one macrocommand at a time.

## OpenClaw dashboard role

The OpenClaw dashboard may later become a command launcher, but it is not the primary development interface until it reliably supports runbook-style commands.

Target dashboard command style:

```text
run jeeves audit
run jeeves action-contracts
run bauclock audit
run bauclock validate
```

Until that is stable, use ChatGPT -> one WSL macrocommand -> GitHub PR.

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
