# BauClock — Canonical System Model (Full)

## Status

This document fixes the full canonical system model for BauClock.

Purpose:
- provide a complete design basis that is sufficient for architecture, implementation, review and handoff
- keep product logic, access logic, legal hardening and deployment priorities in one place
- allow another architect or executor to design a working BauClock-compatible system without reconstructing context from chats

This document must be read together with:
- `BauClock/FINANCIAL_LEGAL_MODEL_V1.md`

If any future decision conflicts with this document, this document wins unless a newer written decision explicitly supersedes it.

---

## 1. Product identity

BauClock is a B2B SaaS platform for construction and field-work companies.

Core product purpose:
- working time tracking
- site presence tracking
- role-based access
- support for contract hours and overtime logic
- support for subcontractor and Gewerbe coordination
- support for accounting-facing and export-facing workflows

BauClock is not a full autonomous payroll engine and not a legal decision-maker.
It is a system of record and workflow support for:
- time
- presence
- derived summaries
- payment-support tracking
- subcontractor coordination
- export support

---

## 2. Canonical working model for development

Development team model:
- User = operator
- ChatGPT = architect / reviewer
- Codex or another agent = executor
- Runtime = target platform of the project

Work mode:
- task-driven
- explicit review loop
- no role mixing
- architecture decisions must be written down
- canonical documents must be updated when product logic changes

---

## 3. High-level system shape

Canonical platform shape:
- company
- site
- person
- company membership / role binding
- worker-facing time events
- derived summaries
- payment-support records
- export layer
- bot and dashboard interfaces

Implementation note:
The target model is `person + company_membership`, but migration may be staged through a transitional `worker` layer.
The live system does not need a destructive rewrite if a transitional compatibility layer is safer.

Canonical base chain:
- company -> site -> worker/person -> time events -> summaries -> payments/export

This base chain must remain stable.

---

## 4. Legal and operating frame

Default operating model:
- client company = controller
- BauClock = processor

Required legal/commercial document set around the product:
- B2B SaaS contract
- AVV / DPA
- TOMs
- privacy notice
- retention / deletion policy
- liability limitation
- service description

Canonical legal framing for Germany:
- do not redesign the core model
- apply legal hardening around the existing system
- preserve the core time-recording architecture
- add security, auditability, access isolation and retention controls

Mandatory hardening themes:
- dashboard / API access control
- role isolation
- audit logging
- manual correction traceability
- retention and privacy layer
- ArbZG policy checks
- DATEV export boundaries

Product boundary:
- BauClock supports payroll/accounting-related workflows
- BauClock does not replace accountant, payroll provider, tax advisor or legal advisor
- generated values, exports and payment support are support layers unless separately validated by the client

---

## 5. Company model

### 5.1 Company as primary business container
A company is the primary business boundary.

A company has:
- legal / registration form
- owner
- company profile
- people
- site relationships
- financial and export scope
- permissions scope

Examples of legal forms:
- Gewerbe
- GmbH
- UG
- GbR

Current canonical rule:
At the current phase, all these legal forms behave the same in core application logic.
Future differences in templates, documents or reporting may be added later without changing the core architecture.

### 5.2 Company onboarding
Company onboarding is invite-based.

A company owner may create or complete the company profile after accepting an invite.
The chosen legal form becomes part of the company profile and may later affect document templates, reports and business flows.

### 5.3 Multi-company model
The platform is multi-company.

Core rule:
- one company only sees its own legitimate business perimeter
- cross-company visibility must always be justified by a site partnership or delegated accounting access

---

## 6. Site model

### 6.1 Site as work object
A site is a work object / Baustelle.

A site has:
- owner company or master company context
- public identity
- QR entry point
- optional geodata
- worker presence data
- subcontractor connections

### 6.2 Master-site rule
Canonical target for multi-company site logic:
- one physical object = one master QR
- non-authorized users see only neutral/public information
- authorized users use the same object as a check-in point

General contractor first creates the site.
Subcontractors do not create a competing official copy when joining that site; they connect their company to the existing object.

### 6.3 Independent subcontractor site before merge
A subcontractor company may create its own internal site and QR for internal time/money tracking before a master-site relationship exists.
If later merged with a general contractor context, the general contractor master site becomes canonical.

### 6.4 Visibility on site
A general contractor must not see one undifferentiated list of everyone.
Visibility must be logically grouped as:
- own workers
- partner companies / subcontractors / Gewerbe

A subcontractor sees only itself and its own people.

---

## 7. Person, worker and membership model

### 7.1 Canonical target
Long-term canonical model:
- person = human identity
- company_membership = relation of person to company and role

