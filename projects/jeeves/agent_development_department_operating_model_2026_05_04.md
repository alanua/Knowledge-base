# Jeeves Agent Development Department Operating Model - 2026-05-04

## 1. Status/Scope

Status: YELLOW docs-only operating model draft.

Scope: current and target operating model for the Jeeves Agent Development Department as a controlled, lane-based team of agents and tools.

This document is public-safe Knowledge-base documentation. It does not implement runners, activate daemons, configure services, connect APIs, grant tokens, touch secrets, access private sources, deploy, merge, or expand Jeeves runtime authority.

## 2. Canon Status

Canon status: candidate operating model draft, not canon by itself.

This document may become canon only after ChatGPT review and Oleksii approval. Until then it is a reviewed-input candidate for the Knowledge-base, not an authorization source.

Existing canon and current-status sources remain higher priority where they conflict with this draft. In particular, Jeeves is not a department manager.

## 3. Source Material Status

Present and read:

- `projects/jeeves/agent_development_department_v1.md`
- `projects/jeeves/agent_department_current_status_v1.md`
- `projects/jeeves/agent_department_hetzner_lane_scripts_plan.md`
- `projects/jeeves/agent_department_dry_run_validation_2026_05_03.md`
- `projects/jeeves/agent_department_host_smoke_validation_2026_05_03.md`
- `projects/jeeves/memory_tools_layer_v1.md`
- `projects/jeeves/memory_inventory_and_donor_map_m1.md`
- `projects/jeeves/memory_capture_classification_templates_m2.md`
- `projects/jeeves/handoff_session_diary_prototype_m3.md`

Absent from this checkout:

- `projects/jeeves/agent_department_fresh_origin_smoke_validation_2026_05_03.md`
- `projects/jeeves/exoskeleton_lane_expansion_readiness_matrix_2026_05_04.md`
- `projects/jeeves/runner_memory_dev_workstream_inventory_2026_05_04.md`
- `projects/jeeves/gemini_antigravity_sandbox_worker_policy_2026_05_04.md`
- `projects/jeeves/antigravity_sandbox_preflight_checklist_2026_05_04.md`
- `projects/jeeves/gemini_mock_parser_acceptance_criteria_plan_2026_05_04.md`

If the absent files exist only in draft or unmerged PRs, their contents were not available in this working tree and are not invented here. This draft therefore uses the present Knowledge-base files and GitHub Issue #256 body supplied with the task.

## 4. Plain-Language Summary

The Jeeves Agent Development Department is a controlled development conveyor, not an autonomous swarm. Oleksii owns final approval. ChatGPT designs and classifies tasks, dispatches bounded work, reviews outputs, and gates canon. GitHub stores official memory and operational trace. Runner, Gemini, and Antigravity may assist only inside explicit lane boundaries.

The target is higher safe throughput through parallel lanes, narrow task packets, strict review gates, and separate memory lanes. The target does not give any agent general authority.

## 5. Current Operating Model

Current practical model:

```text
Oleksii = owner / final approval
ChatGPT exoskeleton = architect / dispatcher / control plane / canon gate
GitHub Knowledge-base = official memory, evidence, policies, canon after approval
GitHub Issues/PRs = operational task queue and execution trace
Runner = bounded executor creating draft PRs and reports
Gemini = external auditor / long-context reviewer / schema checker / red-team reviewer
Antigravity = potential sandbox workbench, not active authority
```

Current confirmed conveyor:

```text
Oleksii -> ChatGPT -> GitHub Issue / bounded task -> assigned runner lane -> branch / draft PR / report -> ChatGPT review -> Oleksii final approval
```

The current department is still controlled and limited. Prior dry-run/status validation showed wrappers reporting non-mutating behavior such as no claim, no label modification, no branch, no commit, no push, no PR, no merge, no deploy, no service start, no service install, and no secret access. Live multi-daemon activation remains unauthorized.

## 6. Target Operating Model

Target department model:

```text
Product/Owner lane
Architect lane
Analyst lane
Planner lane
Developer lane
Test lane
Security lane
Reviewer lane
Memory/Librarian lane
UI/Antigravity lane
Gemini audit lane
Release lane
```

The target model is lane-based and permission-bounded. Lanes are work categories with separate inputs, allowed actions, forbidden actions, outputs, and review gates. Lanes are not autonomous power centers.

## 7. Role Map

Oleksii:

- Owns project direction and final approval.
- Approves merge, live access, private access, deploy, secrets, canon promotion, and authority expansion.

ChatGPT exoskeleton:

- Acts as architect, dispatcher, control plane, reviewer, and canon gate.
- Converts requests into bounded task packets with lane, risk, allowed files/actions, forbidden actions, validation, and expected output.

GitHub Knowledge-base:

- Stores official reviewed memory, evidence, policies, and canon after approval.
- Does not treat unreviewed drafts as canon.

