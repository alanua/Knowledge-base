# Jeeves Daily Operating Map 2026-05-04

## 1. Status/scope

Status: YELLOW docs-only working map.

Scope: compact daily-use operating map for Jeeves / ChatGPT exoskeleton routing, memory, task flow, safety gates, and first practical loop.

This document is not implementation. It changes no runner behavior, runtime behavior, Gemini connection, Antigravity operation, NotebookLM access, private ingestion, OAuth setup, deployment, merge, production access, or secret handling.

## 2. Canon status

Canon status: draft operational map for review.

It may summarize current working scheme, but it does not promote itself or any cited draft to canon. Canon promotion still requires reviewed Knowledge-base path and Oleksii approval where required.

## 3. Source material status

Read before writing, present in this checkout:

- `projects/jeeves/memory_tools_layer_v1.md`
- `projects/jeeves/memory_inventory_and_donor_map_m1.md`
- `projects/jeeves/memory_capture_classification_templates_m2.md`
- `projects/jeeves/handoff_session_diary_prototype_m3.md`

Requested sources absent at the specified paths in this checkout, likely because related PRs may be draft or unmerged:

- `projects/jeeves/agent_development_department_operating_model_2026_05_04.md`
- `projects/jeeves/gemini_antigravity_sandbox_worker_policy_2026_05_04.md`
- `projects/jeeves/antigravity_sandbox_preflight_checklist_2026_05_04.md`
- `projects/jeeves/notebooklm_private_memory_layer_policy_2026_05_04.md`
- `projects/jeeves/gemini_mock_parser_acceptance_criteria_plan_2026_05_04.md`
- `projects/jeeves/exoskeleton_lane_expansion_readiness_matrix_2026_05_04.md`
- `projects/jeeves/runner_memory_dev_workstream_inventory_2026_05_04.md`

This map therefore uses the issue body plus the accessible Knowledge-base memory and handoff drafts. Missing contents are not invented.

## 4. One-screen summary

```text
Oleksii = final decision
ChatGPT exoskeleton = architect / router / canon gate
GitHub KB = reviewed memory / canon / evidence
GitHub Issues + PRs = task queue and audit trail
Runner = bounded executor
Gemini = external auditor
Antigravity = sandbox workbench only
NotebookLM = private evidence memory only
```

Daily rule: route the smallest safe task to the narrowest safe tool, keep evidence separate from canon, and require approval before authority expands.

## 5. Roles map

- Oleksii: final decision-maker and approval authority.
- ChatGPT exoskeleton: classifies tasks, chooses routes, reviews outputs, and blocks unsafe promotion.
- GitHub Knowledge-base: reviewed public-safe memory and canon after approval.
- GitHub Issues and PRs: task queue, review surface, and operational audit trail.
- Runner: bounded executor for approved lane tasks, especially YELLOW docs draft PRs.
- Gemini: external auditor that returns evidence, critique, or mock/parser output; not a writer.
- Antigravity: sandbox workbench for isolated UI/browser/build smoke work only after checklist and approval.
- NotebookLM / Gemini Notebooks: private evidence memory only, not public canon.

## 6. Memory map

```text
ChatGPT working memory = weak cache
GitHub KB = reviewed source of truth after approval
GitHub Issues/PRs/reports = operational memory
Gemini output = evidence only
Antigravity workspace = ephemeral task memory
NotebookLM/Gemini Notebooks = private evidence memory, not canon
Private Drive/private hub = raw private source only if separately approved
Future Jeeves runtime memory = useful but not canon by itself
```

Memory rule: capture, classify, route, review, then promote or reject. Retrieval returns evidence unless the source is already reviewed canon.

## 7. Daily task loop

