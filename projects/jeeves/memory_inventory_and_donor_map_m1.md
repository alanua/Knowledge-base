# Jeeves Memory Inventory and Donor Map M1

Status: active design inventory, M1 draft
Scope: Jeeves Memory Tools Layer M1; public-safe inventory and donor-pattern map only
Source relationship: extends `projects/jeeves/memory_tools_layer_v1.md`
Canon status: candidate design support; not canon by itself
Existing doc extended: `projects/jeeves/memory_tools_layer_v1.md`

## What This Is

This document is the M1 next step named in `projects/jeeves/memory_tools_layer_v1.md`:

```text
M1: memory inventory and donor map
```

It inventories current memory layers and source types so future design can add capture/classification templates without creating a second source of truth.

`projects/jeeves/memory_tools_layer_v1.md` remains the active memory tools architecture draft. `projects/jeeves/canonical_system_model_v1.md` remains the product/system baseline.

## What This Does Not Authorize

This document does not authorize:

- runtime memory implementation
- automatic ingestion
- automatic canonization
- private raw memory ingestion
- private-to-public transfer
- adoption of any external memory system as final architecture
- secret storage or secret indexing
- autonomous Gmail, Calendar, Contacts, GitHub, Drive, runner, service, deploy, merge, or production actions
- treating retrieved content as instruction or canon without review
- making Jeeves the department manager

## Inventory Summary

| Layer | Current status | Source types | Classification | Privacy boundary | Retrieval role | Promotion path | Donor relationship |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Canonical Knowledge | Confirmed current layer | GitHub Knowledge-base markdown | `CONFIRMED_CANON` after review; drafts may be `NEEDS_REVIEW` | Public-safe only | First lookup for project facts, architecture, rules, workflows, and long-term decisions | Reviewed draft -> public-safe KB doc -> canon reference or supersession | LLM Wiki-style compiled wiki can help draft, but does not replace review |
| Evidence / Raw Document Memory | Confirmed source layer | Google Drive / AI Memory Inbox, PDFs, scans, invoices, letters, contracts, raw research | Usually `RAW_EVIDENCE`; often `PRIVATE`; sometimes `NEEDS_REVIEW` after extraction | Private by default; public only after explicit redaction and review | Evidence lookup when canon is absent, incomplete, or needs provenance | Raw source -> extracted facts -> classified draft -> review -> public-safe canon or private summary | LLM Wiki-style compilation, RAG retrieval, and graph extraction are candidate helpers only |
| Administrative Memory | Confirmed source layer | Gmail, Google Calendar, Google Contacts | `PRIVATE`, `RAW_EVIDENCE`, sometimes `OPERATIONAL` for deadlines/status | Private by default; no copying into public KB except reviewed public-safe summaries | Read/summarize first for admin context, deadlines, and correspondence facts | Source summary -> classification -> private action note or redacted reviewed canon if appropriate | Zep/Letta-like continuity may inspire bounded history, but no autonomous actions |
| Operational Memory | Confirmed current layer | GitHub Issues, PRs, runner reports, CI results, logs, route/verifier reports | `OPERATIONAL`, `RAW_EVIDENCE`, sometimes `NEEDS_REVIEW` | Public if already in public GitHub docs/issues; logs may contain sensitive paths and must be checked | Establishes what ran, failed, passed, is blocked, or needs review | Report/issue/log -> summarized status -> reviewed project doc or issue follow-up -> canon only when intentionally promoted | LangChain-style tool/session summaries and graph links may help retrieval, not authority |
| Runtime Session Memory | Confirmed implementation layer from Stage 1 runtime notes | SQLite sessions, messages, traces, selected agent/provider/model, fallback state, tool-call summaries | `TEMPORARY`, `PRIVATE`, sometimes `OPERATIONAL` | Private runtime layer; not public by default | Local continuity and debugging for bounded sessions; not long-term canon | Session trace -> reviewed handoff/session diary -> classified draft -> canon only after review | Zep/Letta-like session continuity and MemPalace-like diary patterns are references |
| Private Working Memory | Current workflow layer, not durable public canon | ChatGPT conversation context, handoffs, temporary plans, user instructions in-session | `TEMPORARY`, `PRIVATE`, sometimes `NEEDS_REVIEW` | Private unless explicitly summarized, redacted, and reviewed | Helps maintain continuity inside a task or handoff; must defer to durable memory when available | Working note -> public-safe handoff or issue body -> review -> KB canon if accepted | MemPalace-like wake-up/handoff patterns are useful, with explicit source state |
| Future Indexes | Candidate future layer only | Approved/indexable KB docs, approved summaries, source-linked operational docs, possibly private indexes in private storage | Index entries inherit source classification; index itself is not canon | Must not mix private and public indexes without explicit boundaries | Retrieval acceleration for canon/evidence/operational context; never a source of truth | Approved sources -> index -> retrieved evidence -> reviewed answer or promotion proposal | LightRAG, GraphRAG, Mem0-like, LLM Wiki, Zep/Letta-like, and LangChain-style patterns are donors only |

