# BauClock — Owner and Worker Visualization Design

## Status

This document fixes the practical visualization model for the worker and company owner roles in BauClock.

Purpose:
- convert allowed role-specific data slices into human-readable graphical forms
- apply the Data Laboratory visualization method to BauClock
- keep worker UX simple
- give company owner clear operational control
- preserve privacy and role boundaries

Read together with:
- `BauClock/ROLE_BASED_VISUALIZATION_STRATEGY.md`
- `BauClock/DATA_VISUALIZATION_MODEL.md`
- `BauClock/VISUALIZATION_ALGORITHM_REFERENCE.md`
- `BauClock/DATA_LABORATORY_VISUAL_ANALYTICS_REFERENCE.md`
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`

---

## 1. Core rule

Visualization is another form of representing the same relation-driven data reality.

It must make data easier for humans to understand.
It must not expand access rights.

Canonical rule:
- one database
- one relation-driven model
- role-specific visual slices
- privacy boundaries preserved

---

## 2. Data Laboratory method applied to BauClock

Before choosing a visualization, define:
1. role
2. purpose
3. allowed data slice
4. elementary data brick
5. visual atom
6. interaction / sorting / grouping
7. privacy boundary

Do not start from “which chart should we draw”.
Start from “which work reality must become visible”.

---

# Part A — Worker Visualization

## 3. Worker purpose

The worker does not need an analytical company dashboard.

The worker needs a simple personal graphical self-control view:
- am I checked in?
- how much did I work today?
- how much break time?
- what did I work this week/month?
- what payment/support item needs my action?
- do I need to acknowledge anything?

Worker scope is self-only.

---

## 4. Worker visual modules

### 4.1 Today Card

Purpose:
- main worker screen
- immediate status and next action

Data brick:
- current worker-day
- current presence state

Visual atom:
- large status card
- one main action button

Shows:
- not started / working / on pause / checked out
- worked today
- break time
- current site/object
- next action: check-in / pause / resume / checkout

Example shape:

```text
[ 🟢 Working ]
Today: 4h 35m
Break: 20m
Site: Baustelle X

[ Start pause ]
```

This is the primary worker visualization.

---

### 4.2 Workday Timeline

Purpose:
- show the day as a natural time line instead of raw events

Data brick:
- check-in / pause-start / pause-end / checkout events

Visual atom:
- horizontal timeline segment

Example:

```text
08:02 ━━━ work ━━━ 12:10 ░ pause ░ 12:40 ━━━ work ━━━ now
```

Markers:
- work segment
- pause segment
- checkout
- unclosed day marker
- manual correction marker, if relevant

This is easier to understand than a technical event list.

---

### 4.3 Weekly Bars

Purpose:
- quick overview of own work week

Data brick:
- worker-day summary

Visual atom:
- simple vertical or horizontal bars by day

Example:

```text
Mon ███████ 8.0h
Tue ██████  7.2h
Wed ███████ 8.4h
Thu ████    5.0h
Fri █████   6.5h
```

Keep this simple.
Do not turn it into company analytics.

---

### 4.4 Month Mini Calendar / Heatmap

Purpose:
- show own month pattern at a glance

Data brick:
- worker-day summary

Visual atom:
- calendar cell / heatmap cell

Example:

```text
Mon Tue Wed Thu Fri Sat Sun
🟩  🟩  🟩  🟨  🟩  ⬜  ⬜
🟩  🟩  🔴  🟩  🟩  ⬜  ⬜
```

Meaning:
- green: normal day
- yellow: incomplete / attention needed
- red: unclosed / issue / dispute
- blank: no work

---

### 4.5 Own Payment Status

Purpose:
- show own payment/support items and required action

Data brick:
- own payment-support event

Visual atom:
- status chip
- compact action card

Example:

```text
Overtime · 01–07.05
28h × €18 = €504
Status: pending confirmation

[ Confirm ] [ Dispute ]
```

Worker sees only own payment/support state.
No company finances.
No DATEV details.

---

### 4.6 Contract / Overtime Split

Purpose:
- show own split only when relevant

Data brick:
- own summary split

Visual atom:
- simple stacked bar

Example:

```text
Week
Contract    ████████ 32h
Overtime    ███      6h
```

Do not show if the worker model does not use CONTRACT/OVERTIME.

---

### 4.7 Notice / Action Checklist

Purpose:
- show required worker acknowledgements without clutter

Data brick:
- own legal acknowledgement state

Visual atom:
- small checklist

Example:

```text
✅ Privacy notice acknowledged
✅ Time tracking notice acknowledged
✅ GPS site presence notice acknowledged
```

After completion, move this into profile/documents.
Do not keep it as a permanent large dashboard block.

---

### 4.8 Minimal Site Context

Purpose:
- show where the worker is checked in / assigned

Data brick:
- current site assignment / check-in site

Visual atom:
- site chip

Example:

```text
📍 Site: Musterstraße 12
QR: valid
```

Do not show full map or raw GPS trails by default.

---

## 5. Worker final structure

Canonical worker view:

```text
Worker Mini View
  ├── Today Card
  ├── Workday Timeline
  ├── Weekly Bars
  ├── Month Mini Calendar
  ├── Payment Status
  ├── Direct Actions
  └── Notices / Profile documents