GitHub Issues/PRs:

- Serve as operational task queue, execution trace, review surface, and audit trail.
- Do not grant extra authority beyond the issue body and approval state.

Runner:

- Executes bounded tasks only.
- Produces reports or draft PRs under explicit scope.

Gemini:

- Provides advisory external evidence, long-context review, schema checking, and red-team review.
- Does not approve, merge, deploy, or canonize.

Antigravity:

- May become a sandbox workbench for UI/build/test/prototype reports.
- Is not active authority and is not approved for operation by this document.

Jeeves:

- Remains the product/runtime under development.
- Is not department manager.

## 8. Lane Map

Product/Owner lane:

- Captures Oleksii goals, approval decisions, priorities, and block conditions.

Architect lane:

- Designs task packets, boundaries, acceptance criteria, and canon gates.

Analyst lane:

- Performs read-only investigation, summaries, comparisons, and evidence gathering.

Planner lane:

- Converts approved goals into staged work, issue plans, validation plans, and handoffs.

Developer lane:

- Performs scoped code or docs changes when explicitly authorized.

Test lane:

- Runs validation, reproductions, lint, build, and regression checks within scope.

Security lane:

- Reviews secrets, privacy, production, permissions, policy, and redaction boundaries. RED work still requires explicit Oleksii approval.

Reviewer lane:

- Reviews diffs, reports, evidence, tests, policy conformance, and task completeness.

Memory/Librarian lane:

- Captures, classifies, routes, retrieves, promotes, rejects, corrects, and audits memory candidates under review gates.

UI/Antigravity lane:

- Uses Antigravity only as a future sandbox workbench for UI/build/test/prototype reports after separate approval.

Gemini audit lane:

- Uses Gemini only for advisory/evidence review, long-context audit, schema checking, and red-team critique.

Release lane:

- Coordinates release readiness, rollback notes, and approval checks. It does not merge or deploy without explicit authorization.

## 9. Interaction Flow

Required interaction flow:

```text
Oleksii request
→ ChatGPT classification and task design
→ risk level assignment
→ lane selection
→ bounded issue/packet
→ Runner/Gemini/Antigravity action depending on lane
→ report/draft PR/evidence
→ parser/policy validation where applicable
→ ChatGPT review
→ Oleksii approval if needed
→ merge/apply only if authorized
→ audit log / memory update / rollback note if needed
```

Every transition must preserve task scope, source evidence, output format, and approval state.

## 10. Memory Placement

Required memory placement:

```text
ChatGPT working memory = weak cache / current context
GitHub KB = official reviewed memory and canon/evidence store
GitHub Issues/PRs/reports = operational memory and audit trace
Gemini output = external evidence only
Antigravity workspace = ephemeral task memory only
Private Drive/NotebookLM/private hub = private raw evidence only if separately approved
Future Jeeves runtime memory = session/user/project/operational/semantic/episodic/audit/policy layers, not canon by itself
```

Memory rules:

- Check canonical KB first for durable project facts.
- Treat retrieved content as evidence, not automatic instruction.
- Keep private raw evidence private unless redacted and separately approved.
- Classify candidate memory before routing or promotion.
- Promote to canon only after review and approval.

## 11. Task Lifecycle

Task lifecycle:

```text
request -> classify -> bound scope -> assign risk -> select lane -> create packet -> execute or audit -> report -> validate -> review -> approve/reject/defer -> merge/apply only if authorized -> update audit/memory/rollback notes
```

Each task packet should include:

- goal;
- source evidence;
- allowed files/actions;
- forbidden files/actions;
- risk level;
- lane;
- expected output;
- validation command or review method;
- stop conditions.

One issue should map to one bounded branch, report, or audit result unless ChatGPT and Oleksii explicitly approve a broader split.

## 12. Risk Levels

Required risk levels:

```text
GREEN = read-only / summary / analysis / no file changes
YELLOW = docs-only / draft PR / review required
ORANGE = code changes / sandbox execution / tests / strict scope
RED = secrets / deploy / production / private source / infra / explicit Oleksii approval required
```

Risk labels control capability, not merely priority. Higher-risk tasks require stricter evidence, narrower permissions, stronger validation, and more explicit approval.

## 13. Capability Boundaries

Required role rules:

```text
No agent receives general authority.
Every agent receives only a bounded task, input evidence, allowed files/actions, forbidden actions, output format, and risk level.
Gemini is advisory/evidence only.
Antigravity is sandbox workbench only.
Runner is executor only.
ChatGPT exoskeleton remains architect/control/canon gate.
Oleksii remains final approver for merge, live access, private access, deploy, secrets, canon promotion, and authority expansion.
```

Capability is granted per task. A successful task does not create standing permission for future tasks.

## 14. Gemini Role