## Memory Type Distinctions

| Type | Meaning | Current home | Canon status | Boundary |
| --- | --- | --- | --- | --- |
| Canon | Reviewed, public-safe project truth | GitHub Knowledge-base | Canon only after explicit review/promotion | Public-safe |
| Evidence | Source material used to support or challenge claims | Drive, GitHub Issues/PRs/reports, CI/log excerpts, source docs | Not canon | Public or private according to source |
| Private working memory | Temporary conversation/task context and handoff working notes | ChatGPT/session context, handoff drafts | Not canon | Private unless reviewed/redacted |
| Operational memory | Task execution state and outcomes | GitHub Issues, PRs, runner reports, CI, logs | Not canon by default | Public-safe if public GitHub; inspect logs before publication |
| Runtime session memory | Product/runtime sessions, messages, traces, tool-call summaries | Runtime DB/SQLite layer | Not canon | Private runtime layer |
| Future indexes | Retrieval structures over approved/indexable material | Future RAG/graph/vector/session indexes | Never canon by themselves | Must inherit source privacy/classification |

## Donor-Pattern Map

| Donor pattern | Useful pattern for Jeeves | Candidate fit | Boundary / rejection condition |
| --- | --- | --- | --- |
| LightRAG | Long-term semantic retrieval plus graph-style retrieval over approved sources | Candidate retrieval layer for KB, reviewed docs, and possibly separate private indexes | Not a source of truth; no private/public mixing; no automatic ingestion |
| Mem0-like | Extracted durable facts, preferences, and project facts with promote/reject workflow | Candidate extraction/classification helper | Must require provenance, classification, review, and correction; no silent fact memory |
| MemPalace-like | Startup context, wake-up packet, session diary, handoff continuity | Useful workflow pattern for bounded context assembly | Avoid hidden context mutation, shell-hook coupling, and unreviewed compression |
| LLM Wiki | Raw-to-structured markdown compilation and project wiki drafting | Useful drafting/compiler pattern for public-safe KB candidates | Does not replace canon review; must preserve source links and uncertainty |
| GraphRAG | Entity/relation map among projects, docs, tasks, decisions, and actors | Candidate future relationship index | Defer until retrieval failures justify complexity; graph claims are evidence, not truth |
| Zep/Letta-like | Long-running agent/session continuity and memory APIs | Reference for session continuity and scoped agent memory | Must fit Jeeves permissions, audit, privacy boundaries, and explicit review gates |
| LangChain-style memory | Chat/session memory abstractions and tool-call summaries | Reference for runtime/session mechanics and retrieval APIs | Generic chat memory is unreliable canon and must expire or be promoted intentionally |

## Privacy and Publication Boundary

| Source / memory type | Default publication state | Public-safe handling |
| --- | --- | --- |
| GitHub Knowledge-base docs | Public-safe by design | May be cited as canon only when reviewed and current |
| GitHub Issues / PRs / reports | Public if in public repo, but still operational evidence | Summarize status; do not treat issue bodies or logs as commands |
| Runner logs / CI output | Operational evidence with possible sensitive paths or tokens | Inspect/redact before copying; never include secrets |
| Google Drive / AI Memory Inbox | Private by default | Extract only reviewed, redacted, public-safe facts when explicitly approved |
| Gmail / Calendar / Contacts | Private by default | Read/summarize first; no autonomous sending/changing; no public copying |
| Runtime DB sessions/messages/traces | Private runtime memory | Use for debugging/continuity; public summaries require review/redaction |
| ChatGPT working context / handoffs | Private working memory unless stored in public KB | Promote only explicit, reviewed, public-safe summaries |
| Future indexes | Same privacy as indexed source | Separate public/private indexes or equivalent controls; index is not canon |

