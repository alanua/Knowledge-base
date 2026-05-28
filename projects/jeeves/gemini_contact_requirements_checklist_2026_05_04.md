# Gemini Contact Requirements Checklist

Date: 2026-05-04

## 1. Status / Scope

Status: draft checklist for future controlled Gemini contact planning.

Scope: public-safe documentation only under `projects/jeeves/`. This file prepares questions, requirements, and validation gates for a possible future Gemini auditor integration. It does not authorize implementation, API access, OAuth setup, credential creation, live Google access, runtime changes, deployment, canon promotion, or any expansion of Jeeves runtime authority.

Required read-before-write source status:

- `projects/jeeves/gemini_external_reviewer_messages_2026_05_04.md`: absent. This may mean issue #208 has not run or merged yet. No missing contents are inferred.
- `projects/jeeves/private_source_routing_design_m6_2026_05_04.md`: absent.
- `projects/jeeves/operational_memory_summary_prototype_m5_2026_05_04.md`: absent.
- `projects/jeeves/startup_context_builder_prototype_m4_2026_05_04.md`: absent.
- `projects/jeeves/chatgpt_exoskeleton_answer_before_read_correction_2026_05_04.md`: absent.
- `projects/jeeves/exoskeleton_lane_expansion_readiness_matrix_2026_05_04.md`: absent.
- `projects/jeeves/fresh_origin_gate_implementation_decision_record_2026_05_04.md`: absent.

Because all read-before-write sources are absent in this checkout, this checklist is derived only from the issue body for the controlled YELLOW task.

## 2. Relationship To ChatGPT Exoskeleton

The intended authority model remains:

```text
Oleksii = owner / final approval / live/private access approval
ChatGPT exoskeleton = control plane / canon gate / safety gate
Gemini = external auditor / reviewer / analyst / private triage assistant
Runner = bounded executor
```

Gemini must remain outside the control plane. Gemini may provide review, analysis, critique, and structured recommendations, but it must not approve canon changes, write directly to the repository, operate the runner, access production systems, or bypass ChatGPT exoskeleton safety gates.

## 3. Canon Status

This document is non-canon draft preparation. It records candidate requirements and open questions for a future controlled integration design. It does not promote Gemini to a trusted authority, department manager, canon gate, runtime actor, or autonomous executor.

Any later canon promotion must happen through a separate controlled task with explicit approval from Oleksii and the ChatGPT exoskeleton.

## 4. What Information Is Needed From Gemini / Google Side

Before any integration can be designed, collect public-safe answers to these checkpoints:

- Which Gemini access path will be used first: manual UI, NotebookLM, Google AI Studio, API, or other?
- Which model family/name is available in Oleksii's current plan/account UI?
- What are the context, file, output, image/PDF/video/audio limits visible to Oleksii?
- What response formats can Gemini reliably follow: markdown, JSON, YAML?
- Can Gemini handle strict JSON output for adapter v0.1?
- Are file uploads available in the selected interface?
- Is NotebookLM available and what source limits are visible?
- Is Drive access enabled, and can it be used read-only?
- Are Gmail/Docs integrations enabled or disabled?
- What privacy/data-retention controls are visible in the UI?
- Are API keys available through Google AI Studio or another Google Cloud path?
- What billing/quotas/rate limits are visible?
- Which languages are reliable for output: Ukrainian, English, German?
- Can Gemini process screenshots/UI mockups in the selected mode?
- Can Gemini process large pasted PR/repo/log packets without truncation?
- Does the selected interface provide a system-instruction field or only chat messages?
- Does the selected interface preserve conversation state, and can that state be disabled or reset?
- Can uploaded files be deleted from the Gemini/Google UI after a test?
- Are model responses exportable without including account identifiers or private file identifiers?
- Are there workspace, organization, or account-level policies that affect data retention or training controls?

## 5. What Must Never Be Requested From Gemini/Oleksii

Never request, paste, upload, transmit, or ask Gemini to retrieve:

- API keys, OAuth client secrets, access tokens, refresh tokens, cookies, SSH keys, passphrases, private certificates, or environment values.
- Account IDs, private Google Drive file IDs, private folder IDs, internal URLs, billing identifiers, or raw private metadata.
- Raw private repository data, production logs, customer data, personal data, secrets, or deployment configuration.
- Direct repository writes, direct PR creation, branch pushes, merges, deployments, service restarts, or runner control.
- Authority to override Oleksii, the ChatGPT exoskeleton, canon gates, or safety gates.
- Decisions that would mark Jeeves as a department manager or expand Jeeves runtime authority.
- BauClock edits or unrelated project authority changes.

