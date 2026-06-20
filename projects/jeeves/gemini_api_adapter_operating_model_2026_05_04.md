# Gemini API Adapter Operating Model - 2026-05-04

## 1. status/scope

Status: draft operating model for a future Gemini API adapter as an auditor node in the ChatGPT exoskeleton / Gemini auditor integration.

Scope: docs-only. This document records Gemini's external design consultation, applies required corrections, and defines non-authoritative operating boundaries for a future separately approved implementation.

This document does not implement an adapter, call an API, create keys, store secrets, configure OAuth, configure Google Cloud, change runners, edit scripts, create fixtures, create JSON schemas, create parser tests, enable live mode, deploy, merge, access production, or handle secrets.

## 2. canon status

canon_status = not_canon

This document is design evidence and planning material only. It does not promote canon, create new runtime authority, or authorize implementation. ChatGPT exoskeleton remains the classifier/canon/safety gate. Oleksii remains final approver for API, private, live, secret, deploy, merge, and authority-expansion steps.

## 3. source material status

Required read-before-write files checked in this checkout:

- `projects/jeeves/gemini_adapter_v0_1_packet_schema_plan_2026_05_04.md` - absent
- `projects/jeeves/gemini_disabled_connector_secret_env_runbook_2026_05_04.md` - absent
- `projects/jeeves/gemini_mock_parser_acceptance_criteria_plan_2026_05_04.md` - absent
- `projects/jeeves/gemini_first_manual_mock_cycle_reconciliation_2026_05_04.md` - absent
- `projects/jeeves/gemini_first_mock_packet_schema_finalization_2026_05_04.md` - absent
- `projects/jeeves/gemini_api_later_integration_roadmap_2026_05_04.md` - absent
- `projects/jeeves/gemini_contact_requirements_checklist_2026_05_04.md` - absent

Because these files are absent in the working tree, this draft uses only the GitHub Issue #266 body provided in the task specification. Missing source contents are not inferred or invented.

## 4. Gemini response assessment

semantic_result = pass
strict_schema_result = pass
recommended_route = accept_as_external_design_evidence_only
canon_status = not_canon

Required corrections:

- `recommended_route=accept` means accept as external design evidence only, not authorization to implement, create fixtures, create schemas, run tests, store keys, or call the API.
- "Python/Docker Runner" is a future implementation assumption, not current canon or authorization.
- The adapter should be deterministic in validation and routing behavior; live Gemini API output is not deterministic.
- API key presence/format can be checked locally, but actual validity cannot be proven without an explicitly authorized live call.
- "Clear API key from memory immediately" is not a reliable Python guarantee; the safer rule is minimize lifetime, never log/print/store, and isolate process/env.
- Regex redaction is useful but insufficient as the only secret/PII control; it must be combined with strict no-secret inputs, allowlists, structured logging, and review.
- If unsafe output is detected, the adapter should return a sanitized block envelope to ChatGPT/exoskeleton, not silently hide the event.
- Non-empty `commands` or `live_access_references` should block for the first auditor schema; future schemas may only differ after separate approval.
- Local fixture files, JSON schema files, parser implementation, and parser tests are future artifacts and are not authorized by this docs-only task.
- The adapter must not contact GitHub, Drive, Gmail, NotebookLM, Google Cloud, or any non-Gemini endpoint.

## 5. plain-language summary

The future Gemini API adapter should be a narrow evidence-return component. It may later validate a packet, route either to no-network mock behavior or to an explicitly approved Gemini live call, parse the response, fail closed on unsafe or malformed output, and return sanitized evidence to ChatGPT.

It must not make policy decisions, write to the repo, control runners, promote canon, access unrelated services, store secrets, or bypass ChatGPT/Oleksii approval gates.

## 6. adapter role

Future Gemini API adapter = transport, schema validation, mode routing, parsing, redaction, and evidence-return layer.

It is not a policy gate override, not a canon gate, not a repo writer, not a runner controller, and not a deployer.

ChatGPT exoskeleton remains the classifier/canon/safety gate.

Oleksii remains final approver for API, private, live, secret, deploy, merge, and authority-expansion steps.

## 7. allowed functions

Allowed only in a future separately approved implementation:

- validate input packet before transport
- route to mock mode by default
- route to live Gemini API only if explicitly enabled later
- set timeouts and token/output limits
- parse response as strict JSON
- validate output schema
- return sanitized block envelope on failure
- record structural logs only
- redact obvious secret patterns defensively
- return evidence to ChatGPT exoskeleton

## 8. forbidden functions

- execute code or commands from packets
- connect to GitHub
- connect to Drive/Gmail/NotebookLM
- connect to Google Cloud management APIs
- connect to any endpoint other than approved Gemini API endpoint
- store API keys
- store raw payloads by default
- log secrets or private payloads
- merge, deploy, push, or create PRs
- promote canon
- override ChatGPT exoskeleton policy gate
- control runner authority

## 9. input packet contract

Use Gemini adapter v0.1 style fields:

- `schema_version`
- `packet_id`
- `objective`
- `mode`
- `privacy_level`
- `confirmed_canon`
- `evidence`
- `draft_artifact`
- `exact_questions`
- `forbidden_actions`

