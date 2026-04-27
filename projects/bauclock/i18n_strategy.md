# BauClock — i18n / Multilingual Strategy

Status: canonical v1
Scope: BauClock UI, Telegram bot text, dashboard text, public site screens, exports where applicable.

## Core decision

BauClock must be built as a multilingual product from the beginning.

Do not hardcode user-facing text directly in UI, bot handlers, or dashboard components. Use stable translation keys and external translation files.

## Language priority for MVP

```text
DE = primary client language for Germany
UK = secondary language for user/team/workers where needed
EN = fallback/internal base language
```

Future language packs can be added without changing business logic:

```text
PL
RO
TR
AR
other worker/customer languages as needed
```

## Development rule

Translations are done in parallel with feature development, but not polished exhaustively during early implementation.

Workflow:

```text
1. New UI/bot/dashboard feature is added.
2. User-facing strings are added as translation keys.
3. Minimal DE + UK + EN translations are added immediately.
4. Feature development continues without waiting for perfect copywriting.
5. Before pilot/customer use, German text gets a final review pass.
```

Do not postpone i18n until the end, because retrofitting direct strings later will be expensive and error-prone.

## Key model

Use stable semantic keys, not display text as identifiers.

Example keys:

```text
dashboard.site.present_today
dashboard.time.check_in
dashboard.time.check_out
worker.status.checked_in
worker.status.checked_out
payment.status.pending
payment.status.paid
manual_correction.requested
manual_correction.approved
manual_correction.rejected
```

Example translation files:

```text
locales/de.json
locales/uk.json
locales/en.json
```

Example German values:

```json
{
  "dashboard.site.present_today": "Heute anwesend",
  "dashboard.time.check_in": "Einstempeln",
  "dashboard.time.check_out": "Ausstempeln"
}
```

Example Ukrainian values:

```json
{
  "dashboard.site.present_today": "Сьогодні присутні",
  "dashboard.time.check_in": "Почати зміну",
  "dashboard.time.check_out": "Завершити зміну"
}
```

## Canonical database rule

Database values, enums, API contracts and audit records must use stable canonical internal values, preferably English snake_case.

Examples:

```text
checked_in
checked_out
payment_pending
payment_paid
manual_correction_requested
manual_correction_approved
manual_correction_rejected
```

Translations are presentation-layer concerns. Do not store localized labels as canonical business state.

## BauClock-specific requirements

Multilingual support must apply to:

```text
- Telegram bot buttons and messages
- Mini App / dashboard labels
- public QR landing page text
- worker check-in / check-out screens
- owner / objektmanager / accountant dashboards
- manual correction flow
- payment/time summary labels
- error and warning messages
```

For legal/business-sensitive screens, German wording is the priority.

Important German-facing areas:

```text
- work time records
- manual corrections
- payment summaries
- export descriptions
- privacy notice links/messages
- role/access labels
```

## UX rule

Keep translations short and button-friendly.

Prefer compact labels for Telegram/Mini App:

```text
Einstempeln
Ausstempeln
Heute
Offen
Bezahlt
Korrektur
```

Avoid long explanatory labels inside buttons. Put explanations in detail screens or help text.

## Fallback rule

If a key is missing in the selected language:

```text
selected language -> EN fallback -> key name visible in dev mode
```

In production, missing translations should be logged and should not crash the user flow.

## Implementation guidance

Initial implementation should add a small i18n layer before heavy UI expansion:

```text
- translation key registry or JSON files
- language selector / company default language
- user preferred language if available
- fallback resolution
- tests for missing/known keys where practical
```

Company-level localization should define default language/country/currency context, but individual users may later override UI language.

## Out of scope for MVP

Do not build a complex translation management system in MVP.

Out of scope initially:

```text
- external translation SaaS
- in-app translation editor
- automatic machine translation workflow
- per-field legal localization engine
- full multi-country tax/legal wording automation
```

## Canonical decision

BauClock must be i18n-ready from the first UI/bot implementation pass.

For MVP, support DE + UK + EN fallback. Add other languages only as language-pack files later.

This is part of the BauClock core architecture, not a cosmetic afterthought.
