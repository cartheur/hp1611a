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

## Important Architectural Split

The two front displays do **not** need to be treated as equal from a computing point of view.

That earlier assumption created confusion.

The correct framing is:

- left display: rich touch UI with real event handling
- right display: terminal, status, logs, or compact diagnostic information

These are different jobs and may justify different implementation strategies.

### Left display role

The left touchscreen is the display that genuinely wants the larger host computer.

Reasons:

- it must handle touch eventing
- it will likely host the main operator workflows
- it is the natural place for environmental-variable control and scenario interaction
- it carries more UI state and layout complexity than the right side

So the left display should be treated as the primary `Raspberry Pi 4` display.

### Right display role

The right display should **not** automatically be assumed to need the same class of rendering path as the left side.

If it is truly a "terminal display," then several architectures are plausible:

- a second `Pi 4` `HDMI` display showing a terminal or status pane
- a simpler serial or controller-driven text/status display
- a compact diagnostic pane driven by the controller tier rather than the full host UI

So the key question for the right side is not "can it be a second modern monitor?"

The key question is:

- what semantic job should the right-side pane actually perform?

Examples:

- raw target serial output
- interpreted machine state
- environmental-variable history
- event and fault logs
- compact counters, flags, and live status

### Practical consequence

The left-side screen choice can be considered settled as the primary touch UI surface.

The right-side facade dimensions are still valid, but the implementation path should remain open until the exact meaning of "terminal display" is fixed.

That means:

- keep the left screen and host assumptions stable
- avoid overcommitting the right screen to a full rich-display path before its role is defined

This distinction matters because it separates:

- screen geometry decisions
- from display-semantic decisions

and prevents the project from solving the wrong problem too early.

## Controller Direction

The preferred system direction is now:

- `Raspberry Pi 4`: graphics, touch UI, terminal, logging, storage, network features
- `Arduino Nano 33 IoT`: front-panel I/O, keypad scanning, lamps, timing-sensitive control, environmental-variable bridge

Reasoning:

- the available `Raspberry Pi 4` already solves the missing-host problem cleanly
- the `Pi 4` is much better suited than a microcontroller for a modern dual-screen UI
- the available `Arduino Nano 33 IoT` is physically easier to integrate than a full-size `Mega`
- the `Nano 33 IoT` still provides a useful deterministic controller tier, with optional `Wi-Fi/Bluetooth` convenience if needed

## Provisional Selection Strategy

Do not freeze exact parts yet.

Instead, shortlist displays in two bins.

### Left-side shortlist criteria

- visible area significantly larger than a standard `5"` `800x480`
- touch support preferred
- rear depth less critical than on the right
- good compatibility with `Raspberry Pi 4`

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
3. `Raspberry Pi 4` handling the UI layer
4. `Arduino Nano 33 IoT` handling instrument and panel control

## Candidate Screen And Support-Part Shortlist

This section adds concrete candidate parts to the geometric conclusions above.

The intent is not to claim that every part below is already proven to fit the `1611A`.

The intent is to define a practical shortlist that matches the current facade measurements and the preferred `Raspberry Pi 4` plus `Arduino Nano 33 IoT` architecture.

Structured parts for this screen-repurpose direction are recorded in:

- [display-bom.csv](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/screen/display-bom.csv:1)
- [display-shopping-list.csv](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/screen/display-shopping-list.csv:1)

## Shopping-List Decision

As of `August 24, 2026`, the display choice should be treated as settled enough for a shopping list:

- left display: `Waveshare 5inch HDMI LCD (H) V4`
- right display: `Waveshare 7inch HDMI LCD (C)`

This is not the most visually aggressive possible pairing.

It is the most defensible pairing from the current combination of:

- measured facade geometry
- `Raspberry Pi 4` compatibility
- mechanical risk
- present-day product availability

### Why this is the settled pair

#### Left side: `Waveshare 5inch HDMI LCD (H) V4`

Checked current figures:

- overall size: `121.00 mm x 89.48 mm`
- display area: `108.00 mm x 64.80 mm`
- resolution: `800 x 480`
- touch: capacitive

Why it wins:

- fits the left side mechanically without drama
- uses standard `HDMI` plus `USB`
- is directly suitable for `Raspberry Pi 4`
- avoids the performance and rotation caveats of the more exotic portrait-first `5.5"` and `2K` display families

Why it is not perfect:

- it under-fills the left facade compared with the available opening

Even so, it is the best current shopping-list choice because the larger alternatives introduce too much mechanical or host-side risk for the first build.

#### Right side: `Waveshare 7inch HDMI LCD (C)`

Checked current figures:

- overall size: `164.90 mm x 106.96 mm x 8 mm`
- display area: `154.21 mm x 85.92 mm`
- resolution: `1024 x 600`
- touch: capacitive, available if later needed

Why it wins:

- it is the best front-fit match found so far for the right `160 mm x 100 mm` visible opening
- it fits within the right `~168 mm` mechanical width on paper
- it gives the right side the intended "full auxiliary pane" appearance

Why it remains the critical bay:

- the right side is still depth-sensitive
- connector and cable-bend clearance still need to be respected in mounting design

Even with that caution, this is still the correct display to buy for the right side.

The capacitive touch layer on this panel should be treated as a bonus capability:

- present in the purchased hardware
- not required by the current right-side role
- available later if the right pane evolves from passive status into an auxiliary control surface

### Shopping-list caveat

The display modules are settled for purchase, but the exact right-side video routing and power packaging still need final implementation detail.

This matters because:

- `Raspberry Pi 4` has the display capability needed for the concept, but final cable routing, connector orientation, and power packaging still matter
- the design wants two front displays

So the shopping list should be interpreted in two tiers:

