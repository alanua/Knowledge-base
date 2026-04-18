# BauClock — Financial & Legal Model v1

## Status

This document fixes the canonical financial and legal model for BauClock and is part of the project knowledge base.

All further architectural, product, database, API, bot-flow, dashboard, export, security and business decisions must be checked against this model.

## Product positioning

BauClock is a B2B SaaS platform for:
- working time tracking
- role-based access
- site attendance tracking
- overtime and payment support
- subcontractor and Gewerbe coordination
- accounting-support exports

## Legal operating model

Default legal model:
- client company = controller
- BauClock = processor

Required document set:
- B2B SaaS contract
- AVV or DPA
- TOMs
- privacy notice
- retention and deletion policy
- liability limitation
- service description

## Scope boundaries

BauClock provides:
- technical recording
- aggregation
- calculation support
- visualization
- export support
- workflow support

BauClock does not replace:
- accountant
- payroll provider
- tax advisor
- legal advisor

Any payroll, DATEV, overtime payment or invoice-related output is a support layer, not an automatic final legal or accounting decision unless separately agreed.

## Commercial model

Core revenue model:
- onboarding fee
- monthly subscription per company
- usage fee per active worker
- add-ons for payroll support, DATEV export, subcontractor module and dedicated bot

Recommended product modules:
- Base
- Payroll Support
- Subcontractor or Gewerbe
- Enterprise or Dedicated Bot

## Canonical development implications

Mandatory development priorities:
- dashboard token security
- audit logging
- role isolation
- retention rules
- DATEV export scope control
- manual correction traceability
- modular separation of time tracking, payroll-support, subcontractor logic and export layer

These are canonical product requirements.

## Technical consequences for architecture

### Dashboard security
Must include:
- tokenized access
- server-side token validation
- TTL control
- role-bound scope
- no open dashboard access
- logging of sensitive access

### Audit trail
System must record:
- who created a worker
- who changed rates or roles
- who changed payment status
- who added adjustments
- who manually corrected time
- who initiated or confirmed payment-related actions

### Raw events vs derived calculations
The model must preserve separation between:
- raw time events
- derived daily or monthly summaries
- payments and adjustments
- manual corrections

Manual edits must not silently overwrite raw events.

### Privacy and geodata minimization
GPS and attendance logic must stay limited to site presence verification and must not evolve into unnecessary background worker tracking.

### Modular product structure
The codebase should keep clear boundaries between:
- time tracking core
- payroll-support logic
- subcontractor or Gewerbe logic
- export layer

## Canonical rule

Any future feature, schema change, API route, dashboard screen, export, payment flow or role expansion must be checked against:
- privacy impact
- auditability
- role isolation
- retention logic
- liability boundaries
- controller and processor model

## Status of fixation

Accepted as a canonical project rule and stored in the Git knowledge base.
