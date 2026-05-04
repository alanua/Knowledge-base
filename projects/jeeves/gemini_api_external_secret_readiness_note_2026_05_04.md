# Gemini API External-Secret Readiness Note - 2026-05-04

## Status/Scope

Status: readiness note only
Scope: ChatGPT exoskeleton / Gemini auditor API-later path

This is a docs-only note for recording the external-secret readiness state. It
does not add, store, inspect, validate, or use any secret value.

## Canon Status

Canon status: not promoted.

This note is a readiness record only. It does not change canonical Jeeves
authority, does not expand runtime authority, and does not authorize live API
integration.

## Source Material Status

The user confirmed an API key exists externally. No key value is recorded here,
and project identifiers must be redacted.

No project number, project ID, API key value, account ID, private ID, or
secret-like identifier is included in this note.

## Plain-Language Summary

A Gemini auditor API key is expected to exist outside the repository as an
external secret. The repository may record only that redacted readiness state.
Current work remains manual/mock-first, and API integration remains disabled and
unauthorized.

## External-Secret State

The external-secret state may be described only as a redacted readiness status.
The repository must not contain the real key, related project identifiers, or
any private credential material.

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

No runner or server secret-env placement is authorized by this note. No runner
script, service unit, server environment, deployment path, or runtime
configuration may be edited under this note.

Any future secret-env placement must be explicitly authorized by a separate
task, must keep the value outside the repository, and must not print, echo, log,
fixture, or otherwise expose the key.

## Mock/Manual Status

Current status remains manual/mock-first. Gemini auditor behavior may be
discussed only as a future API-later path unless a later task explicitly
authorizes live integration work.

## Block/Stop Conditions

Stop if the task requires:

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

Prepare a separate API-later design task that defines the required mock/manual
contract, redacted variable names, and future approval gates without storing
secrets, editing runner environments, calling Gemini, or changing runtime
behavior.
