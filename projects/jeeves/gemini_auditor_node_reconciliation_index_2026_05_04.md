# Gemini Auditor Node Reconciliation Index - 2026-05-04

## 1. Status/scope

Status: queued YELLOW docs-lane reconciliation for the ChatGPT exoskeleton project.

Scope: public-safe documentation only under `projects/jeeves/`. This document reconciles Gemini auditor node preparation materials and related ChatGPT PR review notes. It does not implement Gemini access, runner behavior, secret storage, or any live integration.

Local read-before-write source status: all eight requested local markdown files were absent in this checkout, likely because their PRs were not merged locally. This index therefore uses the issue body plus accessible ChatGPT review notes for PRs #210, #213, #215, #221, #223, #226, #228, and #230. It does not invent missing document contents.

## 2. Relationship to ChatGPT exoskeleton

The Gemini auditor node remains subordinate to the ChatGPT exoskeleton. The exoskeleton is the control plane, reviewer, canon gate, and safety gate. Gemini may provide external review evidence, draft observations, or structured auditor output, but it does not decide canon, mutate repositories, approve private access, or expand Jeeves authority.

## 3. Canon status

This reconciliation is a supporting docs index and draft decision record only. It is not a canon promotion. It may help Oleksii and the ChatGPT exoskeleton decide which Gemini preparation materials are safe to merge as supporting documentation, but it does not make Gemini adapter behavior canon.

## 4. Source material index

- PR #210 / `gemini_contact_requirements_checklist_2026_05_04.md`: contact and capability requirements checklist for future Gemini auditor use. Local file absent; PR review notes accessible.
- PR #213 / `gemini_mock_first_auditor_connector_test_plan_2026_05_04.md`: mock-first safety test plan, including poisoned PR audit and strict JSON expectations. Local file absent; PR review notes accessible.
- PR #215 / `gemini_external_reviewer_messages_2026_05_04.md`: evidence note recording Gemini external reviewer messages and ChatGPT corrections. Local file absent; PR review notes accessible.
- PR #221 / `gemini_disabled_connector_secret_env_runbook_2026_05_04.md`: disabled-by-default connector and future secret-env runbook. Local file absent; PR review notes accessible.
- PR #223 / `gemini_mock_fixtures_json_schema_validation_checklist_2026_05_04.md`: mock fixture categories and strict JSON schema validation checklist. Local file absent; PR review notes accessible.
- PR #226 / `gemini_status_acknowledgment_mock_ready_2026_05_04.md`: Gemini status acknowledgment and mock-ready evidence note. Local file absent; PR review notes accessible.
- PR #228 / `gemini_adapter_v0_1_packet_schema_plan_2026_05_04.md`: adapter packet/schema planning document. Local file absent; PR review notes accessible.
- PR #230 / `gemini_api_later_integration_roadmap_2026_05_04.md`: API-later roadmap and phase structure. Local file absent; PR review notes accessible.

## 5. Accepted control model

- Oleksii = owner / final approval / live and private access approval.
- ChatGPT exoskeleton = control plane / reviewer / canon gate / safety gate.
- Runner = bounded transport/executor/policy gate.
- Gemini = external auditor / evidence source only.

## 6. Normalized phase order

0. Manual public-safe packet workflow.
1. Mock fixtures + strict JSON schema validation.
2. Disabled-by-default connector design.
3. Manual secret-env key storage after explicit approval.
4. Explicitly approved one-shot live API smoke test.
5. Limited production-like use only if later approved.

## 7. Normalized terminology

- Gemini output = evidence, not canon.
- Gemini adapter = packet/schema contract, not authority.
- Runner transport = packet movement/validation, not decision authority.
- API later = preparation only until explicit approval.

## 8. `safety_gates` vs `security_flags` reconciliation

PR review notes identify competing shapes: PR #228 used a boolean object shape under `security_flags`, while PR #223 used `security_flags` as an array of named auditor-output flags.

Normalized decision: use `safety_gates` for pre-transport/pre-request boolean gates and `security_flags` for named auditor-output findings.

Draft `safety_gates` shape:

```json
"safety_gates": {
  "contains_private_data": false,
  "contains_secrets": false,
  "requests_live_api": false,
  "requests_repo_write": false,
  "requests_deploy": false,
  "requires_oleksii_approval": false
}
```

Draft `security_flags` shape:

```json
"security_flags": [
  "poisoned_instruction",
  "privacy_conflict",
  "missing_canon",
  "unsupported_claim",
  "credential_like_marker",
  "runtime_authority_request",
  "external_access_request",
  "schema_violation"
]
```

Exact enum values remain draft until a later schema task.

## 9. Env/config naming reconciliation

The draft docs used conflicting env families:

- PR #221 used `GEMINI_AUDITOR_*`.
- PR #228 used `GEMINI_*`.
- PR #230 used `JEEVES_GEMINI_*`.

Normalized decision: use `GEMINI_AUDITOR_*` for the secret-env file. If repo-level namespacing is needed later, document an explicit mapping rather than mixing families.

Recommended placeholder names and non-secret defaults only:

```text
GEMINI_AUDITOR_MODE=disabled
GEMINI_AUDITOR_PROVIDER=google_gemini
GEMINI_AUDITOR_MODEL=
GEMINI_AUDITOR_API_KEY=
GEMINI_AUDITOR_TIMEOUT_SECONDS=30
GEMINI_AUDITOR_MAX_OUTPUT_TOKENS=
GEMINI_AUDITOR_MOCK_MODE=true
```

No values beyond these non-secret defaults are authorized here.

