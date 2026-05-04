# Gemini API-Later Integration Roadmap

## 1. Status/Scope

Status: queued roadmap draft for future consideration.

Scope: public-safe, docs-only roadmap under `projects/jeeves/` for a possible later Gemini API integration after manual/mock-first validation.

This document does not authorize or implement API access, OAuth, Gemini calls, runner integration, live connector behavior, private-source API flow, secrets handling, deployment, or runtime authority expansion.

Read-before-write source status:

- `projects/jeeves/gemini_external_reviewer_messages_2026_05_04.md`: absent in this worktree.
- `projects/jeeves/gemini_contact_requirements_checklist_2026_05_04.md`: absent in this worktree.
- `projects/jeeves/gemini_mock_first_auditor_connector_test_plan_2026_05_04.md`: absent in this worktree.
- `projects/jeeves/private_source_routing_design_m6_2026_05_04.md`: absent in this worktree.
- `projects/jeeves/operational_memory_summary_prototype_m5_2026_05_04.md`: absent in this worktree.
- `projects/jeeves/fresh_origin_gate_implementation_decision_record_2026_05_04.md`: absent in this worktree.
- `projects/jeeves/exoskeleton_lane_expansion_readiness_matrix_2026_05_04.md`: absent in this worktree.

Because these source files are absent, possibly because related PRs are still draft or unmerged, this roadmap uses only the issue body specification and does not invent missing contents.

## 2. Decision Summary: Manual/Mock-First Now, API Later

Decision: manual/mock-first now, API later.

Current authorized path:

- Prepare manual review packets for Gemini as an external auditor.
- Validate the workflow with mock fixtures before any live API work.
- Keep the ChatGPT exoskeleton as the control plane, reviewer, canon gate, and safety gate.
- Keep Gemini as an external auditor and evidence source only.

`API later` means:

- No API key now.
- No OAuth now.
- No Gemini API call now.
- No runner integration now.
- No live connector now.
- No private-source API flow now.

## 3. Relationship to ChatGPT Exoskeleton

The future Gemini integration must preserve this control model:

```text
Oleksii = owner / final approval / live/private access approval
ChatGPT exoskeleton = control plane / reviewer / canon gate / safety gate
Runner = bounded executor / transport / policy gate
Gemini = external auditor / evidence source only
```

Gemini may provide review evidence, structured observations, or external audit feedback. Gemini must not become a decision-maker, canon promoter, department manager, source-of-truth writer, or runtime authority.

The ChatGPT exoskeleton remains responsible for interpreting Gemini output, checking it against project canon, applying safety gates, and asking Oleksii for approval where required.

## 4. Canon Status

This roadmap is non-canonical planning material unless separately reviewed and promoted through the established canon process.

It does not promote Gemini materials into canon, does not supersede existing Jeeves documents, and does not mark any API path as approved for implementation.

## 5. Prerequisites Before API Work

Before any API implementation task may be opened, all of the following must be true:

- PR #215 reviewed or superseded.
- Gemini materials reconciled/indexed after #208/#209/#212 outputs are accepted or rejected.
- Mock fixture exists.
- Strict JSON schema exists.
- Parser validation exists in design or tests.
- Policy gate defines block behavior for `security_flags`.
- Live mode defaults disabled.
- Explicit Oleksii approval is required for key creation and first live call.
- Secrets storage path is approved outside GitHub.
- Logging policy excludes prompts/responses containing private data or secrets.

Additional prerequisite: this roadmap, or a successor document, must be reviewed against the then-current Gemini/API documentation before implementation work begins.

## 6. Phase 0: Manual Packet Workflow

Goal: validate Gemini as an external auditor without API access.

Allowed shape:

- ChatGPT exoskeleton prepares a public-safe review packet.
- Oleksii approves any packet that includes sensitive, private, or live-source context.
- Gemini response is manually pasted back as external evidence.
- ChatGPT exoskeleton reviews the response for usefulness, contradictions, unsafe recommendations, and canon compatibility.
- Runner behavior does not change.

Exit criteria:

- Manual packet format is stable enough to repeat.
- Gemini response expectations are clear enough to become mock fixtures.
- Stop conditions are identified for unsafe or unusable Gemini feedback.

## 7. Phase 1: Mock Fixture and Strict JSON Schema Validation

Goal: validate the intended data contract without a live Gemini call.

Required artifacts before implementation:

- One or more mock Gemini response fixtures.
- Strict JSON schema for accepted Gemini audit output.
- Parser validation design or tests.
- Explicit handling for missing fields, extra fields, malformed JSON, unsupported values, and `security_flags`.

Expected validation behavior:

- Valid mock responses parse into bounded review evidence.
- Invalid mock responses fail closed.
- Any `security_flags` block behavior is explicit and testable.
- Parser output cannot directly write to canon or trigger runner actions.

## 8. Phase 2: Disabled-by-Default API Adapter Design

Goal: design the adapter boundary without enabling live access.

The adapter design, if later approved, must:

- Default to disabled live mode.
- Require explicit configuration before any live call can be attempted.
- Keep prompt assembly, request execution, response parsing, and policy gating as separate steps.
- Treat Gemini output as evidence only.
- Prevent Gemini from writing directly to the repository.
- Prevent Gemini from invoking runner commands.
- Prevent private-source API flow unless explicitly approved in a later task.

This phase may define interfaces, config names, fixtures, validation rules, and approval gates. It may not create credentials, call Gemini, change runner scripts, or configure cloud resources.

## 9. Phase 3: Explicitly Approved Live API Smoke Test

Goal: perform one narrow live smoke test only after explicit Oleksii approval.

Preconditions:

- Oleksii approves API key creation.
- Oleksii approves the first live call.
- Secret storage path is approved outside GitHub.
- Live mode remains disabled unless explicitly enabled for the test.
- Test prompt is public-safe and contains no secrets, private data, private IDs, account IDs, Drive IDs, cookies, tokens, SSH data, or credentials.
- Logging policy is active and excludes prompts/responses containing private data or secrets.

Smoke test boundaries:

- One public-safe request.
- No private-source content.
- No runner authority expansion.
- No production deployment.
- No canon promotion from test output.

## 10. Phase 4: Limited Production-Like Use, If Ever Approved

Goal: define a future bounded operating mode only if Oleksii explicitly approves it after prior phases succeed.

Possible constraints:

- Live mode remains opt-in and reversible.
- Gemini remains an external auditor/evidence source only.
- ChatGPT exoskeleton remains the review and canon gate.
- Runner remains a bounded executor/transport/policy gate.
- Private data use requires separate explicit approval.
- Logs remain redacted and must not retain sensitive prompts or responses.

This phase is not currently authorized.

## 11. Required Gemini-Side Information Before API Work

Before API implementation, collect public-safe answers from current Gemini/API documentation or approved Gemini-side materials:

- Supported authentication methods relevant to the chosen API path.
- Current request/response format for the selected model endpoint.
- JSON/schema support behavior, if any.
- Rate limits and quota behavior.
- Error classes and retry guidance.
- Data retention and training controls.
- Logging or observability behavior controlled by the provider.
- Safety filter behavior and how blocked responses are represented.
- Model/version naming rules.
- Terms or policy constraints relevant to sending project review packets.

No account IDs, project IDs, keys, OAuth data, or private tenant identifiers should be recorded in this repository.

## 12. Required Runner-Side Safeguards

Any future runner-side design must include:

- Live mode disabled by default.
- Explicit policy gate before request execution.
- Explicit policy gate after response parsing.
- Fail-closed behavior for malformed responses.
- Block behavior for `security_flags`.
- No direct repository writes from Gemini output.
- No direct canon promotion from Gemini output.
- No command execution based only on Gemini output.
- No private-source API flow without a separate approval task.
- Public-safe default test prompt.

## 13. Required Config/Env Variable Names Without Values

Placeholder names only; no values are authorized in this repository.

Potential future names:

- `JEEVES_GEMINI_API_ENABLED`
- `JEEVES_GEMINI_API_KEY`
- `JEEVES_GEMINI_MODEL`
- `JEEVES_GEMINI_API_BASE_URL`
- `JEEVES_GEMINI_TIMEOUT_SECONDS`
- `JEEVES_GEMINI_MAX_OUTPUT_TOKENS`
- `JEEVES_GEMINI_LOG_LEVEL`
- `JEEVES_GEMINI_REDACTION_MODE`
- `JEEVES_GEMINI_FIXTURE_PATH`
- `JEEVES_GEMINI_STRICT_SCHEMA_PATH`

These names are placeholders, not final implementation approval.

## 14. Secret Storage and Rotation Requirements

Future secret handling must:

- Store secrets outside GitHub.
- Use an Oleksii-approved secret storage path before key creation.
- Never place keys, OAuth data, tokens, cookies, account IDs, private IDs, or credentials in docs, commits, logs, fixtures, issues, or PR bodies.
- Define who may create, view, rotate, and revoke secrets.
- Define rotation timing before first live use.
- Define immediate revocation steps for suspected exposure.
- Keep local development and production-like secret handling separate unless explicitly approved.

## 15. Logging/Redaction Requirements

Future logging must:

- Exclude secrets and credential material.
- Exclude prompts/responses containing private data unless a separate approved logging policy exists.
- Redact environment variable values.
- Redact API keys, tokens, OAuth data, cookies, SSH material, account IDs, private IDs, and Drive IDs.
- Avoid storing raw Gemini responses when they include private or sensitive content.
- Log only bounded metadata needed for debugging, such as phase name, validation result, non-sensitive error class, and whether a policy gate blocked execution.

## 16. Failure/Stop Conditions

Stop API preparation or execution if any of the following occur:

- Oleksii approval is missing for key creation or first live call.
- A required prerequisite is incomplete.
- Mock fixture or strict schema is missing.
- Parser validation is missing.
- Live mode would default enabled.
- Secret storage path is not approved outside GitHub.
- Prompt or response would include secrets or private data without explicit approval.
- Gemini output includes `security_flags` requiring a block.
- Response is malformed, ambiguous, unsupported, or fails strict schema validation.
- API behavior would expand runner authority.
- Gemini output would be treated as canon without review.
- Implementation would require forbidden files or broader scope.

## 17. Non-Authorizations

This roadmap does not authorize:

- API key creation.
- API calls.
- OAuth setup.
- Google Cloud setup.
- Gemini live connector implementation.
- Python/Docker runner implementation.
- Runner script edits.
- Secrets, tokens, OAuth data, SSH, env values, cookies, credentials, private IDs, Drive IDs, or account IDs.
- Google Drive, NotebookLM, or Gmail access.
- Service, systemd, network, container, or firewall changes.
- Deployment.
- Merge.
- Canon promotion.
- Direct repo writes by Gemini.
- BauClock edits.
- Jeeves runtime authority expansion.
- Marking Jeeves as department manager.

## 18. Open Questions for Oleksii

- Should Gemini API work remain blocked until all manual/mock-first artifacts are accepted, or can design-only preparation begin once PR #215 is reviewed or superseded?
- Who may approve the first live API smoke test besides Oleksii, if anyone?
- What is the approved off-GitHub secret storage location for any future key?
- Should private-source review through Gemini remain permanently forbidden, or only require a separate explicit approval gate?
- What minimum evidence is required before limited production-like use can be considered?

## 19. Open Questions for Future Gemini/API Docs

- Which Gemini endpoint and model family are appropriate for external audit evidence?
- What is the current supported method for strict JSON output?
- How are safety blocks, refusals, partial responses, and malformed outputs represented?
- What provider-side data retention and training controls apply to API requests?
- What retry, timeout, and quota behavior should the adapter expect?
- What current authentication method is recommended for this use case?
- What API terms constrain automated review of project packets?

## 20. Next Recommended Task

Create the manual/mock-first Gemini auditor fixture and strict JSON schema design after the missing Gemini materials are reconciled/indexed or explicitly rejected, and after PR #215 is reviewed or superseded.
