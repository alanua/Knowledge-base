# Gemini Adapter v0.1 Packet Schema Plan

## 1. Status/scope

Status: draft preparation for a controlled YELLOW docs-only task.

Scope: public-safe packet templates and JSON schema validation planning for later Gemini cooperation through the ChatGPT exoskeleton.

This document does not authorize live Gemini API integration, API keys, OAuth, Google Cloud setup, runner implementation, services, deploys, merges, direct repo writes by Gemini, or Jeeves runtime authority expansion.

Required read-before-write source status:

- `projects/jeeves/gemini_external_reviewer_messages_2026_05_04.md`: absent in this checkout.
- `projects/jeeves/gemini_contact_requirements_checklist_2026_05_04.md`: absent in this checkout.
- `projects/jeeves/gemini_mock_first_auditor_connector_test_plan_2026_05_04.md`: absent in this checkout.
- `projects/jeeves/gemini_api_later_integration_roadmap_2026_05_04.md`: absent in this checkout.
- `projects/jeeves/private_source_routing_design_m6_2026_05_04.md`: absent in this checkout.
- `projects/jeeves/operational_memory_summary_prototype_m5_2026_05_04.md`: absent in this checkout.

Because those files are absent, this plan uses only the GitHub Issue #218 body provided with the task. Missing contents are not inferred.

## 2. Relationship to ChatGPT exoskeleton

Gemini adapter v0.1 is a cooperation preparation packet format for evidence gathering. ChatGPT exoskeleton remains control/canon/safety gate.

Automatic cooperation preparation does not mean live automation is authorized.

Gemini output is evidence only.

Runner may transport and validate packets later.

Oleksii approves keys, first live call, private access, deploy, and merge.

## 3. Canon status

This document is non-canon draft planning. It does not promote any Gemini behavior, packet schema, transport mechanism, or runner authority to canon.

Any future canon adoption requires explicit review and approval through the normal ChatGPT exoskeleton control path.

## 4. Adapter v0.1 goal

Adapter v0.1 should define the smallest public-safe packet contract that can later support:

- manual copy-paste review;
- mock transport tests;
- strict JSON shape validation;
- block/reject decisions before any model output is treated as evidence;
- a disabled-by-default future API transport path after explicit approval.

The adapter must separate transport from authority. Transport may move packets later; it must not make Gemini authoritative.

## 5. Intake packet template

The intake packet is the object sent to Gemini, whether copied manually, loaded through a mock file, or transported by a future disabled-by-default API path.

```json
{
  "schema_version": "gemini_adapter_v0_1",
  "packet_type": "intake",
  "packet_id": "public-safe-test-001",
  "created_at_utc": "2026-05-04T00:00:00Z",
  "source_project": "jeeves",
  "control_system": "chatgpt_exoskeleton",
  "task_title": "Public-safe external review request",
  "task_context": {
    "summary": "Review the provided public-safe task packet and return evidence only.",
    "allowed_sources": [
      "public_repo_docs",
      "provided_packet_text"
    ],
    "disallowed_sources": [
      "private_accounts",
      "secrets",
      "oauth_data",
      "google_drive",
      "gmail",
      "notebooklm"
    ]
  },
  "instructions": [
    "Return evidence only.",
    "Do not claim canon authority.",
    "Do not request secrets or private identifiers.",
    "Do not write to the repository.",
    "Use only the provided public-safe packet content."
  ],
  "requested_output": {
    "format": "json",
    "schema_version": "gemini_adapter_v0_1",
    "required_sections": [
      "summary",
      "findings",
      "risks",
      "unknowns",
      "recommendation",
      "security_flags"
    ]
  },
  "security_flags": {
    "contains_private_data": false,
    "contains_secrets": false,
    "requests_live_api": false,
    "requests_repo_write": false,
    "requests_deploy": false,
    "requires_oleksii_approval": false
  }
}
```

## 6. Output packet template

The output packet is evidence returned by Gemini. It is never canon by itself.

```json
{
  "schema_version": "gemini_adapter_v0_1",
  "packet_type": "output",
  "packet_id": "public-safe-test-001",
  "responded_at_utc": "2026-05-04T00:00:00Z",
  "source_model": "gemini_manual_or_mock",
  "summary": "Short evidence summary.",
  "findings": [
    {
      "id": "finding-001",
      "severity": "info",
      "claim": "The packet is public-safe based on provided fields.",
      "evidence": "No secrets or private identifiers are present in the supplied packet.",
      "confidence": "medium"
    }
  ],
  "risks": [
    {
      "id": "risk-001",
      "description": "Future API mode would require explicit key handling approval.",
      "blocked_by_default": true
    }
  ],
  "unknowns": [
    "No external private source access was available or authorized."
  ],
  "recommendation": {
    "decision": "evidence_only",
    "rationale": "ChatGPT exoskeleton must decide whether the evidence is useful."
  },
  "security_flags": {
    "contains_private_data": false,
    "contains_secrets": false,
    "requests_live_api": false,
    "requests_repo_write": false,
    "requests_deploy": false,
    "requires_oleksii_approval": false
  }
}
```

## 7. JSON schema validation checklist

Future validation should reject packets unless all checks pass:

- top-level value is a JSON object;
- `schema_version` is exactly `gemini_adapter_v0_1`;
- `packet_type` is exactly `intake` or `output`;
- `packet_id` is a non-empty public-safe string with a conservative length limit;
- timestamps use UTC ISO 8601 strings ending in `Z`;
- unknown top-level fields are rejected unless explicitly added to the schema;
- required fields are present for the packet type;
- string fields have maximum lengths;
- arrays have maximum item counts;
- enum fields accept only documented values;
- `security_flags` exists and contains only documented boolean fields;
- any flag indicating secrets, private data, live API, repo write, deploy, or approval requirement triggers block/reject handling;
- output packets cannot contain raw private source text, credentials, account IDs, Drive IDs, cookies, OAuth material, SSH material, or environment values;
- output packets are stored or reviewed only as evidence, never as canon.