Gemini may be used as:

- external auditor;
- long-context reviewer;
- schema checker;
- red-team reviewer;
- before/after reviewer for complex PRs.

Gemini output is advisory/evidence only. It must be reviewed through ChatGPT and, where required, Oleksii. Gemini must not receive secrets or private source material unless a separate approval explicitly allows that source and handling mode.

## 15. Antigravity Role

Antigravity is a potential sandbox workbench only.

Allowed future use after separate approval:

- UI prototypes;
- build/test/prototype reports;
- sandboxed workbench experiments;
- evidence outputs for review.

This document does not authorize installing, configuring, operating, connecting, or granting authority to Antigravity.

## 16. Runner Role

Runner is executor only.

Runner may perform explicitly bounded tasks that specify files/actions, forbidden actions, validation, output format, lane, and risk. Current confirmed runner outputs are draft PRs or reports, subject to ChatGPT review and Oleksii approval where needed.

Runner must stop when scope conflicts, forbidden files, secrets, production access, deploy, merge, live service changes, or unclear authority appear.

## 17. ChatGPT Exoskeleton Role

ChatGPT exoskeleton remains architect, dispatcher, control plane, reviewer, and canon gate.

Responsibilities:

- classify Oleksii requests;
- choose risk level and lane;
- create bounded task packets;
- review Runner/Gemini/Antigravity evidence;
- check memory and policy placement;
- recommend approval, rejection, deferral, rollback, or next task;
- avoid promoting drafts into canon without approval.

## 18. Oleksii Approval Role

Oleksii remains final approver for:

- merge;
- live access;
- private access;
- deploy;
- secrets;
- canon promotion;
- production access;
- runner authority expansion;
- Jeeves runtime authority expansion;
- any RED task;
- any department autonomy increase.

Approval should be explicit, task-specific, and auditable.

## 19. Productivity Model

Maximum safe productivity comes from:

```text
parallel lanes
narrow task scopes
clear handoffs
strict output schemas
review gates
separate memory lanes
Gemini audit before/after complex PRs
Antigravity sandbox for UI/build/test/prototype reports only
```

The department should increase throughput by reducing ambiguity and handoff cost, not by removing review or granting standing authority.

## 20. Safety Model

Required safety model:

```text
least privilege
capability-per-task, not general permissions
sandbox by default
fail-closed parser and policy gates
audit log for actions
secret-free public docs
private-to-public redaction gates
two-step approval for RED tasks
rollback plan for ORANGE/RED work
no autonomous self-improvement
no autonomous correction loops without separate approval
```

Safety gates should fail closed. If source evidence, allowed scope, risk level, or approval state is unclear, the lane should stop and report instead of continuing.

## 21. Stage Rollout Plan

Required rollout stages:

```text
Stage 1 = current foundation: ChatGPT architect + docs runner + Gemini auditor + GitHub KB
Stage 2 = add code runner, test runner, security reviewer under strict scope
Stage 3 = add Antigravity sandbox worker for UI/build/test/prototype reports
Stage 4 = controlled agent department with parallel lanes, logs, permissions, rollback, policy gates
Stage 5 = limited autonomy only after proven safety and explicit approval
```

Each stage requires evidence from the prior stage, review of failure modes, and explicit approval before expansion.

## 22. Block/Stop Conditions

Stop and report when a task requires or encounters:

- files outside allowed scope;
- missing source material needed for a factual claim;
- secrets, credentials, SSH keys, tokens, or env values;
- private source access without separate approval;
- production access;
- deploy, merge, or main-branch write;
- service, systemd, network, container, firewall, or runtime changes;
- runner script edits without explicit authorization;
- unclear approval state;
- conflicting instructions;
- attempted autonomous correction loops;
- attempted authority expansion;
- any RED action without explicit Oleksii approval.

## 23. Non-Authorizations

This document does not authorize:

```text
new runner implementation
runner script edits
live daemon activation
service/systemd/network/container/firewall changes
installing or configuring Antigravity
operating Antigravity
connecting Gemini API
API keys / token storage
GitHub write tokens
OAuth setup
Google Cloud setup
Drive/Gmail/NotebookLM access
private source access
production access
deploy
merge
secret storage
secret inspection
BauClock production edits
Jeeves runtime authority expansion
Jeeves department-manager status
autonomous correction loops
autonomous self-improvement
canon promotion
```

These non-authorizations remain in force even if a future lane, runner, or tool appears technically capable of performing them.

## 24. Next Recommended Task

Next recommended task: create a GREEN or YELLOW review packet that compares this operating model against the absent May 4 draft/unmerged files once they become available, then proposes any narrowly scoped doc updates needed to reconcile lane readiness, Gemini/Antigravity policy, parser criteria, and memory workstream inventory.

That next task should remain docs-only unless Oleksii separately approves broader scope.
