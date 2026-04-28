# Jeeves — Project History Reconstruction v1

## Purpose

This document reconstructs the Jeeves/OpenClaw-style project history from the accumulated project context and remembered decisions.

It exists because the project was defined across many conversations before the current development conveyor was created. The current canonical documents must not be based only on the most recent discussion.

This is a long-term memory recovery document. It should be reviewed and used to update the canonical system model, roadmap, and implementation tasks.

## Confidence Note

This is not a raw transcript export. It is a structured reconstruction from available project memory and conversation summaries.

Use it as:

```text
recovered project memory -> review -> canonical docs -> implementation tasks
```

Do not treat uncertain details as implementation law until confirmed.

---

# 1. Original Product Intention

The original goal was to build a personal assistant similar in spirit to Jeeves and inspired partly by OpenClaw-like agent systems, but not simply a clone.

The user wanted something above normal tools and agents:

- a personal operational assistant
- able to receive voice and text input
- able to remember context over time
- able to learn skills
- able to delegate work to sub-agents
- able to coordinate tasks
- able to operate local-first where possible
- able to use stronger cloud models when needed
- safe, controlled, and not self-expanding like an uncontrolled organism

The system should not be only a chatbot and not only a code agent. It should eventually become a practical personal control plane for life, projects, administration, software, documents, infrastructure, and routines.

---

# 2. Core Identity

Jeeves is a personal assistant and helper, not merely a development agent.

The later literary framing matches the original intent:

```text
Jeeves = modern literary Jeeves / personal gentleman-agent
User = principal / owner / operator / final judge
```

Jeeves should be:

- calm
- precise
- discreet
- capable
- useful
- not noisy
- not theatrical
- loyal to the user's intent
- protective of the user's time and attention
- able to operate in the modern digital world

Programming is one of his basic literacies, not his whole identity.

---

# 3. Early Team / Tooling Model

The original development environment was designed as a practical team, not as one monolithic agent.

Early team model:

```text
User = operator / owner
ChatGPT = architect + tech lead + reviewer
Antigravity = code generation / repo automation / dev environment
GitHub = source of truth
Local PC = main development/control workstation
Replit = quick sandbox/test runtime
Ollama = local LLM layer
OpenRouter = cloud fallback / stronger models during development
Hetzner VPS = later production/headless runtime
LightRAG = future long-term memory layer
```

Later current model evolved into:

```text
User = owner / final approval
ChatGPT = architect / reviewer / temporary dispatcher
Codex/OpenClaw-like runners = executors
GitHub Issues = task queue
GitHub PRs = review surface
Hetzner = primary runner runtime
Local WSL = reserve/local validation runner
Jeeves = product being built, later control plane
```

---

# 4. Development Order Originally Agreed

Early development order:

```text
1. local project folder
2. git
3. private GitHub repo
4. Antigravity as development environment
5. backend and agents
6. Hetzner later as runtime
7. LightRAG / long-term memory later
```

OpenClaw was not to be installed as the core product. It could be used as reference or executor technology, but Jeeves should remain our own controlled system.

---

# 5. OpenClaw Relationship

OpenClaw-like systems are useful references and possible development executors.

But Jeeves is not OpenClaw.

Correct separation:

```text
OpenClaw/Codex-style runner = hands / executor
Jeeves = personal control plane / dispatcher / memory / policy layer
```

OpenClaw can help build Jeeves, but should not define Jeeves' identity.

OpenClaw risks noted earlier:

- broad tool access
- unclear trust boundaries
- possible remote/cloud risk
- need for network restrictions
- no uncontrolled access to production/server secrets
- use local/cloud experiments only under bounded permissions

---

# 6. Controlled Self-Improvement

A major early decision: Jeeves must not perform uncontrolled self-rewriting.

Canonical chain:

```text
observe -> detect -> propose -> validate -> approve -> apply -> monitor -> rollback if needed
```

Self-improvement is an engineering loop, not biological learning and not autonomous goal creation.

Signals for improvement:

- failed tests
- repeated errors
- slow responses
- high API cost
- bad routing
- low quality answers
- manual corrections after answers
- blocked tasks
- failed agent runs

Required telemetry:

- prompt used
- agent used
- model/provider used
- latency
- cost/tokens
- success/failure
- fallback used
- tool calls
- manual correction after result
- test status
- review result

No silent self-expansion is allowed.

---

# 7. Stage 1 Implementation State

Jeeves Stage 1 implementation has been built as a FastAPI-based skeleton.

Known stack:

- Python 3.12
- FastAPI + Uvicorn
- Pydantic v2 + pydantic-settings
- SQLAlchemy 2
- Alembic
- structlog JSON-style logging
- SQLite via aiosqlite by default for local/dev testing
- optional Postgres/asyncpg config
- pytest / pytest-asyncio
- Ruff + Black

