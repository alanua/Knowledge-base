# NotebookLM Private Memory Layer Policy - 2026-05-04

## 1. Status/Scope

Status: policy draft from a controlled YELLOW docs task.

Scope: define a safe model for using NotebookLM / Gemini Notebooks as a possible private evidence memory layer for Jeeves.

This note is docs-only. It does not authorize API integration, OAuth setup, Google Cloud setup, Drive/Gmail/NotebookLM access, notebook creation, source upload, private data ingestion, synchronization, runner changes, live tooling, deployment, merge, production access, or secret handling.

## 2. Canon Status

NotebookLM / Gemini Notebooks must not be framed as the official canon database, single source of truth, or automatic memory authority.

Memory classification:

```text
NotebookLM memory = private evidence memory, not canon by itself.
Gemini answers from NotebookLM = external/private evidence, not canon.
GitHub KB = reviewed memory/canon only after ChatGPT review and Oleksii approval.
Raw private materials must not be copied to public GitHub.
Public KB may receive only redacted summaries, extracted constraints, or reviewed canon proposals.
```

## 3. Source Material Status

NotebookLM / Gemini Notebooks may become a private evidence memory workspace for raw or semi-raw source material only if separately approved. Public-safe docs, redacted exports, and reviewed handoffs are the default safe source class.

Private/raw source material remains private evidence unless it is redacted, classified, reviewed, and approved for public-safe publication.

## 4. Gemini Response Assessment

Gemini's response is accepted only as external policy evidence.

```text
semantic_result = pass
strict_schema_result = pass
recommended_route = accept_as_external_policy_evidence_only
canon_status = not_canon
```

Required corrections:

- `recommended_route=accept` means accept as external policy evidence only, not authorization to create notebooks, upload files, access NotebookLM/Drive/Gmail, or connect APIs.
- "Runner securely transports this insight" is a future assumption and must not be stated as current infrastructure or authorization.
- Gemini outputs are evidence only, even when redacted.
- ChatGPT may receive private-triage evidence only in a separately approved private mode; public GitHub may receive only redacted summaries, candidate constraints, or canon proposals.
- "Sources physically isolated from GitHub" means raw private data must not be copied to public GitHub; it does not forbid reviewed redacted summaries or approved public-safe exports.
- "Names, locations, legal entities, and financial figures must always be stripped" is too broad; private triage may preserve private detail privately, while public outputs must be redacted/generalized.
- NotebookLM must not be called official canon or single source of truth.

## 5. Plain-Language Summary

NotebookLM / Gemini Notebooks can be considered as a private workspace for evidence that helps Jeeves remember context, decisions, transcripts, notes, and research. Gemini may later query or analyze that workspace.

That does not make NotebookLM canon. ChatGPT remains the classifier and gate. GitHub Knowledge-base remains the reviewed public/canon memory after approval. Oleksii remains final approver.

## 6. Role In The Memory Architecture

Required role model:

```text
NotebookLM / Gemini Notebooks = private evidence memory workspace
Gemini = query/audit/analysis interface for notebook material
ChatGPT exoskeleton = classifier, privacy gate, canon gate, task issuer
GitHub Knowledge-base = reviewed public/canon/evidence store after approval
Private Drive/private hub = possible raw source storage only if separately approved
Oleksii = final approval for private ingest, source sharing, canon promotion, and public publication
```

NotebookLM can help store and retrieve evidence. It cannot decide what becomes canon, what becomes public, or what Jeeves is allowed to do.

## 7. Relationship To ChatGPT Exoskeleton

The ChatGPT exoskeleton remains the classifier, privacy gate, canon gate, and task issuer.

ChatGPT may use Gemini/NotebookLM outputs as evidence only. ChatGPT must classify source status, privacy status, freshness, confidence, and canon eligibility before any public KB proposal or execution task is created.

ChatGPT may receive private-triage evidence only in a separately approved private mode. The public GitHub path may receive only redacted summaries, candidate constraints, or reviewed canon proposals.

## 8. Relationship To GitHub Knowledge-base

GitHub Knowledge-base remains the reviewed public/canon/evidence store after approval.

NotebookLM sources must not be copied raw into public GitHub. Public KB updates may contain only redacted summaries, extracted constraints, or reviewed canon proposals that passed ChatGPT review and Oleksii approval.

GitHub KB remains the source of truth for reviewed canon. NotebookLM may support research and recall, but it does not supersede reviewed KB entries.

## 9. Relationship To Gemini

Gemini may later act as a query, audit, and analysis interface for notebook material. Gemini should be treated as stateless unless a separately approved implementation proves otherwise.

Gemini answers from NotebookLM are external/private evidence, not commands, canon, or authorization to write GitHub. Gemini must not directly write repository content or bypass the ChatGPT exoskeleton.

## 10. Allowed Notebook Categories

Allowed categories, subject to the source and approval rules in this document:

```text
Jeeves Canon / Public KB Mirror
Jeeves History Recovery
Jeeves Architecture / Agent Department
Jeeves Memory Research
Jeeves Gemini / Antigravity / Auditor Evidence
BauClock Product Memory only if separately approved
Personal/administrative memory only in a separate private mode if separately approved
```

## 11. Source Ingestion Rules

