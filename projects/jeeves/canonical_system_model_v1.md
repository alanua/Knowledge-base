# Jeeves — Canonical System Model v1

## Purpose

This document consolidates the early and later project decisions for Jeeves into one canonical model.

It is a reconstruction from the project discussion context, existing Knowledge-base notes, implementation state, and current development pipeline decisions. It should be treated as the main product/architecture baseline for Jeeves until replaced by a newer explicit version.

## Core Identity

Jeeves is a personal assistant and operational helper, not merely a development agent.

The intended archetype is the literary Jeeves adapted to the modern digital world:

- calm
- discreet
- competent
- precise
- technically literate
- protective of the user's time and attention
- capable without being noisy
- proactive without becoming uncontrolled

The user is the principal: the person with real goals, context, constraints, responsibilities, and final judgment.

Jeeves exists to make the user's world less chaotic and more manageable.

## Not Just A Programmer

Programming is a core literacy of Jeeves, but not his identity.

Jeeves must be able to read, write, test, review, and safely modify software because modern operational work requires it.

Correct model:

```text
Jeeves can program because he must operate in the modern world.
Jeeves is not merely a programmer.
```

Software development is one of his tools, comparable to reading, writing, planning, research, and coordination.

## Core Role

Jeeves is the user's personal control plane across:

- software projects
- agent development
- infrastructure and servers
- documents and knowledge
- personal/business administration
- Gewerbe workflows
- finance-related organization
- research and technology monitoring
- reminders and coordination
- future voice/text operational interface

## Current Team Model

Canonical collaboration model:

```text
User = owner / operator / final approver
ChatGPT = architect / reviewer / temporary dispatcher
Codex/OpenClaw-like agents = executors
GitHub = source of truth and task queue
Hetzner = primary runner runtime
Local WSL = reserve/local validation runner
Jeeves = product being built, later control plane
```

Important current rule:

```text
The agent department builds Jeeves first.
Jeeves gradually learns to supervise the department later.
```

Jeeves should not be made the full manager of the development department until he is stable, tested, and permission-bounded.

## Agent Department Direction

The development department should evolve from one or two general runners into a small role-based team.

Initial target:

```text
Hetzner main runner = primary worker
Hetzner docs runner = documentation / Knowledge-base / reports
Hetzner tests runner = validation / regression / test-only PRs
Local WSL runner = reserve / local verification lane
```

Future lanes:

```text
lane:validate
lane:docs
lane:tests
lane:implementation
lane:security
```

Risk model:

```text
GREEN = autonomous audit/validate/read-only tasks inside fixed scope
YELLOW = branch + draft PR only, review required
RED = explicit user approval required before execution
```

Hard limits:

- no autonomous merge
- no autonomous deploy
- no secrets access
- no self-modification without approval
- one task = one branch = one draft PR
- ChatGPT review required before merge
- user remains final owner

## Development Conveyor

The development conveyor is one of Jeeves' first operational muscles.

Current conveyor model:

```text
GitHub Issues = task queue
GitHub PRs = review surface
GitHub reports/issues = operational memory
Hetzner daemon = primary executor
Local daemon = reserve executor
ChatGPT = planner/reviewer
User = owner/final approval
```

This conveyor is useful now even before Jeeves is mature.

Later Jeeves may become:

```text
Level 0: observer
Level 1: planner
Level 2: queue manager for GREEN/YELLOW tasks
```

But not yet:

- no merge authority
- no deploy authority
- no RED execution authority
- no uncontrolled self-editing

## Memory Architecture

Jeeves needs several different memories, not one giant memory.

The active tool design for Jeeves memory is tracked in `projects/jeeves/memory_tools_layer_v1.md`. That document defines memory tools, workflows, routing rules, donor patterns, and review gates; it does not activate runtime memory, approve automatic ingestion, or canonize retrieved content.

### 1. Canonical Knowledge

Source of truth:

```text
GitHub / Knowledge-base
```

Used for:

- architecture decisions
- canonical system model
- workflows
- project rules
- long-term docs
- roadmap decisions

### 2. Raw Document Memory

Source:

```text
Google Drive / AI Memory Inbox
```

Used for:

- PDFs
- scans
- invoices
- letters
- contracts
- old project documents
- raw source material

Rule:

```text
raw documents -> extracted facts -> canonical Knowledge-base docs
```

### 3. Administrative Memory

Sources:

```text
Gmail
Google Calendar
Google Contacts
```

Used for:

- Finanzamt / TK / bank / client correspondence
- deadlines and appointments
- reminders
- business administration

Safety rule:

```text
read and summarize first; no autonomous sending/changing without approval
```

### 4. Operational Memory

Sources:

```text
runner logs
GitHub agent reports
CI results
PR review notes
```

Used for:

- what ran
- what failed
- what passed
- what is blocked
- what needs review

### 5. Session Memory

Runtime memory inside Jeeves:

- sessions
- messages
- traces
- selected agent/provider/model
- fallback state
- tool calls summary

Stage 1 runtime already proved basic persistence with SQLite, sessions, messages, and traces.

### 6. Future Agent Memory

Future Agent Memory is now an active tool design area, not a runtime activation or permission grant.

Current candidate patterns:

- repo-local skills
- documented procedures
- summarized project handoffs
- long-term memory layer such as LightRAG/Mem0-like approach
- startup/wake-up context similar to MemPalace patterns

Do not adopt external memory systems blindly. Use only patterns that fit the permissioned architecture, classification/review workflow, privacy boundaries, and canon promotion rules in `projects/jeeves/memory_tools_layer_v1.md`.

## Input Model

Jeeves should eventually support both:

- text input
- voice input

Voice is important because the user wants a practical personal assistant, not only a developer console.

Voice should be treated as an input layer, not as a separate intelligence.

