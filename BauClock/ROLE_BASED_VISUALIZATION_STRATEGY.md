# BauClock — Role-Based Visualization Strategy

## Status

This document fixes the canonical role-based visualization strategy for BauClock.

Purpose:
- define which data categories are visualized for each role
- prevent privacy leaks
- keep daily UX simple
- separate dashboard/charts/maps from later graph/network explorer
- apply Data Laboratory visualization principles to BauClock

Read together with:
- `BauClock/DATA_VISUALIZATION_MODEL.md`
- `BauClock/VISUALIZATION_ALGORITHM_REFERENCE.md`
- `BauClock/D3_VISUALIZATION_REFERENCE.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md`
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`

---

## 1. Core rule

One relation-driven data model.
Different role-specific visual slices.

Canonical principle:
- each role sees only its authorized sample / slice
- same underlying data reality
- different visualization layer per role
- no role sees data outside legal/privacy scope

---

## 2. Visualization design algorithm

Before building any visualization, define:
1. data reality
2. elementary data brick
3. visual atom
4. grouping/sorting logic
5. interaction controls
6. privacy boundary
7. role-specific purpose

Do not pick a chart first.
Pick the data brick first.

---

## 3. Platform superadmin / owner of the system

### 3.1 Purpose
The platform superadmin sees system life, growth, spread and health.
Not personal worker data.

### 3.2 Main data categories
- tenant/company lifecycle
- adoption funnel
- company-site relation network
- platform spread through companies/sites
- system health
- aggregate usage
- legal onboarding completion at aggregate/company level

### 3.3 Allowed data bricks
- company lifecycle transition
- company invite event
- company-site relation
- site activation event
- first QR scan milestone
- aggregate worker count
- aggregate QR scan count
- aggregate error/job event
- legal completion state

### 3.4 Recommended visualizations

#### Platform Intelligence Dashboard
Near-term:
- KPI cards
- lifecycle funnel
- activation timeline
- active companies/sites trend
- legal completion bar/progress chart
- system health cards

Later:
- dynamic graph/network explorer
- map-linked spread view
- lifecycle Sankey/flow
- company relation rose / radial comparison

### 3.5 Privacy boundary
Allowed:
- company metadata
- site metadata where permitted
- counts, percentages, lifecycle stages
- company-to-company/site relations
- anonymized/grouped worker counts

Not allowed by default:
- worker names
- raw GPS
- raw time events
- personal payment details
- sensitive comments
- full staff of another company

Sensitive drill-down requires support/break-glass rule and audit.

---

## 4. Company owner

### 4.1 Purpose
The company owner manages own company, own sites/objects, own people and participating companies on owned/controlled sites.

### 4.2 Main data categories
- today status
- sites/objects
- own workers
- participating subcontractors on own sites
- site-specific history
- hours and contract/overtime split
- payment/support status
- legal/compliance state
- export readiness

### 4.3 Allowed data bricks
- worker-day for own workers
- site-day
- time summary
- payment-support event
- manual correction
- ArbZG finding
- legal acknowledgement status
- company-site relation
- participating-company assignment on own site

### 4.4 Recommended visualizations

#### Today dashboard
- status cards
- collapsible blocks
- current presence list
- unclosed day warning cards

#### Site dashboard
- site cards
- map markers for own sites
- table/list of people currently connected to site
- grouped by source company
- historical attendance list for that site

#### Hours view
- stacked bars: CONTRACT vs OVERTIME
- worker-day heatmap
- week/month trend line
- correction markers

#### Payments view
- payment status cards
- paid/unpaid/disputed distribution
- table with filters
- CONTRACT vs OVERTIME split

#### Compliance view
- legal completion progress
- missing notice checklist
- ArbZG warning counts
- audit/correction indicators

### 4.5 Privacy boundary
Owner sees:
- own company data
- own workers
- people from other companies only when connected to owner-controlled site
- history only for owner-controlled site context

Owner does not see:
- full staff of subcontractor company
- unrelated subcontractor sites
- unrelated worker history from other sites

---

## 5. Worker

### 5.1 Purpose
Worker sees own current status, own hours, own payment/support state and required actions.

### 5.2 Main data categories
- today status
- own daily/weekly/monthly hours
- own payment confirmations/disputes
- own legal notices
- own corrections/dispute-relevant status where applicable

### 5.3 Allowed data bricks
- own time event summary
- own worker-day
- own payment-support event
- own legal acknowledgement state
- own dispute/confirmation action

### 5.4 Recommended visualizations

#### Worker Mini Dashboard
- today card
- simple weekly bars
- monthly summary card
- payment status chips
- direct action buttons

Do not show:
- company graph
- site map except own assigned/checked-in context where needed
- other workers
- compliance internals
- audit logs
- export/DATEV details

### 5.5 Privacy boundary
Worker sees only self-scope.

---

## 6. Objektmanager

### 6.1 Purpose
Objektmanager operates assigned site(s), not the whole company.

### 6.2 Main data categories
- assigned sites
- current presence on assigned sites
- site-day status
- unclosed days
- operational warnings
- delegated corrections if permitted
- subcontractor participation only on assigned sites

### 6.3 Allowed data bricks
- site-day
- assigned-site worker-day
- current presence state
- issue/warning event
- site-scoped correction event

### 6.4 Recommended visualizations
- assigned-site dashboard
- people-on-site grouped list
- site-day heatmap
- issue cards
- simple map of assigned sites

### 6.5 Privacy boundary
Objektmanager sees assigned site scope only.
No full company visibility by default.
No finance escalation unless explicitly granted.

---

## 7. Accountant

### 7.1 Purpose
Accountant sees finance/export/support scope, not broad people/site management.

### 7.2 Main data categories
- CONTRACT hours/summaries
- OVERTIME support data if granted
- payment status
- adjustments
- export readiness
- DATEV/export boundary
- legal/compliance completion if read-only granted

### 7.3 Allowed data bricks
- payment-support event
- monthly summary
- adjustment event
- export event
- contract/overtime split summary

### 7.4 Recommended visualizations
- finance table with filters
- status distribution charts
- CONTRACT vs OVERTIME stacked bars
- export readiness checklist
- adjustment timeline

### 7.5 Privacy boundary
No role management.
No unnecessary raw GPS.
No full worker operational details beyond finance-support scope.

---

## 8. Category-to-visualization matrix

| Data category | Data brick | Superadmin | Owner | Worker | Objektmanager | Accountant |
|---|---|---|---|---|---|---|
| Company lifecycle | lifecycle transition | funnel/timeline | own company status | no | no | no/read-only if needed |
| Site/object status | site-day / site state | aggregate/map | cards/map/table | own site only if needed | assigned-site cards/map | no unless finance scope |
| Current presence | presence state | aggregate count | site grouped list | own status | assigned-site list | no |
| Hours | worker-day summary | aggregate trend only | bars/heatmap/table | own bars/cards | assigned-site heatmap | finance summary |
| CONTRACT/OVERTIME | summary split | aggregate usage only | stacked bars | own summary | optional operational summary | export/payment charts |
| Payments | payment-support event | aggregate usage only | status cards/table/charts | own chips/list | only if delegated | finance table/charts |
| Legal onboarding | acknowledgement/completion state | aggregate/company status | progress/checklist | own notices only | no or site issue count | read-only if granted |
| ArbZG | finding | aggregate count | warning cards/table | own warning if relevant | assigned-site warnings | read-only if granted |
| Company relations | company-site relation | network/map later | own site relations | no | assigned-site relations | no |
| System health | job/error event | health dashboard | no | no | no | no |

---

## 9. Near-term vs later

### Near-term
- dashboard cards
- collapsible blocks
- simple bars/lines
- heatmaps
- checklists
- filtered tables
- simple maps
- funnels

### Later
- dynamic graph explorer
- radial rose views
- map-linked graph mode
- lifecycle Sankey/flow
- advanced D3 visual analytics

---

## 10. Final canonical rule

Use visualizations to simplify perception, not to expose more data.

Every visualization must answer:
- whose role is this for?
- what is the data brick?
- what is the privacy scope?
- what visual form makes the pattern visible fastest?

If the visualization does not make work simpler for the role, do not add it to the main flow.
