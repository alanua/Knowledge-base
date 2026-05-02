# BauClock Source Map - 2026-05-02

Status: docs-only source map for canon reconciliation.
Scope: map `projects/bauclock/` project canon and top-level `BauClock/` model/source docs before implementation tasks are opened.

This file follows `projects/bauclock/BAUCLOCK_SOURCE_LAYOUT_RECONCILIATION_2026_05_02.md` and does not move, rename, delete, copy, canonize, or supersede any source document.

## 1. `projects/bauclock/` Docs

| Document | Purpose | Status | Handling |
|---|---|---|---|
| `projects/bauclock/overview.md` | Product framing for BauClock as a multi-company, site-centric, role-isolated construction workflow product with bot, backend, database, Redis, and dashboard. | Current project canon. | Current canon |
| `projects/bauclock/architecture.md` | Short architecture anchor for core entities, auth/roles, site QR, time tracking, optional finance, dashboard, auditability, and privacy. | Current project canon, but brief. | Current canon |
| `projects/bauclock/domain_model.md` | Current domain anchor for company, person, `company_membership`, site, transitional `worker`, site participation, and gradual identity migration. | Current project canon, with top-level relation docs providing stronger detail. | Current canon |
| `projects/bauclock/decisions.md` | Product, business, platform, bot, QR, privacy, legal-form, and accountant decisions. | Current project canon. | Current canon |
| `projects/bauclock/finance_model.md` | Finance boundary: optional payroll/accountant/export support, not full accounting; manual corrections and payments must be auditable. | Current project canon, with broader top-level finance/legal docs present for later review. | Current canon |
| `projects/bauclock/bot_strategy.md` | Bot contour strategy for `@gewerbebot`, `@bauuhrbot`, dedicated bots, `@SEKbaubot`, invite onboarding, QR entry, hidden sensitive data, and auto-hide. | Current project canon. | Current canon |
| `projects/bauclock/i18n_strategy.md` | Canonical multilingual strategy for DE, UK, EN fallback, translation keys, and canonical internal values. | Canonical v1. | Current canon |
| `projects/bauclock/tasks.md` | Short current/next/backlog task list for role model, dashboard token security, audit logging, QR logic, subcontractors, finance, DATEV later, and localization. | Lightweight planning list, not implementation approval. | Queue/planning |
| `projects/bauclock/handoff.md` | Handoff status, risks, and next steps for identity migration, role isolation, finance consistency, backend hardening, dashboard connection, and real workflow tests. | Handoff note. | Handoff |
| `projects/bauclock/workflow.md` | Local workflow rules for recording decisions and tasks in markdown. | Support process note. | Handoff |
| `projects/bauclock/BAUCLOCK_NEXT_IMPLEMENTATION_QUEUE_2026_05_02.md` | Planning/triage queue with canon anchors, review questions, Codex tasks, Lovable tasks, hardening items, holds, and runner-ready issue drafts. | Planning only; contains incomplete statement that uppercase model docs were not present in the snapshot. | Queue/planning |
| `projects/bauclock/BAUCLOCK_QUEUE_SOURCE_CORRECTION_2026_05_02.md` | Correction that uppercase model docs exist under top-level `BauClock/` and must be treated as source evidence before queue conversion. | Correction and review guardrail. | Correction |
| `projects/bauclock/BAUCLOCK_SOURCE_LAYOUT_RECONCILIATION_2026_05_02.md` | Reconciliation note listing project docs read, top-level model docs found, overlaps, stronger canon candidates, blocked queue items, and next docs-only tasks. | Docs-only reconciliation note. | Correction |

## 2. Top-Level `BauClock/` Docs

