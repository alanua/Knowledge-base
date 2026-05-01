# BauClock — Subcontractor Site Visibility Model

## Status

This document fixes the canonical visibility model for general contractor / subcontractor relationships on sites.

Core rule:
A general contractor does not see the full staff of a subcontractor company.
A general contractor sees only those subcontractor people who are connected to the general contractor's site context.

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`

---

## 1. Canonical rule

Subcontractor visibility is site-scoped and situational.

A general contractor may see:
- subcontractor company connected to the site
- subcontractor workers assigned/connected to that specific site
- current presence status of those people on that site
- historical attendance/work records of those people on that site
- which subcontractor company each person belonged to when working on the site

A general contractor may not see:
- the subcontractor's full staff list
- people of the subcontractor who were never assigned/connected to that site
- unrelated sites of the subcontractor
- internal subcontractor company HR/admin data
- subcontractor workers' unrelated work history from other sites

---

## 2. Site-scoped visibility

The visibility boundary is the site relationship, not the subcontractor company as a whole.

Example:
- General contractor company A owns site X.
- Subcontractor company B joins site X.
- Company B has 20 employees.
- Only 4 of those employees are assigned/connected to site X.

Company A may see the 4 site-connected people in the context of site X.
Company A may not see the other 16 workers of company B.

---

## 3. Historical site record

The general contractor keeps historical visibility for the site record.

For site X, the general contractor may see history such as:
- who worked on this site
- when they worked
- which company they came from
- whether they were present, absent, corrected, or flagged in the site context
- relevant site-scoped time events and summaries

This is not full-company visibility.
It is historical site evidence.

---

## 4. Current presence vs historical attendance

Visibility has two layers:

### 4.1 Current presence
Shows who is currently working or checked in on the site.

### 4.2 Historical attendance
Shows who previously worked on the site and from which company.

Both layers are limited to the site context.

---

## 5. Subcontractor-side visibility

The subcontractor company sees its own people and their own work records.

The subcontractor may see:
- its own full staff, if permitted by its own company role model
- its workers assigned to different sites
- its own internal time/payment/support data

The general contractor does not inherit this full visibility.

---

## 6. Data model implication

Do not model subcontractor workers as direct employees of the general contractor.

Use a site-participation or site-assignment relation.

Canonical relation concept:
- general_contractor_company_id
- site_id
- subcontractor_company_id
- subcontractor_person_id or worker_id
- assignment_start
- assignment_end
- active_on_site
- visibility_scope = site

The site relationship gives the general contractor site-scoped visibility, not company-wide visibility.

---

## 7. Dashboard implication

General contractor dashboard should group site people by company:
- own workers
- subcontractor company A
- subcontractor company B
- Gewerbe / external business entity

Do not show one undifferentiated list that makes subcontractor workers look like internal employees.

Recommended display:
- person name
- source company
- role on site if known
- current status
- site-specific history

---

## 8. Audit / evidence implication

For historical site records, preserve:
- who worked
- for which company
- on which site
- at which time
- whether record was manual/corrected/flagged

This supports site-level evidence without exposing unrelated subcontractor data.

---

## 9. Privacy rule

General contractor legitimate interest is site execution and site history.
It is not general HR visibility into subcontractor's company.

Therefore, site-scoped visibility must be enforced in API, dashboard, bot and export logic.

---

## 10. Final canonical rule

A general contractor sees subcontractor people only through the site relationship.

The general contractor sees:
- who from which subcontractor worked or works on the general contractor's site
- current and historical site-specific attendance/work evidence

The general contractor does not see:
- the subcontractor's complete staff
- unrelated subcontractor workers
- unrelated subcontractor sites or internal records
