# Gemini Prerequisite Merge Decision Packet - 2026-05-04

## Status/Scope

Status: merge-decision packet for Oleksii review.

Scope: docs-only decision support for the ChatGPT exoskeleton / Gemini auditor
prerequisite package.

This packet recommends how to treat the reviewed Gemini prerequisite PRs. It is
supporting documentation only. It does not merge PRs, close PRs, authorize
implementation, authorize live API use, authorize key creation or storage,
authorize secret handling, authorize runner changes, or expand Jeeves runtime
authority.

## Canon Status

Gemini output remains evidence only, not canon.

The ChatGPT exoskeleton remains the classifier, canon holder, and safety gate.
Oleksii remains the final approver for merge decisions, implementation
approval, key creation or storage, and any live API test.

The reviewed Gemini documents may support decisions, reconciliation, and later
planning, but they do not promote Gemini auditor output into canon.

## Source Material Status

Source material is the ChatGPT review sweep of the Gemini prerequisite PR set:

```text
#210 Gemini contact requirements
#213 Gemini mock-first auditor connector safety test plan
#215 Gemini external reviewer messages
#221 disabled connector / secret-env runbook
#223 mock fixtures / JSON schema validation checklist
#226 Gemini mock-ready acknowledgment
#228 adapter v0.1 packet/schema plan
#230 API-later roadmap
#233 Gemini auditor reconciliation index
#236 first mock packet schema finalization
#240 first mock packet JSON schema validation checklist
#243 third Gemini strict-schema pass evidence
#245 first schema mismatch evidence
#248 first manual mock cycle reconciliation
#251 mock parser acceptance criteria
#267 Gemini API adapter operating model
#272 prerequisite reconciliation / blocker note
```

The source material is sufficient to recommend accepting the docs as supporting
documentation and evidence. It is not sufficient to authorize implementation or
live integration.

## Plain-Language Summary

The Gemini prerequisite PRs appear useful as a documentation and evidence
package. They help describe boundaries, mock-first expectations, schema
planning, manual-cycle evidence, parser acceptance criteria, API-later posture,
and remaining blockers.

Recommended decision: accept and merge the Gemini docs only as supporting
documentation/evidence, not as implementation authorization. Implementation
remains blocked until the merge/rejection outcome is known, a clean
reconciliation is created from files actually present in the checkout, and
Oleksii separately approves the implementation path and any key/live-test path.

## Reviewed PR Inventory

Core boundary/supporting docs:

```text
#210 #213 #215 #221 #223 #226 #228 #230 #233
```

First mock packet / manual cycle / parser planning docs:

```text
#236 #240 #243 #245 #248 #251
```

API adapter docs and blockers:

```text
#267 #272
```

Full inventory:

```text
#210 Gemini contact requirements
#213 Gemini mock-first auditor connector safety test plan
#215 Gemini external reviewer messages
#221 disabled connector / secret-env runbook
#223 mock fixtures / JSON schema validation checklist
#226 Gemini mock-ready acknowledgment
#228 adapter v0.1 packet/schema plan
#230 API-later roadmap
#233 Gemini auditor reconciliation index
#236 first mock packet schema finalization
#240 first mock packet JSON schema validation checklist
#243 third Gemini strict-schema pass evidence
#245 first schema mismatch evidence
#248 first manual mock cycle reconciliation
#251 mock parser acceptance criteria
#267 Gemini API adapter operating model
#272 prerequisite reconciliation / blocker note
```

## Recommended Accept-As-Supporting-Docs Batch

Recommend accepting/merging the following as supporting documentation only:

```text
#210 #213 #215 #221 #223 #226 #228 #230 #233
```

These PRs should be treated as boundary, safety, runbook, roadmap, and
reconciliation support. They should not be treated as authorization to create
keys, wire APIs, change runners, ingest private sources, or grant Gemini canon
or runtime authority.

## Recommended Evidence-Only Docs

Recommend accepting/merging the following as evidence-only or planning-only
docs:

```text
#236 #240 #243 #245 #248 #251
```

These PRs may preserve mock packet, strict-schema, mismatch, manual-cycle, and
parser-planning evidence. They should not create fixture files, JSON schema
files, parser tests, parser implementation, or live validation behavior from
this decision packet.

## Recommended Blocker/Reconciliation Docs

Recommend accepting/merging the following as API adapter and blocker docs:

```text
#267 #272
```

These PRs should be treated as operating-model and blocker/reconciliation
material. They do not authorize API implementation, live mode, network access,
secret-env changes, OAuth setup, Google Cloud setup, or production access.

## Merge Order Recommendation

Recommended merge order:

```text
1. #210 #213 #215 #221 #223 #226 #228 #230
2. #233 reconciliation index
3. #236 #240 #243 #245 #248 #251
4. #267 API adapter operating model
5. #272 prerequisite reconciliation / blocker note
6. after merge: new clean reconciliation with files actually present in checkout
```

This order keeps boundary and supporting docs first, then the reconciliation
index, then mock/manual/parser planning evidence, then API operating-model
material, then the final blocker note.

## Known Corrections Before Implementation

The following corrections must be applied before any implementation planning or
implementation work:

```text
safety_gates = boolean pre-transport/pre-request gates
security_flags = named auditor-output array
GEMINI_AUDITOR_* = preferred secret-env family
rationale = required array of strings only
manual/mock-first now, API later
Gemini output = evidence only, not canon
ChatGPT exoskeleton remains classifier/canon/safety gate
Oleksii remains final approver
```

## Post-Merge Reconciliation Requirement

Implementation remains blocked until after:

```text
PRs are accepted/merged or explicitly rejected
clean reconciliation is created from merged files
mock-mode-only implementation planning is separately approved
allowed files/actions list is accepted
no-network validation plan is accepted
secret-env procedure for real key placement is separately approved
explicit Oleksii approval exists for implementation
explicit Oleksii approval exists for key creation/storage
explicit Oleksii approval exists for any live API test
```

The clean reconciliation must be created only from files actually present in the
post-merge checkout, not from assumptions about unmerged PR contents.

## Explicit Non-Authorizations

This document does not authorize:

```text
merge by runner
closing PRs
API implementation
API calls
API key creation
API key storage
secret env changes
fixture files
JSON schema files
parser tests
runner changes
runner script edits
Python/Docker implementation
OAuth setup
Google Cloud setup
Drive/Gmail/NotebookLM access
private source ingestion
service/systemd/network/container/firewall changes
deploy
production access
secret storage
secret inspection
BauClock production edits
Jeeves runtime authority expansion
Jeeves department-manager status
autonomous correction loops
autonomous self-improvement
canon promotion
```

## Next Recommended Action For Oleksii

Oleksii should review the package and decide whether to accept/merge the listed
Gemini PRs as supporting documentation/evidence only, in the recommended order,
or explicitly reject selected PRs.

After that decision, the next work item should be a new clean reconciliation
from the merged checkout. Only after that reconciliation should separate
mock-mode-only implementation planning be considered, with explicit allowed
files/actions, no-network validation, secret-env procedure, and Oleksii approval
for implementation, key creation/storage, and any live API test.
