# Metrics Protocol

## Goal
Track execution quality, speed, cost, and stability across projects.

## Core metrics
- task completion status
- execution time
- review pass or fail
- number of revision rounds
- cost estimate when cloud models are used
- runtime errors
- architecture violations
- knowledge-base sync status

## Per-task record
1. project
2. task name
3. executor
4. start state
5. end state
6. execution time
7. review result
8. revisions count
9. estimated cost
10. risks found
11. knowledge-base updated yes or no

## Rules
- metrics must support engineering decisions
- metrics must not include secrets
- metrics are for trend analysis, not vanity reporting
- architecture violations must be recorded explicitly

## Use
Update metrics after each significant task or review cycle.