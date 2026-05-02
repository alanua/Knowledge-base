# BauClock Source Layout Reconciliation - 2026-05-02

Status: docs-only reconciliation note.
Scope: reconcile `projects/bauclock/` canon with top-level `BauClock/` model docs before converting `BAUCLOCK_NEXT_IMPLEMENTATION_QUEUE_2026_05_02.md` into implementation tasks.

## 1. `projects/bauclock/` docs read

- `projects/bauclock/BAUCLOCK_NEXT_IMPLEMENTATION_QUEUE_2026_05_02.md`
- `projects/bauclock/BAUCLOCK_QUEUE_SOURCE_CORRECTION_2026_05_02.md`
- `projects/bauclock/overview.md`
- `projects/bauclock/architecture.md`
- `projects/bauclock/domain_model.md`
- `projects/bauclock/decisions.md`
- `projects/bauclock/finance_model.md`
- `projects/bauclock/bot_strategy.md`
- `projects/bauclock/i18n_strategy.md`
- `projects/bauclock/tasks.md`
- `projects/bauclock/handoff.md`

## 2. Top-level `BauClock/` model docs found and read

The queue treated these uppercase model docs as missing from the repo snapshot. They are present under top-level `BauClock/` and were read for this reconciliation:

- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
- `BauClock/ROLE_BASED_VISUALIZATION_STRATEGY.md`
- `BauClock/DATA_VISUALIZATION_MODEL.md`

Source layout finding:

- The issue is a path/layout mismatch, not confirmed source absence.
- `projects/bauclock/` contains shorter current project canon and queue documents.
- Top-level `BauClock/` contains older or expanded model docs that materially affect implementation planning.
- The top-level docs should be treated as source evidence requiring reconciliation before implementation tasks are opened from the queue.
- This note does not move, rename, delete, copy, or canonize any top-level docs.

## 3. Top-level docs that overlap current `projects/bauclock/` canon

`BauClock/CORE_ENTITY_RELATION_MODEL.md` overlaps with:

- `projects/bauclock/architecture.md`
- `projects/bauclock/domain_model.md`
- `projects/bauclock/decisions.md`
- `projects/bauclock/handoff.md`

Overlap:

- multi-company, site-centric BauClock model
- `person` plus company relation/membership direction
- `worker` as transition layer
- behavior derived from role, relation, and scope
- site/object as a central context for visibility

`BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md` overlaps with:

- `projects/bauclock/overview.md`
- `projects/bauclock/domain_model.md`
- `projects/bauclock/decisions.md`
- `projects/bauclock/finance_model.md`

Overlap:

- legal form belongs to the business/company profile
- Gewerbe is not a separate worker type
- business entity, person, employment or engagement relation, role, and scope drive behavior
- finance/export support remains optional and should not become full accounting

`BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md` overlaps with:

- `projects/bauclock/domain_model.md`
- `projects/bauclock/decisions.md`
- `projects/bauclock/tasks.md`

Overlap:

- one physical object should have one master site/QR
- subcontractors join an existing site instead of creating parallel master sites
- visibility follows site participation/assignment, not permanent global subcontractor identity

`BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md` and `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md` overlap with:

- `projects/bauclock/overview.md`
- `projects/bauclock/architecture.md`
- `projects/bauclock/tasks.md`
- `projects/bauclock/BAUCLOCK_NEXT_IMPLEMENTATION_QUEUE_2026_05_02.md`

Overlap:

- strict role isolation
- privacy by business logic/design
- auditability
- platform superadmin and analytics require explicit boundary before implementation

`BauClock/ROLE_BASED_VISUALIZATION_STRATEGY.md` and `BauClock/DATA_VISUALIZATION_MODEL.md` overlap with:

- `projects/bauclock/overview.md`
- `projects/bauclock/bot_strategy.md`
- `projects/bauclock/i18n_strategy.md`
- `projects/bauclock/tasks.md`
- Lovable/dashboard queue items in `BAUCLOCK_NEXT_IMPLEMENTATION_QUEUE_2026_05_02.md`

Overlap:

- dashboard is a role-specific operational surface
- UI must preserve hidden sensitive data and role-aware visibility
- i18n keys must cover dashboard, bot, public QR, manual corrections, summaries, warnings, and role labels

## 4. Top-level docs with stronger or more detailed canon

These top-level docs contain stronger or more detailed canon than the shorter `projects/bauclock/` files and should be considered before implementation:

- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
  - Stronger detail: uses a small base entity model (`BusinessEntity`, `Person`, `Site/Object`, `Relation`, `Role`, `Scope`) and explicitly forbids creating special entities for every legal form, employment form, subcontractor situation, accountant case, or object role.
  - Implementation impact: identity, role, company membership, site assignment, and permission tasks should reference relation/scope-driven behavior before any schema or service design.

- `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`
  - Stronger detail: defines legal forms as `BusinessEntity.legal_form`, separates employment type from access role, and clarifies that Gewerbe can be an employer, subcontractor, client, or site owner/controller depending on context.
  - Implementation impact: onboarding, company profile, worker/person migration, subcontractor flows, and finance/export plans should not hardcode Gewerbe as one-person-only or create separate legal-form workflows.

- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
  - Stronger detail: states exactly what a general contractor may and may not see about subcontractor workers, including current presence and historical site attendance limited to the site context.
  - Implementation impact: site QR, dashboard presence, exports, audit/event plans, and role-isolation tests must include site-scoped subcontractor data boundaries.

- `BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md`
  - Stronger detail: distinguishes platform metadata access from support-scoped sensitive access and break-glass access, with reason, scope, time limit where practical, and audit requirements.
  - Implementation impact: no superadmin dashboard, analytics drill-down, support tooling, or broad cross-company search should proceed before this boundary is reconciled into the project canon.

- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
  - Stronger detail: defines allowed platform-level graphs and aggregate analytics while forbidding default worker-level, GPS, raw time, payment, and sensitive note exposure.
  - Implementation impact: platform analytics and graph/network tasks must be separated from daily dashboards and must default to aggregated/minimized data.

- `BauClock/ROLE_BASED_VISUALIZATION_STRATEGY.md`
  - Stronger detail: maps data categories, data bricks, recommended visualizations, and privacy boundaries per role: superadmin, owner, worker, objektmanager, and accountant.
  - Implementation impact: Lovable/dashboard planning must use role-specific slices and cannot use one broad UI model for all roles.

- `BauClock/DATA_VISUALIZATION_MODEL.md`
  - Stronger detail: separates dashboard, charts/diagrams, maps, graph/network visualization, tables, and filtered lists.
  - Implementation impact: future graph explorer work should remain later-stage platform analytics and should not block normal operational dashboard/charts planning.

## 5. Queue items blocked until reconciliation

The following queue items should not be converted into implementation tasks until the top-level docs above are reconciled into an approved project canon or explicitly attached to the issue scope:

- `REVIEW-01` - confirm missing uppercase model files and queue approval.
- `REVIEW-04` - role boundaries for owner, worker, accountant, objektmanager, subcontractor owner, and platform superadmin.
- `CODEX-01` - dashboard token security design and implementation plan, because session privacy and role/scope checks depend on the role/privacy boundary.
- `CODEX-03` - role-isolation test coverage, because the stronger relation/scope and subcontractor visibility rules must shape test cases.
- `CODEX-05` - separation between time tracking, payroll-support, subcontractor coordination, and export layers, because legal form and employment-form modeling affect module boundaries.
- `LOVABLE-01` - dashboard UX plan for privacy-by-session visibility, because role-specific visibility and superadmin boundaries are not yet reconciled.
- `LOVABLE-03` - role-based dashboard navigation and visibility, because it depends directly on the role visualization strategy and privacy boundary.
- `LOVABLE-04` - site presence and subcontractor dashboard views, because top-level subcontractor visibility canon is more specific than the shorter project docs.
- `HARDEN-03` - export scope controls, because exports must obey company/site scope and subcontractor visibility boundaries.
- `HARDEN-05` - platform superadmin privacy boundary before analytics or support tooling.
- `HOLD-02` - identity migration prevention, because `person + company_membership` should be reconciled with the top-level relation model before migration planning.
- `HOLD-03` - platform analytics or superadmin dashboards before privacy review.
- `HOLD-04` - UI generation before role, token, and privacy constraints are reviewed.
- `RUNNER-02` - Codex dashboard token security design issue.
- `RUNNER-04` - ChatGPT role/privacy/retention matrix issue.
- `RUNNER-05` - Lovable dashboard UX planning issue.

## 6. Queue items that can remain planning-only

These items can remain in the queue as planning or guardrail statements, provided they are not converted into code, migrations, UI generation, deploy work, or legal/tax claims:

