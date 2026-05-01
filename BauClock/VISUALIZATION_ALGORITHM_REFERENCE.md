# BauClock — Visualization Algorithm Reference

## Status

This document records a design reference for future BauClock data visualization work.

Reference:
- Habr / Data Laboratory: `Алгоритм визуализации сложных данных`
- URL: https://habr.com/ru/companies/datalaboratory/articles/311210/

This is a conceptual reference, not an immediate implementation task.

Read together with:
- `BauClock/DATA_VISUALIZATION_MODEL.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/PLATFORM_GRAPH_ANALYTICS_BACKLOG.md`
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`

---

## 1. Why this reference matters

The article is useful because it describes visualization as a structured design process, not as random chart selection.

Key ideas relevant to BauClock:
- move from tables/slices to the real-world data reality
- identify elementary data particles
- map data particles to visual atoms
- separate data mass from visual framework
- choose axes and frames based on the meaning of data
- add interface controls for filtering, searching and changing frames

These ideas match BauClock's relation-driven model.

---

## 2. BauClock data reality

BauClock data reality is not just SQL tables.

It is a living work system:
- business entities
- people
- sites/objects
- company-site relations
- check-in/check-out events
- legal onboarding states
- payments/export states
- contractor/subcontractor participation
- lifecycle stages
- platform spread through real construction relationships

Visualization should start from this reality, not from whatever table happens to be easiest to chart.

---

## 3. BauClock elementary data particles

Candidate data particles for BauClock:

### Operational particles
- time event
- worker-day
- site-day
- check-in/check-out cycle
- payment-support event
- manual correction
- ArbZG finding

### Relationship particles
- company-site participation
- company-company invitation
- worker-site assignment
- legal acknowledgement event
- document acceptance event

### Lifecycle particles
- tenant lifecycle transition
- site activation transition
- worker onboarding transition
- first QR scan
- first active workday

Different visualizations may use different particles.
Do not force one particle type into every view.

---

## 4. Visual atoms for BauClock

Possible visual atoms:
- dot: company/site/event point
- line: relation, invitation, lifecycle movement
- bar: hours/payment/status count
- cell: day/status heatmap
- card: dashboard object summary
- node: graph/network entity
- edge: relation between entities
- map marker: site/company address
- cluster: regional aggregate
- timeline segment: lifecycle or work interval

The visual atom should match the meaning of the data particle.

---

## 5. Data mass and framework

For BauClock:

### Data mass
The flexible mass of data may be:
- all time events in a period
- all active sites
- all companies in lifecycle states
- all company-site relations
- all legal onboarding states
- all worker-day summaries

### Framework / каркас
The framework may be:
- time axis
- map/geographic space
- company-site network
- lifecycle funnel
- table/filter grid
- day/week heatmap
- role-based dashboard cards

The same data mass may be placed on different frameworks.

Example:
- worker-day summaries on timeline => workload chart
- worker-day summaries on site grid => site activity heatmap
- worker-day summaries on company filter table => compliance/admin list

---

## 6. Axes and frames

Preferred BauClock frame types:

### Time frame
For:
- hours
- attendance
- lifecycle transitions
- payments
- compliance warnings

### Space/map frame
For:
- sites/objects
- addresses
- regional activity
- geographic adoption

### Network frame
For:
- company-to-company spread
- site participation
- contractor/subcontractor relations

### Funnel frame
For:
- invite -> registration -> legal onboarding -> first site -> first worker -> first QR scan

### Grid/heatmap frame
For:
- days vs workers
- sites vs dates
- status completion by entity

---

## 7. Interface controls

Future visualization UI should support controls for:
- entity type
- category
- company
- site/object
- address/location
- city/region/country
- lifecycle stage
- legal/compliance status
- time range
- role/scope

Controls should not expose data outside privacy boundaries.

---

## 8. Privacy boundary

This reference must not override privacy rules.

Allowed by default:
- aggregated counts
- company/site metadata where permitted
- lifecycle states
- relation edges at business-entity/site level
- anonymized or grouped worker data

Not allowed by default:
- worker names in platform graph
- raw GPS traces
- raw time events in superadmin analytics
- payment details per worker
- private comments
- full staff of another company

---

## 9. Implementation timing

This is a later visualization design reference.

Do not implement the full graph/map analytics UI now unless explicitly scheduled.

Near-term product work may still use this reference for:
- dashboard charts
- compliance indicators
- simple funnels
- maps
- filtered tables

Full dynamic graph explorer remains backlog.

---

## 10. Final canonical rule

For BauClock visualizations, first define:
1. data reality
2. elementary data particles
3. visual atoms
4. framework / axes
5. controls
6. privacy boundary

Only then choose chart, map, table, dashboard card or graph visualization.
