# BauClock — Legal UI Flow

## Status

This document fixes the canonical legal UI flow for onboarding and legal document display in BauClock.

Read together with:
- `BauClock/LEGAL_ONBOARDING_PACK.md`
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/FINANCIAL_LEGAL_MODEL_V1.md`

This document defines how legal documents should be shown in product UX.
It is a product-flow document, not final legal advice.

---

## 1. Core UI principle

Do not show one giant wall of legal text during onboarding.
Use a structured legal flow with:
- short human-readable summary
- full text view
- downloadable PDF where applicable
- explicit accept / acknowledge actions
- versioned acceptance logging

The legal flow must be understandable, auditable, and consistent with the company/worker distinction.

---

## 2. Company onboarding legal flow

### 2.1 Goal
Company onboarding must produce legally explicit controller/processor onboarding evidence.

### 2.2 Step order
Recommended flow:

#### Step 1 — Legal package overview
Show short summary blocks for:
- SaaS Terms / Service Agreement
- AVV / DPA
- Privacy / TOMs / Retention / Subprocessors
- Service scope / liability summary

Each block should contain:
- short summary text
- `Open full text`
- `Download PDF`

#### Step 2 — Full text access
User must be able to open each document in full.
Do not force all documents into one very long page by default.
Modal, side panel, dedicated page, or document viewer are all acceptable.

#### Step 3 — Explicit action
Required actions:
- `I accept SaaS Terms / Service Agreement`
- `I accept AVV / DPA`
- `I acknowledge Privacy / TOMs / Retention / Subprocessors`

Use accept for contracts.
Use acknowledge for policy/information bundle.

#### Step 4 — Company registration details
After legal actions, continue to company setup:
- company name
- legal form
- owner details
- whether Betriebsrat exists
- whether GPS/site validation is enabled

#### Step 5 — Completion summary
Show a summary screen with:
- accepted documents
- acknowledged documents
- document versions
- timestamp
- accepting actor

This state must be stored in legal acceptance evidence.

---

## 3. Worker onboarding legal flow

### 3.1 Goal
Worker onboarding must inform clearly without using false-looking optional consent for mandatory time tracking.

### 3.2 Step order
Recommended flow:

#### Step 1 — Worker notices summary
Show short plain-language notices for:
- Worker Privacy Notice
- Time Tracking Notice
- GPS / Site Presence Notice, but only if actually required for this worker/company/site flow

Each should have:
- short summary
- `Open full text`
- optional PDF or shareable doc view

#### Step 2 — Worker acknowledgement
Required worker actions:
- `I have read / received the Privacy Notice`
- `I have read / received the Time Tracking Notice`
- `I have read / received the GPS / Site Presence Notice` only if applicable

Use acknowledgement wording.
Do not position mandatory core time recording as optional consent.

#### Step 3 — Start use
After acknowledgement, continue into:
- language choice if needed
- worker activation
- QR/site/check-in flow

---

## 4. Companies with Betriebsrat

If company indicates Betriebsrat exists, show an extra internal rollout step:
- `Betriebsrat exists`
- `Internal rollout approval / Betriebsvereinbarung required: yes/no`
- `Status: pending / completed`

This does not replace company-side legal work, but product must support documenting rollout state.

---

## 5. UI content style rules

Legal onboarding UI text should be:
- shorter than contract language
- operationally understandable
- clearly separated into company vs worker flows
- multilingual where worker-facing notices require it

Do not hide the full document.
Do not rely only on a checkbox without document identity/version.
Do not present optional-consent language for mandatory operational processing.

---

## 6. Required UI elements

Minimum canonical UI elements:
- summary card per legal document or document bundle
- full text open action
- PDF download action where appropriate
- explicit accept / acknowledge action
- version label
- acceptance completion summary

Optional but useful:
- scroll-to-bottom gating if later desired
- last updated timestamp
- contact/support link

---

## 7. Acceptance state model in UI

UI should distinguish:
- required
- accepted
- acknowledged
- missing
- not applicable

For worker notices, not all documents are globally required.
GPS/site notice must depend on actual requirement logic.

---

## 8. Failure / incomplete flow behavior

If required legal steps are incomplete:
- onboarding should remain incomplete
- continue button should stay blocked where appropriate
- admin/compliance view should show missing items

Do not silently assume legal completion.

---

## 9. Final canonical rule

In BauClock, legal documents should be shown through a structured onboarding flow:
- summary first
- full text available
- PDF available where relevant
- explicit accept/acknowledge actions
- versioned evidence logging

This applies differently to company onboarding and worker onboarding.
