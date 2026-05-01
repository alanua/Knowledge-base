# BauClock — Platform Graph Analytics Backlog

## Status

This document fixes the decision that the live dynamic platform graph/map analytics UI is a later feature, not current implementation scope.

Read together with:
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`

---

## 1. Decision

The live dynamic graphical platform analytics form will be built later.

It should not be implemented in the current launch-readiness / legal onboarding / UI simplification work unless explicitly scheduled.

---

## 2. What is already structurally prepared

The data structure needed for this feature is already conceptually fixed through the relation-driven model.

Core base entities:
- BusinessEntity
- Person
- Site/Object
- Relation
- Role
- Scope

Behavior is derived from:
- BusinessEntity attributes
- Person-Business relation
- Role
- Site/Object relation
- Scope

This supports future graph analytics without inventing special duplicate entities.

---

## 3. Future feature shape

The future platform graph analytics layer should be a live interactive graphical form, not only static charts.

Expected modes:
- graph mode
- map mode
- timeline mode
- table/filter mode
- funnel mode

Expected filtering/sorting:
- by entity type
- by category
- by company
- by site/object
- by address/location
- by city/region/country
- by lifecycle stage
- by activation/adoption state
- by time range

---

## 4. Privacy boundary

The feature must remain privacy-safe.

Allowed by default:
- business entities
- sites/objects
- company-site relations
- lifecycle stages
- aggregated worker counts
- adoption/usage counters
- network/spread relationships
- map-level clusters and site metadata where permitted

Not allowed by default:
- worker personal names
- raw GPS traces
- raw time events
- worker-level payment records
- sensitive comments
- full staff list of other companies

Sensitive drill-down requires support/break-glass rules from `SUPERADMIN_PRIVACY_BOUNDARY.md`.

---

## 5. Why later

This feature is valuable but not required for immediate daily BauClock launch readiness.

Higher current priorities remain:
- legal onboarding launch readiness
- simple daily UI
- production reliability
- SEK/internal pilot readiness

The graph analytics layer should be implemented after the core product is stable enough for pilot usage.

---

## 6. Final canonical rule

Do not implement the live graph/map analytics UI now.

Keep the relation-driven data model clean so this feature can be added later without reworking the core architecture.
