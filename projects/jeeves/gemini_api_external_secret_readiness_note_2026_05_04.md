# Gemini API External-Secret Readiness Note - 2026-05-04

## Status/Scope

Status: readiness note only.
Scope: ChatGPT exoskeleton / Gemini auditor API-later path.

This is a docs-only note for external-secret readiness. It records only that a
Gemini auditor API key is expected to exist outside the repository while API
integration remains disabled and unauthorized.

## Canon Status

This note is not canon promotion. It does not change Jeeves authority, runtime
status, source-of-truth status, runner behavior, or production behavior.

## Source Material Status

The user confirmed an API key exists externally. No key value is recorded here.
Project identifiers must be redacted.

This note does not include any project number, project ID, API key value,
account ID, private ID, or secret-like identifier.

## Plain-Language Summary

The repository may acknowledge that the Gemini auditor key is expected to be
available as an external secret later. The repository must not store, display,
inspect, test, or use the real key from this note.

## External-Secret State

The only recorded state is that `GEMINI_AUDITOR_API_KEY` exists externally.
The value is not stored. Project identifiers are redacted. The current mode is
API later and disabled by default.

## Allowed Public Statement

```text
GEMINI_AUDITOR_API_KEY exists externally.
value = not stored
project identifiers = redacted
mode = API later / disabled by default
```

## Forbidden Data

This document forbids recording:

```text
actual Gemini API key value
Google Cloud project number
Google Cloud project ID
OAuth client IDs or secrets
account IDs
Drive file IDs
private notebook IDs
cookies
tokens
SSH keys
.env values
credential helper output
secret manager values
raw screenshots containing identifiers
```

## API-Later Boundary

```text
Current status remains manual/mock-first.
No live Gemini API integration is authorized by this note.
No API calls are authorized by this note.
No key storage is authorized by this note.
No runner change is authorized by this note.
A future task must explicitly authorize secret-env placement and must not print the key.
```

## Storage Boundary

```text
GitHub KB may store only placeholder variable names and redacted status.
Real secrets must remain outside the repository.
Real secrets must not be pasted into ChatGPT, Gemini, NotebookLM, GitHub issues, PRs, logs, fixtures, or docs.
If a real key is exposed, revoke/regenerate before continuing.
```

## Runner/Server Secret-Env Boundary

This note does not authorize runner or server secret-env placement. No runner
environment, server environment, service configuration, host script, or secret
store may be edited from this note.

Any future secret-env task must be explicit, bounded, reviewed, and must not
print, log, echo, fixture, or document the key value.

## Mock/Manual Status

Gemini auditor work remains manual/mock-first. Parser tests, fixtures, and
documentation may use only mock data or public placeholder variable names.
Live API behavior remains out of scope.

## Block/Stop Conditions

Stop if task requires:

```text
storing or displaying the API key
recording project identifiers
creating .env files
editing runner secret env
calling Gemini API
OAuth setup
Google Cloud setup
secret manager access
Drive/Gmail/NotebookLM access
private source access
runner changes
production access
deploy/merge
```

## Non-Authorizations

This note must not authorize:

```text
Gemini API integration
API key storage
API calls
OAuth setup
Google Cloud setup
secret manager changes
runner/server env edits
runner script edits
connector implementation
JSON fixtures containing secrets
parser tests using live API
Drive/Gmail/NotebookLM access
private source ingestion
deploy
merge
production access
secret storage
secret inspection
canon promotion
Jeeves runtime authority expansion
```

## Next Recommended Task

Create a separate API-later planning task that defines the manual/mock-first
Gemini auditor integration boundary using placeholder variable names only. Any
future live secret-env placement must be explicitly authorized in a separate
task and must not print the key.
