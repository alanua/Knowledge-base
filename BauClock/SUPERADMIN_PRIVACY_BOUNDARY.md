# BauClock — Superadmin Privacy Boundary

## Status

This document fixes the canonical privacy boundary for the platform superadmin role in BauClock.

Core rule:
The platform superadmin exists for development, maintenance, support, system health, security and operational control.
It is not a permission to freely view customer-sensitive or worker-sensitive information.

Read together with:
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`
- `BauClock/BOT_CONTOURS_AND_ACCESS_BOUNDARIES.md`
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`

---

## 1. Superadmin purpose

The superadmin role exists for:
- development
- system maintenance
- deployment support
- operational troubleshooting
- security monitoring
- tenant setup support
- incident response
- migrations and technical repair

The superadmin role does not exist to browse client/worker private data by default.

---

## 2. Default visibility principle

Default superadmin visibility should be minimized.

The superadmin may see by default:
- platform health
- system metrics
- tenant/company list at metadata level
- deployment/version state
- failed jobs / system errors with minimized data
- invite/status counters
- anonymized or aggregated usage metrics
- configuration state needed for support

The superadmin should not see by default:
- full worker personal details
- full raw time events
- worker payment details
- private company financial details
- full GPS/location evidence
- legal documents accepted by individual workers beyond completion state
- sensitive company internal data unrelated to support

---

## 3. Legal/privacy rule

Technical ability is not the same as legal permission.

Even if the system administrator can technically access data, BauClock product logic should enforce that superadmin access to sensitive tenant data is limited to legally and operationally justified cases.

This is a privacy-by-design rule.

---

## 4. Support / break-glass access

Sensitive tenant data access by superadmin should require a support or incident context.

Preferred model:
- no default direct browse
- support-scoped access only when needed
- reason required
- time-limited if practical
- audit log required
- tenant/company scope required
- least-data view preferred

Possible support access states:
- `none`
- `metadata_only`
- `support_scoped`
- `break_glass`

Break-glass access must be exceptional.

---

## 5. Audit requirements

Any superadmin access to sensitive tenant/worker data must be auditable.

Audit should record:
- actor
- company/tenant scope
- data class accessed
- reason/support ticket/incident context where available
- timestamp
- action performed

Do not log secrets or raw tokens.

---

## 6. Data minimization by admin UI

Superadmin UI should prefer:
- counters
- statuses
- health indicators
- anonymized records
- redacted previews
- technical identifiers where sufficient

Do not build a superadmin UI that exposes every company's full operational content as the normal view.

---

## 7. Tenant support workflow

When support access is needed:
1. identify tenant/company
2. identify support reason
3. request/record support scope
4. access minimum necessary data
5. log action
6. close support scope when done

Where practical, customer-visible support access records may be added later.

---

## 8. Bot contour rule

Superadmin functions belong only in the platform/admin contour.

They must not leak into:
- shared client bot
- dedicated client bot
- worker flows
- normal company dashboard

---

## 9. Implementation guidance

Do not implement superadmin as `can_see_everything = true`.

Instead separate:
- platform metadata access
- tenant configuration access
- support-scoped sensitive access
- break-glass emergency access

Sensitive access should be explicit, justified and logged.

---

## 10. Final canonical rule

The platform superadmin has technical responsibility for the system, not unrestricted business visibility.

Superadmin may maintain and support BauClock.
Superadmin must not routinely see customer/worker sensitive data unless there is a lawful and operationally justified support/security reason, and such access must be limited and auditable.
