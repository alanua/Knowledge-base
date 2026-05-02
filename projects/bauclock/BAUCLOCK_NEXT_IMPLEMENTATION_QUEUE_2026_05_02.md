# BauClock Next Implementation Queue - 2026-05-02

Status: planning/triage only.
Source canon read: `projects/bauclock/overview.md`, `architecture.md`, `domain_model.md`, `decisions.md`, `finance_model.md`, `bot_strategy.md`, `i18n_strategy.md`, `tasks.md`, `handoff.md`.
Named source files requested but not present in this repo snapshot: `CORE_ENTITY_RELATION_MODEL.md`, `BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md`, `PLATFORM_ANALYTICS_PRIVACY_MODEL.md`, `SUPERADMIN_PRIVACY_BOUNDARY.md`, `SUBCONTRACTOR_SITE_VISIBILITY_MODEL.md`, `ROLE_BASED_VISUALIZATION_STRATEGY.md`, `DATA_VISUALIZATION_MODEL.md`.

## 1. Confirmed canon anchors

ID: CANON-01
Owner executor: ChatGPT review
Risk: green
Goal: Preserve BauClock as a multi-company, site-centric, role-isolated construction workflow product, not only a Telegram bot.
Allowed: Use the existing canon that defines Telegram bot layer, FastAPI backend, PostgreSQL, Redis, and web dashboard.
Forbidden: Reframe BauClock as a single-company tool, pure bot, generic ERP, or accounting-only system.
Validation: Future tasks cite the product model before implementation.
Depends on: Existing BauClock overview and architecture canon.

ID: CANON-02
Owner executor: ChatGPT review
Risk: green
Goal: Preserve the identity target of `person + company_membership` while treating `worker` as a transition layer.
Allowed: Plan gradual backend hardening around company membership, active company context, and site assignments.
Forbidden: Perform a direct identity migration, break production worker flows, or collapse people and memberships into one permanent entity.
Validation: Implementation issues include migration-safe acceptance criteria.
Depends on: Domain model and handoff risk notes.

ID: CANON-03
Owner executor: ChatGPT review
Risk: green
Goal: Preserve the site model where one physical object has one master site/QR and subcontractors join existing sites.
Allowed: Plan role and visibility checks around site ownership, participation, and assignments.
Forbidden: Create parallel subcontractor-owned master sites for the same physical object.
Validation: Site/QR tasks include subcontractor participation test cases.
Depends on: Domain model and decisions canon.

ID: CANON-04
Owner executor: ChatGPT review
Risk: yellow
Goal: Preserve finance as optional payroll-support/accountant-export support, not full accounting software.
Allowed: Track hours, support accountant sharing/export, and plan auditable manual payment/correction flows.
Forbidden: Make legal/tax claims, implement full accounting, or default accountants into contract-condition editing authority.
Validation: Finance tasks explicitly separate time tracking, payroll-support, subcontractor, and export layers.
Depends on: Finance model canon.

ID: CANON-05
Owner executor: ChatGPT review
Risk: green
Goal: Preserve bot separation: `@gewerbebot` for platform/personal use, `@bauuhrbot` as shared client bot, and `@SEKbaubot` as isolated first client branch.
Allowed: Plan isolated company context, role-based menus, invite onboarding, QR entry, hidden sensitive data, and inactivity auto-hide.
Forbidden: Mix platform logic into client bots or allow cross-company data leakage.
Validation: Bot tasks include bot/context routing checks.
Depends on: Bot strategy and decisions canon.

## 2. Open questions / needs review

ID: REVIEW-01
Owner executor: ChatGPT review
Risk: yellow
Goal: Confirm whether the missing uppercase model files exist elsewhere and should supersede the shorter current canon docs.
Allowed: Read-only canon search and summary.
Forbidden: Implement based on unstated model details.
Validation: Reviewer either attaches the missing files or confirms current canon is sufficient for the next queue.
Depends on: User-provided canon location.

ID: REVIEW-02
Owner executor: ChatGPT review
Risk: yellow
Goal: Define the exact dashboard token model before coding.
Allowed: Specify token purpose, audience, expiry, revocation, session privacy behavior, and audit events.
Forbidden: Generate tokens, change auth behavior, or store secrets in docs.
Validation: Approved token-security design exists before Codex implementation.
Depends on: Security/legal review.

