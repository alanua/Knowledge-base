# Jeeves Chat Handoff — 2026-04-30

## Purpose

This handoff preserves the current working state so the user can move to a new ChatGPT conversation without losing the Jeeves project context.

## Current user preference

The user wants short, human-language project reports.

Default report format:

```text
Що сталося:
...

Що важливо:
...

Ризик:
...

Що робити тобі:
...
```

If nothing important happened:

```text
Нічого важливого. Дій від тебе не треба.
```

This is already recorded in:

```text
projects/jeeves/behavior/reporting_style_v1.md
```

## Jeeves identity

Canonical short identity:

```text
Jeeves = personal assistant + controlled self-improvement + multiple memory types + safety-first governance
```

Jeeves is not just a coding agent and not an OpenClaw clone.

OpenClaw-like systems are useful references/executors, but Jeeves must be safer, more personal, more auditable, and more deliberately governed.

Recorded in:

```text
projects/jeeves/identity_summary_v1.md
```

## Current development model

Current roles:

```text
User = owner / final approver
ChatGPT = architect / reviewer / temporary queue planner
GitHub = source of truth / task queue / audit trail
Hetzner + Local WSL runners = executors
Jeeves = product being built
```

Jeeves may later become observer -> planner -> bounded queue manager, but must not manage the department yet.

## Memory governance rule

Approved rule:

```text
ChatGPT / project memory = working architectural memory
GitHub Knowledge-base = official long-term canonical memory after review/approval
```

Recovery materials must be treated as:

```text
historical source -> recovery audit -> user review -> canonical update
```

## Historical sources recently registered

Recent source documents added to Knowledge-base:

```text
projects/jeeves/project_history_reconstruction_v1.md
projects/jeeves/history_sources/codex_project_context_bundle_index.md
projects/jeeves/history_sources/chatgpt_agent_conversation_controlled_self_improvement_index.md
projects/jeeves/identity_summary_v1.md
projects/jeeves/behavior/reporting_style_v1.md
```

Important uploaded source:

```text
ChatGpt-Agent.txt
```

It mainly covers controlled self-improvement:

```text
observe -> detect -> propose -> validate -> approve -> apply -> monitor -> rollback
```

## Pull request state remembered from current conversation

BauClock PR #14 was manually finalized and merged:

```text
https://github.com/alanua/bauclock/pull/14
```

Jeeves PR #15 was manually finalized and merged:

```text
https://github.com/alanua/jeeves/pull/15
```

Knowledge-base PR #8 remains open/stale/draft and must not be merged as-is:

```text
https://github.com/alanua/Knowledge-base/pull/8
```

It should be replaced or reworked from current main through the existing task.

## Active / pending Knowledge-base tasks

The important queued/running work items are:

```text
#10 — Jeeves history recovery audit
https://github.com/alanua/Knowledge-base/issues/10

#11 — Rework pipeline workflow PR from current main
https://github.com/alanua/Knowledge-base/issues/11

#12 — Define agent development department lanes and governance
https://github.com/alanua/Knowledge-base/issues/12

#13 — Propose Hetzner lane daemon script plan
https://github.com/alanua/Knowledge-base/issues/13
```

## Agent development department plan

Target lightweight department:

```text
Hetzner:
- runner-main
- runner-docs
- runner-tests
- watchdog

Local WSL:
- reserve validator
```

Constraints:

```text
- no local LLM/Ollama on Hetzner
- no more than 2 heavy jobs at once
- no more than 1 BauClock full pytest at once
- no parallel PRs editing the same files
- no merge/deploy authority for agents
- no Jeeves management authority yet
```

Safe rollout order:

```text
1. #12 governance doc
2. #13 script plan
3. ChatGPT review
4. user approval
5. implementation task for live scripts
6. one-command startup/status check
```

## Local / Hetzner runner notes

Local WSL GREEN and YELLOW daemons were started and showed empty queues:

```text
GREEN: NO_LOCAL_GREEN_TASK / LOCAL_QUEUE_EMPTY
YELLOW: NO_YELLOW_TASK / YELLOW_QUEUE_EMPTY
```

Hetzner runner is the primary runner. Termius login target:

```text
Host/IP: 49.12.76.236
User: agent
Port: 22
Key likely: hetzner_agent_runner_ed25519
```

Do not expose private keys in chat.

## Immediate next steps in new chat

First check project state:

```text
Search GitHub for open and recently updated pull requests, failed workflow runs, blocked agent reports, and runner queue status in alanua/jeeves, alanua/bauclock, and alanua/Knowledge-base. Also check Gmail for recent GitHub failure notifications. Summarize only actionable items in short human language: what matters, risk, and next action. If nothing needs action, say there are no actionable project health updates.
```

Then check readiness of development department docs:

```text
Check Knowledge-base issues #12 and #13 and any related PRs. Tell me in short human language whether the development department docs/script plan are ready for review, blocked, or still running.
```

## Operating instruction for the next chat

Use concise Ukrainian reports.

Do not use long expert-intro phrases.

Do not treat old recovered material as canon until user approval.

Do not recommend merging stale PR #8.

Prioritize:

```text
1. project health
2. PR review/merge decisions
3. Jeeves history recovery
4. agent development department
5. controlled self-improvement docs
```
