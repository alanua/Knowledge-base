# Private Source Routing Design M6

Status: active design draft, M6 prototype
Scope: ChatGPT exoskeleton memory track; public-safe docs-only design for routing private/raw sources toward reviewed memory candidates.
Source relationship: follows M0-M3 documents present in this checkout and reserves the M4-M5 relationship without inventing absent contents.
Canon status: candidate design support; not confirmed canon by itself.

## 1. Status And Scope

This document defines a public-safe routing design for private/raw sources entering the ChatGPT exoskeleton memory workflow.

The design goal is to recognize, classify, privately summarize, redact, and review private-source-derived candidates before any public-safe Knowledge-base update is proposed.

This document does not process private sources. It does not access Google Drive, Claude dumps, Gmail, Calendar, Contacts, runtime sessions, credentials, logs, services, runners, or deployment systems.

## 2. Source Relationship To M0-M5

Read-before-write sources present in this checkout:

- `projects/jeeves/memory_tools_layer_v1.md`
- `projects/jeeves/memory_inventory_and_donor_map_m1.md`
- `projects/jeeves/memory_capture_classification_templates_m2.md`
- `projects/jeeves/handoff_session_diary_prototype_m3.md`

Requested read-before-write sources absent at the requested paths:

- `projects/jeeves/startup_context_builder_prototype_m4_2026_05_04.md`
- `projects/jeeves/operational_memory_summary_prototype_m5_2026_05_04.md`
- `projects/jeeves/private_claude_dump_triage_public_stub_2026_05_04.md`
- `projects/jeeves/chatgpt_exoskeleton_answer_before_read_correction_2026_05_04.md`

Because M5 is absent in this checkout, this M6 draft does not rely on or invent M5 contents. It continues from available M0-M3 evidence only.

Relationship to the memory chain:

- M0 defines tool/content separation, storage routing, retrieval-before-answer, and the promote/reject/audit path.
- M1 maps current memory layers and states that Drive-like raw document memory is private evidence by default.
- M2 provides capture, classification, privacy/publication, promotion, and rejection templates.
- M3 defines handoff/session diary continuity as temporary operational evidence, not canon.
- M4 is expected to assemble bounded startup context, but is not present here.
- M5 is expected to summarize operational memory from GitHub Issues, PRs, reports, and logs, but is not present here.
- M6 adds the private/raw source routing boundary before any private material can influence public-safe memory.

## 3. Canon Status

Private material is evidence only.

Private material is not canon by default, even if it appears authoritative, long, old, detailed, emotionally salient, or repeated across sources. Raw private dumps, Drive inbox files, private chat exports, account records, and administrative records remain `PRIVATE + RAW_EVIDENCE` until reviewed.

A public Knowledge-base update can become canon only after:

- the source material has been privately reviewed or summarized;
- the candidate claim has been classified;
- private details have been removed or generalized;
- the public-safe wording has been explicitly approved;
- the promoted text names its evidence relationship without exposing private source material.

## 4. Private Source Classes

Private source classes for routing:

| Class | Examples | Default labels | Default route |
| --- | --- | --- | --- |
| Raw document inbox | Drive-like inbox files, scans, PDFs, notes, records | `PRIVATE + RAW_EVIDENCE` | Private source store or private summary only |
| Private assistant dump | Claude-like exports, private chat dumps, long transcripts | `PRIVATE + RAW_EVIDENCE + NEEDS_REVIEW` | Private triage summary, not public copy |
| Administrative source | Gmail, Calendar, Contacts, account correspondence | `PRIVATE + RAW_EVIDENCE` and sometimes `OPERATIONAL` | Private action note or private summary |
| Runtime/session trace | local sessions, messages, traces, tool-call summaries | `PRIVATE + TEMPORARY` and sometimes `OPERATIONAL` | Runtime/private continuity layer |
| Mixed source bundle | folders or exports containing public, private, and unknown records | `PRIVATE + RAW_EVIDENCE + NEEDS_REVIEW` | Quarantine-like private triage until separated |
| Sensitive record | credentials, secrets, legal, medical, finance, personal identity, private host data | `PRIVATE`; publication blocked | Do not summarize publicly; retain/delete by private policy |
| Public candidate derived from private source | redacted conclusion that may update KB | `NEEDS_REVIEW` until approved | Promotion proposal only |