Oleksii may approve future live/private access only through a separate explicit approval path. This checklist does not request that approval.

## 6. Manual Copy-Paste Contact Mode Requirements

Manual mode is the safest first contact mode. It should use copy-paste packets prepared by the ChatGPT exoskeleton and manually submitted by Oleksii or an approved operator.

Requirements:

- Use redacted, public-safe packets by default.
- Include a clear task objective, authority boundaries, forbidden actions, and expected output schema.
- Avoid raw secrets, private IDs, production logs, account identifiers, and private file contents.
- Label every packet with source category, sensitivity level, allowed use, and expected deletion/retention handling.
- Prefer small packets that test format compliance before large packets.
- Require Gemini output to be copied back as text, with no direct repository write access.
- Treat Gemini output as untrusted advisory material until reviewed by the ChatGPT exoskeleton and approved where needed by Oleksii.

## 7. Future API Contact Mode Requirements

API contact mode is not authorized by this document. A future API design task must first prove the manual and mock adapter path.

Future API requirements to define before implementation:

- Exact Google API product and model endpoint.
- Auth path, key storage path, and rotation process, without recording secret values in the repository.
- Request and response schemas for adapter v0.1.
- Timeout, retry, rate-limit, quota, and billing behavior.
- Logging policy that excludes prompts, secrets, private files, raw responses containing private data, and account identifiers unless explicitly allowed.
- Kill switch and configuration flag that defaults to disabled.
- Mock transport with deterministic fixtures.
- Tests proving no network calls happen in mock mode.
- Explicit approval checkpoint before any real API call.

## 8. NotebookLM / Drive Contact Requirements

NotebookLM and Drive access are not authorized by this document.

Before any NotebookLM or Drive workflow is considered, collect:

- Whether NotebookLM is available in Oleksii's account.
- Visible NotebookLM source limits, file type limits, notebook limits, output limits, and sharing controls.
- Whether Drive access is enabled and whether read-only use can be enforced.
- Whether Docs, Gmail, or other Google integrations are enabled or disabled.
- What privacy, retention, source deletion, and training controls are visible.
- Whether source uploads can be limited to redacted/public-safe material.
- Whether NotebookLM or Drive outputs expose private file IDs, folder IDs, account IDs, or internal links that must be redacted before repository use.

No Drive folder IDs, private file IDs, raw private files, Gmail data, or private NotebookLM source data should be placed in this repository.

## 9. Required Gemini Intake Packet Fields

Each future Gemini intake packet should include:

- `packet_id`: non-secret identifier.
- `created_at`: date or timestamp.
- `prepared_by`: role, not private account identity.
- `mode`: manual UI, NotebookLM, Google AI Studio, API mock, or other.
- `task_type`: review, critique, analysis, triage, schema test, or other bounded task.
- `authority_model`: Oleksii owner, ChatGPT exoskeleton control/canon/safety gate, Gemini external auditor, Runner bounded executor.
- `source_summary`: high-level description of included materials.
- `sensitivity_level`: public-safe, redacted private, or other approved category.
- `allowed_use`: what Gemini may do with the packet.
- `forbidden_use`: what Gemini must not do.
- `output_format`: markdown, JSON, YAML, or strict JSON schema name.
- `language`: requested output language.
- `size_notes`: expected token/file/log size and truncation risks.
- `return_instructions`: exact fields Gemini should return.
- `deletion_or_retention_note`: user-visible handling instruction where applicable.

## 10. Required Gemini Output Fields

Each Gemini response should be requested with these fields:

- `packet_id`: copied from intake.
- `model_or_interface`: model/interface name visible to the user, if available without exposing private account data.
- `summary`: concise answer.
- `findings`: specific observations or risks.
- `recommendations`: advisory next steps only.
- `confidence`: low, medium, or high.
- `assumptions`: assumptions Gemini made.
- `limits_or_truncation`: any context, upload, output, or truncation limits encountered.
- `format_compliance`: whether requested markdown, JSON, YAML, or strict JSON was followed.
- `private_data_warning`: whether Gemini saw or suspects private data in the packet.
- `requires_owner_approval`: whether Oleksii approval would be required before action.
- `requires_exoskeleton_gate`: whether ChatGPT exoskeleton review is required before action.
- `non_authorization_acknowledgement`: acknowledgement that Gemini is advisory only and cannot write, merge, deploy, or promote canon.

## 11. Environment Variable Names That May Be Needed Later

Placeholder names only. Do not add values to this repository.

