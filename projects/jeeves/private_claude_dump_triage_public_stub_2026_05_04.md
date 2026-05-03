# Private Claude Dump Triage Public Stub 2026-05-04

Status: queued public-safe coordination stub
Scope: redacted handoff pointer for a private Claude dump triage track.
Source relationship: based on GitHub Issue #177 body and public Jeeves memory classification docs available in this repository. The requested public policy/runbook files `knowledge_base/MEMORY_POLICY.md`, `knowledge_base/WORKING_PROTOCOL.md`, `knowledge_base/CHATGPT_EXOSKELETON_RUNBOOK.md`, and `projects/jeeves/runner_memory_dev_workstream_inventory_2026_05_04.md` were not present in this checkout.
Does not authorize: Google Drive access, raw dump inspection, memory import, private-to-public transfer, runner/service edits, secrets access, deploy, merge, or making Jeeves a department manager.

## Privacy Classification

Classification labels:

```text
PRIVATE + RAW_EVIDENCE + NEEDS_REVIEW
```

Publication state:

```text
public-safe stub only
```

The private Claude dump and any unpacked source material remain private evidence. This file is not a summary of the dump, not an index of dump contents, and not permission to import dump material into GitHub.

## Publicly Known Facts

- A private unpacked Claude dump exists in Google Drive.
- A private Drive task exists for triage.
- Triage should happen privately against the private source material.
- Raw content, source excerpts, file names that reveal private context, Drive file IDs, Drive URLs, and account-specific metadata must not enter GitHub.
- Public GitHub may carry only a redacted pointer so this track is not forgotten.

## Allowed Public-Safe Outputs From Future Triage

Future private triage may produce public-safe outputs only after explicit review and redaction. Acceptable public outputs may include:

- high-level candidate categories with no raw quotes or identifying private details;
- a count or status summary such as `not started`, `in progress`, `blocked`, or `reviewed`, if safe;
- redacted memory candidate proposals that state classification, confidence, source type, and recommended route;
- public-safe backlog items derived from private review, without exposing the original private evidence;
- rejected or deferred candidate notes that explain the public-safe reason without quoting private material;
- pointers to approved public Knowledge-base files that should receive future reviewed updates.

## Forbidden Raw Or Private Material

Do not publish or copy:

- raw Claude dump text, transcripts, prompts, outputs, summaries, exports, or screenshots;
- verbatim or near-verbatim excerpts from the dump;
- private Drive file IDs, folder IDs, URLs, path names, export names, or unpacked folder structure;
- personal, accounting, email, server, infrastructure, credential, SSH, token, env, or secret material;
- private names, account identifiers, project details, or sensitive personal context unless separately approved and redacted;
- generated summaries that would let a reader reconstruct private dump contents;
- automatic memory imports or unreviewed canon claims derived from the dump.

## Candidate Classification Buckets

Use these buckets during private triage before any public-safe routing:

| Bucket | Meaning | Default route |
| --- | --- | --- |
| `PRIVATE + RAW_EVIDENCE` | Raw source material or close derivative from the dump. | Keep private. |
| `PRIVATE + NEEDS_REVIEW` | Possible useful memory, not yet redacted or approved. | Private review queue. |
| `PUBLIC_SAFE + NEEDS_REVIEW` | Redacted candidate that appears safe but still needs review. | Draft proposal only. |
| `OPERATIONAL + NEEDS_REVIEW` | Task/status context about the triage process. | Public-safe issue/PR note if no private content. |
| `BACKLOG` | Useful but not urgent candidate. | Private or public backlog according to privacy check. |
| `REJECTED` | Unsafe, stale, duplicate, too private, or not useful. | Auditable rejection note; keep private if needed. |
| `CONFIRMED_CANON` | Reviewed public-safe truth approved for Knowledge-base. | Public KB update only after approval. |

## Relation To Future Jeeves Memories

The private dump may be treated only as an evidence source for future candidate memories. It must not become canon by existing, by being indexed, or by being summarized once.

Future Jeeves memory handling should follow this path:

```text
private source -> private extraction -> classification -> privacy check -> review -> public-safe proposal or private summary -> approval -> promotion/rejection
```

Any future Jeeves memory derived from this track needs provenance, privacy classification, confidence, review state, recommended storage route, and an explicit promotion decision. Public Knowledge-base updates should contain only reviewed, redacted conclusions, not private evidence.

## Public-Safe Questions For Oleksii

These questions can be asked without exposing private dump content:

- What outcome should the private triage optimize for: durable project memory, cleanup, backlog extraction, or archival review?
- Which broad categories are in scope for triage, stated without examples or raw excerpts?
- Are there categories that should be rejected without review, such as sensitive personal, accounting, credentials, or obsolete session material?
- Who is allowed to review the private dump material?
- Should the first private pass produce counts by classification bucket, redacted candidate summaries, or a private-only report?
- What approval is required before any redacted candidate can be proposed for public Knowledge-base canon?
- Should future public notes use only generic status language, or may they include public-safe project names after review?
- Is there a retention or deletion expectation for rejected private candidates?

## Current Public Stub Status

This file records the existence of the private triage track and the publication boundary only. ChatGPT review and user approval remain required before any future merge or memory promotion.
