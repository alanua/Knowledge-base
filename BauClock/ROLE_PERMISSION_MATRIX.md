# BauClock — Role Permission Matrix

## Status

This document fixes the canonical role and permission matrix for BauClock.
It translates the canonical system model into executable access rules.

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/FINANCIAL_LEGAL_MODEL_V1.md`

If implementation conflicts with this matrix, this matrix wins unless a newer written rule supersedes it.

---

## 1. Scope dimensions

Permissions in BauClock must always be evaluated through all of these dimensions:
- role
- company scope
- site scope
- self vs others
- raw events vs derived data vs payment/export data
- bot contour vs dashboard contour

A role name alone is never sufficient.

---

## 2. Canonical roles

- platform_superadmin
- company_owner
- objektmanager
- accountant
- worker
- subcontractor_company_owner / gewerbe_owner

---

## 3. Permission levels

Use these meanings consistently:
- `NONE` = no access
- `OWN` = own data only
- `SITE` = only assigned site scope
- `COMPANY` = whole company scope
- `PLATFORM` = platform scope
- `CREATE` = may create records in allowed scope
- `UPDATE` = may edit records in allowed scope
- `CONFIRM` = may confirm / finalize action in allowed scope
- `EXPORT` = may trigger export in allowed scope
- `INVITE` = may issue invite in allowed scope

---

## 4. Core data objects

This matrix covers these object groups:
- company_profile
- site
- person_worker
- role_assignment
- invite
- raw_time_events
- derived_summaries
- payments
- payment_status_updates
- payment_disputes
- monthly_adjustments
- invoice_support_records
- exports
- audit_logs
- platform_metrics

---

## 5. Matrix

| Object / Action | platform_superadmin | company_owner | objektmanager | accountant | worker | subcontractor_company_owner / gewerbe_owner |
|---|---|---|---|---|---|---|
| View platform metrics | PLATFORM | NONE | NONE | NONE | NONE | NONE |
| View own company profile | PLATFORM or OWN_COMPANY | COMPANY | SITE if needed for assigned work only | COMPANY if granted | OWN minimal only | COMPANY |
| Update own company profile | PLATFORM for platform-owned contour only | UPDATE COMPANY | NONE | NONE by default | NONE | UPDATE COMPANY |
| Create site | PLATFORM for platform-owned contour only | CREATE COMPANY | NONE | NONE | NONE | CREATE COMPANY for own company contour |
| View site list | PLATFORM | COMPANY | SITE | COMPANY if granted | OWN assigned site context only | COMPANY |
| Update site settings | PLATFORM for platform-owned contour only | UPDATE COMPANY | UPDATE SITE only if explicitly delegated later | NONE | NONE | UPDATE COMPANY for own contour |
| Issue worker invite | PLATFORM for platform-owned contour only | INVITE COMPANY | INVITE SITE only if explicitly allowed later | NONE | NONE | INVITE COMPANY |
| Issue subcontractor company invite to existing site | NONE | INVITE COMPANY | NONE | NONE | NONE | NONE |
| Create person/worker | PLATFORM for platform-owned contour only | CREATE COMPANY | CREATE SITE only if explicitly delegated later | NONE | NONE | CREATE COMPANY |
| View person/worker list | PLATFORM | COMPANY | SITE | COMPANY if granted | OWN | COMPANY |
| Update person profile | PLATFORM for platform-owned contour only | UPDATE COMPANY | UPDATE SITE only if explicitly delegated later | NONE by default | OWN language/contact limited if allowed | UPDATE COMPANY |
| Assign/remove objektmanager flag | NONE | UPDATE COMPANY | NONE | NONE | NONE | NONE |
| Assign site to worker | NONE | UPDATE COMPANY | UPDATE SITE if explicitly delegated later | NONE | NONE | UPDATE COMPANY |
| View raw time events | PLATFORM in platform support context only | COMPANY | SITE | COMPANY if granted | OWN | COMPANY |
| Create raw time events through QR flow | NONE | NONE normally | NONE normally | NONE | OWN | OWN / own people via same worker logic |
| Manually correct time events | NONE by default | UPDATE COMPANY with reason required | UPDATE SITE with reason required if delegated | NONE by default | NONE | UPDATE COMPANY with reason required |
| View derived summaries | PLATFORM in platform support context only | COMPANY | SITE | COMPANY if granted | OWN | COMPANY |
| View payments | PLATFORM in support context only | COMPANY | SITE if operationally needed and allowed | COMPANY | OWN relevant status only | COMPANY |
| Create payment-support record | NONE | UPDATE COMPANY | UPDATE SITE if explicitly delegated later | UPDATE COMPANY | NONE | UPDATE COMPANY |
| Update payment status | NONE | UPDATE COMPANY | UPDATE SITE if explicitly delegated later | UPDATE COMPANY | NONE | UPDATE COMPANY |
| Record actual paid amount/date/comment | NONE | UPDATE COMPANY | NONE by default | UPDATE COMPANY | NONE | UPDATE COMPANY |
| Confirm received payment (worker side) | NONE | NONE | NONE | NONE | CONFIRM OWN if workflow requires | CONFIRM OWN company invoice/payment if workflow requires |
| Dispute payment | NONE | NONE | NONE | NONE | OWN | OWN company scope |
| Create monthly adjustment | NONE | UPDATE COMPANY | UPDATE SITE if explicitly delegated later | UPDATE COMPANY if financially delegated | NONE | UPDATE COMPANY |
| View invoice-support records | NONE by default | COMPANY | SITE if explicitly needed | COMPANY | NONE | COMPANY |
| Create invoice-support record | NONE | NONE by default for client owner side | NONE | NONE | NONE | UPDATE COMPANY |
| Trigger export | PLATFORM only for platform-owned/reporting contour | EXPORT COMPANY | NONE unless explicitly delegated later | EXPORT COMPANY if granted | NONE | EXPORT COMPANY |
| View audit logs | PLATFORM in support contour only | COMPANY high-privilege only | SITE limited filtered audit if implemented | COMPANY filtered finance scope if implemented | NONE | COMPANY high-privilege only |
| Access dashboard | PLATFORM in `@gewerbebot` only | COMPANY if allowed | SITE/COMPANY if allowed | COMPANY if allowed | NONE by default | COMPANY if allowed |

---

## 6. Hard rules

### 6.1 Worker
Worker never gets general dashboard data by default.
Worker sees:
- own hours
- own check-in/check-out results
- own payment confirmation/dispute actions where enabled
- own profile-relevant minimal data

### 6.2 Objektmanager
Objektmanager is optional and site-scoped.
Objektmanager is not a second owner.
Objektmanager cannot:
- create new subcontractor company relationships for an existing site
- expand own scope beyond assigned sites
- silently rewrite payment or contract terms by default

### 6.3 Accountant
Accountant is finance-support scoped.
Accountant can handle:
- payment status
- actual paid amount/date/comment
- company financial visibility within granted scope

Accountant cannot by default:
- change cooperation terms
- change hourly_rate
- change pauschal amount
- redefine invoice base values
- assign roles

### 6.4 Company owner
Company owner is the main company authority.
Company owner can:
- create and manage people
- assign selected sites
- issue invites
- view company dashboard
- control subcontractor relationships
- manage finance/support flows

### 6.5 Platform superadmin
Platform superadmin exists only in platform contour.
Platform access must not appear inside shared or dedicated client bots.
Platform support visibility must never become a default client-facing privilege.

---

## 7. Self vs others rule

For any endpoint or UI action, first resolve whether the access target is:
- self
- same company other person
- same site different company
- other company unrelated
- platform object

Default deny applies if the target is outside legitimate scope.

---

## 8. Bot contour rule

Permissions must also be filtered by contour:
- `@gewerbebot` may include platform/personal contour
- `@bauuhrbot` must not expose platform contour
- dedicated client bot must not expose platform contour
- `@SEKbaubot` remains tenant-specific only

A role that exists in one contour does not imply visibility in another contour.

---

## 9. Export rule

Exports must respect both:
- role permission
- data-class boundaries

Example:
- payroll / DATEV-facing export only from allowed company scope
- OVERTIME must not enter CONTRACT export by accident

---

## 10. Audit visibility rule

Audit logs are privileged data.
Visibility should be narrower than normal business data.
Default:
- owner = yes in company scope
- accountant = limited finance-related scope only if implemented
- objektmanager = only filtered site-related audit if explicitly implemented
- worker = no

---

## 11. Future delegation flags to decide explicitly

These permissions remain open for future explicit delegation flags:
- objektmanager may create worker invite
- objektmanager may assign worker to site
- objektmanager may create monthly adjustment
- accountant may create monthly adjustment
- objektmanager may update payment status
- accountant may export company finance data

These are not granted implicitly.

---

## 12. Final canonical rule

Default policy is deny.
Access is granted only if:
- role allows it
- company scope allows it
- site scope allows it where relevant
- contour allows it
- data-class boundary allows it
- feature/module boundary allows it

If any one of those checks fails, access must be denied.
