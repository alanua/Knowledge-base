# BauClock — Bot Contours and Access Boundaries

## Status

This document fixes the canonical bot contour model and access-boundary rules for BauClock.

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`

---

## 1. Core rule

Bot contour is part of access control.
A role may exist conceptually, but if the contour is wrong, access is still wrong.

---

## 2. Canonical bot contours

### 2.1 `@gewerbebot`
Purpose:
- platform-level contour
- personal contour of the operator
- own Gewerbe/company contour of the operator

Allowed content:
- platform metrics
- company counts / invites / aggregate platform structure
- platform superadmin actions
- user's own Gewerbe business data
- user's own personal hours/money contour

Forbidden content leakage:
- unrelated tenant data inside personal/client flows
- client-bot tenant flows mixed into platform admin context without explicit support boundary

### 2.2 `@bauuhrbot`
Purpose:
- default shared client bot for most companies

Allowed content:
- tenant-facing company flows
- worker onboarding
- worker check-in / pause / checkout
- company-level owner/manager/accountant flows within tenant scope

Forbidden content:
- platform superadmin dashboard
- operator personal platform contour
- other tenants' information

### 2.3 Dedicated client bot
Purpose:
- branded client-specific bot for a single customer/tenant

Allowed content:
- same tenant-facing logic as shared client bot, adapted to one tenant

Forbidden content:
- platform superadmin contour
- other tenants' information
- operator personal platform contour

### 2.4 `@SEKbaubot`
Purpose:
- dedicated client bot for SEK tenant only

Forbidden content:
- platform-level superadmin functions
- personal/operator-only contour
- other tenants' content

---

## 3. Unknown-user behavior

For shared or dedicated client bot contours, unknown/non-authorized users should receive only:
- neutral waiting state
- neutral company/public info if appropriate
- no internal system explanation beyond minimal safe entry info

Do not reveal whether a site, worker, company or token is valid in a way that leaks internal state.

---

## 4. Role-to-contour mapping

| Role | `@gewerbebot` | `@bauuhrbot` | Dedicated client bot | `@SEKbaubot` |
|---|---|---|---|---|
| platform_superadmin | yes | no | no | no |
| company_owner | only for own personal/Gewerbe contour | yes in tenant scope | yes in tenant scope | yes for SEK only |
| objektmanager | not as platform role | yes in tenant scope | yes in tenant scope | yes for SEK only |
| accountant | only if acting inside own allowed company contour | yes in tenant scope | yes in tenant scope | yes for SEK only |
| worker | only if it is the operator's own personal/company context | yes in tenant scope | yes in tenant scope | yes for SEK only |
| subcontractor/Gewerbe owner | yes for own company contour | yes if invited to tenant site scope | yes if invited to tenant site scope | yes if invited in SEK scope |

---

## 5. Boundary rules

### 5.1 Platform vs tenant
Platform contour must never appear in tenant bots.

### 5.2 Tenant vs tenant
One tenant must never see another tenant's internal business data through shared bot logic.

### 5.3 Personal vs company
The operator's personal/Gewerbe contour inside `@gewerbebot` must not be mixed into general client bot flows.

### 5.4 Public vs authorized
Public/unknown user state must stay neutral and minimal.

---

## 6. UI minimization rule

Simple users should see only what they need.
Sensitive blocks should remain minimized, hidden, or short-lived on screen where appropriate.
This supports privacy-by-business-logic and privacy-by-default.

---

## 7. Final canonical rule

In BauClock, bot contour is not a branding detail.
It is a security and privacy boundary.
If the wrong contour exposes the wrong role or data, that is an architecture error, not just a UX issue.
