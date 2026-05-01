# BauClock — Business and Employment Forms Model

## Status

This document fixes the canonical BauClock model for business legal forms and employment/engagement forms.

Core correction:
- Gewerbe is not a special kind of worker.
- Gewerbe / Einzelunternehmen is a business actor / employer-capable business subject.
- A Gewerbe can have its own employees.
- BauClock core model should stay simple: employer/business entity + people/workers + scoped relationship.
- General contractor / subcontractor visibility depends on ownership/control of a concrete site, not on global company identity.

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`
- `BauClock/FINANCIAL_LEGAL_MODEL_V1.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`

---

## 1. Canonical simplification

BauClock should not model every German legal form as a separate product object.

Canonical object model:
- business entity / employer
- person
- employment or engagement relation between business entity and person
- site ownership/control relation
- site participation/assignment relation
- time events
- summaries/payments/export

The legal form is an attribute of the business entity, not a different workflow identity.

The daily-use product model should remain simple:
- employer / business entity
- worker / person
- role
- scope
- site

---

## 2. Business entity / employer

A business entity in BauClock may be any employer-capable or client-capable business form.

Canonical field:
- `legal_form`

Possible German business/legal forms to support as values:

### Sole-person / individual business forms
- `einzelunternehmen`
- `kleingewerbe`
- `eingetragener_kaufmann` / `e_k`
- `freiberufler_einzelperson`

### Civil-law / partnership-style forms
- `gbr`
- `egbr`
- `ohg`
- `kg`
- `gmbh_und_co_kg`
- `partg`
- `partg_mbb`

### Capital-company forms
- `gmbh`
- `ug_haftungsbeschraenkt`
- `ag`
- `se`

### Cooperative / association / other organization forms
- `eg_genossenschaft`
- `verein_e_v`
- `other`

Product rule:
All of these are treated as business entities in the same core model unless a future module explicitly needs form-specific templates or reports.

---

## 3. Employer capability

Any business entity may potentially be an employer if it has workers/employees.

Therefore:
- Gewerbe / Einzelunternehmen can be employer
- GmbH can be employer
- UG can be employer
- GbR can be employer
- subcontractor company can be employer
- a company that is subcontractor on one site can be site owner/controller on another site

Do not assume that only GmbH/UG has employees.
Do not assume that Gewerbe means a person without employees.
Do not assume that subcontractor status is permanent or global.

---

## 4. Person model

A person is a human being.

The same person may appear in different contexts:
- owner of a business entity
- employee of a business entity
- object manager for a company/site
- accountant invited to a company
- subcontractor company representative
- worker on a site
- self-employed owner working on a site

Role comes from relationship/context, not from the person object alone.

---

## 5. Employment / engagement relation

Canonical relation object concept:
- `business_entity_id`
- `person_id`
- `relation_type`
- `employment_type`
- `role`
- `scope`
- `start_date`
- `end_date`
- `is_active`

This relation determines how BauClock treats the person in that company context.

Important separation:
- `employment_type` describes how the person is engaged by the business entity.
- `role` describes what access/authority the person has in the system.
- `site_scope` describes where that access or work applies.

---

## 6. Worker / employment forms to support

Supported employment/engagement categories for BauClock as relation values:

### Standard employees
- `employee_full_time`
- `employee_part_time`
- `employee_fixed_term`
- `employee_permanent`

### Low-hours / special wage categories
- `minijob`
- `midijob`
- `short_term_employment`

### Training / student categories
- `auszubildender`
- `praktikant`
- `werkstudent`

### External / business-to-business categories
- `subcontractor_company_worker`
- `external_company_representative`
- `self_employed_owner_working_on_site`

### Administrative / access roles
- `company_owner`
- `objektmanager`
- `accountant`
- `platform_superadmin`

Important rule:
Employment categories and access roles are relation metadata, not separate human species.

---

## 7. Employer vs worker rule

Canonical BauClock simplification:
- The business entity is the employer/client side.
- The person is the human side.
- The relation says whether that human is worker, owner, accountant, manager, or external representative in that context.

For daily product logic:
- employer creates company/sites/people
- workers check in/out and see own data
- managers operate within delegated scope
- accountants work in finance/support scope

---

## 8. Site ownership/control relation

A company may own/control one site and participate as subcontractor on another site.

Therefore, site role is not a permanent company-wide label.
It is a relation between company and site.

Canonical site relation concept:
- `site_id`
- `site_owner_company_id` or `site_controller_company_id`
- `participating_company_id`
- `role_on_site`
- `visibility_scope = site`

Possible `role_on_site` values:
- `owner`
- `controller`
- `general_contractor`
- `subcontractor`
- `external_partner`

The site owner/controller gets site-scoped visibility.
Participating companies keep their own internal company visibility.

---

## 9. Subcontractor rule

A subcontractor should usually be modeled as a business entity participating on a site, not as a worker type.

Example:
- Company A owns/controls site X.
- Company B joins site X as participating subcontractor.
- Company B may have its own workers.
- Company A should see B as a partner/subcontractor group on site X, not as internal employees.
- Company A sees only the people of B connected to site X.

If company B owns/controls site Y and invites company A there, then company B gets the site-owner view on site Y and company A becomes the participating company for that site.

---

## 10. Gewerbe rule

A Gewerbe / Einzelunternehmen may be:
- one self-employed person working alone
- a business with its own employees
- a subcontractor business
- a client/employer business
- a site owner/controller on one object and a participating company on another object

Therefore BauClock must not hardcode Gewerbe as one-person-only.

Correct model:
- Gewerbe is a legal/business profile of the business entity.
- The owner is a person related to that business entity.
- Workers are persons related to that business entity.
- Site roles are determined per site/object.

---

## 11. Product implementation guidance

Do not create separate core flows for every legal form.

Use one generic employer/company flow with attributes:
- legal_form
- country/localization
- tax/accounting settings later
- employer capability
- subcontractor capability
- site owner/controller capability

Only add form-specific logic when it affects:
- document templates
- export formats
- onboarding text
- accounting/tax support

---

## 12. UI wording rule

In product UI, avoid confusing legal labels.

Recommended simple terms:
- Company / Business / Betrieb
- Owner
- Worker / Employee / Mitarbeiter
- Site / Baustelle / Object
- External company / Subcontractor
- Site owner / object owner where needed

Show legal form only in company profile and documents, not everywhere in daily UI.

Show site role only where it matters for visibility, permissions and grouping.

---

## 13. Final canonical rule

BauClock has employers/business entities and people/workers.

Legal forms classify the business entity.
Employment forms classify the person-business relationship.
Site ownership/control classifies the company-site relationship.
Roles define access.

Do not make Gewerbe, GmbH, Minijob, subcontractor, accountant, or objektmanager separate incompatible universes in the core model.

Do not make general contractor/subcontractor a permanent global company identity.
It is site-specific and depends on ownership/control of the concrete object/site.
