# BauClock

## Goal
BauClock is a B2B SaaS system for construction companies that combines time tracking, site presence control, role-based visibility, overtime and payment support, subcontractor coordination, and optional business workflows for Gewerbe and other company types.

## Runtime
- Telegram bot layer
- FastAPI backend
- PostgreSQL
- Redis
- web dashboard

## Product position
The product is not only a Telegram bot. It is a site-centric operating system for small and medium construction workflows.

## Core promise
- simple worker check-in and checkout
- strict role isolation
- support for real construction business structure
- useful minimum flow for both general contractors and subcontractors
- optional finance layer instead of mandatory heavy ERP logic

## Product model
- multi-company
- site-centric
- role-isolated
- privacy-by-business-logic
- one platform with shared and dedicated bot options

## Main user groups
- platform superadmin
- company owner
- optional objektmanager
- accountant
- worker
- subcontractor company owner
- Gewerbe owner

## Geographic strategy
Current business focus is Germany, but the product model should remain extensible to other countries through localization, company legal form configuration, and country-specific business templates instead of rewriting the core domain model.
