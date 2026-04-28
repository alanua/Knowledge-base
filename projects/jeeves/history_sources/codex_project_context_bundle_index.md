# Jeeves Historical Source — Codex Project Context Bundle

## Status

This document registers the uploaded `codex_project_context_bundle.zip` as historical source material for Jeeves/OpenClaw-style project recovery.

The uploaded ZIP is treated as an early Codex onboarding/context bundle for the Jeeves project. It is not automatically canonical, but it is a high-priority historical evidence source for the recovery audit.

Use it for:

- `projects/jeeves/history_recovery_audit.md`
- future updates to `projects/jeeves/canonical_system_model_v1.md`
- future cleanup of early architecture docs

Do not use it blindly as current implementation truth. It must be compared against current code, current Knowledge-base docs, and user-approved decisions.

## Source Package

Uploaded file:

```text
codex_project_context_bundle.zip
```

Manifest observed in the archive:

```text
codex_project_context_bundle/AGENTS.md
codex_project_context_bundle/PROJECT_CONTEXT.md
codex_project_context_bundle/ARCHITECTURE.md
codex_project_context_bundle/DECISIONS.md
codex_project_context_bundle/ROADMAP.md
codex_project_context_bundle/TASKS.md
codex_project_context_bundle/PLANS.md
codex_project_context_bundle/CODEX_BOOTSTRAP_PROMPT.md
codex_project_context_bundle/INSTALL_INTO_REPO.md
codex_project_context_bundle/.codex/config.toml.example
codex_project_context_bundle/.agents/skills/project-onboarding/SKILL.md
codex_project_context_bundle/.agents/skills/project-onboarding/references/reading-order.md
```

## Why It Matters

This bundle appears to be an early project onboarding pack created for Codex. It captures project DNA that predates the current GitHub runner pipeline.

It is important because it confirms that many ideas discussed recently were not new decisions, but earlier canonical directions that had not yet been fully migrated into GitHub Knowledge-base.

## High-Value Recovered Points

### Project Identity

Jeeves is described as:

```text
privacy-first, local-first multi-agent system with a thin top-level assistant layer
```

The assistant should:

- orchestrate specialized subagents
- route work across local and cloud LLM backends
- automate real tasks
- preserve traceability
- evolve only through controlled engineering loops

### Core Architectural Components

The early architecture already listed these as the main system components:

```text
router
agents
tools
memory
policy engine
execution runtime
API/control plane
```

This should be treated as a strong historical confirmation of the current canonical architecture.

### Product Philosophy

The bundle strongly emphasizes:

- do not overinflate the project
- use simple inspectable architecture
- avoid magical autonomy
- keep the top-level UX terse and execution-oriented
- use explicit contracts and deterministic routing
- prefer practical modularity over a monolithic prompt-agent

### Controlled Self-Improvement

The bundle explicitly captures the same core chain:

```text
observe -> detect -> propose -> validate -> approve -> apply -> monitor -> rollback
```

This confirms that controlled self-improvement was an early project invariant, not a later addition.

### Local-First / Cloud-Fallback Model

Recovered decision:

```text
local-first, not local-only
```

Meaning:

- local models handle cheap/simple/private work where practical
- cloud backends are allowed as fallback for stronger reasoning, coding, or large-context tasks
- weak local inference must degrade gracefully to cloud

Mentioned provider stack:

- Ollama
- OpenRouter
- Google AI Pro / Gemini
- ChatGPT Plus

### Resource Constraints

The bundle records early constraints:

- no heavy local GPU should be assumed
- local inference resources are weak
- small local models only
- stronger reasoning needs cloud fallback

### Development Toolchain

The bundle confirms the early development model:

```text
ChatGPT = architect + tech lead
Antigravity = code generation / automation / repo operations
GitHub = source of truth
local PC = main development/control workstation
Replit = sandbox/test runtime
Hetzner VPS = later production/headless runtime
LightRAG = later long-term memory layer
```

Important historical distinction:

```text
Antigravity is dev assistant, not runtime.
GitHub is source of truth.
Hetzner is later runtime/headless runtime.
```

### Contracts-First Stage 1

The bundle describes the Stage 1 foundation as contracts-first:

- enums
- contracts
- errors
- deterministic rule-based router
- minimal orchestrator skeleton

It specifically references expected artifacts such as:

```text
enums.py
contracts.py
errors.py
routing rules module
orchestrator skeleton
```

This matches the current Jeeves implementation direction.

### Agent Specialization

Recovered model:

- PlannerAgent
- ResearchAgent
- ExecutorAgent

Important recovered design point:

```text
planner and research should be distinct agents, not aliases of executor
```

### Memory Direction

The bundle confirms memory as a planned later subsystem, not an early uncontrolled blob.

Recovered memory direction:

- session memory first
- episodic/task memory later
- long-term retrieval backend later, possibly LightRAG
- memory must be evaluated and bounded

### Voice Input

The bundle records voice input as a product requirement, but not as a separate control path.

Correct model:

```text
voice input -> same canonical task envelope as text
```

Voice should not fragment the architecture.

### Skills / Onboarding

The archive includes a repo-local onboarding skill:

```text
.agents/skills/project-onboarding/SKILL.md
```

This is historically important because it confirms that repo-local skills were part of the intended agent workflow very early.

The skill expects agents to:

- read canonical context files
- inspect real code
- report drift/mismatches
- prefer repository evidence over reconstructed docs

### ExecPlan Discipline

The bundle includes `PLANS.md` with an ExecPlan standard.

ExecPlans are required for:

- new subsystem creation
- routing changes
- orchestration flow changes
- shared contract/schema changes
- memory layer changes
- self-improvement flow changes
- voice/multimodal ingress work
- deployment/runtime topology changes

This should be recovered as an active development discipline.

## Historical Decisions Explicitly Listed In Bundle

The bundle’s `DECISIONS.md` appears to contain these key decisions:

```text
D-001 local-first, not local-only
D-002 thin top-level assistant layer
D-003 multi-agent orchestration, not one giant prompt
D-004 contracts first
D-005 deterministic routing first
D-006 planner and research are distinct
D-007 controlled self-improvement, not autonomous self-rewriting
D-008 telemetry is mandatory
D-009 voice through same ingress pipeline
D-010 GitHub is source of truth
D-011 Antigravity is dev assistant, not runtime
D-012 do not overinflate architecture
```

These should be checked and then promoted into the canonical recovery audit as confirmed historical decisions if the audit finds no contradiction.

## Recovery Implications

This source should be used to correct the current memory drift.

Specifically, it should influence:

1. `canonical_system_model_v1.md`
2. `project_history_reconstruction_v1.md`
3. `history_recovery_audit.md`
4. future development department instructions
5. future runtime smoke / Stage 1 roadmap docs

## User Review Requirement

The user wants to personally review and approve recovered memory before it becomes canonical.

Therefore this bundle must be treated as:

```text
historical source -> recovery audit -> user review -> canonical update
```

Not:

```text
historical source -> automatic canon
```

## Next Action

Add this file as an explicit input to the open recovery task:

```text
Knowledge-base #10 — Jeeves history recovery audit
```

The audit should compare this historical source against:

- current Knowledge-base docs
- current Jeeves repository code
- current runner/pipeline design
- current user-approved project rules
