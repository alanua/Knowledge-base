# BauClock — Germany Legal Hardening Plan

## Status

This document fixes the canonical execution order for Germany-focused legal hardening of BauClock.

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/FINANCIAL_LEGAL_MODEL_V1.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`
- `BauClock/DATA_RETENTION_MATRIX.md`
- `BauClock/LEGAL_ONBOARDING_PACK.md`

Core rule:
Do not rebuild the canonical model.
Apply legal hardening around the existing product core.

---

## 1. Objective

Make BauClock operationally and legally stronger for Germany without turning it into:
- a full payroll engine
- a giant DATEV platform
- a legal-advice product
- an architecture rewrite project

The target is a compliance-hardened BauClock, not a different product.

---

## 2. Canonical hardening priorities

Priority order:
1. dashboard / API access control
2. role isolation
3. audit logging
4. manual correction traceability
5. ArbZG policy checks
6. retention/privacy layer
7. DATEV export boundary
8. legal onboarding evidence layer

This order is canonical unless a concrete incident forces reprioritization.

---

## 3. Work phases

## Phase 0 — freeze the model
Goal:
- stop ad hoc redesign
- ensure implementation uses written canonical docs

Deliverables:
- canonical system model
- role permission matrix
- retention matrix
- legal onboarding pack
- open questions list

Status intent:
- architecture base stable

---

## Phase 1 — access and isolation
Goal:
- close the biggest privacy and tenant-isolation risks first

Must implement:
- tokenized dashboard access
- strict server-side token validation
- token TTL control
- company-bound scope checks
- role-bound scope checks
- no dashboard fallback access
- protected dashboard API routes
- deny-by-default access behavior

Outputs:
- hardened dashboard router
- test coverage for missing/invalid/expired token
- company mismatch and role mismatch checks

Exit condition:
- no meaningful dashboard/API access without validated token and scope

---

## Phase 2 — accountability and evidence
Goal:
- make sensitive changes reconstructable

Must implement:
- audit log table/service
- actor + timestamp + old/new values for critical changes
- logging for worker updates, payment updates, monthly adjustments, manual time corrections
- explicit manual correction reason requirement
- UI/API metadata that marks corrected records

Outputs:
- audit logger service
- correction trace fields or equivalent history table
- reviewable evidence trail

Exit condition:
- critical admin-side actions are attributable and reconstructable

---

## Phase 3 — labor-law support layer
Goal:
- add Germany-specific working-time compliance support

Must implement:
- pause reminders
- warning flags for likely ArbZG issues
- over-limit checks
- rest-period checks where feasible
- reporting/review flags instead of silent acceptance

Must avoid:
- pretending the product itself replaces employer responsibility
- premature hard blocks on every edge case before policy is stable

Outputs:
- policy service/module
- warning/reporting logic
- documented limitations and edge cases

Exit condition:
- system helps surface likely violations instead of passively ignoring them

---

## Phase 4 — retention and privacy controls
Goal:
- stop indefinite uncontrolled data accumulation

Must implement:
- retention config flags
- dry-run capable retention job foundation
- data-class-specific cleanup logic
- hold conditions for disputes/audit/legal hold
- deletion/anonymization reports

Must avoid:
- destructive cleanup by default
- deleting finance-critical records in v1
- deleting without logging/reporting

Outputs:
- retention service
- hold mechanism
- retention run reports

Exit condition:
- retention becomes explicit, bounded and reviewable

---

## Phase 5 — export boundary hardening
Goal:
- ensure payroll/export-facing data remains cleanly separated

Must implement:
- explicit export scope checks
- CONTRACT-only boundary where required
- no accidental OVERTIME leakage into payroll-facing export
- export role permission checks
- export audit logging if export is triggered manually

Outputs:
- clean export service boundary
- tests proving exclusion of non-exportable classes

Exit condition:
- export layer respects financial/legal separation

---

## Phase 6 — legal onboarding evidence
Goal:
- make onboarding legally explicit and provable

Must implement:
- company acceptance/acknowledgement logging
- worker acknowledgement logging
- document versioning in onboarding events
- admin/compliance visibility of completion state

Outputs:
- legal acceptance log or equivalent
- onboarding completion state checks
- versioned acceptance records

Exit condition:
- the system can prove who accepted/acknowledged which legal text and when

---

## 4. Out of scope for current hardening

Do not expand now into:
- full payroll engine
- large accounting suite
- legal opinion engine
- universal HRIS
- broad surveillance/location platform
- architecture rewrite for elegance alone

---

## 5. Required implementation discipline

For every hardening task:
- write scope first
- implement minimally but correctly
- add tests
- avoid broad unrelated refactors
- preserve raw events vs derived data separation
- keep role/company isolation visible in code and data flows

---

## 6. Delivery order for executors

When preparing work for Codex or another executor, prefer task bundles in this order:
1. dashboard access hardening
2. role isolation patch review
3. audit logging
4. manual correction model
5. ArbZG support checks
6. retention foundations
7. export boundary control
8. legal onboarding logging

Each task bundle should request:
- changed files
- migration summary
- tests
- open risks
- branch/commit status

---

## 7. Open hardening questions

Still to close:
- whether some ArbZG rules become hard blocks or remain warnings only
- exact retention durations by data class
- exact export format and minimal field set for DATEV-facing layer
- exact legal onboarding UI wording by language
- whether audit logs need different retention by action type

These remain in `OPEN_QUESTIONS.md` until fixed.

---

## 8. Final canonical rule

Germany legal hardening is not a redesign project.
It is an ordered implementation program around the existing BauClock core.

Any future roadmap item that threatens to delay these hardening layers should be treated as secondary unless it is directly required for client delivery.