### 7.2 Transitional implementation
A `worker` layer may remain in implementation while migrating toward canonical `person + company_membership`.
This is acceptable if it reduces rewrite risk.

### 7.3 Employment scope rule
A hired employee may be active in only one company at a time.

External roles with their own business, such as accountant with own enterprise, may serve multiple companies through explicit invitations and scoped access.

---

## 8. Role model

Canonical roles:
- platform_superadmin
- company_owner
- objektmanager
- accountant
- worker
- subcontractor company owner / Gewerbe owner

### 8.1 platform_superadmin
Exists only in the platform/personal contour.
Sees platform-level metrics, companies, invites, aggregate structure and own personal/Gewerbe contour.
Does not collapse tenant privacy boundaries in client-facing bots.

### 8.2 company_owner
Top-level company authority.
Can:
- complete company profile
- create people
- assign roles
- create sites
- invite subcontractor companies to sites
- manage object manager assignment
- delegate accountant access
- access company dashboard and business functions

### 8.3 objektmanager
Optional role.
May be absent entirely.
If present:
- it is enabled on an existing person profile, not created as a separate human type
- it is bound only to selected sites, not automatically to all company sites
- owner may add/remove site scope at any time
- objektmanager does not issue subcontractor company invites to existing sites; only company_owner does that

### 8.4 accountant
May be:
- internal employee with accountant role
- external business invited into multiple companies

Accountant may:
- view company financial/time information within granted scope
- update payment status
- record payment date
- record actual paid amount
- add payment comments

Accountant may not by default:
- redefine cooperation terms
- change contract rates or pauschal amount
- redefine invoice totals
unless specifically delegated in future logic.

### 8.5 worker
Worker is the operational field user.
Worker may:
- register via invite
- scan QR
- check in / out / pause
- see own hours
- confirm or dispute payment-related actions

Worker may not:
- access dashboard by default
- access other users' data

### 8.6 subcontractor / Gewerbe owner
A Gewerbe or subcontractor owner is a full company actor in the system.
It may:
- join external sites by invite
- manage own company profile
- manage own people
- track own hours and payments per site
- optionally create invoices or use only hours-tracking and off-system accounting

---

## 9. Bot and platform contour strategy

Canonical bot strategy:
- `@gewerbebot` = platform-level and personal contour only
- `@bauuhrbot` = default shared client bot for most companies
- dedicated company bot = optional per branded client
- `@SEKbaubot` = dedicated client bot for SEK only, not platform-level

### 9.1 Platform / personal contour
Only `@gewerbebot` contains:
- superadmin dashboard
- platform metrics
- the user's own Gewerbe/company contour
- the user's personal hours and money contour

### 9.2 Shared client bot
Shared client bot is tenant-facing, not platform-facing.
For non-authorized users it should show neutral entry state rather than system internals.

### 9.3 Privacy-by-business-logic
Each bot and each role sees only the legitimate minimum.
Sensitive screens should be minimized and auto-hidden in UI after inactivity where appropriate.
This is a UI/session visibility rule, not data destruction.

---

## 10. Onboarding and invite model

### 10.1 Invite-first model
Registration is invite-driven for company and worker flows.

### 10.2 Worker creation rule
Owner first creates a person/worker with contract/type.
Additional capabilities such as objektmanager are enabled on that existing profile.

### 10.3 Subcontractor company onboarding to site
Flow:
1. accept invite
2. create or complete company profile
3. create own people
4. assign who works on which available sites
5. later add people and reassign by simple toggles

### 10.4 Invite QR
Invite QR is distinct from site QR.
Invite data is temporary and should expire.

---

## 11. Time tracking model

### 11.1 Raw event model
Canonical raw event types:
- CHECKIN
- PAUSE_START
- PAUSE_END
- CHECKOUT

Raw events are primary evidence.
Derived calculations must not silently replace them.

### 11.2 Check-in flow
Typical flow:
1. worker scans site QR
2. system validates worker identity
3. system validates access and proximity rules if enabled
4. system records time event
5. repeated scans move through pause/check-out sequence according to current state

### 11.3 Geodata rule
GPS is allowed only as a site presence verification layer.
Do not evolve into constant background surveillance.
Collect the minimum necessary geodata for legitimacy of site attendance logic.

### 11.4 Suspicion flags
Suspicious or questionable events may be flagged, but should remain auditable rather than silently discarded.

### 11.5 Daily summaries
Derived daily summaries may include:
- total minutes
- break minutes
- contract minutes
- overtime minutes

Derived summaries are secondary to raw events.

---

## 12. Working time law support layer

For Germany, the system should support legal working-time compliance rather than pretending the law does not exist.

Canonical policy layer should support:
- pause reminders
- over-limit warnings
- rest-period checks
- review flags for potential ArbZG violations

