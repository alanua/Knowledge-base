# Decisions

## Canonical model
- user = operator
- ChatGPT = architect/reviewer
- Codex or another coding agent = executor
- runtime = Telegram bot + backend + dashboard

## Product decisions
- multi-company site model
- one physical object = one master QR
- subcontractors join existing sites instead of creating parallel contractor-owned master sites
- privacy by business logic
- person + company_membership is the target identity model, reached gradually through a worker transition layer

## Business decisions
- legal entity type is part of company profile
- invoice flow for Gewerbe is optional
- minimum useful scenario for Gewerbe = time tracking + transfer to accountant
- accountant may be internal or external and can work with multiple companies

## Platform decisions
- @gewerbebot = platform/personal bot
- @bauuhrbot = default shared client bot
- dedicated company bot = optional
- @SEKbaubot = separate client-specific bot for SEK
