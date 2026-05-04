# NotebookLM Private Memory Layer Policy 2026-05-04

Status: YELLOW docs-only policy draft.
Scope: safe model for using NotebookLM / Gemini Notebooks as a possible private evidence memory layer for Jeeves.
Canon status: not canon by itself; candidate policy evidence until reviewed and approved.

This document does not authorize API integration, OAuth setup, Google Cloud setup, Drive/Gmail/NotebookLM access, notebook creation, source upload, private data ingestion, synchronization, runner changes, live tooling, deployment, merge, production access, or secret handling.

## 1. Status/Scope

This note defines a controlled policy model for NotebookLM / Gemini Notebooks as a possible private evidence memory workspace for Jeeves.

Allowed scope for this note:

```text
document the private evidence memory model
document boundaries and stop conditions
document review and canon promotion path
document the Gemini response assessment as external policy evidence
```

Out of scope:

```text
creating notebooks
uploading sources
connecting APIs
accessing Drive, Gmail, NotebookLM, Gemini, or Google Cloud
changing runners or runtime behavior
handling secrets or production data
```

## 2. Canon Status

NotebookLM must not be called official canon or the single source of truth.

Required memory classification:

```text
NotebookLM memory = private evidence memory, not canon by itself.
Gemini answers from NotebookLM = external/private evidence, not canon.
GitHub KB = reviewed memory/canon only after ChatGPT review and Oleksii approval.
Raw private materials must not be copied to public GitHub.
Public KB may receive only redacted summaries, extracted constraints, or reviewed canon proposals.
```

GitHub Knowledge-base remains the reviewed public/canon evidence store after approval.

## 3. Source Material Status

NotebookLM / Gemini Notebooks may hold source-grounded evidence only under a separately approved source process.

Safe source states for this policy draft:

```text
public-safe docs
redacted KB exports
approved handoffs
reviewed GitHub docs
manual public-safe packets
```

Private/raw source ingestion requires separate explicit approval and a private triage policy. This note does not approve private source upload or notebook creation.

## 4. Gemini Response Assessment

Assessment:

```text
semantic_result = pass
strict_schema_result = pass
recommended_route = accept_as_external_policy_evidence_only
canon_status = not_canon
```

Gemini's proposal is accepted only as external policy evidence. It is not authorization to create notebooks, upload files, access NotebookLM, access Drive or Gmail, connect APIs, or set up Google Cloud/OAuth.

Required corrections to Gemini's response:

```text
recommended_route=accept means accept as external policy evidence only, not authorization to create notebooks, upload files, access NotebookLM/Drive/Gmail, or connect APIs.
"Runner securely transports this insight" is a future assumption and must not be stated as current infrastructure or authorization.
Gemini outputs are evidence only, even when redacted.
ChatGPT may receive private-triage evidence only in a separately approved private mode; public GitHub may receive only redacted summaries/candidate constraints/canon proposals.
"Sources physically isolated from GitHub" means raw private data must not be copied to public GitHub; it does not forbid reviewed redacted summaries or approved public-safe exports.
"Names, locations, legal entities, and financial figures must always be stripped" is too broad; private triage may preserve private detail privately, while public outputs must be redacted/generalized.
NotebookLM must not be called official canon or single source of truth.
```

## 5. Plain-Language Summary

NotebookLM / Gemini Notebooks may become a private workspace for evidence that helps Jeeves remember and analyze project history. Gemini may later query or analyze that workspace, but its answers remain evidence, not orders and not canon.

ChatGPT exoskeleton remains the classifier and gate. GitHub Knowledge-base remains the reviewed public/canon memory after approval. Oleksii remains final approver.

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

NotebookLM is useful for source-grounded recall, synthesis, audit, and requirements extraction. It is not a repo writer, runner, deployment system, or canon authority.

## 7. Relationship To ChatGPT Exoskeleton

ChatGPT exoskeleton remains responsible for:

```text
classification
privacy gating
canon gating
task issuance
public/private boundary review
redaction review
promotion proposal review
```

ChatGPT may receive private-triage evidence only in a separately approved private mode. Public GitHub may receive only redacted summaries, candidate constraints, or reviewed canon proposals.

## 8. Relationship To GitHub Knowledge-base

GitHub Knowledge-base remains the reviewed public/canon evidence store after approval.

NotebookLM material must not bypass GitHub review. Raw private materials must not be copied to public GitHub. Public KB updates may include only:

```text
redacted summaries
extracted constraints
reviewed canon proposals
approved public-safe exports
```

"Sources physically isolated from GitHub" means raw private data must not be copied to public GitHub. It does not forbid reviewed redacted summaries or approved public-safe exports.