This policy layer is a compliance support layer, not a replacement for employer responsibility.

---

## 13. Contract and overtime model

### 13.1 Contracted employees
For contracted employees:
- `contract_hours_week` is the official weekly maximum for contract hours
- actual contract time is based on actually worked time, not theoretical entitlement
- overtime is the worked excess above the contract threshold

Weekly logic conceptually:
- contract = min(actual_worked, weekly_contract_limit)
- overtime = max(0, actual_worked - weekly_contract_limit)

If absent or sick:
- do not auto-inflate contract time from theory
- only worked time becomes worked contract time unless separate absence logic is added explicitly

### 13.2 Minijob
Minijob remains separate from standard contract/overtime split where needed.
Monitor threshold-sensitive logic, but do not overload the core model.

### 13.3 Overtime support
Overtime tracking is supported as an operational and payment-support layer.
It is not automatically equivalent to final legal payroll settlement without client/accountant validation.

---

## 14. Payment-support model

Canonical payment support entities may include:
- payment records
- status
- payment type
- hours paid
- amount paid
- confirmed_at
- created_by / actor

### 14.1 Payment types
Canonical split:
- CONTRACT
- OVERTIME

Rule:
- CONTRACT = official payroll-facing / export-facing contour
- OVERTIME = separate payment-support contour

### 14.2 Payment confirmation flow
A manager/accounting-side actor may trigger payment confirmation flow.
Worker may confirm or dispute.
Disputes must remain visible and attributable.

### 14.3 Manual payment recording
Accountant may manually record payment date, paid amount and comment.
This is legitimate and should remain explicit in audit trail.

---

## 15. Gewerbe and subcontractor business model

Canonical rule:
A Gewerbe in BauClock is a full company, not a second-class worker account.

A Gewerbe may use the system in multiple depths:

### Minimal mode
- track hours only
- pass hours to accountant outside the system

### Intermediate mode
- track hours and payment status manually
- record invoiced amount / paid amount / remaining balance

### Full mode
- create invoice-support records
- generate invoice PDF or export
- record issue date and payment status
- optionally send to general contractor

Full invoicing inside BauClock remains optional.
The minimal useful scenario is still valid and must remain supported.

---

## 16. Invoice and export model

### 16.1 Invoice model
Invoice-support is modular and optional.
Do not force all Gewerbe users into full invoice workflow.

### 16.2 DATEV boundary
DATEV/export scope must be controlled.
Canonical rule:
- CONTRACT-facing data belongs to payroll/export contour
- OVERTIME must not accidentally leak into payroll/export contour

### 16.3 Export layer separation
Export logic must stay separate from:
- raw time tracking
- payment-support status handling
- subcontractor coordination logic

---

## 17. Dashboard model

Dashboard is a privileged interface.
It must not be publicly reachable in a meaningful way.

Canonical requirements:
- tokenized access
- strict server-side token validation
- TTL control
- role-bound scope
- company-bound scope
- no open access without valid token
- sensitive API routes use same trust boundary

Dashboard visibility is role-based and must be least-privilege.

Platform dashboard in `@gewerbebot` may show platform metrics.
Company dashboard may show company/site/worker/payment data within scope.

---

## 18. Access and privacy model

### 18.1 Canonical access principle
Privacy is enforced first by business logic and role isolation.

Core rule:
Every actor sees only the minimum legitimate data required for the task.

### 18.2 Data classes
Sensitive data in scope includes:
- person identity data
- time events
- site attendance data
- geodata where used
- payment support data
- role assignments

### 18.3 Access boundaries
Must exist at least at these boundaries:
- platform vs tenant
- company vs company
- owner vs manager vs accountant vs worker
- subcontractor vs general contractor
- raw events vs summaries vs exports

### 18.4 Unknown / non-authorized user behavior
Unknown or non-authorized bot users should receive only neutral/public company info or neutral waiting state.
Do not reveal internal system state.

---

## 19. Audit and traceability model

Auditability is a canonical requirement.

The system must make it possible to reconstruct:
- who created a worker/person record
- who changed rates or permissions
- who changed payment status
- who added adjustments
- who manually corrected time
- who confirmed or disputed payment-related actions

### 19.1 Manual correction rule
Manual corrections must never silently overwrite the story.
At minimum, the system must preserve:
- actor
- timestamp of correction
- reason
- old value
- new value

### 19.2 Raw evidence preservation
Raw events remain evidence.
Derived outputs and admin edits must stay distinguishable from raw source data.

---

## 20. Retention model

Retention is mandatory for legal hardening.

Canonical retention principle:
- keep what is necessary
- do not keep everything forever without rule
- do not auto-delete critical records blindly