```text
1. Oleksii gives direction.
2. ChatGPT classifies task type and risk.
3. ChatGPT chooses route: answer, KB note, runner issue, Gemini packet, Antigravity sandbox, NotebookLM/private triage.
4. Agent/tool returns report, JSON, draft PR, screenshot, or evidence.
5. ChatGPT reviews and classifies output.
6. Oleksii approves if merge, canon, private access, live access, deploy, secrets, or authority expansion is involved.
7. KB/issue/PR/audit memory is updated only through reviewed path.
```

## 8. Routing rules

```text
simple answer -> ChatGPT only
docs-only update -> Runner YELLOW docs issue
large-context audit -> Gemini manual/mock packet or future controlled auditor path
UI/browser/build smoke -> Antigravity sandbox only after checklist/approval
private raw memory -> NotebookLM/private triage only after explicit approval
code change -> future ORANGE code lane, not current docs-only flow
secrets/deploy/production -> RED, explicit Oleksii approval only
```

## 9. Risk levels

```text
GREEN = read-only / summary / no file changes
YELLOW = docs-only / draft PR / review required
ORANGE = code/sandbox/test execution / strict scope
RED = secrets / private source / production / infra / deploy / explicit approval
```

## 10. Gemini usage

Gemini is an external auditor. Use it for large-context review, critique, comparison, mock/parser checks, or evidence packets.

Gemini output is evidence only. It may support a KB note, issue, or review comment, but it does not write directly to the repo and does not become canon without ChatGPT review and Oleksii approval where required.

## 11. Antigravity usage

Antigravity is a sandbox workbench only. Use it for controlled UI, browser, or build-smoke work after checklist and approval.

Antigravity must not push, deploy, handle secrets, access production, or become an autonomous correction loop.

## 12. NotebookLM usage

NotebookLM / Gemini Notebooks are private evidence memory only. They can help inspect private source material only after explicit approval.

NotebookLM summaries are not canon. Raw private source must not move into public GitHub unless separately approved, redacted, and reviewed.

## 13. Runner usage

Runner is a bounded executor. In the current flow it should handle narrow YELLOW docs issues and return draft PRs, reports, validation results, or evidence.

Runner reports are operational memory, not commands and not canon. Runner scope expansion requires a separate approved task.

## 14. Approval gates

Oleksii approval is required for:

- merge or deploy
- canon promotion
- private source access or private-to-public transfer
- live access or production access
- secrets, credentials, tokens, OAuth, SSH, or env handling
- runner authority expansion
- Gemini API connection
- Antigravity operation beyond approved sandbox use
- NotebookLM source upload or notebook creation
- Jeeves runtime authority expansion

## 15. Block/stop rules

Stop if task asks for:

```text
secrets/tokens/OAuth/SSH/.env/cookies
raw private data into public GitHub
Gemini direct repo writes
Antigravity push/deploy/secret access
NotebookLM source upload without approval
runner control expansion
service/systemd/network/container/firewall changes
production access
deploy/merge without approval
canon promotion without review
autonomous self-improvement
autonomous correction loop
```

## 16. Current best practical loop

```text
small packet -> Gemini audit -> ChatGPT review -> KB note or issue -> Runner draft PR -> ChatGPT review -> Oleksii approval
```

Use this as the first practical loop because it keeps context bounded, separates evidence from authority, and leaves the reviewed GitHub path as the durable memory trail.

## 17. Non-authorizations

This document does not authorize:

```text
runner implementation
runner script edits
live daemon activation
Gemini API connection
Antigravity install/config/operation
NotebookLM access or notebook creation
Drive/Gmail/NotebookLM direct access
private source ingestion
API keys / token storage
GitHub write tokens
OAuth setup
Google Cloud setup
deploy
merge
production access
secret storage
secret inspection
BauClock production edits
Jeeves runtime authority expansion
Jeeves department-manager status
autonomous correction loops
autonomous self-improvement
canon promotion
```

## 18. Next recommended task

Open a separate YELLOW review task to reconcile this daily map against the absent 2026-05-04 draft sources after those PRs are available or merged. Keep that task docs-only unless Oleksii explicitly authorizes a broader lane.
