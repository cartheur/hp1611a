# HP 1611A Front-Aperture Dual-Screen Repurpose Notes

This note records the current front-panel screen repurpose direction for the `HP 1611A`.

The working concept is to replace the original CRT presentation area with a modern two-screen facade:

- left aperture: main touch UI
- right aperture: secondary terminal, status, or log display

The goal is not only to make two screens fit electrically. The goal is to use the original facade well and avoid choosing modules that leave too much dead space or conflict with the shallow right-side cavity.

## Measured Front Apertures

User-measured front-visible apertures and approximate mechanical widths:

| Side | Visible aperture | Approximate mechanical width | Notes |
| --- | --- | --- | --- |
| Left CRT side | `140 mm x 100 mm` | `~155 mm` | deeper cavity, more tolerant of thicker display assemblies |
| Right personality-module side | `160 mm x 100 mm` | `~168 mm` | shallower rear clearance, so depth matters much more than front fit |

## What These Measurements Mean

The earlier idea of using a narrow bar display on the right side is no longer the primary recommendation.

With a `160 mm` visible width and `~168 mm` mechanical width, the right side wants a near-full rectangular display from the front.

Likewise, the left side can take more than a standard `5"` screen if the objective is to fill the original opening gracefully.

## Display-Fit Reality Check

The following dimensions are based on currently available display products checked during this design discussion.

### Standard `5"` `800x480` TFT

Typical current figures:

- active or visible area about `108 mm x 65 mm`
- alternate published viewing area about `110.6 mm x 67.4 mm`
- module size about `120 mm x 75 mm` or `121 mm x 76 mm`

Implications:

- fits the left side easily
- does **not** maximize the left facade
- is clearly undersized for the right facade if full aperture use is desired

### Typical `7"` HDMI panel

Checked example:

- display area about `154.21 mm x 85.92 mm`
- overall module size about `164.90 mm x 106.96 mm x 8 mm`

Implications:

- from the front, this is nearly ideal for the right-side aperture
- mechanical width is plausible on the right because `~168 mm` is available
- visible width of `160 mm` means bezel masking must be handled carefully
- the shallow rear cavity on the right still makes connector and PCB depth the main risk

### Small square `4"` class displays

These are visually too small for either aperture if the goal is to use the original facade well.

### Narrow bar displays

These are still interesting stylistically, but they are no longer the best fit-first recommendation for the right side.

They suit a deliberate "instrument side strip" aesthetic, not "maximize the personality aperture" geometry.

## Current Mechanical Conclusions

### Left side

The left CRT opening is more forgiving mechanically because the original CRT cavity is deeper.

Current conclusion:

- a standard `5"` screen is safe but leaves too much unused border
- a display somewhat larger than `5"` is preferred if we can find one with a front area closer to the `140 mm x 100 mm` aperture
- a slightly bulkier screen assembly is acceptable here compared with the right side

### Right side

The right side is now the stronger candidate for a large rectangular secondary display.

Current conclusion:

- prioritize front area close to the `160 mm x 100 mm` visible opening
- prioritize shallow module construction or a separated driver board
- avoid thick all-in-one HDMI monitor boards unless rear clearance proves adequate

## Recommended Screen Direction

The present recommendation is:

- left side: the main touchscreen UI
- right side: a larger secondary rectangular display for terminal, status, logs, or diagnostics

This division still matches the front-panel asymmetry well, but the right-side screen should now be treated as a near-full facade element rather than a narrow sidebar.

## Controller Direction

The preferred system direction is now:

- `Pi Zero 2 W`: graphics, touch UI, terminal, logging, network features
- `Arduino`: front-panel I/O, keypad scanning, lamps, timing-sensitive control, hardware bridge

Reasoning:

- a `Pi Zero 2 W` is much better suited than a low-end Arduino for a modern touchscreen UI
- an Arduino remains useful as a deterministic hardware controller
- the left-side main display is the natural place for the Pi-driven UI
- the right-side display can be either Pi-driven or driven by a simpler secondary controller depending on depth and cabling

## Provisional Selection Strategy

Do not freeze exact parts yet.

Instead, shortlist displays in two bins.

### Left-side shortlist criteria

- visible area significantly larger than a standard `5"` `800x480`
- touch support preferred
- rear depth less critical than on the right
- good compatibility with `Pi Zero 2 W`

### Right-side shortlist criteria

- visible area as close as practical to `160 mm x 100 mm`
- shallow rear profile or remote driver board
- rectangular format strongly preferred
- touch optional
- connector placement and cable bend radius must be checked carefully

## Current Preferred Architecture