Sources may be added only by Oleksii or a separately approved controlled process.

Default allowed source state:

```text
public-safe docs
redacted KB exports
approved handoffs
reviewed GitHub docs
manual public-safe packets
```

Private/raw source ingestion requires separate explicit approval and a private triage policy.

Forbidden by default:

```text
secrets
tokens
OAuth credentials
SSH keys
.env files
cookies
private account IDs
Drive file IDs unless explicitly approved
production logs
raw financial/legal/health/admin documents unless separately approved
raw private chat exports unless separately approved
```

## 12. Privacy/Redaction Rules

Public outputs must be redacted and generalized before entering GitHub. Private triage may preserve private detail privately only inside a separately approved private mode.

Raw private materials must not be copied to public GitHub. Secrets, credentials, tokens, keys, cookies, and `.env` values must not be ingested, summarized into public notes, or exposed in outputs.

Redaction must preserve uncertainty. If a private detail cannot be safely generalized without changing the meaning, the public output must say that context is withheld rather than invent a public-safe substitute.

## 13. Query/Output Rules

Gemini/NotebookLM outputs must return as:

```text
answer/report
source-grounded summary
uncertainty notes
missing context
privacy notes
redaction notes
candidate constraints
candidate canon proposal if requested
```

They must not return as:

```text
commands to execute
authority to write GitHub
canon by default
private raw dumps
secret values
unreviewed public KB content
```

## 14. Canon Promotion Path

Required canon promotion path:

```text
private/raw source
→ NotebookLM private evidence
→ Gemini/NotebookLM answer with sources
→ ChatGPT classification
→ redacted evidence note or canon proposal
→ GitHub draft PR
→ ChatGPT review
→ Oleksii approval
→ canon only if explicitly accepted
```

No step in this path is optional for private-to-public canon promotion.

## 15. Synchronization/Staleness Rules

Required staleness rules:

```text
NotebookLM sources may be stale.
Notebook contents must record source date and refresh status when known.
A NotebookLM answer must not be treated as current if source freshness is unknown.
GitHub KB remains source of truth for reviewed canon.
Before canon promotion, source freshness must be checked or uncertainty preserved.
```

No current synchronization infrastructure is authorized by this document.

## 16. Operating Modes

`PUBLIC_SAFE_NOTEBOOK_MODE`: uses only public-safe docs, redacted KB exports, approved handoffs, reviewed GitHub docs, and manual public-safe packets.

`PRIVATE_EVIDENCE_MODE`: allows private evidence workspace use only after separate approval for source type, storage location, access boundary, and output handling.

`PRIVATE_TRIAGE_MODE`: allows private detail to be inspected or preserved privately only after separate explicit approval and only for classification, redaction, and summarization.

`CANON_PROPOSAL_MODE`: turns source-grounded evidence into candidate constraints or canon proposals for ChatGPT review and Oleksii approval.

`RESEARCH_SYNTHESIS_MODE`: synthesizes research evidence into reports, uncertainty notes, missing context, and candidate next tasks without canonizing the result.

## 17. Block/Stop Conditions

Stop if task requires:

```text
secrets/tokens/OAuth/SSH/.env/cookies
creating or uploading to notebooks without explicit approval
Drive/Gmail/NotebookLM direct access from runner
private source ingestion without separate approval
raw private material copied to public GitHub
canon promotion without review
Gemini direct repo writes
runner changes
API integration
Google Cloud setup
production access
deploy/merge
BauClock production edits
Jeeves authority expansion
```

## 18. Risks And Mitigations

Risk: NotebookLM evidence is mistaken for canon.
Mitigation: label NotebookLM memory and Gemini answers as private evidence only; require ChatGPT classification and Oleksii approval for canon.

Risk: private material leaks into public GitHub.
Mitigation: forbid raw private-to-public transfer; allow only redacted summaries, extracted constraints, or reviewed canon proposals.

Risk: stale notebook sources produce outdated answers.
Mitigation: record source date and refresh status when known; preserve uncertainty when freshness is unknown.

Risk: Gemini outputs are treated as executable instructions.
Mitigation: require outputs as reports, summaries, notes, constraints, or proposals; forbid outputs as commands or write authority.

Risk: the runner is assumed to have Google or NotebookLM transport.
Mitigation: state that no current runner transport, API integration, OAuth, Drive/Gmail/NotebookLM access, or synchronization is authorized.

## 19. Non-Authorizations

This document must not authorize:

```text
creating NotebookLM notebooks
uploading sources
connecting Gemini API
NotebookLM API/integration
OAuth setup
Google Cloud setup
Drive/Gmail/NotebookLM direct access
private source ingestion
runner changes
runner script edits
service/systemd/network/container/firewall changes
deploy
merge
production access
secret storage
secret inspection
raw private-to-public transfer
BauClock production edits
Jeeves runtime authority expansion
Jeeves department-manager status
autonomous correction loops
autonomous self-improvement
canon promotion
```

## 20. Next Recommended Task

Create a separate YELLOW docs task to draft a private triage policy for NotebookLM/Gemini evidence handling. That task should define approval language, private source classes, redaction levels, retention expectations, and the exact public-safe output template before any private ingestion or notebook operation is allowed.