Retention layer should distinguish at least:
- raw time events
- summaries
- audit logs
- payments
- exports
- invite artifacts

Deletion/anonymization policy must be explicit, configurable and safe-by-default.

---

## 21. Multilingual model

The bot must support multilingual operational use.

Canonical language logic:
- dashboard-capable management roles may be forced to DE where business needs require
- workers may auto-detect from Telegram language or be offered a language choice
- hidden language change command may exist outside visible menu

Operational messages such as:
- check-in results
- daily summaries
- payment confirmations
- disputes
should be shown in the user’s language where possible.

---

## 22. Public / unknown-user presentation layer

Unknown user or normal camera flow may lead to a public company info page.
This public page must be neutral and non-sensitive.
It is an access boundary, not a leak point.

---

## 23. Platform metrics and superadmin dashboard

Platform contour may aggregate:
- invite counts
- activated invites
- expired invites
- company counts
- people counts by company
- aggregate monetary/business volume metrics
- organization structure per company

This contour exists only in the platform/personal bot context and must not leak into client bots.

---

## 24. Architecture guidance for implementation

A working system designed from this model should preserve clear boundaries between:
- identity and membership
- site and presence
- raw events
- derived summaries
- payment-support logic
- invoice/export layer
- role enforcement
- audit logging
- retention/privacy controls
- bot UX
- dashboard UX

Recommended code separation:
- time tracking core
- payroll-support layer
- subcontractor/Gewerbe layer
- export layer
- access/security layer
- audit layer
- retention layer

---

## 25. Non-goals at current phase

Do not build right now:
- full payroll engine
- legal-advice engine
- fully automated accounting authority submission layer
- uncontrolled continuous geotracking
- architecture rewrite only for elegance

The project should prefer legal hardening and operational reliability over theoretical redesign.

---

## 26. Canonical Germany hardening checklist

For Germany-focused production readiness, the following must be enforced technically:
- strict dashboard/API access control
- audit logging
- manual correction traceability
- ArbZG policy support checks
- retention/privacy layer
- export boundary protection for DATEV-facing flows
- role and company isolation

This is the required path.
Do not rebuild the canonical model when hardening can solve the gap.

---

## 27. Open questions / not yet fully closed

### 27.1 Identity migration closure
- when exactly to complete migration from transitional `worker` model to full `person + company_membership`
- how much compatibility code should remain in production

### 27.2 ArbZG enforcement depth
- warnings only vs hard blocks
- exact handling of cross-day shifts, night work and edge cases
- exact review/report format for violations

### 27.3 Retention durations by record class
- exact durations for raw events, audit logs and derived summaries
- archive vs delete vs anonymize decision per class

### 27.4 DATEV/export scope details
- exact export schema and file format boundaries
- minimal export scope for v1 vs later phases

### 27.5 Absence model
- future treatment of sickness, vacation, holidays and justified non-work periods
- whether those remain external/accounting-side in v1 or enter product scope later

### 27.6 Payment dispute workflow depth
- exact SLA and escalation path when worker disputes payment
- owner vs accountant vs objektmanager authority in resolution

### 27.7 Delegation matrix
- which actions may later be delegated by owner to objektmanager or accountant
- whether delegation needs explicit per-action flags

### 27.8 Invoicing depth for Gewerbe
- whether built-in invoice generation remains minimal or grows into richer billing support
- document template differences by company legal form

### 27.9 Dedicated bot economics and branding model
- technical isolation requirements for branded bots
- operational limits and pricing boundaries

### 27.10 Public site page depth
- how much public object/company information is appropriate by default
- whether customer-facing public pages evolve beyond neutral info

---

## 28. What still should be added to the knowledge base

Recommended next companion documents:
- `BauClock/ROLE_PERMISSION_MATRIX.md`
- `BauClock/GERMANY_LEGAL_HARDENING_PLAN.md`
- `BauClock/OPEN_QUESTIONS.md`
- `BauClock/DATA_RETENTION_MATRIX.md`
- `BauClock/EVENT_AND_AUDIT_MODEL.md`
- `BauClock/BOT_CONTOURS_AND_ACCESS_BOUNDARIES.md`

Reason:
This canonical model is the top-level source, but implementation teams will still benefit from smaller executable reference documents.

---

## 29. Final canonical rule

Any future feature, schema change, API route, dashboard screen, export, bot flow, payment flow, invoice flow, role expansion or subcontractor feature must be checked against:
- this canonical system model
- the financial/legal model
- privacy impact
- auditability
- role isolation
- retention logic
- liability boundaries
- controller/processor model

If a change cannot be explained cleanly through those lenses, it should not enter the system yet.
