# BauClock — Open Questions Register

## Status

This document tracks unresolved canonical questions for BauClock.
Anything listed here is not yet a fully fixed project rule.

Read together with all canonical BauClock documents.

---

## 1. Identity and membership

### OQ-001 — Final migration target timing
Question:
- when exactly to complete migration from transitional `worker` model to canonical `person + company_membership`

Why still open:
- full migration may add risk to live system
- compatibility layer may still be useful temporarily

Current direction:
- keep transitional layer while hardening legality and access first

---

## 2. ArbZG policy depth

### OQ-002 — Warning vs block
Question:
- which ArbZG-related situations should only warn and which should block actions

Why still open:
- over-blocking may damage field usability
- under-enforcement weakens compliance support

Current direction:
- start with warnings/report flags, decide hard blocks later

### OQ-003 — Edge-case time logic
Question:
- how to handle cross-day shifts, night work and unusual edge patterns

Current direction:
- design policy support layer first, edge-case rulebook later

---

## 3. Retention

### OQ-004 — Exact time horizons by record class
Question:
- exact retention periods for raw events, summaries, audit logs, exports and finance-support data

Why still open:
- needs legal/accounting confirmation beyond system design defaults

Current direction:
- implement safe-by-default retention structure first

### OQ-005 — Archive vs anonymize vs delete strategy
Question:
- which record classes should archive, anonymize or hard-delete after horizon

Current direction:
- no destructive cleanup by default in v1

---

## 4. Export / DATEV

### OQ-006 — Minimal DATEV-facing field set
Question:
- exact fields and exact export artifact shape for v1

Current direction:
- hold a strict CONTRACT-only boundary first

### OQ-007 — Export artifact lifecycle
Question:
- whether generated export files are stored, regenerated, archived or deleted after bounded time

Current direction:
- treat source records as more canonical than output copies

---

## 5. Absence model

### OQ-008 — Sick leave / vacation / Feiertage scope
Question:
- how deeply sick leave, vacation, holidays and justified absence enter product scope

Why still open:
- current focus is time tracking + payment support, not full HR/payroll

Current direction:
- keep outside core v1 unless client need forces a smaller support layer

---

## 6. Payment and dispute logic

### OQ-009 — Payment dispute SLA and resolution ownership
Question:
- who resolves disputes
- in what time window
- what becomes blocked while dispute is open

Current direction:
- keep dispute visible and attributable first; define full SLA later

### OQ-010 — Delegation of financial actions
Question:
- which finance actions owner may delegate to objektmanager/accountant

Current direction:
- default deny, explicit delegation only later

---

## 7. Invoicing for Gewerbe

### OQ-011 — Built-in invoicing depth
Question:
- whether BauClock invoicing remains minimal support or becomes richer billing support

Current direction:
- keep minimal useful mode valid

### OQ-012 — Legal-form-specific templates
Question:
- whether document templates should differ by Gewerbe/GmbH/UG/GbR and when

Current direction:
- not needed for core logic right now

---

## 8. Bot and contour boundaries

### OQ-013 — Public page depth
Question:
- how much public site/company information should be visible by default to unknown users

Current direction:
- neutral minimal public info only

### OQ-014 — Dedicated bot isolation depth
Question:
- exact technical and branding isolation requirements for dedicated client bots

Current direction:
- keep platform contour completely separate from client bots

---

## 9. Legal onboarding

### OQ-015 — Contract acceptance flow placement
Question:
- whether AVV/DPA and terms are accepted in-app during registration or at sales/order phase outside app

Current direction:
- support in-product acceptance state either way

### OQ-016 — Worker legal notices multilingual strategy
Question:
- whether all worker legal notices must exist in all supported worker languages from phase 1

Current direction:
- at minimum provide understandable worker-facing notices for active languages

---

## 10. Audit model

### OQ-017 — Audit log granularity
Question:
- whether all actions go to one audit table or some actions need specialized history tables

Current direction:
- begin with one canonical audit layer and split later only if necessary

### OQ-018 — Audit retention by action type
Question:
- whether some audit classes need longer retention than others

Current direction:
- keep audit logs longer than normal operational logs

---

## 11. Commercial / module boundaries

### OQ-019 — Product module packaging
Question:
- exact split of base module vs payroll-support vs subcontractor/Gewerbe vs dedicated bot

Current direction:
- preserve modular separation in architecture first, pricing detail later

---

## 12. Rule for handling open questions

Until an open question is fixed in writing:
- do not treat it as implicitly decided
- do not let executor invent final policy silently
- prefer safe minimal implementation
- record assumptions explicitly in task prompts and review notes
