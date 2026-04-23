# BauClock — Implementation Status (Germany Hardening)

## Status

This document records the current implementation status of the Germany-focused legal hardening branch in the BauClock repository.

Reference branch:
- `codex/germany-legal-hardening-finalize`

Purpose:
- capture what is already implemented in code
- distinguish implemented hardening from still-open phase-2 items
- keep product/architecture knowledge and implementation status aligned

---

## 1. Current conclusion

The branch is considered PR-ready from a product/architecture perspective.

The work no longer looks like a greenfield hardening effort.
It looks like a nearly completed first hardening wave that preserves the canonical model and adds the expected compliance/security layers around it.

Core rule preserved:
- no architecture rewrite
- no payroll engine expansion
- no large DATEV-module expansion
- canonical model intact

---

## 2. What is implemented on the hardening branch

### 2.1 Access and isolation
Implemented:
- dedicated dashboard router
- token-gated `/dashboard`
- token-gated `/api/dashboard/data`
- token TTL / expiry validation
- company-bound dashboard scope checks
- inactive worker denial
- role-isolation regression coverage on reachable admin/compliance/export edges

### 2.2 Audit and accountability
Implemented:
- audit log foundation
- audited worker mutations
- audited payment mutations
- audited monthly adjustment mutations
- manual correction audit trail

### 2.3 Manual correction traceability
Implemented:
- explicit manual marker
- actor
- reason
- corrected timestamp
- corrected-state visibility

### 2.4 Legal onboarding evidence
Implemented:
- legal acceptance log foundation
- company-side accepted/acknowledged document logging
- worker-side acknowledgement logging
- document version requirement
- worker requirement resolver for legal completion
- compliance overview visibility layer

### 2.5 Retention hardening
Implemented:
- retention hold foundation
- canonical-first hold handling
- dry-run capable retention reporting shape
- by-class reporting structure
- hold-safe behavior

### 2.6 Germany labor support
Implemented:
- ArbZG warning/report support layer
- company/day reporting foundation
- reporting-first approach without turning into hard-block engine

### 2.7 Export boundary hardening
Implemented:
- DATEV export service boundary
- CONTRACT-only export behavior
- company-scoped export behavior
- audit log on export trigger
- objektmanager denial coverage

### 2.8 Repo-local executor guardrails
Implemented:
- `docs/legal_hardening/README.md`
- `docs/legal_hardening/canonical_rules.md`
- `docs/legal_hardening/current_priorities.md`

These mirror the canonical project rules inside the BauClock repo for executor safety.

---

## 3. What is considered done for phase 1 hardening

Phase-1/primary hardening can be treated as substantially complete for:
- dashboard/API hardening
- role isolation on reachable surfaces
- audit/accountability layer
- manual correction traceability
- legal onboarding evidence foundation
- retention hold/reporting foundation
- ArbZG reporting foundation
- DATEV/export boundary foundation

---

## 4. Known remaining limitations / phase-2 items

These are not blockers for the first hardening wave, but remain open for later improvement.

### 4.1 GPS requirement granularity
Current legal-completion logic is already worker-aware, but future refinement may need a more explicit worker/company/site feature flag model for GPS-required onboarding.

### 4.2 Retention executors beyond foundation
Retention currently has reporting structure and safe hold behavior, but not every placeholder class has a full destructive/anonymization executor yet.
Examples:
- invites
- transient states
- logs

### 4.3 ArbZG review workflow depth
ArbZG currently has reporting/warning foundation, but not a persistent reviewed/resolved compliance workflow.

### 4.4 Legacy compatibility cleanup
Retention hold handling still preserves some legacy/new field compatibility. A future cleanup pass should remove redundant legacy paths when safe.

### 4.5 Config warning cleanup
Pydantic deprecation warnings in config classes remain outside the hardening scope and can be cleaned separately.

---

## 5. Recommended next move

Recommended immediate next move:
- open and review the PR
- merge if review is clean
- do not expand feature scope before merge

Recommended post-merge focus:
- phase-2 cleanup items
- GPS requirement granularity
- retention placeholder executors
- ArbZG reviewed/resolved workflow if needed
- config deprecation cleanup

---

## 6. Final canonical rule

The Germany-focused hardening branch should be treated as:
- a successful first hardening wave
- PR-ready
- close to merge

The next step is controlled review and merge, not another large feature expansion on the same branch.