ID: REVIEW-03
Owner executor: ChatGPT review
Risk: yellow
Goal: Clarify retention rules for work-time records, audit records, manual corrections, exports, and inactive sessions.
Allowed: Capture questions and identify data classes from existing canon.
Forbidden: Make legal retention claims beyond reviewed canon.
Validation: Retention matrix is reviewed before database or export work.
Depends on: Legal/privacy review.

ID: REVIEW-04
Owner executor: ChatGPT review
Risk: yellow
Goal: Confirm role boundaries for owner, worker, accountant, objektmanager, subcontractor company owner, and platform superadmin.
Allowed: Map visible entities, permitted actions, and forbidden cross-company views.
Forbidden: Grant broad superadmin or accountant visibility without explicit privacy boundary.
Validation: Role matrix is approved and referenced by Codex and Lovable tasks.
Depends on: Role model canon plus missing privacy-boundary docs if found.

ID: REVIEW-05
Owner executor: ChatGPT review
Risk: yellow
Goal: Decide the first DATEV/export scope.
Allowed: Define minimal accountant export data from tracked hours and correction history.
Forbidden: Implement DATEV export, claim DATEV compliance, or build tax/legal automation.
Validation: Export task has a reviewed non-claiming scope statement.
Depends on: Finance model and retention review.

## 3. Top 5 implementation tasks for Codex

ID: CODEX-01
Owner executor: Codex
Risk: yellow
Goal: Produce a dashboard token security design and implementation plan.
Allowed: Inspect auth/dashboard code, document token lifecycle, expiry, revocation, session visibility, and audit hooks.
Forbidden: Change runtime behavior, create secrets, deploy, or implement code before ChatGPT review.
Validation: Design includes threat cases for shared devices, expired sessions, role changes, and company context mismatch.
Depends on: REVIEW-02, REVIEW-04.

ID: CODEX-02
Owner executor: Codex
Risk: yellow
Goal: Plan audit logging coverage for security-sensitive and business-sensitive actions.
Allowed: Define audit event names for login/session, role changes, site QR access, check-in/out, manual correction, payment status, and export actions.
Forbidden: Log secrets, production data, or localized display labels as canonical audit state.
Validation: Event catalog uses stable English snake_case internal values.
Depends on: REVIEW-03, i18n canonical database rule.

ID: CODEX-03
Owner executor: Codex
Risk: yellow
Goal: Plan role-isolation test coverage before broad dashboard work.
Allowed: Define tests for owner, worker, accountant, optional objektmanager, subcontractor owner, and platform superadmin boundaries.
Forbidden: Add broad permissions or bypass role checks for convenience.
Validation: Test plan includes cross-company, subcontractor site, and accountant multi-company cases.
Depends on: REVIEW-04.

ID: CODEX-04
Owner executor: Codex
Risk: yellow
Goal: Plan manual correction traceability for time records.
Allowed: Define correction states, actor, reason, before/after values, approval/rejection, and audit linkage.
Forbidden: Allow silent edits to time records or overwrite canonical historical state.
Validation: Correction plan proves original record, corrected record, reviewer, and timestamp remain inspectable.
Depends on: CODEX-02, REVIEW-03.

ID: CODEX-05
Owner executor: Codex
Risk: yellow
Goal: Plan the separation between time tracking, payroll-support, subcontractor coordination, and export layers.
Allowed: Document module boundaries and data flow for tracked hours, optional finance, accountant sharing, and future DATEV/export.
Forbidden: Build full accounting, tax automation, or premature DATEV implementation.
Validation: Architecture note shows finance/export can remain optional for subcontractors and Gewerbe.
Depends on: REVIEW-05.

## 4. Top 5 UI/dashboard tasks for Lovable

ID: LOVABLE-01
Owner executor: Lovable
Risk: yellow
Goal: Create a dashboard UX plan for privacy-by-session visibility.
Allowed: Plan auto-hide, inactive session states, sensitive-field masking, and role-aware empty states.
Forbidden: Generate UI, deploy, or expose sensitive data by default.
Validation: UX plan includes worker, owner, accountant, objektmanager, subcontractor, and superadmin views.
Depends on: REVIEW-02, REVIEW-04.