## 8. `security_flags` policy handling

`security_flags` must be treated as policy gates, not metadata decoration.

Required v0.1 flags:

```json
{
  "contains_private_data": false,
  "contains_secrets": false,
  "requests_live_api": false,
  "requests_repo_write": false,
  "requests_deploy": false,
  "requires_oleksii_approval": false
}
```

If any flag is `true`, missing, non-boolean, or unknown, the runner should reject the packet in strict mode. The only exception is a future explicitly approved review mode that still blocks transport and requires human inspection.

## 9. Block/reject behavior

The adapter should block or reject when a packet:

- contains or requests secrets, tokens, OAuth data, SSH material, cookies, credentials, private IDs, Drive IDs, or account IDs;
- requests Google Drive, NotebookLM, Gmail, private account, or private source access;
- requests live API calls before Oleksii approves the first live call;
- requests repo writes by Gemini;
- requests deploy, merge, service changes, systemd changes, network changes, container changes, firewall changes, or runtime authority expansion;
- marks Gemini output as canon;
- attempts to bypass the ChatGPT exoskeleton safety gate.

Rejected packets should produce a public-safe rejection reason and no Gemini request.

## 10. Manual copy-paste mode

Manual copy-paste mode is the first authorized operating mode for this plan.

In this mode, a human copies the public-safe intake packet into Gemini and copies the returned JSON-like evidence back for review. The runner does not call Gemini, does not hold keys, and does not write Gemini output directly to the repository.

## 11. Mock transport mode

Mock transport mode may later read a prepared intake JSON file and pair it with a fixture output JSON file. It is for validator and workflow testing only.

Mock mode must not make network calls, use keys, contact Google services, access private sources, or change runtime behavior.

## 12. Future API transport mode, disabled by default

Future API transport mode is a placeholder plan only. It must remain disabled by default.

Before any API mode is enabled, Oleksii must explicitly approve key handling, the first live call, private access boundaries, deploy, and merge. API mode must still treat Gemini output as evidence only and must keep ChatGPT exoskeleton as the control/canon/safety gate.

## 13. Placeholder environment variable names without values

Future API mode may define placeholder names such as:

- `GEMINI_ADAPTER_ENABLED`
- `GEMINI_API_KEY`
- `GEMINI_MODEL_NAME`
- `GEMINI_API_BASE_URL`
- `GEMINI_REQUEST_TIMEOUT_SECONDS`
- `GEMINI_MAX_OUTPUT_TOKENS`
- `GEMINI_ADAPTER_TRANSPORT_MODE`

This document provides names only. It provides no values, secrets, tokens, IDs, account data, or configuration for live use.

## 14. What Oleksii must provide later for API mode

Oleksii must later provide explicit approval for:

- API key handling approach;
- first live Gemini API call;
- whether any private access is allowed;
- exact data boundaries for any private access;
- deployment path;
- merge authorization;
- rollback and audit expectations;
- confirmation that Gemini remains evidence-only.

## 15. What Gemini must provide later for API mode

For API mode, Gemini output must provide:

- schema-valid JSON output;
- evidence-only findings;
- clear uncertainty markers;
- no requests for secrets;
- no claims of canon authority;
- no direct repository write instructions;
- no private-source claims unless explicitly authorized and routed later.

Gemini must be treated as an external reviewer, not an operator.

## 16. What must never be provided

The adapter, packets, tests, and documentation must never provide:

- API key values;
- secrets or tokens;
- OAuth data;
- SSH keys;
- cookies;
- credentials;
- private IDs;
- Drive IDs;
- account IDs;
- private source contents;
- Google Drive, NotebookLM, or Gmail data;
- production deployment details;
- service credentials;
- firewall, network, service, or container mutation instructions.

## 17. First safe test packets

First safe tests should use manual or mock packets with:

- public-safe task titles;
- synthetic packet IDs;
- no real account identifiers;
- no private source excerpts;
- no secrets;
- no network calls;
- no repository writes;
- output that contains one informational finding, one mock risk, one unknown, and `security_flags` all set to `false`.

The first test should verify that a clean packet passes schema validation. The second test should verify that a packet with `contains_secrets: true` is rejected before transport.

## 18. Acceptance criteria

This plan is acceptable when:

- the document is public-safe;
- all required sections are present;
- missing required read-before-write files are explicitly listed as absent;
- intake and output templates are included;
- strict schema validation behavior is described;
- `security_flags` handling is a hard gate;
- manual copy-paste mode is first;
- mock mode has no network or live authority;
- future API mode is disabled by default;
- placeholder environment variable names have no values;
- required approvals are assigned to Oleksii;
- Gemini output remains evidence only;
- ChatGPT exoskeleton remains the control/canon/safety gate;
- non-authorizations are explicit.

## 19. Non-authorizations

This document does not authorize:

- API key creation;
- API calls;
- OAuth setup;
- Google Cloud setup;
- live connector implementation;
- Python, Docker, or runner implementation;
- runner script edits;
- secrets, tokens, OAuth data, SSH, env values, cookies, credentials, private IDs, Drive IDs, or account IDs;
- Google Drive, NotebookLM, or Gmail access;
- service, systemd, network, container, or firewall changes;
- deploy;
- merge;
- canon promotion;
- direct repo writes by Gemini;
- BauClock edits;
- Jeeves runtime authority expansion.

## 20. Next recommended task

Next recommended task: draft a separate public-safe mock fixture plan for one valid intake/output packet pair and one rejected packet case, still docs-only and still with API mode disabled by default.
