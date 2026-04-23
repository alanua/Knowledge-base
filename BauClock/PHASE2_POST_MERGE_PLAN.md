# BauClock — Phase 2 Post-Merge Plan

## Status

This document fixes the recommended phase-2 plan after merge of the Germany legal-hardening branch.

Read together with:
- `BauClock/IMPLEMENTATION_STATUS_GERMANY_HARDENING.md`
- `BauClock/OPEN_QUESTIONS.md`
- `BauClock/DEVELOPMENT_ROADMAP_GERMANY.md`

Core rule:
Phase 2 is not a rewrite.
It is targeted refinement after the first hardening wave is merged.

---

## 1. Objective

After the first Germany hardening wave is merged, phase 2 should:
- refine remaining coarse-grained legal/compliance logic
- close controlled technical debt from compatibility layers
- improve operator/compliance usability without broad product expansion

Do not turn phase 2 into feature sprawl.

---

## 2. Phase-2 priorities

### P2.1 GPS requirement granularity
Goal:
- move from v1 site-level/default requirement logic to more explicit requirement rules where needed

Possible target:
- worker/company/site-aware GPS requirement resolution
- clearer distinction between GPS required / not required / not applicable

Reason:
- legal acceptance completion should follow actual requirement logic precisely

---

### P2.2 Retention executor depth
Goal:
- extend retention from reporting foundation to more complete class-specific executors

Focus classes:
- invite artifacts
- transient states
- operational logs

Reason:
- the first wave created safe retention structure, but not all classes have full executor behavior yet

---

### P2.3 ArbZG reviewed/resolved workflow
Goal:
- add persistent review state to ArbZG reporting where operationally useful

Possible target:
- flagged
- reviewed
- resolved
- dismissed with reason

Reason:
- current ArbZG layer is reporting-first and lightweight
- later compliance usability may require explicit review lifecycle

---

### P2.4 Retention hold legacy cleanup
Goal:
- retire redundant legacy compatibility paths once safe

Reason:
- first hardening wave preserved compatibility intentionally
- phase 2 should reduce storage/model ambiguity without breaking data

---

### P2.5 Config / warning cleanup
Goal:
- remove Pydantic deprecation warnings and other low-risk framework noise

Reason:
- not a compliance blocker
- useful cleanup after merge stabilization

---

## 3. Not phase-2 priorities

Still not core phase-2 work:
- full payroll engine
- big DATEV module
- full absence/HR suite
- architecture rewrite for elegance
- broad UI redesign unrelated to compliance/product correctness

---

## 4. Recommended order

### Stage A
- merge first hardening wave
- verify production/staging migration path
- smoke-test dashboard/access/compliance/export flows

### Stage B
- GPS requirement granularity
- retention hold legacy cleanup

### Stage C
- retention executors for invite/transient/log classes

### Stage D
- ArbZG reviewed/resolved workflow if still needed after live feedback

### Stage E
- config / framework warning cleanup

---

## 5. Delivery discipline

Every phase-2 task should:
- stay within canonical model
- avoid cross-cutting rewrite
- include tests
- document assumptions clearly
- preserve separation between evidence, summary, correction and audit

---

## 6. Final canonical rule

Phase 2 starts only after the first hardening wave is reviewed and merged.

Do not keep inflating the same hardening branch with secondary work.
