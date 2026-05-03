# ChatGPT Exoskeleton Runner, Memory, And Development Workstream Inventory - 2026-05-04

Status: docs-only YELLOW inventory for morning handoff
Scope: ChatGPT exoskeleton / runner planning, Jeeves memory tools design, and development department boundary tracking
Task source: GitHub Issue #176 body provided to the runner
Canon status: operational summary, not new runtime authority

This inventory summarizes public-safe evidence visible in the local Knowledge-base checkout. It does not implement runner behavior, edit scripts, start services, create systemd units, access private Drive, touch secrets, deploy, merge, or expand Jeeves authority.

## Sources Inspected

Primary local sources inspected:

- `projects/jeeves/memory_tools_layer_v1.md`
- `projects/jeeves/memory_inventory_and_donor_map_m1.md`
- `projects/jeeves/memory_capture_classification_templates_m2.md`
- `projects/jeeves/handoff_session_diary_prototype_m3.md`
- `projects/jeeves/host_wrapper_fresh_origin_gate_design_2026_05_03.md`
- `projects/jeeves/host_wrapper_fresh_origin_gate_insertion_point_2026_05_03.md`
- `projects/jeeves/yellow_host_wrapper_source_control_normalization_2026_05_03.md`
- `projects/jeeves/agent_department_current_status_v1.md`
- `projects/jeeves/agent_department_host_smoke_validation_2026_05_03.md`
- `projects/jeeves/agent_department_dry_run_validation_2026_05_03.md`
- `projects/jeeves/runner_health_status_2026_05_02_v1.md`
- `projects/jeeves/runner_lane_docs_next_step_plan_2026_05_02_v1.md`
- `projects/jeeves/runner_autonomous_loop_recovery_2026_05_02.md`
- `projects/jeeves/runner_docs_live_once_smoke_test_v1.md`
- `projects/jeeves/agent_runner_lane_docs_verifier_test_result_v1.md`
- `projects/jeeves/handoffs/chat_freeze_2026-05-03_agent_department_branch.md`
- `projects/jeeves/handoffs/chat_handoff_2026-04-30.md`

Requested `knowledge_base/` paths were not present at that exact location in this checkout, so this inventory uses the available repo-local `projects/jeeves/` evidence and the issue body supplied for this task.

## Active Tracks

| Track | Current public-safe status | Still open | Blocked by | Next safe task |
| --- | --- | --- | --- | --- |
| Memory tools M1-M4 | M0 memory tools architecture exists; M1 inventory/donor map, M2 capture/classification templates, and M3 handoff/session diary prototype exist as docs-only designs. M4 is recommended but not present as an implemented prototype. | M4 startup context builder prototype, then later M5-M8 only after review. | Privacy and canon boundaries: no automatic ingestion, no automatic canonization, no private-to-public transfer, and no runtime activation before separate approval. | Create a docs-only M4 startup context builder prototype that assembles bounded context from current task, canonical KB refs, active issue/PR state, reviewed operational summaries, and non-expired handoffs. |
| YELLOW runner fresh-origin gate | Design and insertion-point reports identify the desired host-side freshness proof before Codex starts. The gate should record minimal metadata and fail closed on ambiguous freshness or dirty state. | Actual gate implementation is not complete in public source-controlled runner material. | Active wrapper boundary appears host-local; Codex/runner contexts previously failed to prove fresh origin from constrained environments. | Open a reviewed source-controlled reference or implementation task for the fresh-origin gate, with no live host apply unless separately approved. |
| Host-wrapper source-control normalization | Public docs identify `agent-run-next-yellow`, loop wrapper, and setup carrier as the relevant active YELLOW wrapper family and recommend inert source-controlled references. | The inert reference directory and scripts are not yet added in this task scope. | Current generic Knowledge-base `lane:docs` wrapper appears host-local, so a normal Knowledge-base PR alone cannot safely update the live gate. | Add inert, redacted, non-executable host-wrapper reference files under an explicitly allowed future path such as `scripts/agent-host-wrapper-reference/`, then review before any host-side apply. |
| Development department / live expansion boundary | Governance, lane plan, dry-run wrapper plan, rollout checklist, and dry-run wrapper scripts are reported merged. Current status remains dry-run preparation, not a live multi-daemon department. | Live `runner-main`, `runner-docs`, `runner-tests`, watchdog, and local reserve validator are not approved to start. Jeeves is not department manager. | Fresh-origin validation gaps, dry-run/live separation risk, and need for ChatGPT review plus user approval. | Repeat or complete dry-run smoke validation from a checkout where fresh-origin update succeeds before any live department expansion. Keep next work to one bounded docs or dry-run wrapper task. |
| Claude dump triage private track | Public KB memory docs allow private/raw evidence only as private evidence or reviewed redacted summaries. No raw private dump material is included here. | Any Claude dump triage remains a private-source handling task, not public KB ingestion. | Private-source boundary: raw private material cannot be copied to GitHub; summaries need explicit redaction, classification, and review. | Create only a private triage plan or public-safe template, not a raw dump summary. Any public note should record classification/routing rules without private details. |

