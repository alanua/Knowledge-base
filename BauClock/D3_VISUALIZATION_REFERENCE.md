# BauClock — D3 Visualization Reference

## Status

This document records D3.js as a future technical reference for BauClock dashboard/charts/maps/graph visualization work.

Reference:
- Habr / Data Laboratory: `Введение в D3`
- Original article: https://habr.com/ru/companies/datalaboratory/articles/217905/

This is a reference for later implementation, not a current launch-readiness task.

Read together with:
- `BauClock/DATA_VISUALIZATION_MODEL.md`
- `BauClock/VISUALIZATION_ALGORITHM_REFERENCE.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/PLATFORM_GRAPH_ANALYTICS_BACKLOG.md`

---

## 1. Why D3 matters for BauClock

D3 is relevant for BauClock because it supports data-driven visual interfaces through HTML, SVG and CSS.

This matches future BauClock needs for:
- dashboard charts
- lifecycle diagrams
- adoption funnels
- timeline visualizations
- heatmaps
- relation/network views
- custom map overlays where appropriate

D3 should be considered a low-level visualization tool, not a full dashboard product.

---

## 2. Relevant D3 ideas

Key ideas useful for BauClock:
- data binding to DOM/SVG elements
- selections
- enter/update/exit lifecycle
- SVG-based visual elements
- transitions/animations
- computed attributes based on data
- custom visual grammars rather than only ready-made charts

These concepts are especially useful for future graph/network and lifecycle visualization.

---

## 3. Where D3 fits in BauClock

D3 may be appropriate for:
- custom SVG charts
- lifecycle/funnel diagrams
- timeline and heatmap views
- relation graphs
- spread/network visualization
- map overlays combined with a map library later

D3 is probably not needed for:
- simple KPI cards
- simple tables
- basic dashboard counters
- standard charts if a simpler charting library already covers them

---

## 4. Dashboard vs graph explorer

Near-term dashboard should stay simple.

Use D3 only where it adds clear value.
Do not introduce D3 just to replace simple HTML/CSS/cards.

Future graph explorer may use D3 or a graph-specific library, depending on implementation constraints.

---

## 5. Privacy boundary

Any D3 visualization must follow BauClock privacy rules.

Allowed by default:
- aggregated counts
- company/site-level metadata where permitted
- lifecycle stages
- anonymized/grouped worker data
- relation edges between business entities and sites

Not allowed by default:
- worker names in platform-level graph
- raw GPS trails
- raw time events
- worker-level payment records
- sensitive comments
- full staff of other companies outside allowed scope

---

## 6. Implementation timing

D3 is not required for immediate launch.

Recommended timing:
1. build simple dashboard cards/tables/charts first
2. add lightweight charting where useful
3. use D3 only for custom visualizations that simple chart libraries cannot express cleanly
4. implement full graph/map explorer later

---

## 7. Final canonical rule

D3 is a valid future BauClock visualization tool, especially for custom SVG, lifecycle, timeline, map-overlay and graph/network views.

It should not be introduced prematurely into worker daily UX or simple dashboard features.