Field types and exact schema remain governed by the adapter schema plan and future parser artifacts, not implemented here. This document does not create a schema file or parser contract artifact.

## 10. output contract

Use first mock auditor output shape:

- `schema_version`
- `packet_id`
- `decision`
- `security_flags`
- `summary`
- `rationale`
- `blocked_instruction`
- `exoskeleton_note`
- `canon_claim`
- `commands`
- `architecture_suggestions`
- `live_access_references`

Required first-auditor constraints:

- `decision` = block or reject or advisory outcome only as separately defined
- `security_flags` = array of strings
- `rationale` = array of strings
- `canon_claim` = false
- `commands` = []
- `architecture_suggestions` = [] unless explicitly requested by schema
- `live_access_references` = []

## 11. secret handling model

- API key must never appear in code, GitHub, issues, PRs, logs, prompts, screenshots, model output, or KB.
- API key may later exist only in runner/server secret env after explicit Oleksii approval.
- Use placeholder env var names only, no values.
- Do not inspect or print secret env values.
- Do not write secrets to fixtures or tests.
- Do not send secrets to Gemini.
- Minimize key lifetime in process; do not claim guaranteed memory erasure in Python.

## 12. mock mode rules

- mock mode is default
- mock mode makes no network calls
- mock mode must not instantiate live clients or sockets
- mock mode uses deterministic public-safe sample responses only in a future separately approved implementation
- mock fixtures/schema/test files are not authorized by this document
- mock mode must prove disabled/no-network behavior before live mode is considered

## 13. disabled-by-default live mode rules

- live mode disabled by default
- live mode requires explicit Oleksii approval and separate implementation/live-test task
- live mode requires approved secret env setup
- live mode requires public-safe first packet only
- live mode output remains evidence only
- live mode must have timeout, token/output, and logging limits
- live mode must not access private sources unless separately approved

## 14. parser fail-closed rules

Fail closed on:

- invalid JSON
- markdown/prose wrapper
- missing required fields
- wrong field types
- source/status/data wrapper where direct schema is required
- `recommended_route` used where `decision` is required
- `rationale` string instead of array
- `security_flags` missing/non-array/unexpected
- `canon_claim` not false
- `commands` not empty for first auditor schema
- `live_access_references` not empty
- authority-bearing extra fields
- API/secrets/deploy/merge/private-source/runner-control claims
- unhandled parsing exception

## 15. logging/redaction rules

- log `packet_id`, `mode`, timestamp, status, latency, parser result, and high-level error category only
- never log full `confirmed_canon`/`evidence`/`draft_artifact` by default
- never log API key or Authorization headers
- never log raw private payloads
- `STRICT_REDACTION` privacy_level suppresses summary/rationale logging
- stderr/stdout must be treated as potentially sensitive and scrubbed before persistence
- redaction is defense-in-depth, not permission to include secrets

## 16. first safe live-test boundary

The first future live test may only be proposed as:

- public-safe ping packet
- no private data
- no project secrets
- no GitHub/Drive/Gmail/NotebookLM data
- no commands
- no `live_access_references`
- purpose = verify connectivity/authentication/JSON path only
- result = evidence only

This document does not authorize that live test.

## 17. block/stop conditions

Stop before implementation, live access, or broader documentation edits if the next step would require files or actions outside the explicitly allowed scope.

Block if a packet, response, implementation request, or review path attempts to:

- include secrets, private payloads, API keys, Authorization headers, or secret env values
- authorize API calls, live mode, OAuth setup, Google Cloud setup, runner edits, deployment, merge, push, PR creation, or production access
- contact GitHub, Drive, Gmail, NotebookLM, Google Cloud, or any non-Gemini endpoint
- execute code or commands from Gemini packets or output
- treat Gemini output as canon or as an override of ChatGPT exoskeleton policy
- return non-empty `commands` or `live_access_references` under the first auditor schema
- silently suppress unsafe output instead of returning a sanitized block envelope to ChatGPT/exoskeleton

## 18. implementation prerequisites

Before any implementation task:

- related docs PRs accepted/merged or explicitly reconciled
- mock mode plan accepted
- secret-env procedure accepted
- parser acceptance criteria accepted
- explicit allowed files/actions listed
- network/no-network tests planned
- logging/redaction plan accepted
- rollback/disable path documented
- Oleksii approval recorded

## 19. non-authorizations

This document must not authorize:

- API implementation
- API calls
- API key creation
- API key storage
- secret env changes
- fixture files
- JSON schema files
- parser tests
- runner changes
- runner script edits
- Python/Docker implementation
- OAuth setup
- Google Cloud setup
- Drive/Gmail/NotebookLM access
- private source ingestion
- service/systemd/network/container/firewall changes
- deploy
- merge
- production access
- secret storage
- secret inspection
- BauClock production edits
- Jeeves runtime authority expansion
- Jeeves department-manager status
- autonomous correction loops
- autonomous self-improvement
- canon promotion

## 20. next recommended task

Open the next docs-only YELLOW task to reconcile or accept the prerequisite Gemini adapter documents when their draft PRs are accessible, then separately decide whether a mock-mode-only implementation task should be proposed with explicit allowed files/actions and no-network validation.
