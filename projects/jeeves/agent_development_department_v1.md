# Jeeves Agent Development Department v1

Status: canonical draft v1
Project: Jeeves
Scope: current GitHub Issues based development conveyor for agent-assisted software and documentation work.

## 1. Department purpose

The agent development department is a bounded set of role-based runner lanes for moving approved work through the development conveyor.

It exists to make development faster while preserving ownership, review, auditability and merge control.

Canonical chain:

```text
User -> ChatGPT -> GitHub Issue / bounded task -> assigned runner lane -> branch / draft PR / report -> ChatGPT review -> User final approval
```

This is not an autonomous swarm. Work must remain scoped, queued and reviewable through GitHub Issues, branches, draft PRs and reports.

## 2. Department roles

```text
User             = owner / final approver
ChatGPT          = architect / reviewer / queue planner
Hetzner main     = primary executor / general YELLOW lane
Hetzner docs     = Knowledge-base / docs / history recovery lane
Hetzner tests    = validation / tests / regression lane
Local WSL green  = reserve/local GREEN validation lane
Local WSL yellow = reserve/local YELLOW draft PR lane
```

Jeeves is not a department manager yet. Jeeves is still being built and may only become an observer, planner or queue manager after explicit future approval.

## 3. Runner labels and lane vocabulary

Runner labels:

```text
runner:hetzner-main
runner:hetzner-docs
runner:hetzner-tests
runner:local
```

Compatibility runner labels that must not be removed without an explicit migration:

```text
runner:hetzner
runner:any
runner:local
```

Lane labels:

```text
lane:docs
lane:tests
lane:validate
lane:implementation
lane:recovery
```

Issue labels should identify both the intended runner and the work lane when practical. Compatibility labels may remain on older issues while newer issues move toward the clearer runner labels above.

## 4. Permission boundaries

GREEN tasks are read-only or validation-only.

Allowed:

```text
- inspect repositories, issues, PRs and docs
- run tests, lint, format checks and build checks
- summarize findings
- produce reports and recommendations
- validate that a branch or PR matches its requested scope
```

Forbidden:

```text
- modify files
- commit, push, merge or deploy
- access secrets or production systems
- change labels or queues unless explicitly allowed
```

YELLOW tasks may create bounded draft work.

Allowed:

```text
- edit explicitly scoped files
- create a task branch
- run relevant validation
- commit and push the task branch when the task allows it
- create a draft PR when the task allows it
- write a structured report when no PR is created
```

Forbidden:

```text
- merge
- deploy
- write directly to main
- touch secrets
- expand scope without ChatGPT or user approval
- change production/runtime behavior unless the task explicitly allows it
- rewrite canonical Jeeves memory without user review
```

RED tasks require explicit user approval and should usually be performed by the user or under direct user control.

Examples:

```text
- production deployment
- production secrets or credentials
- production data or databases
- security policy changes
- runner infrastructure changes
- main-branch writes
- irreversible operations
```

Agents must not execute RED tasks by default.

## 5. Lane responsibilities

Hetzner main:

```text
- primary YELLOW implementation lane
- small bounded code or docs tasks
- draft PR preparation
- general repository maintenance inside explicit scope
```

Hetzner docs:

```text
- Knowledge-base updates
- project history recovery
- documentation reconciliation
- architecture and decision record drafting
- docs-only draft PRs
```

Hetzner tests:

```text
- GREEN validation
- test, lint, build and regression runs
- failure reproduction
- validation reports
- test-focused YELLOW changes only when explicitly assigned
```

Local WSL green:

```text
- reserve local validation lane
- read-only checks
- reproduction of runner results
- final local sanity checks before ChatGPT review
```

Local WSL yellow:

```text
- reserve local draft PR lane
- bounded work when cloud runners are unsuitable
- emergency or sensitive development that still avoids secrets and production access
```

## 6. Department-wide never rules

No lane may:

```text
- become an autonomous project owner
- invent or start unqueued work
- create a large swarm of agents
- merge PRs
- deploy production
- access production secrets, credentials or databases
- write directly to main
- hide failed tests
- continue after scope conflict without stopping and reporting
- change live runner scripts unless the task explicitly allows it
- grant Jeeves management authority
```

## 7. Queue rules

GitHub Issues are the source of truth for queued work.

Each queued task should include:

```text
- goal
- context
- allowed files or allowed areas
- forbidden files or actions
- GREEN/YELLOW/RED classification
- runner label
- lane label
- validation required
- expected output: draft PR or report
```

Queue planning rules:

```text
- ChatGPT plans and orders the queue.
- The user may override or approve queue priority.
- Runners take only assigned, labeled, bounded work.
- One issue should map to one bounded branch or report.
- A runner stops if required scope is missing or contradictory.
- Follow-up work becomes a new issue unless explicitly included.
```

## 8. PR and report rules

For YELLOW work, the preferred output is a draft PR when branch creation and push are allowed.

Draft PRs must include:

```text
- changed files
- summary of changes
- validation commands and results
- risks and known gaps
- confirmation that no secrets, deploys or main writes occurred
- next recommendation
```

When a PR is not allowed or no file change is needed, the runner must produce a report with the same fields.

Runners must not mark PRs ready for review unless explicitly told to do so. Draft status preserves the ChatGPT review and user approval gates.

## 9. ChatGPT review

ChatGPT reviews runner results before user merge approval.

Review checks:

```text
- task matched the GitHub Issue and allowed scope
- only allowed files changed
- forbidden files and actions were avoided
- no secrets, deploys or production changes occurred
- validation output is present and credible
- risks are stated plainly
- architecture remains compatible with canonical Jeeves docs
- follow-up work is separated from the current task
```

ChatGPT may recommend accept, rework, reject or pause. ChatGPT does not merge.

## 10. User final approval

The user remains the owner and final approver.

Only the user may decide:

```text
- whether reviewed work is accepted
- whether a PR may be merged
- whether RED work may proceed
- whether Jeeves may receive any new supervisory authority
```

Merge should happen only after ChatGPT review and explicit user approval.

## 11. Future Jeeves supervision

Optional future role:

```text
Jeeves observer -> planner -> queue manager
```

This is future-only. Jeeves may later help observe issues, summarize runner status, propose queue ordering and prepare task plans.

Jeeves must not currently:

```text
- assign work autonomously
- manage runners
- approve scope expansion
- approve PRs
- merge
- deploy
- access secrets
- override ChatGPT or the user
```

Any move from observer to planner or queue manager requires explicit user approval and an updated canonical governance document.

## 12. Canonical decision

Adopt the small role-based agent development department defined here for the current Jeeves development conveyor.

The department is bounded by GitHub Issues, explicit runner and lane labels, GREEN/YELLOW/RED permissions, draft PRs or reports, ChatGPT review and user final approval.

Jeeves remains the product being built, not the manager of the department.
