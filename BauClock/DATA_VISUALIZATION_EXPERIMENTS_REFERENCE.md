# BauClock — Data Visualization Experiments Reference

## Status

This document records a visualization reference for future BauClock dashboard, chart, map and visual analytics work.

Reference:
- Habr / Data Laboratory: `5 экспериментов по визуализации данных`
- URL: https://habr.com/ru/companies/datalaboratory/articles/260161/

This is a conceptual reference and pattern library for later visualization work, not a current implementation task.

Read together with:
- `BauClock/DATA_VISUALIZATION_MODEL.md`
- `BauClock/VISUALIZATION_ALGORITHM_REFERENCE.md`
- `BauClock/D3_VISUALIZATION_REFERENCE.md`
- `BauClock/PERSONAL_EXPENSE_VISUALIZATION_REFERENCE.md`
- `BauClock/RADIAL_ROSE_VISUALIZATION_REFERENCE.md`

---

## 1. Why this reference matters

The article is useful because it shows several different visualization experiments built from the same core principle:
- identify the elementary data unit / brick
- make this brick visually comparable
- make bricks additive into a macro-picture
- add interaction, filtering, tooltips and sliders

This matches BauClock's relation-driven data model and future visualization needs.

---

## 2. Core principle for BauClock

Before choosing a chart type, define:
- what is the elementary BauClock data brick?
- which attributes must be visible?
- how do bricks group, sort, compare and accumulate?
- which dimensions need controls?
- what must remain hidden for privacy?

This prevents random chart selection and keeps visualizations meaningful.

---

## 3. Relevant patterns from the reference

### 3.1 Comparable entity scatter / feature comparison
Article example:
- tanks compared by characteristics on axes and visual encodings.

BauClock analogue:
- compare sites by activity, workers, warnings, first QR, legal completion, payment/export status.

Possible views:
- site health scatter
- company activation scatter
- object workload comparison

### 3.2 Grid / heatmap of correctness or status
Article example:
- traffic rules training questions grouped into a grid with error rates.

BauClock analogue:
- worker-day status grid
- site-day compliance grid
- legal onboarding completion grid
- ArbZG warning grid

Possible views:
- days x workers
- sites x days
- companies x lifecycle stages
- notices x workers

### 3.3 Time + map support
Article example:
- weather records with yearly profile and micro-map.

BauClock analogue:
- site activity over time with map context
- active sites by region
- regional adoption/lifecycle view

Possible views:
- site timeline plus map marker
- company distribution by city/region
- object activation timeline

### 3.4 Route/segment violation visualization
Article example:
- minibus delays/speed violations across route segments with time slider.

BauClock analogue:
- workday flow visualization: check-in -> pause -> resume -> checkout
- ArbZG warning segments across a workday
- unclosed day / late checkout / missed pause timeline

Possible views:
- worker-day timeline for authorized roles
- site-day timeline aggregate
- warnings over workday segments

### 3.5 Dense trend comparison
Article example:
- ticket price trends by purchase/departure date with slider.

BauClock analogue:
- overtime/payments over time
- legal completion trends
- company activation trends
- site activity trend comparisons

Possible views:
- multiple company/site activation curves
- payment status trend by period
- contract/overtime split over time

---

## 4. BauClock visualization bricks

Candidate bricks:
- worker-day
- site-day
- company lifecycle transition
- QR scan
- legal acknowledgement event
- payment-support event
- ArbZG finding
- company-site relation
- invite event
- export event

Different visualizations should choose different bricks.
Do not force all views to use raw time events.

---

## 5. Interaction controls

Future BauClock visualizations should support:
- filters
- hover tooltips
- time sliders
- dropdowns for entities/categories
- grouping switches
- map-linked hover/click
- table fallback for exact inspection

Controls must respect role and privacy boundaries.

---

## 6. Near-term applicability

This reference can inform near-term dashboard/charts work:
- legal onboarding completion diagrams
- worker/site status grids
- ArbZG warning heatmaps
- contract vs overtime charts
- company/site activation funnels

It does not require immediate full D3 implementation.

---

## 7. Later applicability

The same principles can later support:
- dynamic graph explorer
- map-linked visual analytics
- lifecycle spread visualization
- company-site network exploration
- platform intelligence views

---

## 8. Privacy boundary

Allowed by default:
- aggregated status bricks
- company/site metadata where permitted
- role-scoped worker-day summaries
- anonymized/grouped worker data
- lifecycle and activation states

Not allowed by default:
- raw worker data in platform views
- raw GPS trails
- raw payment details per person outside role scope
- full staff of other companies
- sensitive comments

---

## 9. Final canonical rule

Use this reference as a pattern library for choosing the right visualization structure.

For each BauClock visualization, define the data brick, visual encoding, grouping, interaction controls and privacy boundary before implementation.
