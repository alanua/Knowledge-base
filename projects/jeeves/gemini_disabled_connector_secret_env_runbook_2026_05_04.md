# Gemini Disabled Connector Secret-Env Runbook - 2026-05-04

## 1. Status/Scope

Status: queued YELLOW docs-only preparation.

Scope: public-safe design and runbook for a future Gemini auditor connector
under the ChatGPT exoskeleton project. This document does not implement,
enable, run, deploy, or configure any connector. It only prepares a future
manual procedure that may be used later after explicit Oleksii approval.

Required read-before-write source status: all six requested source files were
absent in this checkout, likely because related PRs are draft or unmerged:

```text
projects/jeeves/gemini_external_reviewer_messages_2026_05_04.md
projects/jeeves/gemini_contact_requirements_checklist_2026_05_04.md
projects/jeeves/gemini_mock_first_auditor_connector_test_plan_2026_05_04.md
projects/jeeves/gemini_api_later_integration_roadmap_2026_05_04.md
projects/jeeves/gemini_adapter_v0_1_packet_schema_plan_2026_05_04.md
projects/jeeves/gemini_mock_fixtures_json_schema_validation_checklist_2026_05_04.md
```

This runbook therefore uses only the issue body as its source. It does not
invent missing contents from absent documents.

## 2. Relationship To ChatGPT Exoskeleton

The future connector is intended to support the ChatGPT exoskeleton by allowing
Gemini to act as an external auditor or reviewer after the local mock-first
contract, packet schema, and approval gates are complete. The connector must
remain subordinate to the ChatGPT-controlled workflow and must not gain direct
write, merge, deploy, runner-management, or canon-promotion authority.

## 3. Canon Status

This document is not canon promotion. It is a design/runbook draft only. It
does not mark Jeeves as department manager, expand Jeeves runtime authority, or
establish Gemini as an approved live participant.

Canon promotion would require a separate explicit task, review, and approval.

## 4. Connector Design: Disabled By Default

The future connector must be disabled by default at every layer:

- Configuration default: `GEMINI_AUDITOR_MODE=disabled`.
- Mock default: `GEMINI_AUDITOR_MOCK_MODE=true`.
- Runtime default: absence of an approved live-mode flag must prevent API use.
- Failure mode: missing, malformed, or unreadable secret env must stop live
  connector startup rather than attempting fallback discovery.
- Authority default: Gemini receives packets for review only and returns review
  output only. It must not write directly to the repository, edit issues, edit
  PRs, start services, change runner scripts, or touch secrets.

Any future implementation must treat live mode as an exceptional, explicitly
approved state.

## 5. Secret-Env File Location Proposal

Future proposed server path, as a plan only and not as an executed action:

```text
/home/agent/agent-dev/.secrets/gemini-auditor.env
```

Preparing this runbook does not authorize creating this directory or file now.
It also does not authorize storing, pasting, generating, or validating a Gemini
API key now.

## 6. Secret-Env Fields Without Values

Candidate env fields:

```text
GEMINI_AUDITOR_MODE=disabled
GEMINI_AUDITOR_PROVIDER=google_gemini
GEMINI_AUDITOR_MODEL=
GEMINI_AUDITOR_API_KEY=
GEMINI_AUDITOR_TIMEOUT_SECONDS=30
GEMINI_AUDITOR_MAX_OUTPUT_TOKENS=
GEMINI_AUDITOR_MOCK_MODE=true
```

Values must never be committed, pasted into chat, pasted into GitHub, logged,
or shown in command output. Secret values include API keys, OAuth data, tokens,
cookies, private IDs, Drive IDs, account IDs, SSH data, and any credential-like
or account-identifying material.

## 7. Evening Manual Key-Storage Procedure Requirements

The evening key-storage procedure, if approved later by Oleksii, must be manual,
bounded, and non-live:

- Oleksii must explicitly approve the key-storage action before it starts.
- The procedure must only create or update the proposed secret env file.
- The procedure must not call Gemini or any other Google API.
- The procedure must not edit runner scripts, service units, container config,
  firewall rules, deployment paths, or repository source files.
- The procedure must not paste secret values into chat, GitHub, logs, shell
  history, or command output.
- The procedure must leave the connector disabled and mock mode enabled unless
  a separate later live-mode approval explicitly says otherwise.

## 8. Safe Shell Script Behavior Specification, But Not Executable Script

A future helper may be specified later, but this document must not add an
executable script. Any future helper must behave as follows:

- Refuse to run unless Oleksii has explicitly approved that exact operation.
- Use interactive, no-echo input for secret entry.
- Never accept the API key as a command-line argument.
- Never print the API key or full env-file contents.
- Create the parent `.secrets` directory only with restrictive permissions.
- Write the env file atomically with restrictive permissions.
- Preserve `GEMINI_AUDITOR_MODE=disabled` during key storage.
- Preserve `GEMINI_AUDITOR_MOCK_MODE=true` during key storage.
- Perform syntax checks that do not reveal values.
- Exit without making API calls.
- Exit without changing systemd, runner scripts, services, containers, network
  rules, repo remotes, GitHub state, or deployment state.

## 9. Permissions Model: `.secrets` chmod 700, Env File chmod 600

The future permission target is:

```text
/home/agent/agent-dev/.secrets               chmod 700
/home/agent/agent-dev/.secrets/gemini-auditor.env   chmod 600
```

The secret directory should be readable, writable, and searchable only by the
owning user. The env file should be readable and writable only by the owning
user. Group or world access must be treated as a storage failure.