| Document | Purpose | Status | Handling |
|---|---|---|---|
| `BauClock/CORE_ENTITY_RELATION_MODEL.md` | Relation-driven behavior model using `BusinessEntity`, `Person`, `Site/Object`, `Relation`, `Role`, and `Scope`; forbids special entity universes for legal forms, subcontractors, accountants, or object roles. | Stronger and more detailed than current project domain/architecture notes. | Stronger canon candidate |
| `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md` | Business legal form and employment/engagement model; Gewerbe is a business/entity attribute, not a worker type; site role is contextual. | Stronger and more detailed than current project business/entity notes. | Stronger canon candidate |
| `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md` | Privacy-safe platform analytics model for aggregate lifecycle, adoption, usage, spread, health, and sensitive drill-down boundaries. | Stronger source for superadmin/platform analytics planning. | Stronger canon candidate |
| `BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md` | Superadmin boundary separating platform metadata, support-scoped access, break-glass access, audit, and minimized visibility. | Stronger source for role/privacy/scope work. | Stronger canon candidate |
| `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md` | Site-scoped subcontractor visibility model; general contractor sees only subcontractor people connected to the site context. | Stronger source for subcontractor/site visibility rules. | Stronger canon candidate |
| `BauClock/ROLE_BASED_VISUALIZATION_STRATEGY.md` | Role-specific visualization strategy for superadmin, owner, worker, objektmanager, and accountant with privacy boundaries and data bricks. | Stronger source for dashboard/UI planning. | Stronger canon candidate |
| `BauClock/DATA_VISUALIZATION_MODEL.md` | Separates dashboard, charts/diagrams, maps, graph/network visualization, tables, and filtered lists; graph explorer is later-stage. | Stronger source for UI/dashboard and analytics planning. | Stronger canon candidate |
| `BauClock/ROLE_PERMISSION_MATRIX.md` | Role/scope permission matrix referenced by multiple top-level model docs. | Relevant source evidence not yet reconciled into `projects/bauclock/`. | Pending adoption |
| `BauClock/BOT_CONTOURS_AND_ACCESS_BOUNDARIES.md` | Bot contour and access-boundary model referenced by superadmin and bot-related docs. | Relevant source evidence for bot and role isolation. | Pending adoption |
| `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md` | Full canonical system model referenced by entity, employment, and subcontractor model docs. | Broad source evidence requiring separate review before adoption. | Pending adoption |
| `BauClock/FINANCIAL_LEGAL_MODEL_V1.md` | Broader financial/legal model referenced by business and employment forms. | Source evidence for finance/export/accountant planning; no legal/tax claims adopted here. | Pending adoption |
| `BauClock/EVENT_AND_AUDIT_MODEL.md` | Event and audit model for auditable business/security actions. | Source evidence for audit/event catalog planning. | Pending adoption |
| `BauClock/DATA_RETENTION_MATRIX.md` | Retention matrix source. | Source evidence requiring review; no retention/legal claims adopted here. | Pending adoption |
| `BauClock/LEGAL_ACCEPTANCE_LOG_MODEL.md` | Legal acceptance log model. | Source evidence for legal-onboarding/audit planning; not implementation approval. | Pending adoption |
| `BauClock/LEGAL_ONBOARDING_PACK.md` | Legal onboarding pack source. | Source evidence; requires legal/privacy review before product adoption. | Pending adoption |
| `BauClock/LEGAL_UI_FLOW.md` | Legal UI flow source. | Source evidence for future UX planning; no UI generation approval. | Pending adoption |
| `BauClock/GERMANY_LEGAL_HARDENING_PLAN.md` | Germany-focused legal hardening plan. | Source evidence; no legal claims adopted here. | Pending adoption |
| `BauClock/DEVELOPMENT_ROADMAP_GERMANY.md` | Germany-focused development roadmap. | Roadmap source evidence, not current implementation authority. | Historical/backlog |
| `BauClock/PHASE2_POST_MERGE_PLAN.md` | Phase 2 post-merge plan. | Historical/planning source. | Historical/backlog |
| `BauClock/IMPLEMENTATION_STATUS_PHASE2_POST_MERGE.md` | Phase 2 post-merge implementation status. | Historical status source. | Historical/backlog |
| `BauClock/IMPLEMENTATION_STATUS_GERMANY_HARDENING.md` | Germany hardening implementation status. | Historical status source. | Historical/backlog |
| `BauClock/OPEN_QUESTIONS.md` | Open questions register. | Backlog/review source. | Historical/backlog |
| `BauClock/PLATFORM_GRAPH_ANALYTICS_BACKLOG.md` | Platform graph analytics backlog. | Later-stage analytics backlog. | Historical/backlog |
| `BauClock/OWNER_WORKER_VISUALIZATION_DESIGN.md` | Owner and worker visualization design source. | UI source evidence pending reconciliation with role-based visualization strategy. | Pending adoption |
| `BauClock/UI_REFINEMENT_PLAN.md` | UI refinement plan. | UI planning source, not UI generation approval. | Historical/backlog |
| `BauClock/UX_SIMPLICITY_GUARDRAILS.md` | UX simplicity guardrails referenced by privacy and visualization docs. | Source evidence for future UI/dashboard planning. | Pending adoption |
| `BauClock/D3_VISUALIZATION_REFERENCE.md` | D3 visualization reference. | Reference/backlog material. | Historical/backlog |
| `BauClock/VISUALIZATION_ALGORITHM_REFERENCE.md` | Visualization algorithm reference. | Reference/backlog material. | Historical/backlog |
| `BauClock/DATA_VISUALIZATION_EXPERIMENTS_REFERENCE.md` | Visualization experiments reference. | Reference/backlog material. | Historical/backlog |
| `BauClock/DATA_LABORATORY_VISUAL_ANALYTICS_REFERENCE.md` | Data Laboratory visual analytics reference. | Reference/backlog material. | Historical/backlog |
| `BauClock/RADIAL_ROSE_VISUALIZATION_REFERENCE.md` | Radial rose visualization reference. | Reference/backlog material. | Historical/backlog |
| `BauClock/PERSONAL_EXPENSE_VISUALIZATION_REFERENCE.md` | Personal expense visualization reference. | Reference/backlog material; not current BauClock finance canon. | Historical/backlog |
| `BauClock/legacy_docs_analysis.md` | Legacy document analysis. | Historical/source analysis. | Historical/backlog |

