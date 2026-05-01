# BauClock — Radial Rose Visualization Reference

## Status

This document records a visualization reference for future BauClock radial/range/category-distribution visualizations.

Reference:
- Habr / Data Laboratory: `Роза кишечных бактерий`
- URL: https://habr.com/ru/companies/datalaboratory/articles/232895/

This is a conceptual and technical reference for later visualization work, not a current launch-readiness implementation task.

Read together with:
- `BauClock/DATA_VISUALIZATION_MODEL.md`
- `BauClock/VISUALIZATION_ALGORITHM_REFERENCE.md`
- `BauClock/D3_VISUALIZATION_REFERENCE.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/PLATFORM_GRAPH_ANALYTICS_BACKLOG.md`

---

## 1. Why this reference matters

The reference demonstrates a radial interactive visualization for comparing many entities by distance/similarity/distribution.

Important ideas:
- one entity can be placed in the center
- other entities are arranged around it
- distance can be represented literally as radius/length
- color encodes category/group
- hover/click enables deeper analysis
- multiple mini-roses can form an overview grid / garden

This is useful for BauClock because some future views may need to compare many companies/sites/groups without reducing everything to tables.

---

## 2. BauClock analogues

Potential BauClock analogues of the bacteria-rose idea:

### Company relation rose
Center:
- one business entity

Radial elements:
- connected companies
- subcontractors
- invited companies
- companies sharing sites

Radius may represent:
- number of shared sites
- recency of collaboration
- activation depth
- lifecycle distance
- interaction volume

Color may represent:
- legal form
- lifecycle stage
- role category
- region/city
- customer status

### Site participation rose
Center:
- one site/object

Radial elements:
- participating companies
- worker groups aggregated by company
- legal/compliance status groups

Radius may represent:
- participation intensity
- number of active days
- first/last activity distance
- unresolved warnings count

### Lifecycle/adoption rose
Center:
- one lifecycle stage or tenant

Radial elements:
- companies in related stages
- activation milestones
- missing onboarding states

---

## 3. What not to do

Do not use this visualization for worker-level surveillance.

Do not show:
- raw worker names in platform-level rose
- raw GPS trails
- raw time events
- payment records per worker
- full staff of other companies

This visualization must remain aggregated and privacy-safe.

---

## 4. Relationship to graph analytics

A radial rose is not the same as full graph/network explorer.

It can be a focused comparison view:
- center one entity
- arrange comparable related entities around it
- show distance/category/distribution

Full graph explorer remains a separate later feature.

---

## 5. Possible future UI patterns

Future BauClock UI may use:
- one detailed radial rose for selected company/site
- small-multiple rose garden for many sites/companies
- hover tooltips
- click-to-center behavior
- filters by company/site/category/region/stage
- switch between rose/table/map modes

---

## 6. Implementation timing

Do not implement now.

This belongs to future visual analytics after:
- core pilot readiness
- legal onboarding launch readiness
- simple dashboard/charts
- production stability

---

## 7. Final canonical rule

Use radial rose visualization as a future pattern for comparing many related entities by distance, intensity, category or lifecycle state.

Keep it privacy-safe, aggregated and separate from the simple daily dashboard.
