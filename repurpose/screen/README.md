# HP 1611A Front-Panel Hardware-Trigger And Character-LCD Direction

This note records the current front-panel repurpose direction for the `HP 1611A`.

As of `August 24, 2026`, the project is no longer trying to build a rich touchscreen front end.

The working concept is now:

- operator inputs are real hardware controls
- environmental variables are created in hardware
- a small character LCD is used only for status, labels, and simple readback

This change is intentional.

It avoids:

- `Raspberry Pi` image churn
- Windows-only display toolchains
- large graphics stacks whose failure mode is "nothing useful works"

## Current Committed Direction

As of `August 24, 2026`, these choices should be treated as the active working direction:

- `Arduino Nano 33 IoT` remains the first controller
- `10`x `Same Sky PTNS2-4515M-B10` slide potentiometers are already purchased
- first revision should assume `8` active slider channels, not `10`, unless muxing is added
- if muxing is needed, prefer `CD74HC4051E` over older `CD4051B` family parts for the `3.3 V` logic environment
- the right side should be treated as a Rodney annunciator/status area rather than a second terminal
- the right-side text strip should be a narrow fixed-role display, not a free-running console
- the left side should carry the denser control bank

The point of this section is to record what is no longer just brainstorming.

## Measured Front Apertures

User-measured front-visible apertures and approximate mechanical widths:

| Side | Visible aperture | Approximate mechanical width | Notes |
| --- | --- | --- | --- |
| Left CRT side | `140 mm x 100 mm` | `~155 mm` | deeper cavity, more tolerant of thicker assemblies |
| Right personality-module side | `160 mm x 100 mm` | `~168 mm` | shallower rear clearance, so depth matters much more than front fit |

These dimensions still matter mechanically, but they no longer force us to fill both openings with modern display glass.

## Current Architecture

The preferred high-level architecture is now:

1. hardware controls generate environmental variables directly
2. `Arduino Nano 33 IoT` reads controls, enforces timing, and owns target-facing logic
3. a small character LCD provides status and readback only
4. target-facing outputs remain electrically simple

Suitable output forms include:

- digital lines
- latched status bits
- timed pulses
- PWM or DAC-derived analog levels
- UART-style byte streams at conservative rates

## Why This Direction Wins

This architecture fits the project better because:

- it behaves more like an instrument and less like a general-purpose computer
- it can boot deterministically
- it makes failure analysis easier
- it keeps the target-side interface honest and simple
- it turns "environmental simulation" into real electrical behavior instead of screen state

## Display Role

The display is no longer the main interface.

The small character LCD should be treated as an observability device with jobs such as:

- current mode
- selected variable
- current setpoint or level
- trigger state
- counter values
- fault or limit messages
- simple prompts during setup or calibration

Good display behavior is:

- always readable
- low-information but high-trust
- useful even when the rest of the system is still primitive

## Control Surface Direction

The main operator surface should now be physical.

Candidate input types:

- toggle switches
- pushbuttons
- rotary encoder with push
- potentiometers
- thumbwheel or BCD switches if exact numeric entry matters
- mode selector switch
- dedicated trigger or inject button

The exact mix should follow the variable types:

- binary conditions want switches or buttons
- continuously adjustable values want pots or encoder-driven numeric entry
- event injection wants dedicated momentary controls
- operating mode wants a distinct selector rather than a buried menu

## Slider Bank Direction

The purchased `PTNS2-4515M-B10` parts are a strong fit for the left-side control bank:

- `45 mm` travel
- `10 kOhm` linear taper
- through-hole mounting
- long enough throw to feel like a real instrument control rather than a trim adjustment

These sliders should be assigned fixed roles rather than reused through menus.

Recommended structure:

- `6` core sliders with clearly justified continuous-variable roles
- `2` likely sliders for secondary continuous variables
- `2` reserved sliders for later expansion or experiment

Good first-role candidates:

- `LEVEL`
- `BIAS`
- `RATE`
- `THRESHOLD`
- `DELAY`
- `WIDTH`
- `NOISE`
- `LIMIT`

Possible reserved or later roles:

- `GAIN`
- `OFFSET`

Do not waste slider positions on jobs that should really be:

- toggle switches for binary state
- buttons for events
- selectors for mode
- encoder or keypad style entry for exact numeric values

## Analog-Input Constraint And Mux Direction

The `Arduino Nano 33 IoT` offers `8` practical analog inputs on the board.

That means:

- `8` sliders can be read directly with no extra parts
- `10` sliders require either prioritization or muxing

The preferred first-build stance is:

- wire `8` sliders directly
- physically mount all `10` only if it helps the mechanical design
- leave `2` channels reserved until the variable map proves they are needed

If muxing is later justified, the recommended part family is:

- `CD74HC4051E`

Reason:

- it is a better fit for the board's `3.3 V` logic than older `CD4051B` choices

Minimal mux use:

- `8` slider wipers into one mux
- mux common output to one ADC
- `3` digital select lines from the controller
- optional enable control if desired

Even if muxing is added later, the input circuitry remains modest:

- slider ends to `3.3 V` and `GND`
- wiper to ADC or mux input
- optional `1 kOhm` series resistor
- optional small capacitor to ground for smoothing

## Front-Panel Use Of The Two Apertures

The earlier two-screen goal is no longer the design center.

The apertures should now be treated as available front-panel real estate.