```

Worker view must remain small, mobile-first and action-oriented.

---

# Part B — Company Owner Visualization

## 6. Company owner purpose

The company owner needs an operational graphical control panel for the company.

The owner sees:
- own company
- own sites/objects
- own people
- participating subcontractors on owned/controlled sites
- people from those subcontractors only when connected to those sites
- site-specific history
- hours
- payments
- compliance
- export readiness

The owner does not see unrelated staff or unrelated history of other companies.

---

## 7. Owner visual modules

### 7.1 Owner Today Dashboard

Purpose:
- show current operational state quickly

Data brick:
- site-day
- current presence state
- warning state

Visual atom:
- status cards
- warning cards
- collapsible blocks

Shows:
- active sites
- people currently on sites
- unclosed days
- people on pause
- ArbZG warnings
- payment confirmations pending

Example:

```text
Today
├── Active sites: 3
├── People on sites: 14
├── Unclosed days: 2
├── On pause: 3
├── ArbZG warnings: 1
└── Payments pending: 4
```

---

### 7.2 Site Cards / Object Cards

Purpose:
- make every owned/controlled site visible as an operational unit

Data brick:
- site/object state

Visual atom:
- site card

Shows:
- site name
- address
- active/dormant state
- people currently present
- own workers count
- participating company count
- warnings
- last activity

Example:

```text
Baustelle Musterstraße 12
Status: active
Own workers: 5
Subcontractors: 2 companies
People now: 8
Issues: 1 unclosed day
```

---

### 7.3 People-on-Site Grouped View

Purpose:
- show who is working on a site and from which company

Data brick:
- company-site-worker relation
- current presence state

Visual atom:
- grouped list / grouped table

Example:

```text
Baustelle Musterstraße 12

Own company
├── Ivan — working
├── Petro — on pause
└── Max — unclosed day

Subcontractor A
├── Worker A1 — working
└── Worker A2 — checked out

Subcontractor B
└── Worker B1 — working
```

Rules:
- group by source company
- show only people connected to this site
- do not show full staff of subcontractor
- preserve site-specific history

---

### 7.4 Hours Visualization

Purpose:
- make working-time patterns visible

Data brick:
- worker-day summary
- site-day summary

Visual atoms:
- stacked bars
- heatmap cells
- trend line

Views:

#### CONTRACT vs OVERTIME stacked bars

```text
Week
Contract    ████████████ 160h
Overtime    ████          42h
```

#### Worker-day heatmap

```text
        Mon Tue Wed Thu Fri
Ivan    🟩  🟩  🟩  🟨  🟩
Petro   🟩  🔴  🟩  🟩  🟩
Max     🟨  🟩  🟩  🟩  🔴
```

Meaning:
- green: normal
- yellow: attention
- red: unclosed / dispute / correction needed

---

### 7.5 Payments Visualization

Purpose:
- show payment/support status and needed actions

Data brick:
- payment-support event
- summary split

Visual atoms:
- status cards
- distribution chart
- filtered table

Shows:
- pending
- confirmed
- disputed
- paid
- unpaid
- CONTRACT
- OVERTIME

Example:

```text
Payments
├── Pending: 4
├── Confirmed: 12
├── Disputed: 1
├── Paid: 9
└── Unpaid: 7
```

Important:
- CONTRACT and OVERTIME remain separated
- DATEV/export boundary remains visible but not overcomplicated

---

### 7.6 Site Map

Purpose:
- show company objects geographically

Data brick:
- site/object location and state

Visual atom:
- map marker / cluster

Shows:
- owned/controlled sites
- active/dormant/problem state
- people currently present as count
- participating companies as count
- warnings

Do not show raw worker GPS trails by default.

---

### 7.7 Compliance / Legal Visualization

Purpose:
- show what needs attention without showing legal noise everywhere

Data brick:
- legal completion state
- acknowledgement state
- ArbZG finding
- audit/correction indicator

Visual atoms:
- progress bar
- checklist
- warning card

Example:

```text
Compliance
├── Company legal docs: 3/3 complete
├── Worker notices: 12/14 complete
├── GPS notices missing: 2
├── ArbZG warnings this week: 1
└── Manual corrections: 3
```

Legal text itself stays in legal/documents section.
Daily dashboard shows only completion and required actions.

---

### 7.8 Object Relationship Mini-Graph

Purpose:
- show the relationship structure of one object without opening the full future graph explorer

Data brick:
- company-site relation

Visual atom:
- simple node-link mini diagram

Example:

```text
SEK GmbH
  └── owns Site X
        ├── Own workers: 5
        ├── Subcontractor A: 2 people connected
        └── Subcontractor B: 1 person connected
```

Rules:
- this is site-specific
- not a global company graph
- no full staff exposure
- use for comprehension, not surveillance

---

### 7.9 Site History Timeline

Purpose:
- show site-specific past activity

Data brick:
- site-day
- attendance/work evidence grouped by day

Visual atom:
- timeline / table hybrid

Shows:
- which companies worked on the site
- which people were connected to the site
- daily status
- corrections / flags
- warnings

Only for owned/controlled site context.

---

## 8. Owner final structure

Canonical owner dashboard:

```text
Company Owner Dashboard
  ├── Today status
  ├── Sites / Objects
  ├── People on site
  ├── Hours
  ├── Payments
  ├── Compliance
  ├── Export
  ├── Map
  ├── Object relationship mini-graph
  └── Site history timeline
```

All major blocks should be collapsible.

---

## 9. Owner visualization matrix

| Category | Data brick | Visual form |
|---|---|---|
| Today state | presence state / site-day | status cards |
| Objects | site state | site cards + map |
| People on site | company-site-worker relation | grouped list/table |
| Hours | worker-day summary | bars + heatmap |
| CONTRACT/OVERTIME | summary split | stacked bars |
| Payments | payment-support event | cards + table + chart |
| Compliance | completion/finding | checklist + warnings |
| Subcontractors | company-site relation | object mini-graph |
| Site history | site-day timeline | timeline/table |

---

## 10. Final rule

Worker visualization is a personal self-control panel.
Owner visualization is an operational company control panel.

Both are graphical forms of allowed data slices.
Neither expands access rights.

Use the simplest visual form that makes the work reality visible fastest.