## 9. Relationship To Gemini

Gemini may later act as a query, audit, or analysis interface for notebook material.

Useful cases:

```text
query/synthesize raw AI conversation transcripts
extract requirements from private notes
draft redacted public-safe summaries
cross-reference draft PRs against historical private decisions
```

Gemini outputs are evidence only, even when redacted. Gemini must not directly write the repository, authorize commands, promote canon, or bypass ChatGPT/Oleksii review.

## 10. Allowed Notebook Categories

Allowed categories:

```text
Jeeves Canon / Public KB Mirror
Jeeves History Recovery
Jeeves Architecture / Agent Department
Jeeves Memory Research
Jeeves Gemini / Antigravity / Auditor Evidence
BauClock Product Memory only if separately approved
Personal/administrative memory only in a separate private mode if separately approved
```

These categories define possible policy buckets only. They do not authorize notebook creation or source upload.

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

Public outputs must be redacted or generalized before GitHub publication. Private triage may preserve private detail privately only when a separate private mode has been approved.

Privacy rules:

```text
do not expose secrets, credentials, tokens, SSH keys, cookies, or .env values
do not copy raw private materials to public GitHub
do not publish private account IDs or Drive file IDs unless explicitly approved
do preserve uncertainty when redaction removes context
do mark outputs with privacy and redaction notes
do require Oleksii approval for public publication
```

Names, locations, legal entities, and financial figures are not automatically forbidden in private triage. They must be redacted or generalized for public output unless explicitly approved as public-safe.

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

Every answer should distinguish source-grounded evidence from proposed action.

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

No item becomes canon because it exists in NotebookLM or because Gemini summarized it.

## 15. Synchronization/Staleness Rules

Required staleness rules:

```text
NotebookLM sources may be stale.
Notebook contents must record source date and refresh status when known.
A NotebookLM answer must not be treated as current if source freshness is unknown.
GitHub KB remains source of truth for reviewed canon.
Before canon promotion, source freshness must be checked or uncertainty preserved.
```

Synchronization is not authorized by this note. Any future synchronization process requires a separate task, approval, and policy review.

## 16. Operating Modes

`PUBLIC_SAFE_NOTEBOOK_MODE`:
Only public-safe docs, redacted KB exports, reviewed GitHub docs, approved handoffs, and manual public-safe packets may be used.

`PRIVATE_EVIDENCE_MODE`:
NotebookLM may hold private evidence only after separate explicit approval. Outputs remain private evidence and must not be published without redaction and review.

`PRIVATE_TRIAGE_MODE`:
Private details may be preserved privately for classification, redaction, and evidence review only after separate explicit approval and a private triage policy.

`CANON_PROPOSAL_MODE`:
Gemini/NotebookLM may produce candidate constraints or candidate canon proposals. ChatGPT classifies them, GitHub receives only reviewed public-safe drafts, and Oleksii gives final approval.

`RESEARCH_SYNTHESIS_MODE`:
NotebookLM/Gemini may synthesize research notes, architecture evidence, and historical context into source-grounded summaries with uncertainty and privacy notes.

## 17. Block/Stop Conditions

Stop if a task requires:

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

Gemini's suggested block conditions also apply:

```text
direct API uploads or notebook modifications
bypass ChatGPT and push notebook data to GitHub
unredacted secrets or highly sensitive data in output
requests to treat notebook content as absolute canon
```

## 18. Risks And Mitigations

Risks:

```text
false canon from unreviewed notebook summaries
private-to-public leakage
stale source synthesis
hidden permission expansion
Gemini answer treated as command or authority
duplicate source-of-truth conflicts
future runner integration assumed to already exist
```

Mitigations:

```text
label NotebookLM as private evidence memory only
require ChatGPT classification before any public use
require Oleksii approval for private ingest, source sharing, canon promotion, and publication
record source date and freshness when known
preserve uncertainty when freshness is unknown
allow only redacted summaries, extracted constraints, and reviewed canon proposals into public GitHub
block runner, API, OAuth, Google Cloud, production, deploy, merge, and secret tasks by default
```

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

Next recommended task: open a docs-only draft PR for review that states the changed file, Gemini response assessment, role model, memory classification, notebook categories, ingestion rules, query/output rules, canon promotion path, staleness rules, block conditions, non-authorizations, validation result, and this next recommended task.

That follow-up must remain docs-only and must not create notebooks, upload sources, connect APIs, access Drive/Gmail/NotebookLM, change runners, touch secrets, deploy, merge, or expand Jeeves authority.