If a dual-screen build is pursued, the current high-level architecture should be treated as:

1. left main display in the original CRT region
2. right secondary display in the original personality-module region
3. `Pi Zero 2 W` handling the UI layer
4. Arduino handling instrument and panel control

## Candidate Screen And Support-Part Shortlist

This section adds concrete candidate parts to the geometric conclusions above.

The intent is not to claim that every part below is already proven to fit the `1611A`.

The intent is to define a practical shortlist that matches the current facade measurements and the preferred `Pi Zero 2 W` plus Arduino architecture.

Structured parts for this screen-repurpose direction are recorded in:

- [display-bom.csv](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/screen/display-bom.csv:1)

### Preferred screen pair

#### Left side candidate

`Waveshare 7inch HDMI LCD (C)`

- resolution: `1024 x 600`
- display area: `154.21 mm x 85.92 mm`
- overall size: `164.90 mm x 106.96 mm x 8 mm`
- touch: capacitive, `5-point`
- interface: `HDMI` plus `USB` for touch and power

Why it is attractive:

- much better front-area usage than a standard `5"` panel
- directly compatible with `Pi Zero 2 W`
- capacitive touch suits the main UI role well

Why it is not yet fully committed:

- likely too large to expose fully in the left `140 mm x 100 mm` visible opening without deliberate bezel cropping
- outer size exceeds the left `~155 mm` mechanical width, so left-side installation needs a careful mounting concept

Current verdict:

- strong candidate only if bezel cropping is acceptable and left-side mechanics prove workable

#### Right side candidate

`Waveshare 7inch HDMI LCD (C)`

- resolution: `1024 x 600`
- display area: `154.21 mm x 85.92 mm`
- overall size: `164.90 mm x 106.96 mm x 8 mm`

Why it is attractive:

- almost ideal visible-area usage for the right `160 mm x 100 mm` aperture
- fits the right `~168 mm` mechanical width on paper
- gives the secondary display a strong "full instrument pane" look rather than a small insert

Why it is risky:

- the right side remains depth-sensitive
- connector placement and cable bend may be harder than the front fit suggests

Current verdict:

- the best front-fit candidate for the right side so far
- should be treated as the reference geometry for the right aperture

### Safer fallback screen pair

#### Left side fallback

`Adafruit 5.0" 800x480 TFT` or equivalent `5"` `800x480` HDMI/TTL panel

Typical checked figures:

- visible area about `108 mm x 65 mm`
- alternate viewing area about `110.6 mm x 67.4 mm`
- module size about `120 mm x 75 mm` to `121 mm x 76 mm`

Why it is attractive:

- straightforward fit in the left aperture
- many support options exist
- low-risk with both Arduino-driven and Pi-driven approaches

Why it is a fallback rather than the current ideal:

- leaves too much unused facade area on the left

Current verdict:

- safest left-side part family
- aesthetically second choice compared with a larger panel

#### Right side fallback

If the shallow right cavity rejects a full `7"` module, the fallback should be a shallow bare panel with remote driver board rather than a small square display.

At this stage the fallback strategy is:

- keep the right screen rectangular
- separate the driver board from the panel if possible
- accept reduced screen coverage only if depth demands it

Do **not** default back to a narrow bar display unless a deliberate styling choice is made.

### Small-screen options that remain useful but are no longer primary

#### `Waveshare 4inch HDMI LCD (C)`

- resolution: `720 x 720`
- touch: capacitive
- current checked price: about `$66.99`

This remains a useful development display or an intermediate mockup part, but it is now too small to be the preferred final facade display for either side.

#### Narrow bar TFT modules

Examples such as the Adafruit `3.2"` `320 x 820` rectangular bar TFT remain visually interesting for a stylized right-side panel, but they no longer match the measured objective of maximizing the personality aperture.

## Recommended Support Hardware

### Main UI computer

`Raspberry Pi Zero 2 W`

- current official positioning: `65 mm x 30 mm` form factor
- quad-core `1 GHz` Cortex-A53
- `512 MB` SDRAM
- mini `HDMI`
- micro `USB` OTG
- official price currently stated as `$15`

Why it fits this project:

- small enough to hide easily inside the chassis
- much better suited than a low-end Arduino for the main UI and terminal layer
- simple HDMI path to one primary screen

### Hardware controller

Preferred pragmatic controller:

`Arduino Mega 2560 Rev3`

- current official price: `$49.90`
- `54` digital I/O
- `16` analog inputs
- `4` hardware UARTs

Why it fits this project:

- abundant I/O for switches, lamps, keypad matrix, and miscellaneous control lines
- multiple UARTs simplify communication with the Pi and optional peripherals
- easier choice than a small Arduino when the front panel starts to grow in complexity

Alternative:

- use a smaller Arduino only if the panel-I/O count stays modest

### Left-screen interface support

For a `Pi Zero 2 W` main display path:

- mini-HDMI to HDMI adapter or cable for the Pi
- USB connection for touch and, depending on panel, panel power

If a raw `5"` TTL TFT is used instead of a self-contained HDMI display, candidate support boards include:

- `Adafruit TFP401 HDMI/DVI Decoder to 40-pin TTL Breakout - With Touch`
- `Adafruit RA8875 Driver Board for 40-pin TFT Touch Displays`

Use notes:

- `TFP401` suits a Pi-driven HDMI display path
- `RA8875` suits an Arduino-driven path better, but this is now secondary to the Pi-based UI plan

### Right-screen interface support

Preferred approach:

- use an HDMI display whose panel electronics are shallow enough for the right bay
- if depth is marginal, use a panel whose driver electronics can be relocated away from the facade

Practical support items likely needed:

- short, flexible HDMI cable
- short USB cable for touch or display power
- right-angle adapters only if they reduce depth rather than increase it

### Interconnect between Pi and Arduino

Recommended baseline:

- one UART link between `Pi Zero 2 W` and Arduino
- shared ground
- optional second UART or USB serial path for debug and maintenance

Function split:

- Pi sends UI commands and receives machine state
- Arduino owns physical I/O timing and hardware-side control

### Power-support parts

Expected support items:

- solid `5 V` rail sized for `Pi Zero 2 W` plus two displays
- separate fused branches for logic and display power if practical
- provision for display backlight control or shutdown

Because the display choice is still open, power sizing should not be frozen yet.

The `7"` HDMI display family is more demanding than the small `5"` panel family and should be budgeted accordingly.

## Present Recommendation

If selecting parts today for the planning document rather than for immediate purchase, the current preferred package should be recorded as:

1. `Pi Zero 2 W` as the UI computer
2. `Arduino Mega 2560 Rev3` as the panel and instrument controller
3. right side anchored around a `7"` rectangular HDMI display geometry similar to `Waveshare 7inch HDMI LCD (C)`
4. left side either:
   - another larger-than-`5"` touch display if mechanical work allows, or
   - a `5"` class display as the conservative fallback

This keeps the design honest about what is known now:

- the right side strongly wants a near-full rectangular display
- the left side benefits from a larger display than the common `5"` modules, but its exact best candidate still needs a fit-first pass

## Facade Layout Concept

The screen choice should be tied to a specific visual arrangement on the `1611A` front panel.

The current preferred facade concept is:

- left side: primary touch workspace
- right side: persistent secondary information pane

### Left-side role

The left display should act as the operator's main surface.

Suggested content:

- measurement and trace views
- setup and trigger controls
- on-screen soft keys where useful
- system configuration and maintenance pages

Preferred presentation:

- one dominant full-screen working view
- minimal decorative framing
- custom bezel mask sized to make the modern panel look intentional in the CRT opening

### Touchscreen as environmental simulator

The touchscreen does not need to be limited to ordinary front-panel replacement duties.

A more interesting role is to use it as an operator-facing environmental model that can influence the target CPU under test.

In that mode, the touchscreen can:

- display synthetic environmental variables presented to the target
- let the operator bias those variables
- inject disturbances, thresholds, or state changes
- help create controlled feedback loops between operator input and target response

Examples of operator-adjustable variables could include:

- analog-like sensor levels
- switch closures and discrete state flags
- timing offsets or event rates
- fault or limit conditions
- external status bytes or simple virtual peripherals

This gives the left display a stronger systems role:

- not just "a nice GUI"
- but a way to shape the world seen by the target CPU

### Important constraint: target side remains simple

This idea must stay grounded in the actual hardware reality of the project:

- the target-side processing computer is `8-bit`
- the construction style is still wire-wrapped and resource-constrained
- the repurpose should avoid assuming abundant memory, bandwidth, or software abstraction on the target side

That means the touchscreen side should usually operate at a higher level than the target side.

Preferred pattern:

1. the touchscreen UI runs on the modern host side
2. the host reduces operator actions to a small, disciplined set of variables
3. the controller hardware presents those variables to the target in simple forms the `8-bit` system can realistically consume

Suitable target-facing forms include:

- digital lines
- latched status bits
- simple counters
- PWM or DAC-derived analog levels
- UART-style byte streams at conservative rates

Avoid designs that require the target side to interpret a large modern protocol stack just to benefit from the touchscreen.