- `CANON-01` - multi-company, site-centric, role-isolated product framing.
- `CANON-02` - target identity direction of `person + company_membership` with `worker` as transition layer.
- `CANON-03` - one physical object, one master site/QR, subcontractors join existing sites.
- `CANON-04` - optional payroll-support/accountant-export finance framing, not full accounting.
- `CANON-05` - bot separation and company-context isolation.
- `REVIEW-02` - dashboard token model review questions.
- `REVIEW-03` - retention class review questions, without legal retention claims.
- `REVIEW-05` - first DATEV/export scope questions, without implementing DATEV or claiming compliance.
- `CODEX-02` - audit logging coverage as a planning/event-catalog task only.
- `CODEX-04` - manual correction traceability as a planning task only.
- `LOVABLE-02` - visual direction planning only, with no UI generation.
- `LOVABLE-05` - multilingual UI foundation planning only, with no generated UI.
- `HARDEN-01` - retention class planning with legal-review markers.
- `HARDEN-02` - audit-safe canonical values planning.
- `HARDEN-04` - manual correction immutability planning.
- `HOLD-01` - prevent premature DATEV/export implementation.
- `HOLD-05` - prevent legal/tax claims beyond canon.
- `RUNNER-01` - source review and queue approval issue, updated to say the uppercase docs exist under `BauClock/`.
- `RUNNER-03` - audit event catalog issue, if scoped as docs/planning only and cross-referenced to the reconciled role/scope model.

## 7. Next recommended docs-only tasks

1. Create a BauClock source map under `projects/bauclock/` that lists project canon docs, top-level model docs, status, owner/reviewer, and whether each top-level doc is adopted, superseded, or still pending review.
2. Draft a docs-only role/privacy/scope matrix using the top-level relation, superadmin, subcontractor, and role visualization docs as inputs.
3. Draft a docs-only entity/relation glossary that reconciles `company`, `BusinessEntity`, `person`, `company_membership`, `worker`, `Relation`, `Role`, `Scope`, `site`, and `Site/Object`.
4. Draft a docs-only subcontractor site visibility acceptance matrix for owner/controller, participating company, subcontractor company owner, objektmanager, worker, accountant, and superadmin.
5. Draft a docs-only dashboard visualization boundary note separating daily dashboards, charts/diagrams, maps, graph/network explorer, tables, and filtered lists.
6. Update the next queue review issue text so it no longer says the uppercase docs are missing and instead references their top-level `BauClock/` paths.
7. After ChatGPT review, decide whether selected top-level docs should be linked from `projects/bauclock/` canon, summarized into project canon, or left as historical/source evidence.

## 8. Draft PR body for runner

Changed file:

- `projects/bauclock/BAUCLOCK_SOURCE_LAYOUT_RECONCILIATION_2026_05_02.md`

Source docs read:

- `projects/bauclock/BAUCLOCK_NEXT_IMPLEMENTATION_QUEUE_2026_05_02.md`
- `projects/bauclock/BAUCLOCK_QUEUE_SOURCE_CORRECTION_2026_05_02.md`
- `projects/bauclock/overview.md`
- `projects/bauclock/architecture.md`
- `projects/bauclock/domain_model.md`
- `projects/bauclock/decisions.md`
- `projects/bauclock/finance_model.md`
- `projects/bauclock/bot_strategy.md`
- `projects/bauclock/i18n_strategy.md`
- `projects/bauclock/tasks.md`
- `projects/bauclock/handoff.md`
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
- `BauClock/ROLE_BASED_VISUALIZATION_STRATEGY.md`
- `BauClock/DATA_VISUALIZATION_MODEL.md`

Source layout finding:

- The uppercase BauClock model docs are present under top-level `BauClock/`; the queue's missing-file statement is a path/layout mismatch, not confirmed absence.
- Top-level model docs include stronger canon for relation-driven modeling, business/employment forms, subcontractor site visibility, superadmin privacy, platform analytics, and role-based visualization.

Blocked queue items:

- `REVIEW-01`, `REVIEW-04`, `CODEX-01`, `CODEX-03`, `CODEX-05`, `LOVABLE-01`, `LOVABLE-03`, `LOVABLE-04`, `HARDEN-03`, `HARDEN-05`, `HOLD-02`, `HOLD-03`, `HOLD-04`, `RUNNER-02`, `RUNNER-04`, `RUNNER-05`.

Next recommended docs-only reconciliation tasks:

- Create source map.
- Draft role/privacy/scope matrix.
- Draft entity/relation glossary.
- Draft subcontractor site visibility acceptance matrix.
- Draft dashboard visualization boundary note.
- Update queue review issue text to reference top-level `BauClock/` paths.
- Decide through ChatGPT review whether to link, summarize, or leave top-level docs as source evidence.

Validation result:

- `git diff --check` passed with no output.

ChatGPT review required before merge. User remains final approver.
