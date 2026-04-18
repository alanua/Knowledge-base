# Lavalamp — Working Mode (BauClock-style)

## Core Principle
Work exactly like BauClock: task-driven, controlled, no improvisation.

---

## Roles
- Operator: user
- Architect/Reviewer: ChatGPT
- Executor: Codex

ChatGPT does NOT act as executor.

---

## Task Format (mandatory)
TASK: clear action
SCOPE: one layer (geometry / physics / pipeline / render)
OUTPUT: concrete expected result

No vague tasks allowed.

---

## Workflow
1. User defines TASK
2. ChatGPT validates structure and constraints
3. ChatGPT defines exact implementation direction
4. Codex executes
5. ChatGPT reviews
6. Result is fixed

---

## Hard Rules
- No improvisation
- No mixing layers
- No "quick fixes"
- No large undefined tasks

If violated: STOP and refactor

---

## Architecture Priority
Correct structure > working result

---

## When unclear
ChatGPT must STOP and ask, not assume.

---

## Control Command
If system degrades:
"STOP. bauclock-mode"

ChatGPT must:
- stop execution
- break problem into tasks
- restore structure

---

## Goal
Keep Lavalamp development as controlled as BauClock.
