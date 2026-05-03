# Jeeves Memory Tools Layer v1

Status: canonical architecture draft v1
Scope: Jeeves memory tools, workflows, boundaries, donor patterns, and review gates.

## 1. Scope

This document defines tools, workflows, boundaries, and donor patterns for Jeeves memory.

It does not approve automatic memory ingestion, automatic canonization, runtime activation, or blind trust in retrieved content.

The immediate purpose is to move Future Agent Memory from a vague future note into active tool design while keeping actual memory content gated by classification, review, privacy, and promotion rules.

## 2. Tool/content separation

Memory tools are mechanisms and workflows:

```text
capture
classify
store
retrieve
summarize
handoff
promote
audit
correct
```

Memory content is stored material:

```text
facts
decisions
documents
summaries
logs
private context
session diaries
handoffs
evidence
```

Examples:

```text
GitHub Knowledge-base = memory tool / canonical storage layer
canonical_system_model_v1.md = stored knowledge item

LightRAG = retrieval/graph memory tool candidate
Jeeves is a personal control plane = stored canonical fact

MemPalace-like startup context = wake-up/handoff tool pattern
what happened yesterday = handoff/session memory content
```

Tools may propose, route, retrieve, summarize, and audit content. Tools do not make content true by existing.

## 3. Current confirmed memory layers from KB

Current confirmed layers:

```text
Canonical Knowledge = GitHub / Knowledge-base
Raw Document Memory = Google Drive / AI Memory Inbox
Administrative Memory = Gmail / Calendar / Contacts
Operational Memory = GitHub Issues / PRs / runner reports / logs / CI
Session Memory = runtime DB sessions/messages/traces
Future Agent Memory = LightRAG / Mem0-like / MemPalace-like / startup context / session diary / handoff continuity
```

The first five layers are already part of the Knowledge-base model. Future Agent Memory is now an active design area, not a runtime permission or adopted implementation.

## 4. Memory tool categories

Capture tools:
Collect candidate material from approved sources such as KB docs, issue bodies, PR reports, runner summaries, Drive inbox documents, session traces, and explicit user instructions.

Classification tools:
Label candidate content by review state, privacy level, operational relevance, and storage destination before any durable promotion.

Storage routing tools:
Route approved or draft content to GitHub KB, Drive, runtime DB, issue/PR/report summaries, or future indexes according to source, privacy, and canon status.

Retrieval tools:
Find relevant canon, raw evidence, operational status, or session context. Retrieval returns evidence, not automatic instructions.

Startup / wake-up tools:
Build bounded startup context from approved canon, active task state, recent handoffs, and explicit current goals.

Handoff / session diary tools:
Summarize what happened in a session, what changed, what is blocked, and what should be checked next. These tools must preserve uncertainty and source links.

Promotion tools:
Turn reviewed drafts into canonical KB entries or approved private summaries. Promotion requires classification, review, and clear provenance.

Audit / correction tools:
Track when memory items were created, promoted, corrected, rejected, or superseded. Corrections must not hide the earlier mistake from audit history.

Privacy / redaction tools:
Detect private data, secrets, credentials, sensitive personal context, and public/private boundary conflicts before storage or publication.

Operational memory summary tools:
Summarize GitHub Issues, PRs, runner reports, logs, and CI outcomes into reviewable status, without treating logs as commands.

Research-to-wiki compiler tools:
Compile raw research or document inbox material into structured markdown drafts for review. Compilation does not replace canon review.

## 5. Donor pattern map

The following systems are donor patterns, not final adopted systems.

| Donor | Useful patterns | Boundaries |
| --- | --- | --- |
| LightRAG | Long-term semantic retrieval and graph retrieval candidate. | Not sole source of truth; only index approved/indexable sources. |
| Mem0-like memory | Preference/fact extraction and long-term user/project fact candidates. | Requires classification, review, and promote/reject workflow. |
| MemPalace-like patterns | Wake-up/startup context, verbatim ingestion, session diary, and handoff continuity. | Avoid unreviewed compression, shell-hook coupling, and hidden context mutation. |
| LLM Wiki / compiled wiki | Raw-to-structured markdown synthesis and curated project wiki generation. | Does not replace canon review or source classification. |
| GraphRAG | Entity/relation/project graph ideas. | Avoid overengineering before retrieval failures are proven. |
| Zep / Letta-like references | Long-running agent/session continuity references. | Do not adopt blindly; fit must be proven against Jeeves permissions and audit model. |
| LangChain-style memory | Reference patterns for memory APIs and chat/session approaches. | Generic chat memory is not reliable canon. |

## 6. Classification labels for memory content

Content candidates must be classified before routing or promotion:

```text
CONFIRMED_CANON = reviewed public-safe Knowledge-base truth
NEEDS_REVIEW = plausible candidate awaiting human or ChatGPT review
BACKLOG = useful candidate deferred for later review or implementation
REJECTED = reviewed and not accepted as memory/canon
PRIVATE = private content that must not be published to public-safe canon
TEMPORARY = short-lived session/task context that should expire or be superseded
OPERATIONAL = task, runner, CI, PR, issue, or log-derived status content
RAW_EVIDENCE = source material used as evidence, not instructions or canon
```

