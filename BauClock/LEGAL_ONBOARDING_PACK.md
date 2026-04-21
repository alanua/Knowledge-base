# BauClock — Legal Onboarding Pack

## Status

This document fixes the canonical legal onboarding pack for BauClock.
It defines what must be accepted, acknowledged, or separately handled during onboarding of:
- client companies
- workers
- subcontractor / Gewerbe companies
- companies with Betriebsrat

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/FINANCIAL_LEGAL_MODEL_V1.md`
- `BauClock/GERMANY_LEGAL_HARDENING_PLAN.md`

This is a product/legal-operating design document, not final legal advice.

---

## 1. Core legal model

Default legal operating model:
- client company = controller
- BauClock = processor

Therefore the product must support onboarding through a contract and processor-framework package, not through vague implied usage.

BauClock should not rely on worker consent as the primary legal basis for core working-time recording.
For core working-time recording and attendance support, the product should use:
- employer-side legal/operational necessity
- privacy notice
- worker acknowledgement of policy and information

Not:
- optional-looking consent as the foundation for mandatory time recording

---

## 2. Onboarding package by actor

### 2.1 Client company onboarding pack
Required onboarding package for a client company:
- B2B SaaS contract / Terms of Service / Service Agreement
- AVV / DPA
- TOMs summary or linked document
- Privacy notice for business users / platform users
- Retention and deletion policy summary
- Subprocessor list and change process notice
- Service description / scope boundaries
- Support, liability, and security section

At company registration, the product should collect at minimum:
- explicit acceptance of SaaS terms / service agreement
- explicit acceptance of AVV / DPA
- acknowledgement of privacy notice
- acknowledgement of TOMs / retention / subprocessors info
- acceptance timestamp and actor identity
- document version or policy version

### 2.2 Worker onboarding pack
Required worker-facing onboarding information:
- worker privacy notice
- time tracking policy notice
- site presence / GPS notice if GPS is used
- explanation of check-in / pause / check-out flow
- explanation of payment confirmation / dispute flow if used

At worker registration, the product should collect:
- acknowledgement of privacy notice
- acknowledgement of time tracking policy
- acknowledgement of GPS/site presence policy if used
- timestamp and actor identity
- document/policy version

Do not phrase core time-recording onboarding as optional marketing-style consent.
Use acknowledgement / Kenntnisnahme style language for mandatory operational processing.

### 2.3 Subcontractor / Gewerbe onboarding pack
Subcontractor or Gewerbe onboarding should include both:
- company-level pack as client/business actor
- worker-level pack for their own workers if they onboard them into the system

Where invoice-support or export features are enabled, the onboarding pack should also include:
- invoice-support module scope summary
- export boundary summary
- statement that outputs are support outputs, not automatic final legal/accounting decisions

### 2.4 Companies with Betriebsrat
If a client company has a Betriebsrat, the onboarding path should support:
- indication that a Betriebsrat exists
- internal rollout support note
- possibility to attach/reference company-specific Betriebsvereinbarung or rollout agreement
- documentation path for implementation sign-off if required by the client

BauClock should not pretend this is irrelevant for companies where employee co-determination applies.

---

## 3. What must be accepted vs acknowledged

### 3.1 Must be accepted
Use explicit acceptance for:
- SaaS contract / Terms / service agreement
- AVV / DPA
- optional paid modules if separately ordered
- major updated terms where re-acceptance is required

### 3.2 Must be acknowledged
Use acknowledgement for:
- privacy notice
- worker time tracking notice
- GPS/site presence notice
- retention/deletion summary
- support/contact/escalation info

### 3.3 Must not be positioned as core required consent
Do not use worker consent as the primary legal basis for:
- mandatory time recording
- core attendance recording
- core role/identity processing required for employment workflow

Separate consent may still be used later for truly optional features.

---

## 4. Optional features that may require separate consent

If BauClock later includes optional features not necessary for core time tracking, treat them separately.
Potential examples:
- marketing communication
- worker photo/profile image beyond operational necessity
- biometric features
- expanded geolocation beyond site-presence verification
- analytics or convenience features not necessary for labor/time workflow

For these, the product should support:
- separate opt-in
- separate withdrawal path
- no negative consequence for refusing unrelated optional processing

---

## 5. Versioning and evidence

All legal onboarding events must be versioned.
The system should store at minimum:
- actor id
- company id if applicable
- document type
- document version
- accepted or acknowledged action
- timestamp
- channel / source if relevant

Recommended storage object:
- `legal_acceptance_log`
or equivalent audit-compatible object

The goal is to prove:
- who accepted what
- when
- which version was active

---

## 6. Product implementation rules

### 6.1 Company registration screen
Company registration should include:
- legal links / expandable summaries
- acceptance checkbox for SaaS terms
- acceptance checkbox for AVV / DPA
- acknowledgement checkbox for privacy/TOMs/retention/subprocessors
- disabled continue button until required actions are complete

### 6.2 Worker registration flow
Worker registration should include:
- concise privacy/time-tracking notice
- GPS/site presence notice if used
- acknowledgement action
- no pseudo-voluntary wording for mandatory core processing

### 6.3 Admin visibility
Owner/admin or compliance-support actor should be able to verify:
- whether company acceptance is complete
- whether worker acknowledgement is complete
- which version was accepted

### 6.4 Update events
When a legally relevant document changes materially, the system should support:
- new version id
- who must re-accept vs re-acknowledge
- temporary gating if required

---

## 7. Minimal canonical documents to prepare

BauClock should maintain at least draft templates for:
- B2B SaaS Terms / Service Agreement
- AVV / DPA
- TOMs summary
- Privacy Notice for Business Users
- Worker Privacy Notice
- Worker Time Tracking Notice
- GPS/Site Presence Notice
- Betriebsrat / Internal Rollout Note
- Retention and Deletion Summary

---

## 8. Open legal onboarding questions

Still to close explicitly:
- which legal documents are embedded in-app vs linked externally
- whether AVV acceptance happens during signup or contract/order phase
- whether worker acknowledgement must be renewed on major policy changes
- how to handle multilingual legal notices across worker languages
- whether a separate legal acceptance object is enough or a dedicated compliance module is needed

These unresolved points belong in `OPEN_QUESTIONS.md` until fixed.

---

## 9. Final canonical rule

Every onboarding path in BauClock must be legally explicit.

Company onboarding = contract + processor framework + policy acknowledgement.
Worker onboarding = information + acknowledgement for core processing.
Optional unrelated processing = separate consent if ever introduced.

If a required legal onboarding artifact is missing, the flow should be considered incomplete.