### Recommended split for feedback-loop experiments

For this repo's design direction, the most realistic loop is:

1. operator adjusts environmental variables on the left touchscreen
2. `Pi Zero 2 W` manages the UI and scenario logic
3. controller hardware converts those choices into simple target-facing signals
4. the `8-bit` target reacts
5. the right display shows logs, traces, counters, or state changes

This preserves the character of the target system instead of overwhelming it with modern complexity.

### Right-side role

The right display should act as a persistent auxiliary pane rather than a duplicate main screen.

Suggested content:

- terminal or shell window
- event log
- probe and target status
- serial console
- clocks, counters, acquisition state, and other always-visible machine state

Preferred presentation:

- mostly static layout
- small text and dense information are acceptable
- touch is optional on this side

## Bezel Strategy

The modern screens should not simply be dropped into the original openings with exposed mismatch around the edges.

The design should assume a custom inner bezel or mask on both sides.

### Left bezel strategy

Because the left visible opening is `140 mm x 100 mm`, and larger candidate panels may exceed that front window:

- allow intentional cropping by the bezel
- center the active area visually
- avoid exposing the full outer glass if it makes the fit look accidental

This is especially important if a `7"` class panel is used on the left.

### Right bezel strategy

Because the right visible opening is `160 mm x 100 mm` and the mechanical width is `~168 mm`:

- maximize visible area
- keep bezel borders thin and even
- prefer a panel that fills the opening from the front without needing dramatic masking

The right side should read visually as a purpose-built display pane, not as a small module in a large empty recess.

## Mounting Direction

The present display design should assume different mounting priorities for the two bays.

### Left side mounting priorities

- front appearance first
- depth is relatively forgiving
- display controller PCB may remain attached if needed
- touch is strongly preferred

### Right side mounting priorities

- shallow rear build first
- remote driver board preferred if panel depth is marginal
- connector orientation is critical
- flexible cable routing matters more here than on the left

## Cabling Direction

The dual-screen design should try to keep all bulky adapters and cable bends away from the right facade volume.

Preferred cable strategy:

- left side can tolerate more direct adapter hardware
- right side should use the shortest and flattest cabling possible
- if a display family places its controller PCB directly behind the active area, it should be treated cautiously for the right side

## Current Visual Recommendation

If drawing or mocking up the front panel today, use this arrangement:

1. left aperture populated by the main touch UI
2. right aperture populated by a nearly full-width rectangular secondary screen
3. right screen content shown as terminal, log, or compact status information
4. both screens hidden behind custom masks so the facade reads as deliberate rather than retrofitted

This keeps the design aligned with the actual measurements and prevents the project from drifting back toward undersized insert screens.

## Cross-Repo Timing

Cross-reference this screen-repurpose work with the other repo only when the interface between "modern environmental model" and "`8-bit` target-facing signals" becomes concrete.

That usually means one or more of these are true:

1. the list of environmental variables is being formalized
2. the signal form for each variable is being chosen
3. the target-side injection path is being defined
4. the right-side logging or observability path needs to agree with target-side semantics

Before that point, cross-repo linking is likely to create noise rather than clarity.

So the practical answer is:

- keep this repo focused on display, facade, operator interaction, and controller-side packaging for now
- cross-reference the two repos as soon as variable definitions and target-facing interfaces stop being speculative and start becoming named engineering objects

## Open Questions

These items still need a fit-first pass before parts are committed:

1. What exact rear depth is available behind the right aperture, including connector and cable bend clearance?
2. Is the right-side display allowed to sit slightly behind a custom bezel mask, or must it visually fill the opening edge-to-edge?
3. Is the left-side priority "best fit" or "easiest supported touchscreen"?
4. Is the right-side display intended to be a true second desktop display, or a dedicated status screen with a simpler rendering path?

## Next Step

Build a fit matrix for candidate displays with:

- active area
- outer dimensions
- estimated rear depth
- connector location
- left-fit verdict
- right-fit verdict
- `Pi Zero 2 W` compatibility

## Source Notes

Current checked reference dimensions came from these products and documentation:

- Adafruit `5.0"` `800x480` TFT family: `108 mm x 65 mm` visible area and `~121 mm x 76 mm` module dimensions
- DigiKey listing for Adafruit `1596`: `110.6 mm x 67.4 mm` viewing area
- Waveshare `7inch HDMI LCD (C)`: `154.21 mm x 85.92 mm` display area and `164.90 mm x 106.96 mm x 8 mm` overall size

These references are enough to guide geometry decisions for now, but they are not yet the final parts shortlist.
