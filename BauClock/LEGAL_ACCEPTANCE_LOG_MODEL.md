# BauClock — Legal Acceptance Log Model

## Status

This document fixes the canonical evidence model for legal acceptance and acknowledgement events in BauClock.

Read together with:
- `BauClock/LEGAL_ONBOARDING_PACK.md`
- `BauClock/LEGAL_UI_FLOW.md`
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`

This is the canonical model for proving who accepted or acknowledged which legal text and when.

---

## 1. Goal

The system must be able to prove:
- who performed the action
- for which company context
- which legal document was involved
- which document version was active
- whether the action was acceptance or acknowledgement
- when it happened

This evidence must survive normal UI flow changes.

---

## 2. Canonical event types

Use these core action types:
- `accepted`
- `acknowledged`

Do not blur them together.
Contracts and contract-like documents use `accepted`.
Information/policy notices use `acknowledged`.

---

## 3. Canonical document groups

### 3.1 Company-level documents
Examples:
- `saas_terms`
- `avv_dpa`
- `privacy_toms_retention_subprocessors`
- future module-specific addenda if needed

### 3.2 Worker-level notices
Examples:
- `privacy_notice`
- `time_tracking_notice`
- `gps_site_presence_notice`

---

## 4. Canonical log object

Recommended canonical object:
`legal_acceptance_log`

Minimum fields:
- `id`
- `actor_type`
- `actor_id`
- `company_id` nullable where appropriate
- `document_type`
- `document_version`
- `action_type`
- `created_at`

Strongly recommended future optional fields:
- `source` (web, bot, miniapp, admin-created, migration)
- `language`
- `ip_hash` or request fingerprint only if truly needed and policy-approved
- `user_agent_hash` only if justified and minimized
- `session_id` if there is a clear compliance reason

Default recommendation for v1:
keep the model lean and avoid over-collecting request metadata.

---

## 5. Actor rules

### 5.1 Company acceptance
Typically logged as:
- `actor_type = worker` or `company_owner_actor`
- `actor_id = accepting owner/admin user`
- `company_id = company being onboarded`

### 5.2 Worker acknowledgement
Typically logged as:
- `actor_type = worker`
- `actor_id = worker`
- `company_id = worker company`

---

## 6. Versioning rules

Every legal event must carry an explicit `document_version`.

Do not rely on:
- implicit latest version only
- current file content lookup without stored version
- checkbox state without version binding

If legal text changes materially, new events must point to the new version.

---

## 7. Completion model

Legal completion should not be one blind boolean.
It should be derivable from logged events and requirement rules.

### 7.1 Company completion
Company legal completion = all required company-level accept/acknowledge events exist for the active document versions.

### 7.2 Worker completion
Worker legal completion = all required worker-level acknowledgements exist for the active document versions and actual requirement logic.

Important:
GPS/site notice is not universally required for every worker.
Requirement resolver must decide applicability.

---

## 8. Duplicate events

The system may store multiple events for the same document over time.
This is acceptable and useful when:
- document version changes
- acknowledgement is renewed
- acceptance is repeated after major contract update

Do not delete history just because a newer event exists.

---

## 9. Admin/compliance usage

Privileged compliance/admin views should be able to derive:
- company document completion state
- worker notice completion totals
- incomplete workers
- missing document types
- active versions vs acknowledged versions

Worker-facing UI does not need full compliance detail.

---

## 10. Audit relation

Legal acceptance logging is evidence logging, but not identical to generic audit logging.

Relationship:
- legal acceptance logs = proof of acceptance/acknowledgement events
- audit logs = proof of sensitive administrative/data mutations

They may coexist and reference similar actors, but they are different event classes.

---

## 11. Final canonical rule

No legal onboarding step in BauClock should exist without versioned evidence logging.

If the system cannot prove:
- who accepted or acknowledged,
- what document version,
- and when,
then legal onboarding is incomplete.