```text
GEMINI_AUDITOR_MODE
GEMINI_AUDITOR_PROVIDER
GEMINI_AUDITOR_MODEL
GEMINI_AUDITOR_API_KEY
GEMINI_AUDITOR_BASE_URL
GEMINI_AUDITOR_TIMEOUT_SECONDS
GEMINI_AUDITOR_MAX_INPUT_TOKENS
GEMINI_AUDITOR_MAX_OUTPUT_TOKENS
GEMINI_AUDITOR_RATE_LIMIT_PER_MINUTE
GEMINI_AUDITOR_MOCK_MODE
GEMINI_AUDITOR_LOG_LEVEL
GOOGLE_AI_STUDIO_PROJECT_HINT
NOTEBOOKLM_AUDITOR_MODE
GOOGLE_DRIVE_AUDITOR_READONLY
```

These names are candidates only. A future implementation task may rename or remove them after design review.

## 12. Secret-Handling Rules

- Never commit secret values, credentials, tokens, cookies, account IDs, private file IDs, Drive folder IDs, or raw private data.
- Never paste secrets into Gemini, NotebookLM, Google AI Studio, issue bodies, PR descriptions, logs, fixtures, tests, or documentation.
- Keep environment variable examples value-free.
- Redact private identifiers before any Gemini packet is created.
- Store real secrets only in an approved secret manager or runner environment outside the repository, after explicit approval.
- Disable prompt/response logging for live private data unless a separate approved policy allows a narrow safe log.
- Treat Gemini output as potentially containing reflected sensitive text and review it before saving.

## 13. Mock-First Integration Plan

1. Define adapter v0.1 schemas for intake and output using public-safe fixture data.
2. Build deterministic mock Gemini responses with no network calls.
3. Validate strict JSON, markdown, and YAML parsing against fixtures.
4. Confirm the runner can keep Gemini disabled by default.
5. Add tests proving no API call, OAuth flow, Drive access, NotebookLM access, or Gmail access occurs in mock mode.
6. Run a manual copy-paste test with public-safe text only.
7. Review output quality through the ChatGPT exoskeleton safety gate.
8. Ask Oleksii for explicit approval before any live/private access design proceeds.

## 14. Validation Checklist For A Future Implementation Task

A future implementation task must verify:

- Scope explicitly permits code changes.
- Scope explicitly permits the files to be edited.
- Mock mode is implemented before live mode.
- Live mode defaults to disabled.
- No API keys, OAuth secrets, tokens, cookies, account IDs, private IDs, or raw private data are committed.
- No network call occurs in tests unless a controlled live-test task explicitly authorizes it.
- No Drive, NotebookLM, Gmail, Docs, or Google Cloud access occurs without explicit approval.
- Gemini cannot write directly to the repository.
- Gemini cannot merge, push, deploy, restart services, or operate the runner.
- Gemini output is treated as advisory and gated by the ChatGPT exoskeleton.
- Oleksii remains final approval for live/private access.
- Documentation states non-authorizations and residual risks.

## 15. Open Questions For Oleksii

- Which first contact path should be evaluated: manual UI, NotebookLM, Google AI Studio, API, or another path?
- Which Gemini or Google plan/account interface is available for review?
- Are file uploads, screenshots, PDFs, audio, or video needed for the first auditor workflow?
- Should the first Gemini tests use English only, or also Ukrainian and German?
- Is NotebookLM in scope for a later design task, or should it remain out of scope?
- Should Drive read-only workflows be considered later, or should all Drive access remain forbidden?
- What privacy/data-retention controls are acceptable before any private packet is submitted?
- Who is allowed to manually paste packets into Gemini, if anyone?
- What approval record is required before live/private access can be tested?

## 16. Open Questions For Gemini

These questions should be asked only with public-safe manual packets:

- Can you reliably return strict JSON matching a provided schema?
- Can you identify when a packet appears truncated or internally inconsistent?
- Can you separate findings, recommendations, assumptions, and confidence?
- Can you explicitly acknowledge that your role is advisory only?
- Can you avoid requesting secrets, credentials, account identifiers, private file IDs, or direct repository access?
- Can you process long pasted PR/repo/log packets without losing earlier constraints?
- Can you provide output in English, Ukrainian, and German with consistent structure?
- Can you analyze screenshots or UI mockups in the selected interface?

## 17. Next Recommended Task

Create a follow-up controlled docs task to draft a public-safe Gemini manual intake packet template and a strict JSON output schema for adapter v0.1. That task should remain mock/manual only and should not create API keys, call Gemini APIs, configure OAuth, access Drive/NotebookLM/Gmail, edit runner scripts, or change runtime behavior.
