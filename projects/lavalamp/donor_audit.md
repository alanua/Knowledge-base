# Lavalamp donor audit v1

## Purpose

Canonical method for analyzing donor effects for the Lavalamp project.

Goal:
- extract reusable motion patterns
- extract anti-repeat mechanisms
- extract low-cost optimization patterns
- reject visually attractive but computationally wrong ideas for ESP32-S3 + WLED + 16x16 cylinder

Donors are not copied wholesale.
They are decomposed and translated into Lavalamp runtime terms.

## Canonical runtime vocabulary

All extracted ideas must fit this runtime vocabulary:
- `theta8`
- `h8`
- `angleDelta8`
- `field[256]`
- `seed per entity`
- `target/interpolate random`
- `cheap soften / afterglow`
- cylinder-first geometry

## Core rule

Analyze each donor as 4 reusable layers:
1. geometry idea
2. motion idea
3. anti-repeat idea
4. optimization idea

Do not port full donor logic unless it already matches Lavalamp constraints.

## Donor audit template

### A. Geometry
- space: `flat_xy | polar | cylindrical | hybrid`
- wrap on X: `yes | no`
- natural for cylinder: `yes | partial | no`
- transfer to `theta + h`: `direct | partial | bad`

### B. Motion
- main motion
- secondary motion
- number of time layers
- phase offsets per entity: `yes | no`
- delay along height: `yes | no`
- event-driven behavior: `yes | no`

### C. Randomness / anti-repeat
- seed per entity: `yes | no`
- drift targets: `yes | no`
- hold-and-interpolate random: `yes | no`
- rare micro-events: `yes | no`
- non-commensurate periods: `yes | no`
- anti-repeat score: `0..5`

### D. Optimization
- LUT used: `yes | no`
- integer math heavy: `yes | no`
- local update / bounding boxes: `yes | no`
- cheap blur/decay: `yes | no`
- precomputed coordinates: `yes | no`
- few active entities: `yes | no`
- expensive math present: `sin/cos/sqrt/exp/noise/full-frame blur`
- optimization score: `0..5`

### E. Visual signature
- what makes it feel alive
- what must be preserved
- what can be simplified safely

### F. Extraction
- geometry idea to extract
- motion idea to extract
- anti-repeat idea to extract
- optimization idea to extract

### G. Fit for Lavalamp
- anemone fit: `high | medium | low`
- jellyfish fit: `high | medium | low`
- generic kernel fit: `high | medium | low`
- final class: `A | B | C | D`

### H. Decision
- `adopt now | later | reject`
- exact reusable parts
- exact parts to ignore

## Classification

### A-class
Take almost directly.
Strong transferability, low compute cost, high anti-repeat value.

### B-class
Take partially.
Contains 1–2 strong reusable mechanisms.

### C-class
Take only isolated tricks.
Do not treat as scene model.

### D-class
Reject.
Visually interesting but wrong for runtime budget or cylinder logic.

## Canonical extraction priorities

### Tier 1
- LUT instead of trig
- integer math / fixed-point where practical
- `seed per entity`
- `target + interpolate`
- local update regions
- `field[256]`
- decay/afterglow instead of true blur

### Tier 2
- cheap noise LUT
- low-res internal field
- active entities instead of full-frame complexity
- non-commensurate slow clocks

### Tier 3
- edge glow tricks
- pseudo-depth cheats
- soft body masks if still low-cost

## What to reject by default

Reject unless proven cheap and transferable:
- true physics
- heavy per-pixel noise
- `sqrt/exp` in the main render loop
- complex full-frame blur
- flat-XY logic without cylinder wrap
- scene kernels that require a large matrix to look good

## Canonical anti-repeat method

Randomness must change behavior parameters, not raw pixels.

Use:
- per-entity seeds
- multiple non-commensurate slow clocks
- hold-and-interpolate targets
- rare micro-events
- light asymmetry between entities

Avoid:
- frame-by-frame random
- unstable pixel noise
- short obvious loops

## Reusable kernels to build from donor analysis

### Motion kernel v1
- global slow sway
- local sway per entity
- pulse layer
- drift targets for amplitude/width/offset
- delay along height where natural

### Randomness kernel v1
- entity seed
- target value
- current value
- chase/interpolation factor
- hold timer
- rare event trigger

### Optimization kernel v1
- precomputed cylinder coordinates
- `theta8` / `h8`
- local cheap masks
- field accumulation
- one cheap soften pass maximum
- decay-based trails

## Low-cost primitives to standardize

- wrapped angular band
- vertical range mask
- cheap blob / cheap ellipse
- decay8
- one-pass cheap soften

## Scene-specific notes

### Anemone
Look for:
- per-tentacle phase offsets
- delay along height
- different lengths and widths
- slow drift of amplitude
- occasional local activation

Do not take:
- physically simulated strands
- spline-heavy geometry
- expensive distance-to-curve math

### Jellyfish
Look for:
- dome as mask
- pulse
- phase lag in tentacles
- slow drift around cylinder
- soft rim glow

Do not take:
- mesh deformation
- volumetric tricks
- expensive blur-heavy softness

## Source location for donors

Primary donor source is the `effects` branch in the Lavalamp project.

Use this document as the canonical audit framework before extracting reusable kernels into implementation files.
