# BauClock — Implementation Status (Phase 2 Post-Merge)

## Status

This document records the implementation status of the phase-2 post-merge refinement branch in the BauClock repository.

Reference branch:
- `codex/phase2-post-merge-refinement`

Purpose:
- capture what phase 2 added beyond the first Germany hardening wave
- separate completed refinement work from still-open future work
- keep product architecture knowledge aligned with real code status

---

## 1. Current conclusion

The phase-2 refinement branch is considered PR-ready from an architecture/product perspective.

It stays inside the canonical model and does not broaden scope into payroll, HR, or large DATEV expansion.

Core rules preserved:
- canonical company -> site -> worker/person -> time events -> summaries -> payments/export chain
- CONTRACT / OVERTIME separation
- QR/GPS/bot-first flow
- tenant isolation
- bot contour separation
- evidence != summary != correction != audit

---

## 2. What phase 2 added

### 2.1 GPS requirement granularity
Implemented:
- explicit GPS notice requirement resolution
- precedence across worker override, site setting, company setting, and safe fallback
- worker-specific legal onboarding completion logic
- compliance visibility that reflects worker-specific requirement state

### 2.2 Retention executor depth
Implemented:
- real retention executors for non-critical Redis-backed artifacts
- dry-run/destructive reporting continuation
- hold-safe behavior preserved
- retention reporting extended without touching finance-critical classes

### 2.3 ArbZG review lifecycle
Implemented:
- lightweight persistent ArbZG finding lifecycle
- states: open, reviewed, resolved, dismissed
- company-scoped review model
- no conversion into a large case-management system

### 2.4 Retention-hold canonicalization
Implemented:
- canonical-first writes around hold_reason / hold_until / held_by_worker_id
- compatibility-safe reads for legacy reason / expires_at fields
- reduced ambiguity without breaking older rows

### 2.5 Config cleanup
Implemented:
- Pydantic config warning cleanup for api/bot config layer

---

## 3. Schema additions in phase 2

Migration:
- `b7f2c1e4d5a6_add_phase2_gps_and_arbzg_findings.py`

Added columns:
- `companies.gps_site_presence_required`
- `sites.gps_site_presence_required`
- `workers.gps_site_presence_required_override`

Added table:
- `arbzg_findings`

---

## 4. What is now considered complete

After phase 1 + phase 2, the following can be treated as implemented foundations:
- dashboard/API hardening
- role isolation on reachable surfaces
- audit logging foundation
- manual correction traceability
- legal onboarding evidence foundation
- legal UI/acceptance model foundation
- retention hold/reporting foundation
- GPS requirement granularity for legal notices
- ArbZG reporting + lightweight review lifecycle
- DATEV/export boundary foundation

---

## 5. Known remaining limits / later-phase items

These are not blockers for phase-2 PR readiness, but remain open for future refinement.

### 5.1 Workspace knowledge-base mirroring
Exact external Knowledge-base markdown files may still be missing from some executor workspaces. Repo-local guardrail docs remain the practical fallback.

### 5.2 Retention scope edges
Some retention classes remain intentionally partial or global-only in attribution, especially:
- transient states
- invite artifacts without company linkage
- some operational log categories

### 5.3 Legacy retention-hold columns
Legacy `reason` / `expires_at` fields remain for backward compatibility and can be removed only in a later compatibility cleanup phase.

### 5.4 Further compliance workflow depth
ArbZG review is now persistent but still lightweight. A richer reviewed/resolved governance workflow remains optional future work, not current necessity.

---

## 6. Recommended next move

Recommended next move:
- open PR for `codex/phase2-post-merge-refinement`
- review for scope discipline and compatibility safety
- merge if clean

Do not keep expanding this branch before PR review unless a real bug is found.

---

## 7. Final canonical rule

Phase 2 should be treated as a successful refinement pass.

The correct next action is PR + review, not continued uncontrolled feature growth on the same branch.
