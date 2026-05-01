# BauClock — Platform Analytics Privacy Model

## Status

This document fixes the canonical model for privacy-safe platform analytics and graphs visible to the platform superadmin.

Core rule:
The platform owner/superadmin may see graphs and aggregated analytics about the life stages, adoption, health and spread of the system, but not unnecessary personal or customer-sensitive details.

Read together with:
- `BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md`
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`

---

## 1. Purpose

Platform analytics exist to help understand:
- system growth
- tenant lifecycle stages
- onboarding bottlenecks
- product adoption
- company/site activation
- spread through subcontractor networks
- operational health
- feature usage at aggregate level

This is not a license to inspect individual worker details or sensitive tenant business data.

---

## 2. Allowed superadmin graph types

The superadmin may see privacy-safe graphs such as:

### 2.1 Tenant lifecycle graph
Stages:
- invited
- registered
- company profile complete
- legal onboarding complete
- first site created
- first worker added
- first QR scan
- first full workday recorded
- first payment/export/support event
- active tenant
- dormant tenant

### 2.2 Adoption funnel
Examples:
- invites sent -> invites accepted -> companies activated
- companies activated -> sites created -> workers onboarded -> first check-in
- workers invited -> workers acknowledged notices -> first check-in

### 2.3 Usage trend graphs
Examples:
- active companies per week/month
- active sites per week/month
- active workers count, aggregated only
- QR scan count, aggregated only
- check-in/check-out event volume, aggregated only
- legal onboarding completion percentage
- retention/compliance warning counts

### 2.4 Spread / network graph
Allowed:
- company-to-company relationship graph at business-entity level
- which company invited or connected another company to a site
- count of shared sites between companies
- direction of platform spread through contractor/subcontractor relationships

Not allowed by default:
- showing individual worker names in platform spread graph
- exposing full staff of connected companies
- exposing raw time records as graph nodes

### 2.5 System health graph
Examples:
- failed jobs
- bot/API errors
- dashboard token failures by count only
- migration state
- scheduler state
- queue/Redis health
- test/deploy status

---

## 3. Data minimization rules

Platform analytics should prefer:
- counts
- percentages
- stages
- trends
- anonymized IDs where needed
- company-level metadata only where necessary for platform operations

Avoid showing:
- worker full names
- raw GPS points
- raw time events
- exact payment amounts per worker
- sensitive comments
- private customer internal notes

---

## 4. Aggregation levels

Default safe aggregation levels:
- platform total
- tenant/company metadata level
- site count level
- feature usage count level
- lifecycle stage level
- week/month time buckets

Sensitive drill-down requires explicit support context and must follow `SUPERADMIN_PRIVACY_BOUNDARY.md`.

---

## 5. Company identifiers in platform graphs

Platform superadmin may need to identify tenant companies for support and growth understanding.

Allowed:
- company name / tenant label in platform admin context
- company status
- lifecycle stage
- number of sites/workers as aggregated counts
- connection to other companies by business relationship/site participation

Not allowed by default:
- listing all workers of the company
- opening worker-level raw details without support reason

---

## 6. Site/object analytics

Allowed platform-level site analytics:
- number of sites per company
- active/dormant site count
- site lifecycle stage
- participating company count per site
- site activity level as aggregate count

Do not show worker-level site attendance details in platform analytics unless support-scoped access is justified and audited.

---

## 7. Spread graph rule

The spread graph exists to understand how BauClock propagates through real construction relationships.

Allowed graph nodes:
- business entities / tenant companies
- sites/objects as anonymized or named if necessary for platform support
- lifecycle stages

Allowed edges:
- invited company
- connected to site
- shared site participation
- subcontractor/general-contractor relation on a specific site

Forbidden default nodes:
- individual workers
- raw time events
- payment records
- GPS records

---

## 8. Product lifecycle state model

Recommended lifecycle states:
- lead / manually known
- invited
- signup started
- company registered
- legal onboarding incomplete
- legal onboarding complete
- first site created
- first worker invited
- first worker active
- first QR scan
- operational pilot
- active customer
- dormant
- churned / archived

This helps the platform owner understand the system without exposing private worker data.

---

## 9. Audit rule

Normal aggregated analytics access does not need heavy audit for every view.

Sensitive drill-down beyond aggregated analytics must be audited.

Examples requiring audit:
- opening worker raw data
- viewing raw GPS/time/payment evidence
- support-scoped tenant data access
- break-glass access

---

## 10. Final canonical rule

The platform owner/superadmin may see graphs about the system as a living product:
- growth
- activation
- spread
- usage
- lifecycle stages
- health

The platform owner/superadmin must not use these graphs to bypass privacy boundaries or inspect worker/customer-sensitive data without lawful support context.

Platform analytics = aggregated understanding.
Sensitive support access = scoped, justified and auditable.
