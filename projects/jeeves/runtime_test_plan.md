# Jeeves — Runtime Test Plan

## Status

Initial Stage 1 runtime smoke was executed locally on WSL.

Confirmed:

- API starts successfully
- `/health` returns OK
- `/ask` returns a mock-provider response when started with SQLite and `MOCK_PROVIDER_ENABLED=true`
- SQLite database exists and migrations are applied
- `sessions`, `messages`, and `traces` tables receive records
- `tool_calls` remain empty in safe mock mode
- fallback is disabled in the smoke test

Observed issue:

- early `/ask` call failed under incorrect environment/startup configuration
- after correct SQLite/mock-provider environment, `/ask` worked
- task classifier labeled two session-memory smoke prompts as `coding`; this is not blocking Stage 1, but should be refined later

## Next Steps

### 1. Fix runtime smoke report into GitHub / Knowledge-base

Create a short permanent report for the successful local Stage 1 runtime smoke.

Include:

- commands used
- environment variables
- `/health` result
- `/ask` result
- DB tables and counts
- known limitation around mock provider and classifier behavior

### 2. Add Jeeves runtime smoke script

Add a repeatable local script for safe runtime smoke testing.

Target behavior:

- use SQLite under `.runtime/`
- enable mock provider
- disable cloud fallback
- disable tool execution
- disable self-modification
- run migrations
- start API or run scripted health/ask checks

This should make future smoke tests reproducible without manual command reconstruction.

### 3. Add classifier refinement task

Create a follow-up task to improve task type classification.

Observed case:

```text
"Remember for this session: my test codename is Wooster."
"What is my test codename in this session?"
```

These were classified as `coding`, but should probably classify closer to simple/session/memory intent.

Do not block Stage 1 runtime validation on this.

### 4. Test real LLM without tools

After mock-mode smoke is stable, test a real LLM provider with tools disabled.

Order:

1. local Ollama if available and lightweight enough
2. OpenRouter fallback only after local path is understood

Rules:

- `allow_tools=false`
- no filesystem/shell/http tools
- no self-modification
- no production deployment
- no autonomous action execution

## Canonical Rule

Stage 1 Jeeves runtime testing must stay safe:

```text
API + DB + session + trace + mock/LLM response first.
Tools and real actions later.
```