- `buy_now`: the settled display modules, basic adapters, and mounting hardware
- `hold`: final integration parts whose exact form depends on the chosen `Pi 4` placement, cable routing, and power packaging

Use [display-shopping-list.csv](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/screen/display-shopping-list.csv:1) as the purchase-oriented version of the BoM.

### Aperture-versus-display comparison

This table compares the measured facade openings with the currently chosen display modules.

| Side | Visible aperture | Approx. mechanical width | Chosen display | Display area | Module size | Front-fit summary | Cable / connector concern |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Left CRT side | `140 mm x 100 mm` | `~155 mm` | `Waveshare 5inch HDMI LCD (H) V4` | `108.00 mm x 64.80 mm` | `121.00 mm x 89.48 mm` | safe mechanical fit, but visually under-fills the opening | lower-risk bay; still check exact `HDMI` and `USB` connector orientation so cable bend does not interfere with bezel setback |
| Right personality side | `160 mm x 100 mm` | `~168 mm` | `Waveshare 7inch HDMI LCD (C)` | `154.21 mm x 85.92 mm` | `164.90 mm x 106.96 mm x 8 mm` | near-ideal front coverage and within mechanical width on paper | highest-risk bay; must inspect `HDMI`, `USB`, and any onboard PCB protrusions because rear clearance is shallow and cable bend radius may dominate the real fit |

Immediate implications:

- the left side is mostly a visual-fit problem, not a raw mechanical-fit problem
- the right side is both a facade-fit and cable-clearance problem
- the right-side module should be physically inspected with attention to connector direction before mounting is frozen

### Rear-interface observation for the chosen `7"` panel

The added rear image for `Waveshare 7inch HDMI LCD (C)` is encouraging for the shallow right-side bay.

Observed from [7-in.jpg](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/screen/7-in.jpg:1):

- the main `HDMI` connector is placed at the left edge of the rear PCB
- the `USB` connector is also placed at the left edge
- the backlight switch is likewise at the same edge
- there is no large central rear connector block projecting straight backward from the middle of the panel

Why this helps:

- cable exit can be routed sideways from the panel edge rather than directly rearward from the center
- this reduces the risk that connector depth alone will consume the shallow cavity behind the right aperture
- it makes bracket design more plausible because the center rear area is comparatively clear

What still needs checking on the real part:

- exact plug body thickness once `HDMI` and `USB` cables are installed
- bend radius of the chosen cables immediately after the connectors
- whether the left-edge connector side aligns favorably with the available chassis escape path inside the `1611A`

So the backside image improves confidence in the right-side choice, but the final fit still depends on the cables, not just the bare module.

### Preferred screen pair

#### Left side candidate

`Waveshare 5inch HDMI LCD (H) V4`

- resolution: `1024 x 600`
- display area: `108.00 mm x 64.80 mm`
- overall size: `121.00 mm x 89.48 mm`
- touch: capacitive, `5-point`
- interface: `HDMI` plus `USB`

Why it is attractive:

- straightforward fit inside the left bay
- directly compatible with `Raspberry Pi 4`
- capacitive touch suits the main UI role well

Why it is not yet fully committed:

- it does not maximize the left facade
- it is a conservative fit choice rather than the boldest possible visual choice

Current verdict:

- settled left-side shopping-list choice

#### Right side candidate

`Waveshare 7inch HDMI LCD (C)`

- resolution: `1024 x 600`
- display area: `154.21 mm x 85.92 mm`
- overall size: `164.90 mm x 106.96 mm x 8 mm`
- touch: capacitive, but not currently required by role

Why it is attractive:

- almost ideal visible-area usage for the right `160 mm x 100 mm` aperture
- fits the right `~168 mm` mechanical width on paper
- gives the secondary display a strong "full instrument pane" look rather than a small insert

Why it is risky:

- the right side remains depth-sensitive
- connector placement and cable bend may be harder than the front fit suggests

Current verdict:

- settled right-side shopping-list choice and reference geometry for the right aperture

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

- still valid if the exact Waveshare left-side module changes, but no longer the primary shopping-list pick

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

`Raspberry Pi 4`

Why it fits this project:

- already on hand
- sufficient graphics and software headroom for the display role
- much better suited than a microcontroller for the main UI and terminal layer
- easier path to a true two-display setup than the abandoned `Pi Zero 2 W` plan

### Hardware controller

Preferred pragmatic controller:

`Arduino Nano 33 IoT`

Why it fits this project:

- already on hand
- small physical footprint
- suitable for deterministic panel and target-facing control jobs
- includes optional wireless convenience through onboard `Wi-Fi/Bluetooth`

Alternative:

- use the older mini-USB `Arduino Nano` as a helper or fallback if a narrowly-scoped secondary controller is useful

### Left-screen interface support

For a `Raspberry Pi 4` main display path:

- micro-HDMI to HDMI adapter or cable for the Pi
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
- route video from the `Pi 4` with the flattest practical cabling
- if depth is marginal, use a panel whose driver electronics can be relocated away from the facade

Practical support items likely needed:

- short, flexible HDMI cable
- short USB cable for touch or display power
- right-angle adapters only if they reduce depth rather than increase it

### Interconnect between Pi and Arduino

Recommended baseline:

- one UART link between `Raspberry Pi 4` and `Arduino Nano 33 IoT`
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

1. `Raspberry Pi 4` as the UI computer
2. `Arduino Nano 33 IoT` as the panel and instrument controller
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
2. `Raspberry Pi 4` manages the UI and scenario logic
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
- touch is optional on this side even though the currently selected `7"` panel includes capacitive touch

This side is best treated as semantically lighter than the left side unless later requirements prove otherwise.

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
