# BauClock — Legacy Documents Analysis

## Purpose

This document captures useful findings from older BauClock/BauZeit/Bautagebuch files that were created near the beginning of the project.

These files are treated as legacy source material, not as current canonical scope. Useful ideas may be reintroduced only if they fit the current BauClock model.

## Source Pack

Reviewed legacy/source materials include:

- `BauClock_Block2_Bautagebuch_AI.docx`
- `BauClock_Product_Description_v2.docx`
- `BauZeit_Product_Description.docx`
- `2021-11-29_SAX27+Dnipro_Bautagebuch_01.pdf`
- `2021-11-29_SAX27+Dnipro_Bautagebuch_02.xlsx`
- `07_Bautagebuch` folder

## High-Value Ideas To Keep

### 1. BauClock as a Baustelle Operating System

The strongest positioning idea is that BauClock is not just a time tracker.

Better product frame:

```text
BauClock = operational layer for a construction site day
```

This does not replace the canonical data core:

```text
company -> site -> person/worker -> time events -> summaries/payments/export
```

But it suggests that the UI, reports, and future daily summaries should be organized around real construction operations:

```text
Baustelle -> Team -> Arbeitstag -> evidence/report
```

### 2. Arbeitstag as a Business Aggregate

The old documents correctly point toward `Arbeitstag` as a useful business-level aggregate.

Do not replace raw `time_events` with `Arbeitstag`.

Instead, use `Arbeitstag` later as a derived layer for:

- dashboard summaries
- daily site views
- Bautagebuch
- exports/reports
- dispute review

### 3. Vorarbeiter/Bauleiter-First UX

The old files correctly focus on the real daily field user: Vorarbeiter/Bauleiter.

In the current model this maps mainly to:

```text
objektmanager / site manager / Bauleiter-like operator
```

Do not restore old role names directly as the canonical model. Use the insight to improve daily workflows.

### 4. Subcontractor Growth Mechanic

The old product logic that one contractor can pull in several subcontractors remains valuable.

This supports the current multi-company model:

```text
general contractor site -> invited subcontractor companies/Gewerbe -> their own workers -> scoped visibility
```

Subcontractor support is not only a feature. It may become a growth channel.

### 5. Real Bautagebuch Template Value

The SAX27 Bautagebuch PDF/XLSX pair is valuable as a realistic example of what a construction diary needs to contain.

Useful future fields:

- company/team presence
- people and hours
- external firms
- work completed
- daily site status
- deliveries and purchases
- new defects
- fixed defects
- open client questions
- instructions
- comments
- photo references/archive

This should inform future `Bautagebuch PDF schema`, not current MVP scope.

### 6. Block 2: Bautagebuch + AI

The legacy Block 2 document has a strong future product direction:

- voice notes
- photos with context
- defect management
- daily tasks
- evening Bautagebuch PDF draft
- human confirmation before final output

Best target user scenario:

```text
Bauleiter walks the site -> speaks/photos issues -> AI structures the notes -> evening draft Bautagebuch -> human confirms -> PDF generated
```

This is valuable, but belongs after stable Block 1.

## Deprecated Or Not Current Scope

### 1. BauZeit Name

Do not revive `BauZeit` as the product name.

Canonical product name is:

```text
BauClock
```

Legacy BauZeit files are idea sources only.

### 2. Full PWA Pivot

The old materials contain a stronger PWA/SMS-OTP direction.

Current canonical direction remains:

```text
Telegram-first bot/Mini App + dashboard, with future web/PWA optionality
```

Do not pivot the product now.

### 3. Old Role Model

Do not directly restore old roles such as `OBJECT_ADMIN` or `VORARBEITER` as canonical roles.

Use the insight, not the old role system.

Current role/membership model remains authoritative.

### 4. Legal Overclaiming

Avoid wording such as:

```text
legally binding / court-proof / has legal force
```

Safer framing:

```text
audit-ready construction documentation
structured evidence support
exportable site diary
useful for disputes, insurance, client communication, and internal accountability
```

### 5. Old AI Cost/Model Assumptions

Any old references to Whisper, GPT-4 Vision, GPT-4, or cost calculations are historical only.

Before pricing or implementation, recompute using current providers, models, and data-protection constraints.

### 6. Minijob / SiGe / Materials / Warehouse

These ideas may be useful later, but they are not current MVP scope.

Keep as future backlog only.

## Canonical Decision

Keep:

- BauClock as broader Baustelle operational layer
- Arbeitstag as future derived business aggregate
- Vorarbeiter/Bauleiter-first UX insight
- subcontractor growth mechanic
- Block 2 Bautagebuch + AI as future module
- SAX27 Bautagebuch as real template reference
- GDPR/DPA/EU-hosting/security framing

Do not reintroduce now:

- BauZeit name
- full PWA pivot
- SMS OTP as main auth
- old role model directly
- Block 2 AI into current MVP
- strong legal-force claims
- SiGe/materials/minijob as early scope

## Current Action

Treat the legacy documents as:

```text
raw source material -> extracted useful concepts -> future backlog / canonical docs
```

Do not treat them as current product specification.