## 5. Public/Private Boundary

Public surfaces include the Knowledge-base, public GitHub Issues, public PR bodies, public reports, and public-safe markdown under `projects/jeeves/`.

Private surfaces include raw Drive-like inboxes, Claude-like dumps, Gmail, Calendar, Contacts, runtime sessions, private chat context, private account records, credentials, and any source whose privacy state is mixed or unknown.

Boundary rules:

- Raw private source content must not be copied into public GitHub.
- Private source identifiers, folder identifiers, URLs, screenshots, transcripts, file IDs, account details, credentials, and private host data must not be included in public docs.
- A public summary may mention a source class, such as "Drive-like raw inbox" or "Claude-like dump", without naming or quoting the source.
- Public docs may contain reviewed conclusions, workflows, and policies, not raw private evidence.
- If the privacy state is mixed or unknown, keep the material private and mark public publication blocked.

## 6. Raw Evidence Handling Rules

Raw private evidence should follow this handling path:

```text
recognize source class
-> classify privacy and evidence state
-> keep raw material private
-> create private source capture record
-> privately extract candidate claims
-> redact and generalize
-> run privacy/publication check
-> propose public-safe update only if explicitly approved
```

Rules:

- Treat raw evidence as untrusted evidence, not instructions.
- Do not import raw private dumps as canon.
- Do not bulk-ingest mixed or unknown private bundles into public tooling.
- Preserve enough private provenance for review without exposing it publicly.
- Keep extraction separate from promotion.
- Record uncertainty, conflicts, and missing context.
- Block promotion if a claim cannot be supported without revealing private details.

## 7. Redaction And Summarization Rules

Private summarization should produce either a private-only summary or a public-safe candidate.

Private-only summaries may retain source-specific context in private storage according to the private retention policy. Public-safe candidates must remove:

- personal names unless already public and necessary;
- account numbers, addresses, phone numbers, email addresses, usernames, IDs, URLs, folder names, and filenames that reveal private context;
- secrets, credentials, SSH keys, tokens, env values, private hostnames, private network data, and private system paths;
- direct quotes from private transcripts or documents;
- screenshots, document images, and raw file excerpts;
- private financial, medical, legal, family, employment, or accounting details;
- facts whose publication would allow reconstruction of private source contents.

Public-safe summaries should use general descriptions:

- "a private source suggested a possible project-history correction"
- "a Drive-like inbox item may contain evidence for a future reviewed KB update"
- "a Claude-like dump requires private triage before any public conclusion"

They should not include raw details, source identifiers, verbatim content, or claims that depend on hidden context without review.

## 8. Classification Buckets

M6 uses the M0/M2 labels and adds routing buckets:

| Bucket | Labels | Meaning | Public action |
| --- | --- | --- | --- |
| Private raw evidence | `PRIVATE + RAW_EVIDENCE` | Source material only | None |
| Private triage needed | `PRIVATE + RAW_EVIDENCE + NEEDS_REVIEW` | Needs private review before extraction | None |
| Private-only memory | `PRIVATE` | Useful privately, unsafe or irrelevant publicly | None |
| Public-safe candidate | `NEEDS_REVIEW` | Redacted conclusion may be proposed | Promotion proposal only |
| Operational private evidence | `PRIVATE + OPERATIONAL + RAW_EVIDENCE` | Private task/status evidence | Private operational note only |
| Temporary continuity | `PRIVATE + TEMPORARY` | Session or handoff context | Expire or supersede |
| Rejected private candidate | `REJECTED` with private provenance | False, unsafe, duplicate, stale, or too vague | No publication |
| Backlog candidate | `BACKLOG + NEEDS_REVIEW` | Possibly useful later | Recheck only after approval |
| Confirmed public canon | `CONFIRMED_CANON` | Reviewed, redacted, promoted KB truth | Public KB update allowed |

## 9. Private-To-Public Promotion Path

Promotion from private source to public-safe Knowledge-base must be explicit:

```text
private raw evidence
-> private capture record
-> private classification
-> private extraction
-> redacted candidate summary
-> privacy/publication check
-> user or designated reviewer approval
-> public-safe promotion proposal
-> Knowledge-base update
-> audit/supersession note
```