## Merged Or Complete Items Visible In Public KB

- Memory M0-M3 docs are visible as public-safe design artifacts: memory tools layer, M1 inventory/donor map, M2 templates, and M3 handoff/session diary prototype.
- Development department governance and Hetzner lane daemon script plan are recorded as merged in the handoff evidence.
- Current department status reports dry-run wrapper design, rollout checklist, and dry-run wrapper scripts as merged.
- The lane docs verifier test result reports passing `git diff --check`, shell syntax validation, self-tests, and manual accept/reject route checks.
- The runner docs live-once smoke test records a completed docs-only draft-PR smoke path and explicitly does not authorize daemon mode, deployment, runtime changes, broad routing, merge, or secret access.
- Public runner status docs confirm the active intake shape as GitHub Issues with labels for Knowledge-base `lane:docs` YELLOW work, not markdown executor task files.
- Fresh-origin gate design and insertion-point docs are complete as planning artifacts, but not as live implementation.
- Host-wrapper source-control normalization report is complete as a docs-only plan and recommends inert references before any host apply.

## Still-Open Items

- M4 startup context builder prototype has not yet been added as a docs-first prototype.
- M5 operational memory summary and later memory roadmap items remain future work.
- Fresh-origin gate has not been implemented in the active host wrapper through reviewed source control.
- Host-wrapper reference normalization remains future work outside this task's allowed file scope.
- Live development department expansion remains unapproved; current posture is dry-run only.
- The exact autonomous scheduler/daemon state remains unproven in public docs; issue/label queue execution is the safe model.
- Duplicate or superseded historical PRs named in older handoff files require fresh GitHub review before action because local docs may be stale.
- Claude dump triage remains private and cannot be represented in public GitHub with raw content.

## Blocked Items And Reasons

- Fresh-origin proof from constrained runner/Codex contexts is blocked because prior evidence shows Git metadata writes or network freshness checks may fail in that context.
- Live host-wrapper patching is blocked because the active wrapper appears host-local and this task does not authorize edits under live runner paths.
- Full development department launch is blocked pending successful fresh-origin validation, live/dry-run safety review, and explicit ChatGPT plus user approval.
- Jeeves department-manager authority is blocked by the canonical boundary that Jeeves is not manager yet and may only become observer/planner/bounded queue manager after future approval.
- Public Claude dump or private Drive triage is blocked from raw publication by privacy rules: private raw content, secrets, SSH material, env values, Termux details, and IP material must not be copied into GitHub.

## Privacy Note

Private Drive material, Claude dump contents, Termux access details, host/IP material, SSH key material, environment values, credentials, tokens, and raw private logs are not copied raw to GitHub. This inventory uses public-safe summaries only. Private-source-derived information requires explicit redaction, classification, review, and approval before any public publication.

## Non-Authorizations

This file does not authorize:

- runner script edits
- edits to live Hetzner runner paths or `~/agent-dev/bin/*`
- service, daemon, systemd, network, firewall, container, or deploy changes
- secret, SSH key, token, credential, env value, private Drive, or raw Claude dump access
- GitHub issue creation beyond the supplied task
- commits, pushes, merges, PR creation by the author of this docs change, or final approval
- live development department expansion
- marking Jeeves as department manager

ChatGPT review and user approval remain required before merge or any broader action.