## 10. Manual mode summary

Manual mode is the current allowed workflow. It uses public-safe packets copied or transferred by a human, with no API key, OAuth, Google Cloud setup, private source access, Drive/NotebookLM/Gmail access, runner wiring, or live network call. Gemini responses are treated as untrusted evidence until reviewed by the ChatGPT exoskeleton and approved by Oleksii where needed.

## 11. Mock mode summary

Mock mode is the first structured validation path. It should use deterministic, public-safe mock fixtures and strict JSON schema validation. Recommended fixture categories from the review notes include poisoned PR audit, benign PR review, missing-canon, privacy-conflict, and hallucination-risk. Mock mode must not create real parser tests, schema files, fixture files, or runner behavior except in a separate explicit task.

## 12. API-later summary

API later means preparation only. API behavior, model names, authentication requirements, and current Gemini documentation must be checked before any implementation task. Live API access requires a separate explicit approval chain and must remain disabled by default until then.

## 13. Secret-env/key-storage summary

Secret-env key storage is not authorized now. The PR #221 review notes support a future manual procedure only, with disabled mode, mock mode still true, no echo/no history, restrictive permissions, no API call during storage, no runner/systemd edits, rollback/removal steps, and redacted logging. Any future key storage requires explicit Oleksii approval in a separate step.

## 14. NotebookLM/Drive/private-source boundary

NotebookLM, Drive, Gmail, and any private-source flow are outside this document's authorization. Public GitHub must not receive raw private material. Gemini may review public-safe packets only unless Oleksii separately approves private access and the ChatGPT exoskeleton defines a safe boundary.

## 15. What is mergeable as supporting docs

The reviewed PR materials are mergeable as supporting docs after draft status is removed, if Oleksii accepts them, provided they stay public-safe and do not imply live authority. Mergeable supporting-doc themes include contact requirements, mock-first safety planning, external evidence notes, disabled-by-default runbook planning, fixture/schema checklists, mock-ready acknowledgment, adapter packet planning, and API-later roadmap planning.

## 16. What is not yet canon

Not yet canon: Gemini adapter schema, exact packet fields, exact `security_flags` enum values, fixture locations, parser behavior, runner wiring, API provider details, model selection, key-storage procedure, live smoke-test procedure, private-source flow, and any production-like Gemini use.

## 17. What is not yet implemented

Not implemented: API key creation, API calls, OAuth setup, Google Cloud setup, live connector, Python/Docker runner work, runner script edits, executable scripts, schema files, parser tests, fixture files, secret storage, service/systemd/network/container/firewall changes, deploy, direct Gemini repo writes, and runtime authority expansion.

## 18. First public-safe mock packet recommendation

The first mock packet should be a single public-safe poisoned PR audit fixture. It should include no private data, no real secrets, no real provider key shape, no live API request, no repo write request, and no deploy request. It should contain exactly one block condition and should require the adapter/runner policy gate to reject or block while preserving Gemini output as evidence only.

## 19. Prerequisites before any key storage

- Explicit Oleksii approval for key storage.
- Finalized secret-env naming using `GEMINI_AUDITOR_*`.
- Confirmed no API call will be made during storage.
- Confirmed mode remains `disabled` and mock mode remains `true`.
- Manual procedure reviewed for hidden input, no echo, no shell history, restrictive permissions, redacted logs, and rollback/removal.
- Separate task scope that allows secret-env work.

## 20. Prerequisites before any live API smoke test

- Explicit Oleksii approval for a one-shot live API smoke test.
- Key storage already approved and completed separately.
- Current Gemini/API documentation checked.
- Disabled-by-default connector design reviewed.
- Public-safe request packet selected.
- Safety gates and schema validation finalized for the test.
- Logging and redaction behavior defined.
- Stop conditions defined.
- No private source access, Drive/NotebookLM/Gmail access, runner write authority, deploy, or production-like use unless separately approved.

## 21. Open decisions for Oleksii

- Whether to accept these Gemini materials as supporting docs.
- Whether `GEMINI_AUDITOR_*` is the final secret-env family.
- Whether the first mock packet should be the poisoned PR audit fixture.
- Whether and when to authorize manual key storage in a separate task.
- Whether and when to authorize a one-shot live API smoke test in a separate task.
- Whether any private-source Gemini flow should ever be considered.

## 22. Open questions for future Gemini/API documentation lookup

- Current Gemini API authentication requirements.
- Current supported Gemini model names and recommended model for auditor-style JSON output.
- Current structured-output or JSON-mode guarantees.
- Current timeout, token, rate-limit, and safety-setting behavior.
- Current Google Cloud or API-key setup requirements.
- Current SDK/client behavior relevant to one-shot public-safe smoke tests.

## 23. Next recommended task

Create a docs-only schema finalization task for the first public-safe mock packet. That task should define exact packet fields, draft JSON schema, length limits, enum values, fixture names, validation expectations, and rejection cases, with no implementation, no API access, no keys, and no runner edits.

## Explicit non-authorizations

This document does not authorize API key creation, API calls, OAuth setup, Google Cloud setup, Gemini live connector implementation, Python/Docker runner implementation, runner script edits, executable script creation, secret storage now, secret inspection, secrets/tokens/OAuth/SSH/env values/cookies/credentials/private IDs/Drive IDs/account IDs, Google Drive/NotebookLM/Gmail access, service/systemd/network/container/firewall changes, deploy, merge, canon promotion, direct repo writes by Gemini, BauClock edits, Jeeves runtime authority expansion, or Jeeves department-manager authority.