## 10. No-History/No-Echo Handling

The future manual procedure must prevent secret exposure through shell history
and terminal echo:

- Do not place secret values in command arguments.
- Do not use commands that echo the secret to stdout or stderr.
- Use no-echo interactive input for the key.
- Avoid copying the secret through clipboard, chat, GitHub, or issue comments.
- Avoid shell history expansion or shell commands that contain the key.
- Confirm success only with redacted status, file path, mode, and field names.

## 11. No API Call During Key Storage

Key storage must not perform a live Gemini request, model list request, token
validation request, OAuth request, Google Cloud request, or network smoke test.
The only permitted result of key storage is a locally stored secret env file
with disabled-by-default settings.

## 12. No Systemd/Runner Script Edits During Key Storage

Key storage must not edit:

- systemd units or timers;
- live Hetzner runner scripts;
- `~/agent-dev/bin/*`;
- repository runner implementations;
- Python or Docker runner files;
- service environment wiring;
- deployment scripts.

Enabling a runner to read the secret env file is a separate future task and
requires explicit approval.

## 13. Future Connector Implementation Prerequisites

Before any live connector implementation, the project needs:

- merged mock-first reviewer packet schema;
- merged fixture validation checklist;
- merged adapter roadmap;
- public-safe contact requirements;
- a redaction policy for prompts, packets, logs, and outputs;
- approval for exact model, timeout, and output token limits;
- a bounded invocation path that starts in mock mode;
- tests proving disabled mode makes no API calls;
- tests proving missing secret env makes no API calls;
- tests proving logs redact secret values and sensitive identifiers;
- explicit Oleksii approval for any live smoke test.

## 14. First Live Smoke-Test Approval Gate

The first live smoke test must require a separate explicit approval after key
storage is complete. That approval must name:

- the exact connector entry point;
- the exact env file path;
- the exact model;
- the exact prompt or packet fixture;
- the maximum output tokens;
- the timeout;
- the expected log redactions;
- the expected no-write behavior;
- the rollback path.

No live smoke test is authorized by this runbook.

## 15. Rollback/Remove-Secret Procedure Requirements

A future rollback procedure must:

- remove or blank `GEMINI_AUDITOR_API_KEY` without printing it;
- leave no backup file containing the key;
- preserve no command history containing the key;
- confirm only redacted status;
- leave `GEMINI_AUDITOR_MODE=disabled`;
- leave `GEMINI_AUDITOR_MOCK_MODE=true`;
- avoid API calls;
- avoid runner, systemd, network, service, container, and deployment changes.

If secure deletion is proposed later, it must be handled as a separate approved
host-operation task, because filesystem and backup behavior depend on the host.

## 16. Logging/Redaction Rules

Future logging must be redacted by default:

- Never log API keys, tokens, OAuth data, cookies, private IDs, Drive IDs,
  account IDs, SSH material, env values, or full secret files.
- Never log full request packets if they can contain private content.
- Log only high-level connector state such as disabled, mock, approved live
  smoke-test run id, model name if approved for public reporting, timeout, and
  redacted result status.
- Redact secret-like substrings before stdout, stderr, issue comments, PR
  comments, artifacts, and local logs.
- Treat accidental secret output as a stop condition requiring manual review.

## 17. What Oleksii Must Do Later

Oleksii must later provide explicit approval before any of these actions:

- creating or storing a Gemini API key;
- creating the proposed secret env file;
- selecting a live Gemini model;
- allowing a live connector smoke test;
- allowing runner wiring to read the secret env file;
- promoting any design into canon.

Oleksii must never paste the actual key into chat, GitHub, commit history, logs,
or command output.

## 18. What ChatGPT Must Provide Later

ChatGPT must later provide:

- an exact manual key-storage procedure for review before use;
- a public-safe redaction checklist;
- a disabled-by-default connector implementation plan;
- mock-first tests proving no API calls in disabled and mock modes;
- live smoke-test instructions only after explicit approval;
- rollback instructions that do not reveal secret values;
- final reporting that lists non-authorizations and validation results.

## 19. What Runner Must Not Do Automatically

The runner must not automatically:

- create a Gemini API key;
- request OAuth access;
- access Google Cloud setup;
- access Google Drive, NotebookLM, Gmail, or account data;
- create or edit the secret env file;
- switch Gemini mode from disabled to live;
- make Gemini API calls;
- edit systemd or live runner scripts;
- restart services;
- change network, container, firewall, or deployment settings;
- allow Gemini direct repository writes;
- promote canon.

## 20. Non-Authorizations

This document does not authorize:

- API key creation;
- API calls;
- OAuth setup;
- Google Cloud setup;
- live connector implementation;
- Python or Docker runner implementation;
- runner script edits;
- executable script creation;
- secret storage now;
- secret inspection;
- SSH, token, cookie, credential, private ID, Drive ID, or account ID access;
- Google Drive, NotebookLM, or Gmail access;
- service, systemd, network, container, firewall, or deployment changes;
- merge, push, deploy, or PR creation by this task;
- canon promotion;
- direct repo writes by Gemini;
- BauClock edits;
- Jeeves runtime authority expansion.

Preparing this runbook does not authorize creating or storing the key now. It
only prepares the future manual procedure.

## 21. Next Recommended Task

Next recommended task: after the missing Gemini design/checklist PRs are merged,
prepare a mock-only connector implementation plan that proves disabled mode and
mock mode make no API calls, includes redaction tests, and still does not create
or store any secret.