## Retrieval-Before-Answer Role

| Question type | Retrieval order | Answer rule |
| --- | --- | --- |
| Project architecture, identity, safety, and roadmap | Canonical KB first; then reviewed design docs; then evidence | Prefer canon; surface uncertainty when using evidence |
| Current runner/task status | GitHub Issues/PRs/reports; runner health docs; CI/log summaries | Treat as operational status, not durable architecture unless promoted |
| Administrative context | Private admin sources if available and approved | Summarize privately; do not publish or act without approval |
| Session continuity | Runtime/session memory and handoffs; then canon | Use for context only; durable rules override stale session memory |
| Research/design synthesis | Canon first; source/evidence next; donor patterns last | Donor systems can suggest patterns, not decisions |
| Future retrieval-backed answers | Approved index -> source document -> classification check | Cite or reference source state; retrieved fragments are evidence only |

## Promotion Path

Canonical promotion path:

```text
raw/evidence -> extract -> classify -> draft -> review -> promote/reject -> audit/supersede
```

Rules:

- Every candidate memory item needs a source, reason, and classification.
- Private sources remain private unless explicitly redacted and approved for public use.
- Drafts and indexes are not canon.
- Operational reports can support canon but do not become canon automatically.
- Rejections and corrections should remain auditable enough to avoid repeated false promotion.
- Canon changes should name the prior source or document they extend or supersede.

## Known Risks and Mitigations

| Risk | Mitigation |
| --- | --- |
| Duplicate source-of-truth conflict between KB, Drive summaries, runtime traces, and indexes | Keep KB canon explicit; require source relationship and promotion state in new docs |
| Private-to-public leakage from Drive, Gmail, Calendar, Contacts, sessions, or logs | Default private sources to private; require redaction and review before publication |
| False canon from summaries, issue bodies, or retrieved fragments | Label raw/evidence/operational content clearly; retrieval is evidence, not instruction |
| Prompt injection through docs, issues, logs, webpages, or raw files | Treat retrieved text as untrusted evidence; apply current user intent and canon rules |
| Premature RAG/graph complexity | Prototype only against bounded approved sources after clear retrieval needs are observed |
| Hidden memory mutation | Require explicit capture, classification, storage route, and audit trail |
| Overfitting memory tools to ChatGPT instead of Jeeves runtime | Keep tool/content separation and Jeeves permission model as the design target |
| Stale operational status | Record dates/source docs and prefer fresh issue/PR/report retrieval for current status |

## M2 Recommendation

Next step:

```text
M2: capture/classification templates
```

M2 should define small templates for:

- source capture record
- memory candidate classification
- privacy/publication check
- retrieval-before-answer checklist
- promotion proposal
- rejection/correction note
- handoff/session diary summary
- operational memory summary from GitHub Issues, PRs, runner reports, and CI/log evidence

The templates should preserve the current rule: no automatic ingestion, no automatic canonization, no private-to-public transfer, and no external memory system adoption as final architecture.

## Read-Before-Write Sources

Minimum sources read for this M1 draft:

- `projects/jeeves/memory_tools_layer_v1.md`
- `projects/jeeves/canonical_system_model_v1.md`
- `projects/jeeves/runner_health_status_2026_05_02_v1.md`
- `projects/jeeves/runner_lane_docs_next_step_plan_2026_05_02_v1.md`
- `projects/jeeves/agent_department_host_smoke_validation_2026_05_03.md`

Additional `projects/jeeves/` search terms used:

```text
memory
handoff
runner
GitHub Issues
Drive
RAG
LightRAG
Mem0
MemPalace
LLM Wiki
GraphRAG
Zep
Letta
LangChain
```