## 3. Overlap Map

| Topic | `projects/bauclock/` anchors | Top-level `BauClock/` sources | Reconciliation handling |
|---|---|---|---|
| Entity and relation model | `architecture.md`, `domain_model.md`, `decisions.md`, `handoff.md` | `CORE_ENTITY_RELATION_MODEL.md`, `BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`, `CANONICAL_SYSTEM_MODEL_FULL.md`, `ROLE_PERMISSION_MATRIX.md` | Current project canon names the target direction; top-level docs provide stronger relation/scope detail and should be reconciled before schema or migration planning. |
| Legal forms and employment forms | `overview.md`, `domain_model.md`, `decisions.md`, `finance_model.md` | `BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`, `FINANCIAL_LEGAL_MODEL_V1.md` | Treat legal form as business/entity profile and employment/access as relation metadata; do not implement legal/tax claims from this map. |
| Subcontractor and site visibility | `domain_model.md`, `decisions.md`, `tasks.md` | `SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`, `CORE_ENTITY_RELATION_MODEL.md`, `ROLE_PERMISSION_MATRIX.md` | Preserve one master site/QR and site-scoped subcontractor visibility; reconcile before role-isolation tests, exports, or dashboard planning. |
| Role and privacy boundaries | `overview.md`, `architecture.md`, `tasks.md`, `BAUCLOCK_NEXT_IMPLEMENTATION_QUEUE_2026_05_02.md` | `SUPERADMIN_PRIVACY_BOUNDARY.md`, `PLATFORM_ANALYTICS_PRIVACY_MODEL.md`, `ROLE_PERMISSION_MATRIX.md`, `BOT_CONTOURS_AND_ACCESS_BOUNDARIES.md` | Queue items depending on superadmin, support, analytics, dashboard tokens, or role isolation remain blocked until a reviewed matrix exists. |
| Dashboard and visualization | `overview.md`, `bot_strategy.md`, `i18n_strategy.md`, `tasks.md`, queue Lovable items | `ROLE_BASED_VISUALIZATION_STRATEGY.md`, `DATA_VISUALIZATION_MODEL.md`, `UX_SIMPLICITY_GUARDRAILS.md`, visualization references | Use role-specific data slices; keep daily dashboard separate from later graph/network explorer; no UI generation from this map. |
| Finance, accountant, export, audit | `finance_model.md`, `i18n_strategy.md`, `tasks.md`, queue hardening items | `FINANCIAL_LEGAL_MODEL_V1.md`, `EVENT_AND_AUDIT_MODEL.md`, `DATA_RETENTION_MATRIX.md`, `ROLE_BASED_VISUALIZATION_STRATEGY.md` | Finance/export remains optional support, not full accounting; reconcile scope and audit before DATEV/export/accountant tasks. |
| Bot and session contour | `bot_strategy.md`, `decisions.md`, `i18n_strategy.md` | `BOT_CONTOURS_AND_ACCESS_BOUNDARIES.md`, `SUPERADMIN_PRIVACY_BOUNDARY.md`, `CORE_ENTITY_RELATION_MODEL.md` | Keep platform/admin functions out of client bots and worker flows; reconcile before token/session/privacy implementation. |

## 4. Read Before Role, Privacy, or Scope Work