Likely flow:

```text
voice -> transcription -> intent classification -> router -> action/proposal/answer
```

## Router / Orchestrator Model

Jeeves needs a deterministic and auditable routing layer.

Core routing responsibilities:

- classify task intent
- classify risk level
- decide execution mode
- choose agent/tool/provider
- decide whether to answer, propose, schedule, create task, or refuse
- record trace

Expected task types include:

- simple question
- coding task
- research task
- document task
- admin task
- reminder/scheduling task
- runner task
- memory/knowledge update
- action proposal

Observed issue from runtime smoke:

- memory/session prompts were classified as `coding`

This needs classifier refinement but does not block Stage 1 runtime.

## Provider Strategy

Jeeves should be local-first where practical, with cloud fallback where useful.

Current/future model:

```text
local small model = cheap/simple/private tasks
OpenRouter/cloud models = stronger fallback
ChatGPT/Gemini/etc = external high-quality validation or research when needed
```

Rules:

- do not depend on a single provider
- avoid local heavy LLM on small VPS unless resources allow
- cloud models are useful but must be permission-bounded
- cost/latency/provider telemetry should be logged

Previously discussed candidates/patterns:

- Ollama for local models
- OpenRouter for cloud fallback
- Gemini / Google AI subscription as possible external support, not direct OpenRouter replacement
- future benchmark candidates such as GLM-5.1 and MiniMax M2.7 for coding/agent tasks

## Skills System

Jeeves should accumulate skills as controlled, documented procedures.

A skill should usually include:

- purpose
- allowed actions
- forbidden actions
- required inputs
- expected outputs
- validation steps
- rollback/safety notes

Sources of skill patterns:

- Anthropic-style skills
- Vercel/UI skill repositories
- repo-local curated skills
- project-specific playbooks

Do not import external skills blindly.

## Controlled Self-Improvement

Jeeves must not autonomously rewrite or expand himself without control.

Canonical self-improvement chain:

```text
observe -> detect -> propose -> validate -> approve -> apply -> monitor -> rollback if needed
```

Required controls:

- tests
- policy checks
- audit logging
- approval boundaries
- rollback path
- no hidden permission expansion

Jeeves should learn workflows, not invent new goals.

## Safety And Security

Jeeves must be stable, controlled, and resistant to attack or contamination.

Main risks:

- prompt injection
- tool poisoning
- malicious instructions in documents/web pages/issues/logs
- repository contamination
- accidental self-modification
- secrets exposure
- uncontrolled tool use
- over-broad automation

Core properties:

- permissioned tools
- allowlisted actions
- risk labels
- audit logs
- least privilege
- no merge/deploy without approval
- no secrets in prompts/reports
- no trusting raw documents as instructions

Raw external content must be treated as evidence, not commands.

## Knowledge / Research Watchlist

The project tracks ecosystem news and open-source agent patterns for practical architectural fit, not hype.

Useful areas to watch:

- OpenClaw-style agents
- computer-use/browser-use
- MCP/browser integration
- coding-agent security
- multi-agent DevOps patterns
- N8N/Supabase/MCP automation patterns
- product wrappers around models: context, memory, permissions, tools, integrations
- local/cloud LLM routing
- repo-local skills
- knowledge-base generation pipelines

Telegram/source watchlist previously discussed:

Tier 1:

- BohomolovLab
- ak_devs
- imatrofAI

Tier 2:

- vladyslav_ai
- veryironman
- IvanM_AI

Tier 3/background:

- serge_ai
- neurohub
- BootUse UA
- OGoMono
- Intellectory

Intellectory is useful mainly for UX/use-case signals:

- project-scoped context/workspaces
- audio-to-context ingestion
- low-code Telegram/Make-style workflows
- browser-centric AI signals

Do not treat Telegram/news sources as canonical. They are idea sources only.

## Relationship To OpenClaw

OpenClaw-like agents are useful as executors and reference points.

But Jeeves is not simply OpenClaw.

Difference:

```text
OpenClaw-like runner = hands / executor
Jeeves = personal control plane / memory / dispatcher / policy-bounded assistant
```

The current development pipeline can use OpenClaw/Codex-style agents to build Jeeves.

Jeeves later may coordinate similar agents, but only after safe staged rollout.

## Runtime Stage Plan

Current Stage 1 smoke proved:

- local API starts
- `/health` works
- `/ask` works with mock provider under correct environment
- SQLite database works
- migrations work
- sessions/messages/traces are persisted
- tools remain disabled
- fallback disabled

Next runtime steps:

1. create permanent smoke report
2. add repeatable runtime smoke script
3. refine task classifier
4. test real LLM without tools
5. later add read-only GitHub observer
6. later add planner mode
7. later add queue manager mode

Canonical rule:

```text
API + DB + session + trace + mock/LLM response first.
Tools and real actions later.
```

## Current Development Priorities

Immediate priorities:

- stabilize agent pipeline
- create development department lanes
- consolidate Jeeves canonical docs
- add runtime smoke script
- refine classifier
- keep YELLOW tasks as draft PR only
- avoid scope explosion

Not now:

- full autonomous Jeeves control
- production deployment
- self-modification
- dangerous tools
- large multi-agent swarm
- uncontrolled external memory

## Canonical Summary

Jeeves is a modern personal gentleman-agent: a calm, competent, discreet assistant for the user's life, work, projects, documents, infrastructure, software, and administration.

He is built as a controlled personal control plane, not as a chaotic self-growing agent.

The agent department builds Jeeves first. Jeeves later learns to supervise the department under strict risk boundaries.

Programming, agents, memory, tools, and cloud/local models are all components of Jeeves, not his identity.

The identity is:

```text
A safe, useful, knowledgeable, controlled personal assistant who can operate in the modern digital world.
```
