# Lavalamp canonical effect models

## Scope

This file fixes the current canonical scene models for the Lavalamp project.

Project is hard-locked to:
- ESP32 / future ESP32-S3
- WLED base
- 16x16 matrix
- closed cylindrical wrap
- matte cylindrical diffuser

This is not a generic effect framework.
This is a hardware-locked visual runtime for one lamp.

## Global rules

1. Scene-first.
2. Cheap-render first.
3. Closed-cylinder geometry first.
4. Smooth motion is more important than complex math.
5. If it slows down, it is wrong.
6. If it looks chaotic, it is wrong.
7. If it reads as a flat panel, it is wrong.
8. Any detail that dies in the diffuser is useless.

## Geometry canon

- `X` is angular position around the cylinder.
- `Y` is height.
- X is always wrap-aware.
- X=0 and X=max are neighbors.
- No scene may assume a true left/right edge.
- All body masks must preserve seam continuity.

## Donor roles

Donor effects are used as mechanics donors, not as final scene templates.

### FireNoise / Noise2D
Role:
- smooth internal flow
- continuous evolving field
- no row-jumps

### Sun Radiation
Role:
- smooth continuous evolution
- stable temporal feel
- useful angular/radial shaping hints

### Plasma Ball
Role:
- internal energy structure
- living inner channels
- use only in a very reduced form

### Octopus
Role:
- organic soft deformation
- tentacle-like bending logic
- use only as a deformation donor, not as visual identity

## Canonical Flame model

Flame is not based on heavy propagation, heavy pseudo-physics, or flat fire maps.

Canonical structure:
- one dominant cylindrical flame body
- body is wrap-aware
- stable lower ignition zone
- hotter lower-middle core
- upward taper / fade
- smooth internal motion from FireNoise/Noise2D-class donor mechanics
- very mild angular sway only

Flame must read as:
- torch / candle inside a cylinder
- not stock FireNoise
- not a flat fire panel
- not a chaotic field

## Canonical Lava model

Lava is not a fluid sim and not metaballs-heavy pseudo-physics.

Canonical structure:
- stylized molten-wax scene
- 2-3 readable bodies max
- lower birth zone
- slow upward motion
- minimal deformation
- smooth donor-style motion inside the bodies
- strong palette / output shaping

Lava must read as:
- slow molten bodies
- not flame
- not plasma
- not chaotic noise

## Canonical Anemone model

Anemone grows from below.

Canonical structure:
- one small anchored body: about 2-3 pixels visually
- 4-5 tentacles only
- lower underglow / base light
- body mostly stable
- tentacles move with soft underwater sway
- tentacle tips move more than the base
- no strong vertical transport
- meditative scene class

Motion:
- smooth and soft only
- no jerks
- no aggressive pulses
- no chaos

## Canonical Jellyfish model

Jellyfish is a separate scene from Anemone.

Canonical structure:
- one jellyfish only
- small-to-medium bell: about 4-5 pixels wide, 2-3 pixels tall
- 3-4 main tentacles
- 1 very weak extra trail maximum
- scene lives in the middle / upper half of the cylinder
- not attached to the bottom

Motion:
- pulse -> glide rhythm
- bell compresses and opens softly
- slight upward lift after pulse
- slow drift
- tentacles lag behind body motion
- meditative and soft, but more mobile than Anemone

Palette:
- softer and more translucent than Anemone
- cold underwater family from reference images

## Scene differentiation

### Flame
- energy / heat / upward force

### Lava
- slow molten mass / heavier body logic

### Anemone
- anchored underwater life / sway and bend

### Jellyfish
- free-floating underwater life / pulse and drift

## Optimization priorities

1. Stable FPS on current hardware.
2. Readability through matte glass.
3. One dominant scene body.
4. Minimal pass count.
5. Donor mechanics adapted, not copied blindly.

## What must not be done

- no heavy pseudo-physics by default
- no expensive multi-pass chains unless proven necessary
- no donor cloning without cylinder adaptation
- no flat-panel logic disguised as cylindrical effect
- no premature complexity growth

## Practical development rule

First extract donor mechanics.
Then adapt them to:
- body mask
- closed cylindrical wrap
- 16x16 readability
- diffuser-aware shaping

Only after that evaluate scene quality live.