- `projects/bauclock/overview.md`
- `projects/bauclock/architecture.md`
- `projects/bauclock/domain_model.md`
- `projects/bauclock/decisions.md`
- `projects/bauclock/bot_strategy.md`
- `projects/bauclock/BAUCLOCK_QUEUE_SOURCE_CORRECTION_2026_05_02.md`
- `projects/bauclock/BAUCLOCK_SOURCE_LAYOUT_RECONCILIATION_2026_05_02.md`
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
- `BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`
- `BauClock/BOT_CONTOURS_AND_ACCESS_BOUNDARIES.md`

## 5. Read Before UI or Dashboard Work

- `projects/bauclock/overview.md`
- `projects/bauclock/bot_strategy.md`
- `projects/bauclock/i18n_strategy.md`
- `projects/bauclock/tasks.md`
- `projects/bauclock/BAUCLOCK_NEXT_IMPLEMENTATION_QUEUE_2026_05_02.md`
- `projects/bauclock/BAUCLOCK_SOURCE_LAYOUT_RECONCILIATION_2026_05_02.md`
- `BauClock/ROLE_BASED_VISUALIZATION_STRATEGY.md`
- `BauClock/DATA_VISUALIZATION_MODEL.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`

## 6. Read Before Entity, Schema, or Migration Planning

- `projects/bauclock/architecture.md`
- `projects/bauclock/domain_model.md`
- `projects/bauclock/decisions.md`
- `projects/bauclock/handoff.md`
- `projects/bauclock/BAUCLOCK_QUEUE_SOURCE_CORRECTION_2026_05_02.md`
- `projects/bauclock/BAUCLOCK_SOURCE_LAYOUT_RECONCILIATION_2026_05_02.md`
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/OPEN_QUESTIONS.md`

## 7. Read Before Finance, Export, or Accountant Work

- `projects/bauclock/finance_model.md`
- `projects/bauclock/decisions.md`
- `projects/bauclock/domain_model.md`
- `projects/bauclock/i18n_strategy.md`
- `projects/bauclock/tasks.md`
- `projects/bauclock/BAUCLOCK_SOURCE_LAYOUT_RECONCILIATION_2026_05_02.md`
- `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/ROLE_BASED_VISUALIZATION_STRATEGY.md`
- `BauClock/FINANCIAL_LEGAL_MODEL_V1.md`
- `BauClock/EVENT_AND_AUDIT_MODEL.md`
- `BauClock/DATA_RETENTION_MATRIX.md`
- `BauClock/LEGAL_ACCEPTANCE_LOG_MODEL.md`

## 8. Final Recommendation

Next docs-only task: draft `projects/bauclock/BAUCLOCK_ROLE_PRIVACY_SCOPE_MATRIX_2026_05_02.md`.

That task should reconcile owner, worker, accountant, objektmanager, subcontractor company owner, site owner/controller, participating company, and platform superadmin across:

- `projects/bauclock/domain_model.md`
- `projects/bauclock/decisions.md`
- `projects/bauclock/bot_strategy.md`
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
- `BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/ROLE_PERMISSION_MATRIX.md`

The output should remain docs-only and should explicitly block code, migrations, UI generation, export implementation, and legal/tax claims until ChatGPT review and user approval.

## 9. Draft PR Body Checklist For Runner

Changed file:

- `projects/bauclock/BAUCLOCK_SOURCE_MAP_2026_05_02.md`

Docs inspected:

- `projects/bauclock/BAUCLOCK_SOURCE_LAYOUT_RECONCILIATION_2026_05_02.md`
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
- `projects/bauclock/workflow.md`
- `BauClock/CORE_ENTITY_RELATION_MODEL.md`
- `BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`
- `BauClock/PLATFORM_ANALYTICS_PRIVACY_MODEL.md`
- `BauClock/SUPERADMIN_PRIVACY_BOUNDARY.md`
- `BauClock/SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`
- `BauClock/ROLE_BASED_VISUALIZATION_STRATEGY.md`
- `BauClock/DATA_VISUALIZATION_MODEL.md`
- heading-level inventory of remaining top-level `BauClock/*.md` docs

Source-map summary:

- Classified `projects/bauclock/` docs as current canon, queue/planning, handoff, or correction.
- Classified top-level `BauClock/` docs as stronger canon candidates, source evidence pending adoption, or historical/backlog.
- Mapped overlaps between the two layouts.
- Named required read-before docs for role/privacy/scope, UI/dashboard, entity/schema/migration, and finance/export/accountant work.

Next recommended docs-only task:

- Draft `projects/bauclock/BAUCLOCK_ROLE_PRIVACY_SCOPE_MATRIX_2026_05_02.md`.

Validation result:

- To be filled by runner from `git diff --check`.