ID: LOVABLE-02
Owner executor: Lovable
Risk: green
Goal: Prepare BauClock dashboard visual direction.
Allowed: Use BauClock branding, Material-style icons, reduced radii, compact cards, and collapsible sections.
Forbidden: Build a marketing landing page or decorative UI that hides operational workflows.
Validation: Mock scope prioritizes operational dashboard screens over hero/landing content.
Depends on: CANON-01.

ID: LOVABLE-03
Owner executor: Lovable
Risk: yellow
Goal: Plan role-based dashboard navigation and visibility.
Allowed: Define menus and cards per role using hidden sensitive data and role-based menus.
Forbidden: Show cross-company data, platform analytics, or superadmin views without reviewed privacy boundaries.
Validation: Navigation matrix is reviewed against role-isolation test plan.
Depends on: CODEX-03, REVIEW-04.

ID: LOVABLE-04
Owner executor: Lovable
Risk: yellow
Goal: Plan site presence and subcontractor dashboard views.
Allowed: Show one master site/QR, site participation, assignments, and presence summaries by permitted role.
Forbidden: Create duplicate master sites or expose subcontractor data beyond the permitted company/site context.
Validation: UI scenarios include general contractor and subcontractor company owner views.
Depends on: CANON-03, REVIEW-04.

ID: LOVABLE-05
Owner executor: Lovable
Risk: green
Goal: Plan multilingual UI foundations for DE, UK, and EN fallback.
Allowed: Use translation keys for dashboard, bot labels, public QR text, manual corrections, payment/time summaries, warnings, and role labels.
Forbidden: Hardcode user-facing text directly into generated UI.
Validation: UI plan names translation-key coverage and short button-label constraints.
Depends on: i18n strategy canon.

## 5. Security/legal hardening tasks

ID: HARDEN-01
Owner executor: ChatGPT review
Risk: yellow
Goal: Define retention classes before storing or exporting more sensitive records.
Allowed: Classify work-time records, manual corrections, audit logs, dashboard sessions, exports, and payment-status support records.
Forbidden: Claim legal retention periods without review.
Validation: Retention matrix has explicit "needs legal review" markers where needed.
Depends on: REVIEW-03.

ID: HARDEN-02
Owner executor: Codex
Risk: yellow
Goal: Plan audit-safe canonical values.
Allowed: Use stable English snake_case values for enums, API contracts, and audit records.
Forbidden: Store localized labels as canonical business state.
Validation: Proposed event/state names align with i18n strategy examples.
Depends on: CODEX-02.

ID: HARDEN-03
Owner executor: Codex
Risk: yellow
Goal: Plan export scope controls.
Allowed: Specify role-gated, company-scoped, time-range-scoped export permissions with audit events.
Forbidden: Implement DATEV, export cross-company data, or expose production data in tests.
Validation: Export plan includes denial cases for wrong role, wrong company, and unapproved time range.
Depends on: REVIEW-05, CODEX-03.

ID: HARDEN-04
Owner executor: Codex
Risk: yellow
Goal: Plan manual correction immutability.
Allowed: Define append-only correction history, approval flow, actor tracking, and before/after inspection.
Forbidden: Silent updates, destructive overwrites, or unlogged correction approvals.
Validation: Manual correction scenarios include request, approval, rejection, and export visibility.
Depends on: CODEX-04.

ID: HARDEN-05
Owner executor: ChatGPT review
Risk: red
Goal: Review platform superadmin privacy boundary before analytics or support tooling.
Allowed: Define what platform support can see, what must be aggregated, and when client data access requires explicit context.
Forbidden: Build platform analytics, broad superadmin dashboards, or raw cross-company visibility before review.
Validation: Approved privacy-boundary document exists.
Depends on: REVIEW-01, REVIEW-04.

## 6. What must not be implemented yet

