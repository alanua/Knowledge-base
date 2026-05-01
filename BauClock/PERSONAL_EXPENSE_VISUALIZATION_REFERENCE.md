# BauClock — Personal Expense Visualization Reference

## Status

This document records a visualization reference for future BauClock financial/payment-support and personal/role-specific money views.

Reference:
- Habr / Data Laboratory: `Визуализация личных расходов`
- URL: https://habr.com/ru/companies/datalaboratory/articles/217179/

This is a conceptual reference, not a current implementation task.

Read together with:
- `BauClock/DATA_VISUALIZATION_MODEL.md`
- `BauClock/VISUALIZATION_ALGORITHM_REFERENCE.md`
- `BauClock/D3_VISUALIZATION_REFERENCE.md`
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`

---

## 1. Why this reference matters

The article is useful because it shows how financial events can be visualized as many small event particles across multiple dimensions:
- time
- category
- weekday
- time of day
- place/location
- tooltip detail
- filtering by category and time

For BauClock, this approach is relevant to payment-support, overtime, worker self-view and owner/accountant summaries.

---

## 2. BauClock equivalent of expense particles

The reference visualizes individual spending transactions.

BauClock equivalents may include:
- payment-support event
- overtime payment event
- contract-hours settlement event
- worker-day earning summary
- monthly adjustment
- disputed payment item
- confirmed payment item
- export-related payment record

These should be treated as financial/workflow particles, not as full payroll truth.

---

## 3. Relevant dimensions for BauClock

Potential visualization dimensions:
- date
- week/month
- worker group or anonymized worker id where appropriate
- site/object
- company
- payment_type: CONTRACT / OVERTIME
- status: pending / confirmed / disputed / paid
- category: hours / overtime / adjustment / export
- role scope: owner / accountant / worker self-view

Do not expose sensitive per-worker financial details outside allowed role scope.

---

## 4. Potential visual forms

Near-term possible charts/diagrams:
- payments by week/month
- overtime paid/unpaid distribution
- contract vs overtime stacked bars
- status distribution chart
- worker self-view timeline of own hours/payments
- owner/accountant aggregate payment status view
- heatmap of payment/adjustment activity by week
- filterable table paired with chart

Later possible views:
- richer interactive D3 financial timeline
- filtered payment-event cloud
- site-based payment heatmap
- company/site financial activity map at aggregate level

---

## 5. Role-specific interpretation

### Worker
Worker may see only own relevant money/time information.

Possible worker view:
- own hours
- own overtime/payment status
- own confirmations/disputes
- own timeline

### Owner
Owner may see company/site aggregate and permitted person-level operational payment support.

### Accountant
Accountant may see finance/support scope granted by company.

### Platform superadmin
Platform superadmin may see only aggregated, privacy-safe financial usage signals unless support-scoped access is justified.

---

## 6. Privacy boundary

Allowed by default:
- aggregated payment status counts
- role-permitted own data
- company/site aggregate data where authorized
- contract vs overtime aggregates
- anonymized trend views

Not allowed by default:
- platform-wide worker-level payments
- private payment comments outside role scope
- raw personal financial history of workers
- sensitive per-person amounts in superadmin analytics

---

## 7. Implementation timing

This reference should not trigger immediate implementation.

Near-term priority remains:
- legal onboarding launch readiness
- simple daily UI
- production reliability
- SEK/internal pilot readiness

Financial visualizations may be added later in owner/accountant/worker views once the core payment-support workflow is stable.

---

## 8. Final canonical rule

Use the personal-expense visualization reference as a pattern for interactive financial-event exploration.

For BauClock, apply it only through role-scoped, privacy-safe views and keep it separate from payroll/legal decision-making.
