# Decisions

## Architecture
- strict separation: geometry → physics → render → integration
- cylinder-first mapping (no planar hacks)

## Rendering
- focus on realism over abstract effects
- light diffusion simulation via gradients

## Constraints
- must run on ESP32
- optimized for WLED usermod structure
