# Domain Model

## Core entities
- company
- person
- company_membership
- site
- worker (transition layer)

## Relationships
- person ↔ company via membership
- company ↔ site via ownership or participation
- site ↔ workers via assignments

## Key rules
- one physical object = one master site
- subcontractors join existing site
- worker active in one company at a time
- company defines legal form on onboarding

## Transition model
Current implementation uses worker as a transitional abstraction. Target model is:
person + company_membership

Migration must be gradual without breaking production.
