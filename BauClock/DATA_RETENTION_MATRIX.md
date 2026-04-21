# BauClock — Data Retention Matrix

## Status

This document fixes the canonical retention matrix for BauClock.
It defines record classes, retention intent, deletion/anonymization posture and implementation priorities.

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/FINANCIAL_LEGAL_MODEL_V1.md`

This is a system design document, not final legal advice.
Exact durations may be adjusted later with accountant/legal confirmation, but implementation must already respect the structure of this matrix.

---

## 1. Canonical retention principles

Retention in BauClock must follow these principles:
- keep only what is needed
- separate operational data classes
- do not keep everything forever by accident
- do not auto-delete critical records blindly
- prefer explicit configuration and dry-run capable retention jobs
- distinguish deletion from anonymization from archive
- preserve auditability where legally and operationally necessary

---

## 2. Retention states

Use these state concepts consistently:
- `ACTIVE` = normal operational record
- `ARCHIVABLE` = not needed for day-to-day use, but may still need preserved form
- `ANONYMIZABLE` = personal link may be removed while aggregate/business value remains
- `DELETABLE` = may be removed once retention condition is met
- `KEEP` = not auto-deleted in current phase

---

## 3. Matrix

| Data class | Purpose | Personal/Sensitive level | Default retention posture | Suggested v1 handling | Notes |
|---|---|---|---|---|---|
| company profile | business identity and configuration | medium | KEEP | no auto-delete in v1 | tied to customer relationship |
| site master record | operational object and reporting context | low/medium | KEEP | no auto-delete in v1 | may outlive active use |
| person/worker membership record | identity, role, business relation | high | KEEP / archive when inactive | no hard delete in v1 | deactivation preferred over deletion |
| invite artifacts | onboarding workflow temp data | medium | DELETABLE | short-lived auto-expiry | invite tokens should expire quickly |
| invite acceptance logs | audit of onboarding action | medium | ARCHIVABLE | keep longer than raw invite token | useful for proof of onboarding |
| raw time events | source attendance evidence | high | ANONYMIZABLE / DELETABLE after horizon | retention-controlled job | primary evidence class |
| suspicious event flags | review/support metadata | medium/high | linked to raw event horizon | delete/anonymize with parent record unless separately justified | do not preserve forever without reason |
| GPS check data | presence verification | high | shortest practical horizon among time evidence classes | minimize, then anonymize/delete | do not turn into surveillance archive |
| derived daily summaries | operational/payroll support summary | high | ARCHIVABLE / ANONYMIZABLE | longer than raw if needed | derived, not primary evidence |
| derived monthly summaries | reporting/export/accounting support | high | ARCHIVABLE / ANONYMIZABLE | keep longer than raw if justified | business-facing derived layer |
| payments | payment-support history | high | KEEP in v1 | no auto-delete | financial relevance |
| payment comments | payment context / dispute context | high | KEEP in v1 | no auto-delete | may contain sensitive remarks; minimize content |
| payment dispute records | labor/payment dispute support | high | KEEP / archive | no auto-delete in v1 | high evidentiary value |
| monthly adjustments | payroll-support correction layer | high | KEEP / archive | no auto-delete in v1 | ties to settlement history |
| invoice-support records | subcontractor/Gewerbe financial workflow | high | KEEP / archive | no auto-delete in v1 | business/accounting relevance |
| export artifacts | generated output copies | medium/high | ARCHIVABLE / DELETABLE by policy | avoid indefinite accumulation | may be reproducible from source |
| dashboard access tokens | temporary access control | high | DELETABLE | Redis TTL only | should vanish automatically |
| dashboard access logs | security trace | medium/high | ARCHIVABLE | keep configurable security horizon | no raw token in logs |
| audit logs | accountability trail | high | KEEP / archive longer | no auto-delete in v1 unless explicit archive policy exists | key legal hardening layer |
| bot conversation operational state | runtime state / FSM / transient UX state | medium | DELETABLE | short-lived | not canonical evidence |
| public page access logs | infrastructure/security support | medium | ARCHIVABLE / DELETABLE | short/medium retention | avoid over-collection |
| error logs | debugging / security support | variable | ARCHIVABLE / DELETABLE | bounded retention | never log secrets |

---

## 4. Suggested v1 retention horizons

These horizons are implementation targets for v1 and may later be adjusted.

| Data class | Suggested horizon |
|---|---|
| invite token payloads | 7 days or less |
| dashboard tokens | Redis TTL only, e.g. 30 minutes |
| bot transient state | hours to days |
| raw time events | 3 years target horizon unless legal/accounting need extends |
| GPS precision data | same or shorter than raw time events; minimize first |
| daily summaries | 3–5 years depending on accounting/operational need |
| monthly summaries | 5 years target horizon pending legal/accounting confirmation |
| public page access logs | 30–90 days depending on security needs |
| dashboard/security access logs | 90–365 days depending on security policy |
| audit logs | 5 years target horizon pending legal/accounting confirmation |
| payments / adjustments / invoice-support records | keep in v1 until explicit finance retention policy is approved |
| company/person master records | keep while relationship exists, then archive/deactivate strategy |

These are implementation defaults, not final legal advice.

---

## 5. Deletion vs anonymization guidance

### 5.1 Raw time events
Preferred strategy after retention horizon:
- if no ongoing financial/legal need and no dispute/audit hold exists -> anonymize or delete by policy
- if aggregate reporting value remains useful -> anonymize identifiers and preserve aggregate-compatible structure where possible

### 5.2 Person/worker records
Do not hard-delete by default in v1.
Preferred handling:
- mark inactive
- cut operational visibility
- keep only required historic linkage
- consider later archive/anonymize workflow

### 5.3 Payments and finance-support records
Do not auto-delete in v1.
These require explicit finance/accounting policy before destructive retention is enabled.

### 5.4 Audit logs
Audit logs should be retained longer than normal operational noise because they are part of accountability and manual correction traceability.
Do not auto-delete in v1 unless an archive/retention policy is explicitly approved and implemented safely.

---

## 6. Holds and exceptions

Any retention job must support hold conditions.
At minimum, deletion/anonymization must be blocked when record is involved in:
- open payment dispute
- open worker dispute
- open audit/review
- active export/accounting investigation
- explicit legal hold / admin hold

Suggested hold flags:
- `hold_reason`
- `hold_until`
- `held_by`

---

## 7. Implementation rules

### 7.1 Safe defaults
Retention must be:
- disabled by default for destructive actions
- dry-run capable
- logged
- scoped by data class
- reversible where practical until final destructive step

### 7.2 Feature flags
Recommended config flags:
- `ENABLE_RETENTION=false`
- `RETENTION_DRY_RUN=true`
- `DATA_RETENTION_YEARS_TIME_EVENTS=3`
- `DATA_RETENTION_YEARS_AUDIT_LOGS=5`
- `ENABLE_ANONYMIZATION=true/false`

### 7.3 Deletion reports
Each retention run should produce machine-readable summary:
- data class
- candidate count
- held count
- anonymized count
- deleted count
- errors

---

## 8. Record-class specific notes

### 8.1 GPS and geodata
Geodata is especially sensitive.
Retention should be no longer than necessary for site presence verification, dispute handling and auditability.
Where full precision is no longer needed, prefer reduction or anonymization.

### 8.2 Export artifacts
Generated export files should not pile up forever if they can be deterministically regenerated from source records.
If regeneration is reliable, retention horizon for artifact copies can be shorter than source data.

### 8.3 Logs
Operational and error logs are not a substitute for audit logs.
They should have shorter bounded retention and must not contain secrets, tokens, or unnecessary personal data.

---

## 9. Open retention questions

Still to close explicitly:
- exact legally safe retention horizon for raw time events in Germany-focused deployment
- exact horizon for monthly summaries vs finance-support records
- exact treatment of inactive worker/person identities
- whether export artifacts are archived, regenerated, or deleted after a bounded period
- whether audit logs require different retention by action type

These questions belong in `OPEN_QUESTIONS.md` until fixed.

---

## 10. Final canonical rule

No engineer should implement blind indefinite storage or blind destructive cleanup.
Every data class in BauClock must have an explicit retention posture.

If a record class does not yet have a closed retention rule:
- default to safe preservation
- avoid destructive cleanup
- add the unresolved point to written open questions