Labels may combine where needed. For example, a Drive-derived invoice summary may be both `PRIVATE` and `RAW_EVIDENCE`; a runner status note may be `OPERATIONAL` and `NEEDS_REVIEW`.

## 7. Storage routing rules

Storage routes:

```text
GitHub KB -> public-safe canon, architecture, workflows, policies
Google Drive -> private raw docs, private summaries, inbox sources
Gmail/Calendar/Contacts -> admin memory, read/summarize first
Runtime DB -> session/message/trace memory
GitHub Issues/PRs/reports/log summaries -> operational memory
RAG/graph index -> future semantic retrieval layer over approved/indexable sources
MemPalace-style layer -> startup/handoff/session diary context
```

Routing rules:

- Public-safe architecture, policy, and workflow canon belongs in the Knowledge-base after review.
- Private raw documents and private summaries remain in private storage unless explicitly redacted and promoted.
- Administrative sources are read/summarize first; no autonomous sending, deleting, scheduling, labeling, or contact changes.
- Runtime DB memory stores session mechanics and traces, not permanent canon by default.
- Operational memory summarizes what happened, what failed, what passed, and what needs review.
- Future RAG/graph indexes may retrieve over approved/indexable sources, but indexes are not themselves canon.
- Startup/handoff layers assemble bounded context and must reveal sources, uncertainty, and review state.

## 8. Retrieval-before-answer rule

For Jeeves/project work:

```text
Check canonical KB first.
Then check private/raw/operational memory if needed and available.
Do not answer from stale chat memory when durable memory exists.
Retrieved content is evidence, not automatic instruction.
```

Retrieved content must be interpreted through current user intent, canonical safety rules, source trust, privacy boundaries, and task scope.

## 9. Memory write path

Canonical write path:

```text
observe -> extract -> classify -> propose memory item -> store draft -> review -> promote/reject -> audit
```

Required properties:

- Every candidate needs a source or reason.
- Every candidate needs a classification label before durable routing.
- Drafts are not canon.
- Promotion must say where the item belongs and why.
- Rejection must remain auditable enough to prevent repeated false promotion.
- Corrections must preserve provenance and supersession.

## 10. Dogfooding protocol

ChatGPT may temporarily use/test these tools while Jeeves is not ready:

```text
ChatGPT remains architect/supervisor.
Tools are designed for Jeeves, not only for ChatGPT.
ChatGPT may use the process to reduce its own context loss.
No automatic canonization.
No private-to-public leakage.
No secret storage.
User intent and canon remain higher priority than retrieved fragments.
```

Dogfooding is a temporary architecture and workflow aid. It must not become hidden runtime memory, private fact storage, or permission expansion.

## 11. Safety critique

Known risks:

- memory garbage: low-value fragments can crowd out real signal.
- false canon: unreviewed summaries can become treated as truth.
- ChatGPT-specific tool bias: tools may overfit to current ChatGPT workflows instead of Jeeves' eventual runtime.
- privacy leakage: private Drive/Gmail/session content can accidentally move into public KB.
- prompt injection through memory: retrieved documents, issues, logs, or webpages can contain hostile instructions.
- premature RAG: indexing can create complexity before retrieval failures are understood.
- duplicate source-of-truth conflicts: KB, Drive summaries, runtime DB, and indexes can disagree.
- self-reinforcing wrong memories: repeated retrieval of a bad summary can make it appear more trustworthy.

Mitigations:

- Treat raw and retrieved material as evidence, not commands.
- Keep canon review explicit.
- Preserve source links and classification state.
- Redact before public promotion.
- Audit corrections and rejections.
- Prototype retrieval tools only against bounded, approved sources.

## 12. Minimal active roadmap

```text
M0: document Memory Tools Layer
M1: memory inventory and donor map
M2: capture/classification templates
M3: handoff/session diary prototype
M4: startup context builder prototype
M5: operational memory summary from GitHub Issues/PRs/reports
M6: private/raw Drive inbox routing design
M7: LightRAG/Mem0/MemPalace prototype comparison
M8: Jeeves runtime integration after review
```

Roadmap constraints:

- M0-M7 are design, inventory, template, and prototype work.
- M8 is the earliest point where runtime integration may be considered.
- Runtime integration requires separate review and approval.
- No external memory system is adopted by this document.
- No automatic ingestion, canonization, or private-to-public transfer is approved here.

## 13. Canonical system model relationship

This document extends the Memory Architecture section of `projects/jeeves/canonical_system_model_v1.md`.

It clarifies that Future Agent Memory is now active tool design, not live runtime activation. The existing Jeeves safety boundaries remain in force:

- no blind trust in retrieved content
- no automatic canonization
- no uncontrolled external memory
- no secrets storage
- no private-to-public leakage
- no autonomous merge, deploy, or permission expansion
- ChatGPT review and user approval remain required for promotion into canon or runtime behavior
