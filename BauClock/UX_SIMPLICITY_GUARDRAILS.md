# BauClock — UX Simplicity Guardrails

## Status

This document fixes the canonical UX simplicity guardrails for BauClock.

Purpose:
- prevent the product from becoming bloated
- preserve BauClock as a simple daily-use tool
- keep legal/compliance/security complexity mostly under the hood
- ensure each role sees only what it needs for the current job

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`
- `BauClock/BOT_CONTOURS_AND_ACCESS_BOUNDARIES.md`
- `BauClock/GERMANY_LEGAL_HARDENING_PLAN.md`

---

## 1. Core UX rule

BauClock must remain a simple daily working-time tool.

The legal, audit, retention, ArbZG and export layers are necessary foundations, but they must not make the everyday user experience heavy.

Canonical rule:
- complexity under the hood
- simple role-specific screens on top

---

## 2. Worker UX

Worker flow must stay minimal.

Primary worker flow:
1. open bot / mini app
2. scan QR or use assigned check-in entry
3. check in / pause / resume / check out
4. see own hours and own relevant status

Worker must not see:
- company-wide dashboard
- audit logs
- retention logic
- legal/compliance internals
- DATEV/export logic
- other workers' data

Worker legal onboarding should be one short notice/acknowledgement flow, not a long legal process.

---

## 3. Objektmanager UX

Objektmanager should see only operational site work.

Primary objektmanager view:
- assigned sites
- people on those sites
- time status
- obvious issues / warnings
- operational corrections if delegated
- payment/overtime operational state only if explicitly allowed

Objektmanager must not become a second owner by UI accident.

---

## 4. Company owner UX

Company owner needs broader control but still not a cluttered system.

Primary owner view:
- company structure
- sites
- people
- roles
- hours
- payments/support status
- compliance status
- exports
- open issues / warnings

Owner can access legal/compliance views, but these should be grouped into clear sections, not mixed into every daily screen.

---

## 5. Accountant UX

Accountant UX should stay finance/support focused.

Primary accountant view:
- hours/summaries needed for payment/accounting support
- payment status
- actual payment date/amount/comment
- export/support data if granted
- compliance evidence if read-only access is granted

Accountant should not receive broad role-management or site-management UI by default.

---

## 6. Platform/admin UX

Platform/admin UX may expose more system-level detail, but only in the platform contour.

Platform complexity must not leak into client bots or ordinary company screens.

---

## 7. Legal/compliance UX rule

Legal/compliance features must be available, but not intrusive.

Examples:
- legal onboarding = structured, short summaries + full text access + versioned logging
- ArbZG = warning/review layer, not constant disruption
- audit = background evidence layer, shown only to authorized users
- retention = admin/compliance tool, not worker-facing feature
- DATEV/export = explicit export boundary, not everyday worker UI

---

## 8. Dashboard layout rule

Dashboard must be role-filtered and block-based.

Preferred pattern:
- concise cards
- collapsible sections
- only relevant blocks per role
- warnings grouped separately
- legal/compliance grouped separately
- no giant all-in-one screen

The mobile mini app must remain especially strict: fewer blocks, short labels, clear status.

---

## 9. Feature admission rule

Before adding a new feature, ask:
1. Which role needs this every day?
2. Can it stay hidden unless relevant?
3. Does it belong under compliance/admin instead of daily UI?
4. Does it duplicate existing logic?
5. Does it push BauClock toward payroll/HR/accounting bloat?

If the answer is unclear, do not add it to the main user flow.

---

## 10. Anti-bloat boundaries

Do not turn BauClock into:
- full payroll engine
- full HR suite
- full accounting suite
- large DATEV platform
- legal decision engine
- worker surveillance dashboard
- overloaded admin cockpit for every role

BauClock should remain:
- time tracking
- site presence
- role-based visibility
- overtime/payment support
- subcontractor/Gewerbe coordination
- compliance/export support around the core

---

## 11. Final canonical rule

BauClock may have a serious backend, but it must feel simple in daily use.

For every role:
- show only what is needed now
- hide complexity until needed
- keep legal/compliance layers available but not intrusive
- never let internal hardening turn into user-facing clutter
