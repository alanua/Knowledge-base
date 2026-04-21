# BauClock — Development Roadmap (Germany Focus)

## Status

This document fixes the current roadmap order for BauClock after recent Germany-related legal framing updates.

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/FINANCIAL_LEGAL_MODEL_V1.md`
- `BauClock/GERMANY_LEGAL_HARDENING_PLAN.md`
- `BauClock/OPEN_QUESTIONS.md`

---

## 1. Strategic rule

Do not rebuild the product core now.
Preserve the canonical core and move through legal hardening + execution discipline.

Canonical core kept stable:
- company -> site -> worker/person -> time events -> summaries -> payments/export
- CONTRACT / OVERTIME separation
- QR/GPS/bot-first operational flow

---

## 2. Current top priorities

### P1 — Access and isolation
- dashboard token security
- protected dashboard API
- role isolation checks
- company/scope checks

### P2 — Accountability
- audit logging
- manual correction traceability
- evidence visibility for corrected records

### P3 — Germany labor support
- ArbZG-related warning/check layer
- review/reporting support

### P4 — Privacy lifecycle
- retention/privacy layer
- hold logic
- safe retention job foundation

### P5 — Financial/export boundary
- DATEV/export scope control
- CONTRACT-only export boundary where applicable

### P6 — Legal onboarding evidence
- company contract/AVV acceptance logging
- worker acknowledgement logging
- document version tracking

---

## 3. What is not core roadmap now

Not current core roadmap:
- full payroll engine
- big DATEV module
- large accounting product expansion
- full absence/HR suite
- architecture rewrite for elegance only

These may come later, but must not delay legal hardening and stability.

---

## 4. Execution order for development

### Stage 1
- secure dashboard and API access
- patch obvious role leaks
- test tenant isolation

### Stage 2
- add audit layer
- add manual correction model
- expose corrected-state metadata

### Stage 3
- implement ArbZG warning/report support
- define edge-case limitations explicitly

### Stage 4
- implement retention foundation
- add holds and dry-run retention reporting

### Stage 5
- harden export boundaries
- verify CONTRACT / OVERTIME separation in export flows

### Stage 6
- implement legal onboarding evidence layer
- version legal documents in onboarding flows

---

## 5. Knowledge-base support files required by roadmap

Required companion docs:
- canonical system model
- role permission matrix
- data retention matrix
- legal onboarding pack
- open questions register
- event/audit model
- bot contours and access boundaries

---

## 6. Review rule

Every roadmap task should be checked against:
- privacy impact
- role isolation
- auditability
- retention impact
- export boundary impact
- Germany hardening priorities

If a task does not improve those or unblock core product delivery, it is probably secondary.

---

## 7. Final canonical rule

The current roadmap is: stabilize, harden, prove, then expand.
Not: expand first and clean up legality later.