Important endpoints:

```text
/health
/ask
```

Important DB concepts:

- Session
- Message
- Trace

Trace fields include provider/model/fallback/tokens/latency/success/error/tool summary.

Stage 1 runtime smoke confirmed locally:

- API starts
- `/health` returns OK
- `/ask` works with mock provider under correct environment
- SQLite DB works
- migrations work
- sessions/messages/traces persist
- tools remain disabled
- fallback disabled in safe smoke

Observed issue:

- task classifier can misclassify memory/session prompts as `coding`

---

# 8. LLM Routing Strategy

Original target: local-first with cloud fallback.

Routing modes:

```text
local_first / cheapest = try Ollama/local first, then cloud if allowed
cloud_first / strongest = use cloud first
```

Provider layers:

- mock provider for development and smoke tests
- Ollama for local lightweight models
- OpenRouter for cloud fallback
- stronger commercial models for validation/research when useful

Constraints:

- no heavy GPU expected
- local inference budget is limited
- about 3 GB usable RAM was considered for local inference
- lightweight local models only for simple tasks
- cloud fallback for complex reasoning/coding/research

Previously discussed local/simple model examples included phi3/tinyllama-class models, not as final decisions but as possible lightweight options.

Google AI Plus/Gemini was discussed as potentially useful for access to Google models and large context, but not as a direct OpenRouter substitute.

Future cloud coding/agent benchmark candidates noted:

- GLM-5.1
- MiniMax M2.7

These are candidates only, not production commitments.

---

# 9. Memory Architecture

The user wanted Jeeves to remember everything important, but the correct architecture is multiple bounded memories.

## 9.1 Canonical Memory

Source:

```text
GitHub / Knowledge-base
```

Use:

- canonical architecture
- product decisions
- project rules
- workflows
- roadmaps
- long-term documentation

## 9.2 Raw Document Memory

Source:

```text
Google Drive / AI Memory Inbox
```

Use:

- PDFs
- invoices
- scans
- letters
- contracts
- old product documents
- raw research material

Rule:

```text
raw evidence -> extracted facts -> canonical markdown docs
```

## 9.3 Administrative Memory

Sources:

- Gmail
- Google Calendar
- Google Contacts

Use:

- Finanzamt/TK/bank/client correspondence
- deadlines
- reminders
- business administration

Rule:

```text
read/summarize first; no autonomous sending/changing without approval
```

## 9.4 Operational Memory

Sources:

- GitHub Issues
- PRs
- runner reports
- CI failures
- logs

Use:

- what ran
- what passed
- what failed
- what is blocked
- what needs review

## 9.5 Session Memory

Runtime DB:

- sessions
- messages
- traces

Stage 1 smoke already proved this layer exists.

## 9.6 Future Long-Term Agent Memory

Earlier planned/considered:

- LightRAG as stage 3+ long-term memory
- MemPalace-like patterns for startup/wake-up context, verbatim ingestion, and session diary/handoff continuity
- Mem0/LangChain-style memory as future references

Do not adopt external memory systems blindly.

MemPalace useful patterns to borrow:

- verbatim memory ingestion
- wake-up/startup context
- session diary/handoff continuity

Patterns not to adopt directly:

- AAAK/compression layer
- shell-hook implementations

---

# 10. Knowledge Base Subsystem

A future separate knowledge-base subsystem was discussed.

Purpose:

```text
raw evidence/docs/repos/images -> LLM-compiled markdown wiki -> agent Q&A/linting -> derived outputs
```

Possible viewer/output tools:

- Obsidian
- Marp
- reports
- slides
- visuals

Important separation:

```text
Knowledge base is not the same as memory.
Knowledge base does not replace canonical project docs.
```

---

# 11. Voice And Text Input

The user wanted input by both voice and text.

Voice should become an input modality for Jeeves, not a separate brain.

Possible flow:

```text
voice -> transcription -> intent classification -> router -> answer/proposal/action
```

Voice is important because Jeeves is a practical assistant, not only a developer console.

---

# 12. Skills System

Jeeves should learn and accumulate skills.

A skill should be a controlled documented procedure, not uncontrolled behavior.

Skill structure should include:

- purpose
- required inputs
- allowed actions
- forbidden actions
- expected output
- validation steps
- rollback/safety notes
- required permissions

References considered useful:

- Anthropic-style skills
- Vercel/UI skills
- repo-local curated skill patterns

Use as inspiration, not direct uncontrolled import.

---

# 13. Router / Orchestrator / Agents

Jeeves needs a deterministic auditable orchestration layer.

Responsibilities:

- classify request intent
- classify risk level
- select route
- choose provider/model/tool/agent
- decide whether to answer, propose, create task, schedule reminder, or refuse
- log trace