ID: HOLD-01
Owner executor: Runner
Risk: red
Goal: Prevent premature DATEV/export implementation.
Allowed: Create reviewed scope docs only.
Forbidden: Build DATEV export, claim DATEV compliance, or generate tax/legal output.
Validation: No code, migrations, or UI generation for DATEV/export before review.
Depends on: REVIEW-05.

ID: HOLD-02
Owner executor: Runner
Risk: red
Goal: Prevent identity migration before a migration-safe plan exists.
Allowed: Read code and draft migration plan.
Forbidden: Replace `worker` with `person + company_membership` in production behavior.
Validation: No database migration or behavior change occurs.
Depends on: CANON-02.

ID: HOLD-03
Owner executor: Runner
Risk: red
Goal: Prevent platform analytics or superadmin dashboards before privacy review.
Allowed: Draft privacy-boundary questions.
Forbidden: Build raw cross-company analytics, broad superadmin search, or support impersonation.
Validation: No UI or backend task proceeds without HARDEN-05.
Depends on: HARDEN-05.

ID: HOLD-04
Owner executor: Runner
Risk: red
Goal: Prevent UI generation before role, token, and privacy constraints are reviewed.
Allowed: Draft Lovable prompts and screen scope.
Forbidden: Generate or deploy UI in this planning task.
Validation: Lovable tasks remain queued, not executed.
Depends on: REVIEW-02, REVIEW-04.

ID: HOLD-05
Owner executor: Runner
Risk: red
Goal: Prevent legal/tax claims beyond canon.
Allowed: Use cautious wording: payroll-support, accountant export/share, optional finance layer.
Forbidden: Claim tax compliance, payroll compliance, legal advice, or DATEV certification.
Validation: Review issue checks wording before implementation tasks are opened.
Depends on: HARDEN-01, REVIEW-05.

## 7. Suggested runner issue sequence

ID: RUNNER-01
Owner executor: Runner
Risk: yellow
Goal: Open ChatGPT review issue for missing canon files and queue approval.
Allowed: Attach this queue, list docs read, and ask whether missing uppercase model files exist elsewhere.
Forbidden: Convert queue items into implementation before review.
Validation: Review result names the approved top Codex and Lovable tasks.
Depends on: This planning file.

ID: RUNNER-02
Owner executor: Runner
Risk: yellow
Goal: Open Codex issue for dashboard token security design.
Allowed: Scope to design/inspection only unless ChatGPT explicitly approves implementation.
Forbidden: Runtime auth changes, secrets, deploys, or database migrations.
Validation: Output includes token lifecycle, session privacy, revocation, role-change handling, and test plan.
Depends on: RUNNER-01, REVIEW-02.

ID: RUNNER-03
Owner executor: Runner
Risk: yellow
Goal: Open Codex issue for audit logging and canonical event catalog.
Allowed: Draft event catalog and implementation plan for later coding.
Forbidden: Log secrets or localized labels as canonical audit state.
Validation: Event catalog covers dashboard sessions, role changes, site QR, time tracking, manual corrections, payment status, and exports.
Depends on: RUNNER-01, CODEX-02.

ID: RUNNER-04
Owner executor: Runner
Risk: yellow
Goal: Open ChatGPT review issue for role/privacy/retention matrix.
Allowed: Review owner, worker, accountant, objektmanager, subcontractor owner, platform superadmin, retention classes, and export scope.
Forbidden: Make legal/tax claims or approve broad platform visibility without explicit boundary.
Validation: Approved matrix is attached to future Codex and Lovable issues.
Depends on: RUNNER-01.

ID: RUNNER-05
Owner executor: Runner
Risk: yellow
Goal: Open Lovable planning issue for dashboard UX after token and role constraints are approved.
Allowed: Plan BauClock branding, Material-style icons, collapsible cards, reduced radii, privacy-by-session visibility, and i18n keys.
Forbidden: Generate UI before RUNNER-02 and RUNNER-04 review results are available.
Validation: Prompt references approved role/privacy matrix and token/session plan.
Depends on: RUNNER-02, RUNNER-04.

Top next Codex task: CODEX-01 / RUNNER-02, dashboard token security design.
Top next Lovable task: LOVABLE-01 / RUNNER-05, privacy-by-session dashboard UX plan.
