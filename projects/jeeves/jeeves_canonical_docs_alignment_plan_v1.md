# Jeeves Canonical Docs Alignment Plan v1

Status: docs-only alignment plan
Date: 2026-04-30
Scope: proposed canonical Jeeves docs package alignment with existing Knowledge-base canon

This document is a planning artifact only. It does not import the proposed docs package, create repo-local `docs/architecture/*`, `docs/security/*`, or `docs/workflows/*` files, edit runner scripts, change services, touch secrets, deploy, merge, or change production/runtime behavior.

## Goal

Review the proposed canonical Jeeves docs package as an import candidate and align it with the existing Knowledge-base canon without creating duplicate or conflicting sources of truth.

The safe import rule is:

```text
proposed docs package -> alignment review -> target mapping -> scoped follow-up tasks
```

Do not treat proposed docs as canonical until they are reconciled with the current Knowledge-base sources listed below.

## Existing Canon To Preserve

Current Knowledge-base sources already define the major canon:

```text
projects/jeeves/canonical_system_model_v1.md
projects/jeeves/identity_summary_v1.md
projects/jeeves/agent_development_department_v1.md
projects/jeeves/agent_department_current_status_v1.md
projects/jeeves/runtime_test_plan.md
projects/jeeves/agent_runner_lane_docs_route_spec_v1.md
projects/jeeves/agent_runner_source_of_truth_inventory_v1.md
projects/jeeves/agent_runner_read_only_host_inventory_v1.md
projects/jeeves/agent_runner_hotfix_normalization_v1.md
projects/jeeves/agent_runner_lane_docs_verifier_plan_v1.md
projects/jeeves/agent_runner_lane_docs_verifier_implementation_task_v1.md
projects/jeeves/openclaw_runner/collaboration_technology_v1.md
```

These documents already establish the current source-of-truth boundaries:

```text
Knowledge-base = canonical product, architecture, governance, policy, and planning memory
GitHub Issues = queued work source of truth
GitHub PRs = review surface
project repos = implementation source and repo-local operational docs
Jeeves runtime = product being built, not current department manager
```

## Useful Proposed Docs

The following proposed-doc categories are useful if imported through a mapping pass:

| Proposed doc area | Useful parts | Alignment note |
| --- | --- | --- |
| Architecture overview | Component map, routing/orchestration model, runtime boundaries | Must defer to `canonical_system_model_v1.md` for product identity and stage model. |
| Runtime operations | API, database, provider, smoke-test, local dev, and deployment-neutral run instructions | Repo-local later, because implementation commands belong beside the `jeeves` code. |
| Memory model | Session memory, canonical knowledge, raw evidence, administrative memory, operational memory, future agent memory | Mostly already exists in `canonical_system_model_v1.md` and `identity_summary_v1.md`; avoid a second memory doctrine. |
| Security and permissions | Threat model, tool permissions, prompt-injection handling, secrets boundaries, audit logging | Useful, but must match existing no-secrets/no-merge/no-deploy/no-unapproved-actions canon. |
| Workflow docs | Development conveyor, task lifecycle, review gates, runner reporting | Already exists across agent department and OpenClaw runner docs; import only missing repo-local procedure details. |
| Integrations | Gmail, Calendar, Drive, GitHub, browser/computer-use, model providers | Useful as capability inventory only; actual access must remain permissioned and staged. |
| Agent department docs | Runner lanes, labels, dry-run wrappers, docs lane routing, verifier plans | Already strongly covered; proposed content should not replace current route specs. |

## Already Covered In Current Canon

Do not duplicate these as new independent sources of truth:

```text
Jeeves identity and product role:
- canonical_system_model_v1.md
- identity_summary_v1.md

Current team and department model:
- agent_development_department_v1.md
- agent_department_current_status_v1.md

Runtime stage and smoke path:
- canonical_system_model_v1.md
- runtime_test_plan.md

Memory model:
- canonical_system_model_v1.md
- identity_summary_v1.md
- project_history_reconstruction_v1.md as recovery evidence

Runner route and lane-docs constraints:
- agent_runner_lane_docs_route_spec_v1.md
- agent_runner_source_of_truth_inventory_v1.md
- agent_runner_read_only_host_inventory_v1.md
- agent_runner_hotfix_normalization_v1.md
- agent_runner_lane_docs_verifier_plan_v1.md
- agent_runner_lane_docs_verifier_implementation_task_v1.md

OpenClaw/Codex collaboration:
- openclaw_runner/collaboration_technology_v1.md
```

If proposed docs restate these rules, import them as edits to the existing files only after review, not as parallel canonical documents.

## Repo-Local Docs Later

The following should become repo-local docs in the `jeeves` implementation repository later:

```text
docs/runtime/local-dev.md
docs/runtime/smoke-test.md
docs/runtime/configuration.md
docs/runtime/database.md
docs/providers/model-routing.md
docs/api/endpoints.md
docs/security/runtime-permissions.md
docs/security/tool-gating.md
docs/workflows/development.md
docs/workflows/release-checklist.md
```

Repo-local docs should cover implementation facts that must evolve with code:

```text
- exact commands
- environment variable names, without secret values
- API endpoints
- database schema notes
- migration commands
- smoke-test commands
- provider configuration knobs
- tool enablement flags
- local development and test procedures
- deployment-neutral operational runbooks
```

Repo-local docs must reference Knowledge-base canon for policy and product authority instead of redefining it.

## Knowledge-base Docs To Keep

The following should stay in Knowledge-base:

```text
- product identity and system model
- canonical memory model
- source-of-truth boundaries
- user/ChatGPT/Jeeves/runner responsibility model
- risk classes and approval gates
- agent department governance
- lane label vocabulary and runner route policy
- long-term roadmap and staged capability decisions
- security principles and forbidden-operation canon
- historical recovery and decision records
```

Knowledge-base should not become an implementation runbook dump for the `jeeves` codebase. It should remain the durable decision layer.

## Conflicts And Wording To Adjust

Before importing any proposed docs, adjust wording that conflicts with current canon:

| Topic | Required wording |
| --- | --- |
| Real mail access | Say Gmail/Calendar/Contacts are administrative memory sources only where approved. Read and summarize first; no autonomous sending, deleting, labeling, calendar changes, or contact changes without explicit approval. |
| Secrets | Say no secret values, SSH keys, tokens, env values, production credentials, or private key material may be placed in docs, prompts, logs, reports, or PR bodies. Path-only inventory is acceptable when scoped. |
| Browser/computer-use | Treat browser-use and computer-use as future permissioned tool capabilities, not current default runtime powers. Tools remain disabled until explicit staged approval and audit controls exist. |
| Runtime tools | Preserve the current Stage 1 rule: API + DB + session + trace + mock or real LLM response first; tools and real actions later. |
| Department authority | Do not mark Jeeves as department manager. Current canon says Jeeves is the product being built and may later become observer, planner, then bounded queue manager only after approval. |
| Source of truth | Say Knowledge-base is canonical product/governance memory and project repos hold implementation docs. Do not let repo-local docs override Knowledge-base policy. |
| GitHub task queue | Preserve GitHub Issues as queued-work source of truth and PRs as review surface. |
| Runner docs | Do not imply docs-lane route specs authorize live runner edits, services, systemd, secrets, deployment, merge, or production changes. |
| External sources | Treat Telegram/news/blog/project examples as idea sources, not canon. |

## Markdown Fixes Needed Before Import

Run a cleanup pass on the proposed docs before any import:

```text
- Add a status line to every imported doc: canonical, repo-local, draft, or historical evidence.
- Add a scope line to clarify whether the doc is Knowledge-base policy or repo-local implementation guidance.
- Replace absolute claims like "Jeeves manages" with staged claims such as "Jeeves may later observe/plan/manage after approval."
- Replace secret examples with placeholders that do not reveal values.
- Remove live command examples that start, stop, enable, restart, deploy, merge, or touch production unless the doc is a future task and explicitly forbidden by default.
- Normalize headings to one H1 and sentence-case or title-case section headings.
- Use fenced code blocks for commands, labels, file mappings, and task templates.
- Convert duplicated architecture summaries into references to existing canonical docs.
- Add "not approved by this document" clauses where a doc discusses future tools, browser-use, computer-use, runner services, or production behavior.
- Ensure repo-local target paths are proposals only until a later scoped task creates them.
```

## Recommended Target Mapping

| Proposed source | Target | Action |
| --- | --- | --- |
| Product identity / mission | `projects/jeeves/canonical_system_model_v1.md` and `projects/jeeves/identity_summary_v1.md` | Merge only genuinely new wording after review. |
| Architecture overview | Knowledge-base canonical model plus future `jeeves/docs/architecture/overview.md` | Keep durable architecture in Knowledge-base; put code-adjacent diagrams/details repo-local later. |
| Runtime overview | Future `jeeves/docs/runtime/README.md` | Repo-local later; reference `runtime_test_plan.md` for current stage constraints. |
| Runtime smoke test | Future `jeeves/docs/runtime/smoke-test.md` or script README | Repo-local later; keep safe mock/tools-disabled rule. |
| API endpoints | Future `jeeves/docs/api/endpoints.md` | Repo-local later; do not duplicate in Knowledge-base unless endpoint design changes policy. |
| Database/migrations | Future `jeeves/docs/runtime/database.md` | Repo-local later; no secret-bearing connection strings. |
| Memory architecture | `canonical_system_model_v1.md` if policy-level; future repo-local doc if implementation-level | Avoid second memory doctrine. |
| Security model | Knowledge-base policy summary plus future `jeeves/docs/security/runtime-permissions.md` | Split policy from implementation. |
| Tool permissions | Future `jeeves/docs/security/tool-gating.md` | Must say tools are off until explicitly approved. |
| Browser/computer-use | Future capability proposal in Knowledge-base, repo-local only after implementation exists | Do not describe as current default access. |
| Gmail/Calendar/Drive | Knowledge-base capability policy; repo-local connector setup only later | Real access remains approval-gated. |
| Development workflow | Existing agent department docs and OpenClaw collaboration doc | Import only missing procedural details. |
| Runner lane docs | Existing lane-docs route, verifier, and inventory docs | Do not create new route authority. |
| Release/deploy workflow | Future repo-local release checklist | Must not authorize deployment; deployment remains separate approval. |

## Safest Next Implementation Task

The safest next task is another docs-only YELLOW task that imports only one narrow slice:

```text
Create a proposed target mapping issue for the `jeeves` repo-local docs package.
Allowed: one Knowledge-base markdown mapping file or one small update to this alignment plan.
Forbidden: creating repo-local docs directories, live runner edits, services, scripts, deployment, secrets, browser/computer-use enablement, real mail actions, merge.
Validation: git diff --check.
Output: draft PR for ChatGPT review.
```

After review, the first repo-local implementation task should create only the runtime smoke-test doc in the `jeeves` repository, because runtime smoke behavior is already proven and narrow. It should not create the full architecture/security/workflows tree in one step.

## Import Stop Conditions

Stop and ask for review if a proposed doc:

```text
- gives Jeeves current department-management authority
- grants real mail sending/changing/deleting authority
- enables browser/computer-use as a default tool
- includes secret values or production credentials
- treats repo-local docs as overriding Knowledge-base policy
- authorizes runner scripts, services, systemd, deployment, merge, or production changes
- duplicates current canon with conflicting wording
- cannot be mapped to either Knowledge-base policy or repo-local implementation docs
```

## Validation

Required validation for this alignment file:

```bash
git diff --check
```