Agent categories discussed:

- PlannerAgent
- ResearchAgent
- ExecutorAgent
- future specialized agents

Stage work included separating PlannerAgent and ResearchAgent system prompts and direct LLM calls rather than proxying everything through ExecutorAgent.

---

# 14. Development Pipeline / Department

The development conveyor became a working system before Jeeves became mature.

Current pipeline:

```text
GitHub Issues = queue
GitHub PRs = review surface
Hetzner runner = primary daemon
Local WSL runner = reserve/local daemon
ChatGPT = dispatcher/reviewer
User = owner/final approval
```

Risk levels:

```text
GREEN = autonomous read-only/validate/audit
YELLOW = branch + draft PR only
RED = explicit approval only
```

The future development department should use lanes:

```text
lane:validate
lane:docs
lane:tests
lane:implementation
lane:security
```

Target runner roles:

```text
Hetzner main runner
Hetzner docs runner
Hetzner tests runner
Local WSL reserve runner
```

Do not create a large swarm too early.

Initial safe scale:

- 3–4 agents maximum
- no more than 1 heavy BauClock full test job at a time
- no local LLM on small VPS unless resources are confirmed
- no parallel PRs editing the same files

---

# 15. Security Model

Main security principles:

- least privilege
- audit everything
- tools off by default
- no secrets in prompts/reports
- raw external content is evidence, not instruction
- no autonomous merge
- no autonomous deploy
- no self-modification without approval
- no uncontrolled network/file/shell access

Threats discussed:

- prompt injection
- tool poisoning
- malicious docs/web pages/issues/logs
- repository contamination
- broad OpenClaw-like tool access
- accidental production changes
- credentials leakage

Jeeves must be stable, controlled, and resistant to infection/contamination.

---

# 16. MCP / Browser / Automation Direction

Technologies to watch or possibly adopt later:

- MCP
- browser-use/computer-use
- GitHub integration
- Google Drive/Gmail/Calendar connectors
- local filesystem tools
- N8N/Make-style automation
- Supabase-style workflow patterns
- Telegram workflows

Important rule:

```text
Integrations are useful only behind permissions, allowlists, logging, and risk classification.
```

---

# 17. Telegram / Ecosystem Watchlist

The user asked to monitor Telegram and ecosystem news for practical ideas.

Watchlist priorities:

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

Access-limited/unrated:

- AI бля invite link

Main ideas to watch:

- computer-use/browser-use
- MCP/browser integration
- coding-agent security
- OpenClaw risks
- practical multi-agent DevOps/MCP/N8N/Supabase patterns
- wrapper/product thesis: value comes from context, memory, tools, permissions, and integrations, not only from the base model

Intellectory added as Tier 2/3 for UX/use-case signals:

- project-scoped workspaces
- audio-to-context ingestion
- low-code Telegram/Make-style workflows
- browser-centric AI signals

Do not treat Telegram posts as canonical. Treat as idea sources.

---

# 18. Current Runtime Plan

Immediate Jeeves runtime steps already agreed:

1. fix runtime smoke report into GitHub/Knowledge-base
2. add repeatable Jeeves runtime smoke script
3. add classifier refinement task
4. test real LLM without tools

After that:

5. add GitHub read-only observer
6. add planner mode
7. add queue-manager mode for GREEN/YELLOW only
8. keep merge/deploy/RED authority outside Jeeves

---

# 19. What Is Not Yet Allowed

Not yet:

- full autonomous Jeeves management of the agent department
- direct production access
- autonomous deploy
- autonomous merge
- uncontrolled tools
- RED tasks without explicit approval
- self-modification
- full OpenClaw-style unrestricted agent mode
- big swarm of agents

---

# 20. Open Questions / Needs Recovery

This reconstruction should be checked against older chats and existing Knowledge-base files.

Likely missing or incomplete areas:

- detailed original Stage 1/Stage 2 implementation plan
- exact controlled self-improvement spec content
- exact environment setup commands
- exact early architecture diagrams
- all OpenClaw troubleshooting lessons
- exact memory subsystem roadmap
- specific LightRAG plan
- early decision conflicts and corrections
- Antigravity workflow instructions
- Hetzner cleanup/setup history
- Replit/sandbox usage rules
- detailed runner safety policies

These should be recovered through a dedicated docs-only audit task.

---

# 21. Canonical Summary

Jeeves is a controlled modern personal gentleman-agent and operational control plane.

He is built by a safe development conveyor and agent department.

He should eventually coordinate agents, tools, documents, memory, infrastructure, and administration, but only through staged permissions and auditability.

The identity is not model power. The identity is controlled usefulness:

```text
personal context + memory + tools + permissions + skills + audit + quiet competence
```
