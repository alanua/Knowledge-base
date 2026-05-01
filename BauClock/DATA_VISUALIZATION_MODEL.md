# BauClock — Data Visualization Model

## Status

This document fixes the canonical distinction between dashboard analytics, charts/diagrams, maps, and graph-based visualization in BauClock.

Core correction:
- Dashboard is not the same as graph analytics.
- Charts and diagrams are not the same as graph/network visualization.
- Graph visualization is a separate later visualization mode.

Read together with:
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/PLATFORM_GRAPH_ANALYTICS_BACKLOG.md`
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`

---

## 1. Visualization layers

BauClock has multiple visualization layers.

They should not be mixed into one overloaded UI.

Canonical layers:
1. dashboard
2. charts and diagrams
3. maps
4. graph/network visualization
5. tables and filtered lists

---

## 2. Dashboard

Dashboard is the main daily visual surface.

Purpose:
- show current state
- show key counters
- show role-specific actions
- show warnings
- show status of workers/sites/payments/compliance

Dashboard must stay simple, role-filtered and practical.

Dashboard may contain charts and diagrams, but it should not become a full graph explorer.

---

## 3. Charts and diagrams

Charts and diagrams are normal analytical visualizations.

Examples:
- bar charts
- line charts
- pie/donut charts if useful
- stacked bars
- timeline charts
- funnel diagrams
- status diagrams
- compliance completion diagrams
- workload diagrams

Use cases:
- hours by day/week/month
- contract vs overtime split
- active workers over time
- sites by status
- legal onboarding completion
- payment status distribution
- ArbZG warning counts
- QR scan activity

These are suitable for dashboard and admin/compliance views.

---

## 4. Maps

Maps are a location-based visualization mode.

Use cases:
- site/object locations
- active sites by region
- company/site distribution
- address-based filtering
- regional adoption
- map clusters
- site activity heatmap at aggregate level

Map mode may be part of platform analytics or site dashboard.

Privacy rule:
- show site/company/location-level aggregates
- do not show raw worker GPS trails by default

---

## 5. Graph / network visualization

Graph visualization is a separate visualization form.

It is not just a chart.
It represents nodes and edges.

Possible nodes:
- business entities
- sites/objects
- lifecycle stages
- document/onboarding states
- aggregated worker groups
- feature usage groups

Possible edges:
- company owns/controls site
- company participates on site
- company invited another company
- company connected through shared site
- lifecycle progression

Graph visualization is for understanding:
- system spread
- company-to-company relationships
- site participation networks
- lifecycle dynamics
- structure of BauClock as a living platform

This is a later feature and should not block launch readiness.

---

## 6. Difference between diagrams and graph visualization

A diagram simplifies one process or metric.
A graph shows relationships between entities.

Examples:
- adoption funnel = diagram
- company-site-subcontractor network = graph
- hours by week = chart
- object locations = map
- worker list by site = table/list

This distinction must be preserved in implementation and planning.

---

## 7. Recommended near-term dashboard visualizations

Near-term dashboard and compliance views may include:
- counters
- collapsible cards
- simple bar/line charts
- legal completion indicators
- payment status distribution
- site status cards
- ArbZG warning counts
- export status

These are current or near-term product features.

---

## 8. Later graph explorer

The later graph explorer should support:
- dynamic node/edge view
- filters by entity/category/place/address/time
- map-linked mode
- lifecycle mode
- table fallback mode

This belongs to platform analytics, not worker daily flow.

---

## 9. Privacy rule

All visualization layers must respect privacy boundaries.

Allowed by default:
- aggregated counts
- company metadata where needed
- site/object data where permitted
- status categories
- anonymized/aggregated worker groups

Not allowed by default:
- raw personal worker data
- raw GPS trails
- raw payment details per person
- sensitive private notes
- full staff of other companies outside allowed scope

---

## 10. Final canonical rule

Dashboard, charts, diagrams, maps and graph visualization are different tools.

Use the simplest visualization that answers the role's question.

Do not build the future graph explorer into the daily dashboard.
Do not block normal dashboard/charts work because graph analytics is scheduled later.