Current preferred use:

- left CRT opening: main control cluster and or the character LCD with supporting indicators
- right opening: additional controls, status lamps, legends, or a future expansion area

Reasonable alternatives:

- put the character LCD in the right opening and use the left for denser controls
- use one opening for a labeled control panel and leave the other masked until the hardware-trigger set stabilizes

The important point is this:

- do not buy large displays just to occupy space

## Right-Side Rodney Annunciator Concept

The right opening should now be treated as the Rodney side.

Its job is not to be a second general-purpose terminal.

Preferred composition:

- one narrow fixed-role text strip
- a field of labeled LEDs
- a few dedicated action buttons

Recommended semantic split:

- left side: operator sets the world
- right side: Rodney reports what happened

### Right-side text strip

The strip display should show compact, fixed-role text such as:

- latest Rodney message
- active handshake phase
- current fault text
- current communications or scenario summary

The right-side strip should be treated as a status bus, not a terminal emulator.

### Right-side LED groups

Recommended first LED set:

- `POWER`
- `RODNEY LINK`
- `RX`
- `TX`
- `ARMED`
- `TRIGGER`
- `INJECT`
- `FAULT`

Recommended row grouping:

- row `1`: `POWER`, `LINK`, `RX`, `TX`
- row `2`: `ARMED`, `TRIGGER`, `INJECT`, `FAULT`

Recommended behavior:

- `TRIGGER` can latch until acknowledged
- `FAULT` should latch until cleared
- `RX` and `TX` can be brief activity indicators
- `POWER` and `LINK` should reflect steady state cleanly

### Right-side buttons

Recommended first buttons:

- `ACK`
- `FREEZE`
- `CLEAR`

## Character-LCD Selection Direction

The preferred display class is now a small character LCD rather than a graphics panel.

Good candidate classes:

- `16x2`
- `20x4`
- character LCD with `HD44780`-compatible parallel or `I2C` backpack interface
- optionally transflective or high-contrast modules if ambient readability matters

Selection criteria:

- simple interface
- broad library support
- no vendor lock-in
- readable from the operator position
- easy mechanical mounting

What the LCD does not need:

- touch
- framebuffer graphics
- Linux
- special desktop tooling

For the right-side strip specifically, the current favored class is a long narrow character display rather than a blockier `20x4`.

## Hardware Support Around The LCD

The LCD support circuitry should stay simple.

Typical needs:

- regulated logic supply
- contrast control if required by the module
- backlight current limiting or backlight supply path
- connector and service access
- optional `I2C` backpack if it reduces wiring cleanly

If an `I2C` backpack is used:

- check voltage compatibility
- keep bus wiring short and clean
- include pull-up sanity if the chosen backpack does not already handle it well

## Target-Facing Hardware Direction

The environmental variables should now be realized in hardware.

That means defining each variable in terms of:

- operator control type
- firmware representation
- output electrical form
- expected target behavior

Examples:

| Variable type | Operator input | Output form |
| --- | --- | --- |
| binary condition | toggle switch | logic line or open-collector output |
| analog-like level | potentiometer or encoder | PWM plus filter or DAC |
| timed event | pushbutton or mode plus button | monostable or firmware-timed pulse |
| count or rate | encoder or thumbwheel | counter preload, divided clock, or burst generator |
| external status byte | selector plus confirm | latched digital outputs or conservative serial byte stream |

## `Arduino Nano 33 IoT` Role

The `Arduino Nano 33 IoT` remains the preferred controller for bring-up.

Its jobs should be:

- read controls
- debounce and validate inputs
- own timing-sensitive behavior
- drive the character LCD
- create target-facing outputs
- report simple status and fault conditions

The firmware style should stay boring on purpose:

- simple state machine
- minimal dependencies
- explicit timing
- easy serial debug

## Mechanical Direction

The mechanical priorities changed with the display choice.

### Left side

- depth is forgiving
- good place for a dense control cluster
- good place for the character LCD if the operator should read it centrally

### Right side

- shallow rear build still matters
- good place for lamps, small displays, legends, or lighter controls
- avoid deep connector stacks

## Bezel And Facade Strategy

The project no longer needs to pretend both apertures are display windows.

So the facade strategy should be:

- use custom masks or subpanels freely
- make controls look intentional rather than temporarily stuffed into openings
- allow one aperture to become mostly controls rather than screen area
- prioritize legibility and serviceability over "max screen coverage"

## Present Recommendation

If selecting parts today for planning rather than immediate full build, the preferred package should be recorded as:

1. `Arduino Nano 33 IoT` as the panel and instrument controller
2. one small character LCD as the only planned display
3. physical controls for environmental-variable creation
4. simple target-facing output hardware
5. custom mounting and masking that treats the front apertures as general instrument-panel area

## Open Questions

These are the useful questions now:

1. Which environmental variables are definitely needed first?
2. Which of those are binary, analog-like, timed, counted, or serial?
3. Should the character LCD be centered in the left opening or moved to the right opening?
4. Which controls deserve dedicated hardware versus menu-style selection on the LCD?
5. Which target-facing outputs require buffering, isolation, or analog conditioning?

## Next Step

Build the first-pass hardware-trigger map with:

- variable name
- control type
- firmware variable
- output electrical form
- default range or levels
- calibration need
- display readback text

Then choose the smallest character LCD that still makes the readback usable.
