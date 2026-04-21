# BauClock — Event and Audit Model

## Status

This document fixes the canonical event and audit model for BauClock.
It defines the difference between raw evidence, derived data, manual corrections and audit records.

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`
- `BauClock/DATA_RETENTION_MATRIX.md`

---

## 1. Core principle

BauClock must preserve a clear separation between:
- raw operational events
- derived summaries/calculations
- payment-support records
- manual corrections
- audit records about changes

Raw evidence must not be silently overwritten by later convenience logic.

---

## 2. Canonical event layers

### 2.1 Raw time events
Primary event layer.
Examples:
- CHECKIN
- PAUSE_START
- PAUSE_END
- CHECKOUT

Raw time events are the closest operational evidence layer.

### 2.2 Derived summaries
Secondary calculation layer.
Examples:
- daily total minutes
- break minutes
- contract minutes
- overtime minutes
- monthly aggregates

Derived summaries may be recalculated from raw events and policy logic.

### 2.3 Payment-support layer
Business workflow layer.
Examples:
- hours paid
- amount paid
- payment_type
- status
- dispute state

### 2.4 Correction layer
Explicit human intervention layer.
Examples:
- adjusted event timestamp
- inserted correction record
- changed summary value by authorized actor

### 2.5 Audit layer
Meta-accountability layer.
It records who changed what, when, why, and from what to what.

---

## 3. Canonical model for corrections

Manual corrections must never pretend to be original machine/user-captured events.

Any manual correction must preserve at minimum:
- actor
- timestamp of correction
- reason
- old value
- new value
- related entity id/type

If implementation uses direct mutation of a record, audit trail must still reconstruct the before/after state.
Preferred future direction is append-friendly history where practical.

---

## 4. Audit event classes

Canonical audit event classes should include at minimum:
- create
- update
- delete
- manual_correction
- status_change
- acceptance_or_acknowledgement
- export_triggered
- access_sensitive_area

Not every operational action must become a heavy audit record, but all legally/financially/security-relevant actions should.

---

## 5. Minimum objects that require auditability

- worker/person profile changes
- role and permission changes
- hourly_rate changes
- contract_hours_week changes
- site assignment changes where sensitive
- payment status changes
- paid amount/date changes
- monthly adjustments
- manual time corrections
- export-trigger actions
- legal document acceptance/acknowledgement records

---

## 6. Sensitive access logging

Separate from full audit events, the system should support security logging for:
- dashboard access attempts
- invalid token use
- expired token use
- repeated access denial patterns

Do not log raw secrets or raw tokens.

---

## 7. Canonical storage rule

Where practical, audit logging should happen inside or tightly coupled to the same transaction scope as the business change.
Critical writes should not rely on fragile fire-and-forget logging.

---

## 8. UI/API visibility rule

The system should expose enough metadata so that privileged UI can show:
- record was corrected manually
- who corrected it if policy allows
- why it was corrected if policy allows
- whether dispute/review is open

Worker-facing views may show limited versions of this information.

---

## 9. Final canonical rule

In BauClock, evidence, calculation, correction and audit are different layers.
If implementation collapses them into one opaque state, the system is moving away from canonical design.