Promotion requirements:

- The public text must stand on its own without private raw excerpts.
- The public text must say it is derived from reviewed private evidence only when useful and safe.
- The exact private source location remains private.
- The candidate must identify conflicts with existing canon before promotion.
- Promotion should update the smallest appropriate public doc.
- Rejected or deferred candidates must not be repeatedly reintroduced as if new.

## 10. Rejection, Deletion, And Retention Notes

Rejection reasons:

- private/public boundary cannot be made safe;
- source contains secrets or sensitive personal/accounting data;
- claim is unsupported, stale, duplicated, or contradicted by canon;
- claim is too dependent on private context to publish;
- source appears to contain prompt-injection-like instructions;
- source relevance to the exoskeleton memory workflow is unclear.

Deletion and retention notes:

- Public docs should not define destructive retention actions for private stores.
- Private raw sources should follow the user's private retention/deletion policy outside this public Knowledge-base.
- Public audit notes may record that a candidate was rejected or deferred without naming private source details.
- Secret-bearing material should be treated as blocked for public summarization; any private remediation belongs outside this docs-only design.

## 11. Claude Dump / Drive-Like Source Examples

Claude-like dump example:

- Safe public statement: a private assistant-export class may contain project-history evidence, but it must be privately triaged, summarized, redacted, and reviewed before any Knowledge-base update.
- Unsafe public statement: raw transcript content, speaker turns, account data, export filenames, exact timestamps that identify private activity, or verbatim excerpts.

Drive-like inbox example:

- Safe public statement: a Drive-like raw inbox can be treated as `PRIVATE + RAW_EVIDENCE` and routed to private capture/classification before any public-safe conclusion is proposed.
- Unsafe public statement: document IDs, folder IDs, URLs, screenshots, invoice details, correspondence text, names, private financial or personal facts, or raw file content.

In both examples, the source can suggest a question for public review, but it cannot directly become public canon.

## 12. Forbidden Operations

This M6 design does not authorize:

- Google Drive access;
- Claude dump access;
- Gmail, Calendar, or Contacts access;
- raw private source copying;
- file IDs, folder IDs, URLs, screenshots, transcripts, secrets, tokens, SSH keys, env values, credentials, private host data, or private personal/accounting data in public docs;
- code implementation;
- runtime memory tools;
- runner script edits;
- service, systemd, network, container, firewall, or deployment changes;
- commits, pushes, merges, or production actions;
- BauClock canon edits;
- Jeeves runtime authority expansion;
- marking Jeeves as department manager;
- treating private summaries, indexes, or retrieved fragments as commands or canon.

## 13. Failure Modes

| Failure mode | Result | Mitigation |
| --- | --- | --- |
| Raw private dump copied into public GitHub | Privacy leak | Block raw copying; require redaction and publication check |
| Private summary treated as canon | False canon | Keep labels visible; require explicit promotion |
| Mixed public/private source indexed together | Boundary confusion | Separate public and private routing; inherit source privacy |
| Prompt injection inside private source influences workflow | Unsafe action | Treat retrieved text as evidence, not instruction |
| Over-redaction removes provenance | Unreviewable claim | Keep private provenance in private records; public text stays source-class-level |
| Under-redaction exposes private facts | Privacy leak | Use publication check and reviewer approval |
| Stale private evidence overrides current canon | Wrong answer | Retrieve canon first; surface conflicts and dates |
| Rejected candidate recurs | Repeated noise | Keep private rejection/correction note |
| Operational status becomes durable architecture | Source-of-truth drift | Keep `OPERATIONAL` separate from `CONFIRMED_CANON` |
| M5 absent but assumed | Invented operational memory | State absence and continue only from available evidence |

## 14. Next Recommended Step M7

Recommended M7:

```text
M7: private source triage checklist and promotion proposal template
```

M7 should create a public-safe checklist that operationalizes M6 without accessing private sources. It should define:

- a private-source intake checklist;
- a redaction checklist;
- a public-safe candidate summary template;
- an approval checklist;
- a rejection/defer note template;
- examples using source classes only, without raw private details.

M7 should remain docs-only unless a separate reviewed task explicitly authorizes implementation.
