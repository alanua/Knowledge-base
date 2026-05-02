# BauClock Queue Source Correction — 2026-05-02

Status: correction / review guardrail
Related merged file: `projects/bauclock/BAUCLOCK_NEXT_IMPLEMENTATION_QUEUE_2026_05_02.md`

## Correction

The BauClock queue file says that several requested uppercase model files were not present in the repo snapshot.

That statement is incomplete.

At least these files are present in the repository under the top-level `BauClock/` directory:

```text
BauClock/CORE_ENTITY_RELATION_MODEL.md
BauClock/BUSINESS_AND_EMPLOYMENT_FORMS_MODEL.md
```

The queue should not be used as if those source models are missing.

## Correct interpretation

The issue is path/location mismatch, not confirmed absence.

The queue was created from the newer canonical project area:

```text
projects/bauclock/
```

But older or expanded BauClock model documents also exist under:

```text
BauClock/
```

Before any BauClock implementation task is opened from the queue, ChatGPT or the runner must reconcile `projects/bauclock/` with the relevant top-level `BauClock/` model files.

## Required effect on next tasks

Before converting any queue item into Codex or Lovable work:

```text
1. Read the relevant `projects/bauclock/` canon docs.
2. Search/read matching top-level `BauClock/` model docs.
3. Treat top-level model docs as source evidence needing reconciliation, not as missing files.
4. Do not implement from the queue alone if a relevant top-level model doc exists.
5. Do not move/canonize top-level files automatically without a separate reviewed docs task.
```

## Safety

This correction does not approve implementation.

Forbidden from this correction:

```text
- no code changes
- no migrations
- no deploy
- no secrets
- no UI generation
- no legal/tax claims
- no automatic canon merge between `BauClock/` and `projects/bauclock/`
```

## Next safe action

Open a reviewed docs-only reconciliation task for BauClock source layout before creating implementation tasks from `BAUCLOCK_NEXT_IMPLEMENTATION_QUEUE_2026_05_02.md`.
