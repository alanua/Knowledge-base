# Codex Execution Protocol

## Order of work
1. Read the relevant Knowledge-base files.
2. Restate the objective in one precise engineering sentence.
3. Read the originating GitHub Issue and confirm GREEN/YELLOW/RED classification.
4. Define scope boundaries.
5. For RED tasks, stop unless explicit user approval is recorded.
6. For YELLOW tasks, prepare branch/draft PR only; do not mark ready or merge.
7. For GREEN tasks, stay inside predefined autonomous scope.
8. Inspect current code before editing.
9. Make the smallest coherent change set.
10. Run or describe validation steps.
11. Update knowledge-base files only when the task explicitly allows it.
12. Return the engineering report to the GitHub Issue.

## Rules
- stay within scope
- do not change architecture silently
- avoid unnecessary dependencies
- sync the knowledge base only when scoped or when accepted decisions change
- post runner reports to GitHub Issues
- use Hetzner as the primary daemon lane and WSL only as reserve/local lane
- never expose secrets

## Output format
1. STATUS
2. FILES CHANGED
3. WHAT WAS DONE
4. VALIDATION
5. RISKS OR LIMITATIONS
6. KNOWLEDGE-BASE UPDATES

## Escalation
If there is an architecture conflict, report it clearly instead of guessing.
