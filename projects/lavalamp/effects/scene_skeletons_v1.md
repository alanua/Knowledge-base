# Scene skeletons v1

## Scope
Short scene decomposition for current Lavalamp effect work.

Hard lock:
- ESP32 / future ESP32-S3
- WLED base
- 16x16 closed cylindrical matrix
- matte diffuser
- cheap-render first

## Anemone v1

### Identity
- anchored bottom creature
- meditative underwater scene
- one object only

### Geometry
- small body/core: 2-3 px visual size
- anchored near bottom
- 4-5 tentacles only
- X is wrap-aware angle
- no seam break

### Structure
1. bottom underglow
2. small anchored core
3. 4-5 tentacle anchors around core
4. tentacle ribbons with soft taper

### Motion
- primary: soft sway / bend
- body: almost stable
- tips: move more than bases
- slight length breathing only
- no upward transport logic
- no aggressive pulse

### Kernels
- K2 Tentacle Bend Kernel = primary
- K1 Smooth Flow Substrate = secondary, very weak
- K3 Macro Calm Evolution = secondary
- K4 Subtle Inner Life = none by default

### Readability targets
- clearly reads as one anchored organism
- no flame similarity
- no noise mess

## Jellyfish v1

### Identity
- free-floating soft creature
- meditative underwater scene
- one object only

### Geometry
- bell width: about 4-5 px
- bell height: about 2-3 px
- 3-4 main tentacles
- 1 very weak extra trail maximum
- lives in middle / upper half
- X is wrap-aware angle
- no seam break

### Structure
1. soft bell cap
2. soft inner bell glow
3. 3-4 trailing tentacles
4. weak lower translucency trail

### Motion
- primary: pulse -> glide
- bell compress/open softly
- slight upward lift after pulse
- slow drift
- tentacles lag behind bell motion
- no sharp pulse
- no fast travel

### Kernels
- K1 Smooth Flow Substrate = primary for soft body field
- K2 Tentacle Bend Kernel = primary for tentacle lag
- K3 Macro Calm Evolution = secondary for pulse continuity
- K4 Subtle Inner Life = very weak only

### Readability targets
- clearly reads as one small jellyfish
- not a floating flame
- not an anemone in mid-air
- not a plasma effect

## Shared limits
- one object per scene
- low-frequency motion only
- no donor cloning
- no heavy pseudo-physics
- no expensive multipass chains
- diffuser-aware shaping only
