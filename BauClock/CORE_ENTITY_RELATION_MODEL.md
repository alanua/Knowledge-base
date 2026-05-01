# BauClock — Core Entity / Relation Behavior Model

## Status

This document fixes the highest-level canonical behavior model for BauClock.

Core rule:
BauClock must not create separate special entities for every legal form, worker type, subcontractor situation, accountant case, or object role.

The system has a small number of base entities and derives behavior from relations, roles and scope.

Read together with:
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`

---

## 1. Base entities

Canonical base entities:
- `BusinessEntity`
- `Person`
- `Site/Object`
- `Relation`
- `Role`
- `Scope`

Do not invent separate incompatible entities such as:
- Gewerbe-worker
- GmbH-worker
- subcontractor-worker as a separate human type
- accountant-person as a separate human type
- objektmanager-person as a separate human type
- permanent global general-contractor company
- permanent global subcontractor company

These concepts are attributes or contextual relations.

---

## 2. BusinessEntity

A `BusinessEntity` is a company/business actor.

It may have attributes such as:
- legal_form
- country/localization
- employer capability
- site owner/controller capability
- subcontractor/participant capability
- accounting/export settings

Examples of `legal_form`:
- Gewerbe / Einzelunternehmen
- Kleingewerbe
- GmbH
- UG
- GbR
- OHG
- KG
- AG
- SE
- eG
- e.V.
- other

The legal form is not a separate workflow universe.
It is an attribute of the business entity.

---

## 3. Person

A `Person` is a human being.

A person may be connected to one or more business contexts as:
- owner
- employee
- minijobber
- accountant
- objektmanager
- external representative
- self-employed owner working on site

The person object alone does not define system behavior.
Behavior comes from relation + role + scope.

---

## 4. Person-business relation

The person-business relation defines how a human is connected to a business entity.

Canonical relation metadata:
- business_entity_id
- person_id
- employment_type
- role
- scope
- start_date
- end_date
- is_active

Examples of `employment_type`:
- employee_full_time
- employee_part_time
- fixed_term
- minijob
- midijob
- ausbildung
- praktikant
- werkstudent
- external_representative
- self_employed_owner_working_on_site

Examples of `role`:
- company_owner
- worker
- objektmanager
- accountant
- platform_superadmin

Important separation:
- employment_type explains the business/legal/work relation
- role explains access authority
- scope explains where that authority applies

---

## 5. Site/Object

A `Site/Object` is a concrete work object / Baustelle / project site.

It may have:
- owner/controller business entity
- participating companies
- assigned persons/workers
- QR/check-in entry
- site-specific history
- site-specific visibility boundary

A site is not just a location.
It is the main context that determines contractor/subcontractor visibility.

---

## 6. Company-site relation

General contractor / subcontractor behavior is determined by the company-site relation, not by permanent company identity.

Canonical company-site relation metadata:
- site_id
- business_entity_id
- role_on_site
- assignment_start
- assignment_end
- visibility_scope = site

Possible `role_on_site` values:
- owner
- controller
- general_contractor
- subcontractor
- external_partner

The same company may be:
- owner/controller on one site
- subcontractor/participant on another site

This is normal and must be supported.

---

## 7. Behavior derivation rule

System behavior is derived from the combination of:
- business legal_form
- person-business relation
- employment_type
- access role
- site ownership/control relation
- site participation/assignment
- visibility scope

Canonical formula:

```text
behavior = BusinessEntity attributes
         + Person-Business relation
         + Role
         + Site/Object relation
         + Scope
```

No single label such as `Gewerbe`, `GmbH`, `subcontractor`, `accountant`, or `objektmanager` should control the whole behavior alone.

---

## 8. Visibility rule

Visibility is always scoped.

Examples:
- a worker sees own data
- an objektmanager sees assigned site scope
- an accountant sees granted finance/compliance scope
- a company owner sees own company scope
- a site owner/controller sees people from participating companies only within that site context

No role or business form grants uncontrolled global visibility.

---

## 9. Example

Company A is a GmbH.
Company B is a Gewerbe.

On Site X:
- Company A owns/controls Site X.
- Company B participates on Site X.
- Company A sees Company A workers and only Company B people connected to Site X.

On Site Y:
- Company B owns/controls Site Y.
- Company A participates on Site Y.
- Company B sees Company B workers and only Company A people connected to Site Y.

There is no global rule saying Company A is always general contractor or Company B is always subcontractor.
The role is site-specific.

---

## 10. Product simplification

This model keeps BauClock simple:
- few base entities
- rich contextual relations
- role-based access
- site-scoped visibility
- no duplicate workflows per legal form
- no duplicate human models per employment type

This supports legal correctness without bloating daily UX.

---

## 11. Implementation guidance

When implementing a new feature, do not ask:
- what kind of special entity is this?

Ask instead:
- which base entity is involved?
- what relation gives authority or visibility?
- what role applies?
- what scope applies?
- is the site/object relation relevant?

If a feature requires a new entity, first check whether it is really only a new relation or attribute.

---

## 12. Final canonical rule

BauClock is a relation-driven system.

There are no special separate universes for Gewerbe, GmbH, Minijob, subcontractor, accountant, objektmanager or site owner.

They are modeled through:
- business entity attributes
- person-business relations
- company-site relations
- roles
- scopes

This is the canonical behavioral model.
