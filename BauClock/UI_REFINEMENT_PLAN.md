# BauClock — UI Refinement Plan

## Status

This document fixes the canonical UI refinement plan for BauClock after legal-hardening and UX simplicity decisions.

Purpose:
- keep BauClock visually simple and daily-use friendly
- prevent legal/compliance complexity from cluttering the interface
- define concrete UI corrections for icons, radii, dashboard blocks and placeholder screens

Read together with:
- `BauClock/UX_SIMPLICITY_GUARDRAILS.md`
- `BauClock/CANONICAL_SYSTEM_MODEL_FULL.md`
- `BauClock/BOT_CONTOURS_AND_ACCESS_BOUNDARIES.md`

---

## 1. Core visual direction

Canonical BauClock UI direction:
- mobile-first
- warm sand background
- white rounded cards
- strong black text
- orange/red accent blocks
- black round action buttons
- pill chips
- flat/clean look
- minimal shadows
- high contrast
- large readable controls

The interface must stay practical for construction users and daily field use.

---

## 2. Icon correction plan

### 2.1 Replace letter badges
Replace letter badges such as:
- `BC`
- one-letter heading blocks
- two-letter heading blocks

with simple minimal SVG icons.

### 2.2 Icon style
Preferred icon style:
- Material Symbols / Material Icons
- or very close minimal Material-style icon pack

### 2.3 Logo badge
For the BauClock logo/action badge use a punch-clock style icon:
- `punch_clock`
- punch-clock equivalent SVG

Do not use text badges like `BC` as the main interface icon.

### 2.4 Header blocks
Every heading that currently uses a letter/abbreviation badge should be reviewed and converted to a relevant icon.

Examples:
- dashboard / overview -> dashboard icon
- people / workers -> group/person icon
- sites -> location/building icon
- payments -> payments/euro icon
- compliance/legal -> verified/shield/document icon
- time tracking -> schedule/punch-clock icon

---

## 3. Border radius correction plan

Canonical decision:
- reduce the border radius of main UI blocks approximately by half compared with the current overly-rounded style

Rationale:
- preserve friendly rounded cards
- avoid toy-like over-rounded blocks
- make the dashboard cleaner and more professional

Apply to:
- dashboard cards
- major information blocks
- modal/panel cards
- public/company info cards
- Mini App cards

Do not remove rounding entirely.
The target is still soft and modern, just less inflated.

---

## 4. Collapsible dashboard blocks

Every major dashboard information block should be collapsible.

Required behavior:
- block title/header always remains visible
- content can collapse to minimal height/thickness
- collapsed state should save vertical space, especially on mobile
- important warnings may remain visually visible even when collapsed if needed

Apply to:
- personal/platform dashboard in `@gewerbebot`
- company dashboard screens
- compliance/legal blocks
- people/worker blocks
- site blocks
- payment/export blocks

This is especially important for Telegram Mini App mobile UX.

---

## 5. Placeholder / waiting screen

For non-authorized users in shared/default client bot context:
- do not show system internals
- do not show company/private data
- show neutral waiting/placeholder screen

The placeholder animation may be an automatic falling-blocks game-like animation, but the UI/code must not use the word `Tetris` as a product/UI term.

Visual behavior:
- fullscreen or near-fullscreen field
- old handheld game feel
- thick blocks
- automatic random movement
- no user controls required in v1
- looped natural-looking animation

This placeholder must remain a neutral waiting state, not a public system explanation.

---

## 6. Simplicity rules for this UI pass

This UI pass must not become a redesign project.

Do:
- replace badges with icons
- reduce radii
- make major blocks collapsible
- clean visual hierarchy
- keep role-specific UI minimal

Do not:
- rebuild frontend architecture
- add heavy design framework unless already used
- mix legal/compliance complexity into worker daily flow
- create a full new design system before the product works
- add decorative clutter

---

## 7. Implementation order

Recommended implementation sequence for Codex/Lovable:

1. Audit current dashboard and Mini App screens for letter badges and over-rounded cards.
2. Introduce a small icon mapping layer or reusable icon component.
3. Replace `BC` and all one/two-letter header badges with Material-style SVG icons.
4. Reduce card/block border-radius globally or through shared CSS variables where possible.
5. Add collapsible behavior to main dashboard blocks.
6. Verify mobile layout after collapsing/expanding.
7. Update neutral unauthorized placeholder to use punch-clock branding and falling-block animation without `Tetris` naming.
8. Run UI smoke checks and avoid unrelated UI expansion.

---

## 8. Acceptance criteria

UI refinement is acceptable when:
- no primary UI header depends on letter badges
- punch-clock icon is used where BauClock identity/action badge is needed
- main cards look cleaner and less over-rounded
- dashboard major blocks are collapsible
- mobile Mini App remains readable and compact
- unauthorized shared-bot state remains neutral and does not leak internals
- worker daily flow remains simple

---

## 9. Final canonical rule

BauClock UI must feel simple, clean and practical.

Visual refinement must support the product goal:
- fast daily time tracking
- clear role-based dashboard
- hidden complexity under the hood

Do not let UI refinements become product bloat.
