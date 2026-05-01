# BauClock — Data Laboratory Visual Analytics Reference

## Status

This document records Data Laboratory as an umbrella visual analytics reference for future BauClock dashboard, chart, map, and graph/network visualization work.

Reference:
- Data Laboratory / Лаборатория данных
- URL: https://datalaboratory.ru/

This is a design and technical inspiration source, not an immediate implementation task.

Read together with:
- `BauClock/DATA_VISUALIZATION_MODEL.md`
- `BauClock/VISUALIZATION_ALGORITHM_REFERENCE.md`
- `BauClock/D3_VISUALIZATION_REFERENCE.md`
- `BauClock/DATA_VISUALIZATION_EXPERIMENTS_REFERENCE.md`
- `BauClock/ROLE_BASED_VISUALIZATION_STRATEGY.md`
- `BauClock/PLATFORM_GRAPH_ANALYTICS_BACKLOG.md`

---

## 1. Why Data Laboratory matters

Data Laboratory is relevant because it specializes in interactive data visualizations and analytical tools, especially custom D3.js visualizations, dashboards, maps, funnels, timelines, and complex exploratory interfaces.

For BauClock, this validates the direction that data should not only be shown as tables, but also as visual forms that help humans understand structure, flow, dynamics and anomalies faster.

---

## 2. Relevant reference categories

Data Laboratory examples relevant to BauClock include:
- interactive dashboards
- analytical tools
- maps
- funnels
- financial/expense visualizations
- route/time visualizations
- radial/rose views
- reports with embedded visualizations
- custom D3-based visual interfaces

---

## 3. BauClock interpretation

BauClock should treat visualization as a separate product layer over the relation-driven data model.

The same data reality may be represented as:
- dashboard cards
- bar/line charts
- heatmaps
- maps
- funnels
- timelines
- tables/filters
- later graph/network explorer
- later radial/rose or custom D3 views

Visualization is not a replacement for access control.
Visualization is a role-specific representation of the allowed data slice.

---

## 4. Core design method for BauClock

Before implementing any visualization, define:
1. role and purpose
2. allowed data slice
3. data brick / elementary particle
4. visual atom
5. axis/framework
6. filters/interactions
7. privacy boundary
8. fallback table/list view

Only then choose chart/map/graph/D3 implementation.

---

## 5. Role-specific BauClock application

### Platform superadmin
May see:
- system lifecycle
- adoption funnel
- company/site spread
- platform map
- system health
- aggregate usage

Must not see by default:
- worker personal details
- raw GPS
- raw time events
- worker-level payment details

### Company owner
May see:
- own company
- own sites/objects
- own workers
- participating subcontractors on owned/controlled sites
- connected people from those companies only through the site context
- own company payments/compliance/export

### Worker
May see:
- own status
- own hours
- own payments/support events
- own notices/actions

### Objektmanager
May see:
- assigned sites
- current presence and issues on assigned sites
- site-scoped workers/participating companies where authorized

### Accountant
May see:
- finance/export/support scope
- payment status
- contract/overtime summaries
- adjustment/export readiness

---

## 6. Implementation timing

Do not use this reference to delay current launch readiness.

Near-term:
- simple dashboard cards
- charts/diagrams
- maps where useful
- role-specific visual slices
- table fallback

Later:
- dynamic graph/network explorer
- map-linked relation analytics
- radial/rose comparison views
- advanced D3 custom visualizations

---

## 7. Final canonical rule

Data Laboratory is a reference for how BauClock should think about data visualization:
visualization is a human-friendly analytical layer over structured data, not decorative charts.

For BauClock, every visualization must simplify perception of the allowed role-specific data slice without expanding access rights.
