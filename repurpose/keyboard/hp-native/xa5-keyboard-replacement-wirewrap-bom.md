# HP 1611A XA5 Keyboard Replacement Wire-Wrap BOM

This document is a descriptive bill of materials for a wire-wrap or vector-card replacement that plugs into the `XA5` slot on the `A1` main board and reads the original `A4` keyboard.

It is meant for a practical first build, not a museum-accurate recreation of the original `A5` board.

The design target is:

- original `A4` keyboard retained
- replacement board plugs into the `XA5` slot using the existing `100-pin` card edge
- keyboard scan and key-sense method reproduced
- `74LS` logic used for all TTL glue logic
- through-hole and wire-wrap-friendly parts preferred

Related design notes:

- [xa5-keyboard-replacement-vector-card-sketch.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native/xa5-keyboard-replacement-vector-card-sketch.md)
- [keyboard-to-bus-summary.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native/keyboard-to-bus-summary.md)
- [a1-interconnect-pin-by-pin.csv](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/a1-interconnect-pin-by-pin.csv)

## Build Philosophy

For a wire-wrap build, the safest approach is to split the design mentally into five sections:

1. `backplane interface`
2. `power conditioning`
3. `keyboard row scan generation`
4. `keyboard column sense detection`
5. `controller and optional bus output`

The parts below are grouped that way.

## Recommended First-Pass Architecture

The most practical first-pass build is:

- one `5 V` microcontroller
- one row decoder
- one row-driver bank
- one key-sense comparator section
- one logic cleanup stage
- no direct backplane bus-driving at first

That means the very first version should only:

- power from the `XA5` slot
- drive `SCAN A-D`
- read `KS0-KS4` and `KS7`
- decode keys in firmware
- report results on a debug header or serial port

Then, once stable, an optional second revision can add bus-emulation output.

## Core BOM

## 1. Mechanical / Backplane Hardware

### `1x` wire-wrap or vector prototyping card with `100-pin` edge compatibility

Purpose:
- main physical carrier for the replacement circuit
- plugs into the existing `A1` `XA5` slot

What to look for:
- board thickness compatible with the HP card edge socket
- enough free area for DIP parts and wire-wrap routing
- preferably plated-through or with wire-wrap-friendly pad spacing

Notes:
- this is the most critical mechanical item in the whole build
- verify finger pitch, board thickness, insertion depth, and keying before populating parts

### `1x` correctly dimensioned `100-pin` edge-finger layout

Purpose:
- provides electrical connection to the `A1` main board through the `XA5` slot

Implementation options:
- purpose-made edge-finger proto card
- custom-cut vector card with added edge fingers
- sacrificial donor card reused as a finger carrier

Notes:
- if you do not already have a compatible card edge, salvaging a damaged original-format board may be easier than fabricating a perfect edge from scratch

### `4x` card support standoffs or spacers

Purpose:
- prevent flex during insertion and removal
- support the free end of a heavier wire-wrap build

Notes:
- optional, but strongly recommended if the board will be inserted and removed repeatedly

### `1x` bench mating method for development

Examples:
- extender card
- sacrificial slot
- passive breakout

Purpose:
- allows debugging without repeated full insertion into the machine

Notes:
- not required, but it reduces the risk of damaging the backplane or the replacement card

## 2. Controller Section

## Recommended Option A: `ATmega328P-PU` DIP build

### `1x` `ATmega328P-PU`

Purpose:
- central controller
- generates row scan sequence
- times the excitation pulse
- samples conditioned `KS` lines
- debounces and interprets key states
- optionally reports keycodes over UART or drives later bus-emulation logic

Why it is a good fit:
- available in through-hole DIP
- easy to prototype on wire-wrap
- mature toolchain
- enough GPIO for this task
- enough speed for controlled pulse-and-sample scanning

Why choose it over something larger:
- simpler support parts
- easier socketing and replacement
- no need for fine-pitch breakout hardware

### `1x` `28-pin DIP socket`

Purpose:
- protects the MCU
- allows easy replacement during bring-up

Recommendation:
- use a machine-pin socket if possible

### `1x` `16 MHz` crystal or ceramic resonator

Purpose:
- provides stable clocking for repeatable scan timing if you use a bare DIP MCU

Typical supporting parts:
- `2x 22 pF` capacitors if using a crystal

Notes:
- optional if you use the internal oscillator, but an external clock is better for repeatable scan timing

### `1x` reset pushbutton

Purpose:
- manual reset during firmware development

### `1x` `10k` reset pull-up resistor

Purpose:
- holds reset line in inactive state

### `1x` programming header, `2x3` AVR ISP

Purpose:
- firmware loading and recovery

## Recommended Option B: ready-made `5 V` MCU module

Alternative:
- small `Arduino Pro Mini 5V`
- small through-hole-friendly controller board

Why choose it:
- faster bring-up
- less support circuitry

Why not choose it:
- more awkward mechanically on a clean slot-card build
- module headers can make card height and clearance uglier

Recommendation:
- use the bare `ATmega328P-PU` if you want the cleanest wire-wrap build
- use a module if you want the fastest proof-of-concept

## 3. Row Scan Generation

The keyboard requires `SCAN A-D`, with `SCAN A-C` selecting row address and `SCAN D` acting as enable.

## `1x` `74LS138`

Purpose:
- decodes a `3-bit` row address into `1-of-8` row selection

Required logic family:
- `74LS138`

Why `74LS` here:
- matches the design constraint for this keyboard build
- keeps the glue logic family consistent across the board

Function in this build:
- MCU drives three row-address inputs
- decoder selects one row at a time
- output then goes to a transistor driver stage

Package:
- DIP-16 strongly preferred

### `1x` `16-pin DIP socket`

Purpose:
- lets you replace the decoder easily if you miswire or overstress it

## 4. Row Driver Stage

The original keyboard row excitation is not something I would drive directly from TTL or MCU pins.

You want a modest transistor sink/driver stage.

### `8x` `2N3904` or `2N2222A` NPN transistors

Purpose:
- sink or switch current for the selected keyboard row
- isolate the logic ICs from keyboard pulse current

Recommendation:
- `2N3904` is fine
- `2N2222A` is slightly more rugged if that is what you already have

Why eight:
- one per possible row

### `8x` transistor base resistors, typically `1k` to `4.7k`

Purpose:
- limit base current from the decoder or logic driver

Starting value:
- `2.2k` is a good practical starting point

### `8x` pull-up or bias resistors as required by the chosen row topology

Purpose:
- define inactive state
- help shape or stabilize the row-drive network

Typical value:
- `10k`

### `1x` pulse-shaping capacitor

Purpose:
- helps create a sharp excitation pulse for the row drive

Typical starting experiment range:
- `470 pF` to `4.7 nF`

### `1x` pulse-path resistor

Purpose:
- works with the pulse capacitor and row inductance

Typical starting experiment range:
- `100 ohm` to `4.7k`

Notes:
- this pair is one of the analog-tuning areas of the build
- you should expect to adjust these after observing the real row waveform on a scope

## 5. Column Sense / Key-Sense Front End

The `KS` lines are the most important analog part of the whole project.

The keyboard does not return clean digital logic levels by itself. It returns small pulses, and the replacement board must turn those into reliable logic events.

## `2x` `LM339AN`

Purpose:
- comparators for conditioning the `KS` pulses
- provide threshold detection for `KS0-KS4` and `KS7`
- leave spare channels for debug thresholding or future expansion

Preferred part:
- `LM339AN`

Why `LM339AN`:
- inexpensive
- through-hole DIP
- open-collector outputs are easy to combine with pull-ups
- forgiving in experimental analog front ends
- a good stocked part for this project and future comparator work

Why two packages:
- each package gives `4` comparators
- total `8` channels available
- enough for `6` sense lines plus spares

### `2x` `14-pin DIP sockets`

Purpose:
- comparator ICs are easy to swap if damaged during tuning

### `6x` input series resistors for `KS` lines

Purpose:
- protect comparator inputs
- limit transient current
- help define source impedance for the threshold network

Typical value:
- `1k` to `10k`

Starting recommendation:
- `4.7k`

### `6x` input clamp diode pairs or protection network

Suggested part:
- `1N4148`

Purpose:
- protect front-end inputs from unexpected excursions
- clip excessive positive or negative spikes

### `1x` threshold-adjust trim potentiometer, `10k` or `20k`

Purpose:
- sets comparator trip threshold during tuning

Why it matters:
- the manual notes key-sense outputs around `1 to 2 V` when a key is depressed
- exact amplitude will vary with key condition, scan pulse shape, and loading

### `6x` comparator output pull-up resistors

Purpose:
- `LM339` outputs are open collector, so they require pull-ups

Typical value:
- `4.7k` to `10k`

Starting recommendation:
- `10k`

### Optional pulse stretching components

Purpose:
- stretch a very narrow `KS` pulse into a cleaner logic event for MCU sampling or interrupt capture

Implementation choices:
- RC plus Schmitt cleanup
- monostable
- firmware capture if raw pulses are wide enough after conditioning

Notes:
- this is not always necessary, but it often makes development much easier

## 6. Logic Cleanup / Pulse Conditioning

## `1x` `74LS14`

Purpose:
- Schmitt-trigger cleanup for comparator outputs or pulse-shaped lines
- can also help generate clean timing edges for the MCU

Why:
- strong utility part
- very helpful on wire-wrap builds where edges and noise can be uglier than on a PCB
- available in the required `74LS` family

### `1x` `14-pin DIP socket`

Purpose:
- makes replacement easy

## 7. Optional Monostable / Event Hold Helper

## `1x` `74LS123`

Purpose:
- optional monostable for pulse stretching
- can help mimic the original “valid key event” pulse timing
- useful if comparator output pulses are too narrow or if you want more deterministic event width

Why optional:
- firmware can sometimes replace this
- but on a wire-wrap build, hardware pulse stretching can make the system much easier to debug

### `1x` `16-pin DIP socket`

Purpose:
- allows experimentation or removal if not ultimately needed

## 8. Optional Backplane / Bus Emulation Section

Only add this after the scanner is working by itself.

## `1x` `74LS245`

Purpose:
- tri-state bus transceiver
- can drive an encoded output onto selected backplane lines or a local debug header

Use case:
- if you decide to emulate the original `A5` keyboard-read behavior more closely
- for example, outputting a code analogous to `M0-M7`

Why optional:
- if your immediate goal is only to use the keyboard in a repurposed system, the MCU can simply output decoded key events elsewhere

### `1x` `20-pin DIP socket`

Purpose:
- protects the buffer and makes later changes easier

### Optional additional latch IC

Examples:
- `74LS373`
- `74LS574`

Purpose:
- holds a stable output code if you want latched bus presentation rather than purely firmware-timed drive

Recommendation:
- do not include this in the first build unless you already know you need it

## 9. Power Conditioning

For a simple scanner-only build, the card should run primarily from backplane `+5 V` and `GND`.

## `1x` reverse-polarity or fault-protection diode

Suggested part:
- `1N5819` Schottky

Purpose:
- protects the replacement card from basic hookup or transient mistakes

Notes:
- because this is a slot card, polarity mistakes are less likely than in cable projects, but inrush and accidental bench wiring still happen

## `1x` fuse or resettable polyfuse

Suggested options:
- small axial fuse
- `PTC` resettable fuse

Purpose:
- protects the replacement card and possibly the host backplane from faults on your experimental board

Recommendation:
- strongly recommended for first power-up

## `1x` bulk input capacitor, `10 uF` to `47 uF`

Purpose:
- local supply stabilization

Suggested type:
- low-ESR electrolytic or tantalum if you trust your handling

## `1x` second bulk capacitor near logic cluster, `10 uF`

Purpose:
- supports transient demand in the scan and comparator sections

## `1x` decoupling capacitor per IC, `0.1 uF` ceramic

Estimated quantity:
- `8` to `12`

Purpose:
- local high-frequency supply decoupling

This is mandatory on a wire-wrap build.

Do not economize here.

## Optional `3.3 V` regulator

Only needed if your MCU is `3.3 V`.

Suggested parts:
- `MCP1700-3302`
- `LM1117-3.3` if heat and dropout are acceptable

Support parts:
- input and output capacitors per regulator datasheet

Recommendation:
- avoid this complexity by choosing a `5 V` MCU for the first build

## 10. Passives Assortment

You will want a small tuning-friendly assortment rather than exact single values only.

## Resistors

Recommended assortment:

- `220 ohm`
- `470 ohm`
- `1k`
- `2.2k`
- `4.7k`
- `10k`
- `22k`
- `47k`
- `100k`

Suggested quantity:
- at least `10` of each common value

Use cases:
- base resistors
- pull-ups
- pull-downs
- input protection
- threshold network
- RC timing experiments

## Capacitors

Recommended assortment:

- `100 pF`
- `470 pF`
- `1 nF`
- `4.7 nF`
- `10 nF`
- `100 nF`
- `1 uF`
- `10 uF`
- `47 uF`

Use cases:
- pulse shaping
- filtering
- decoupling
- monostable timing

## Diodes

### `20x` `1N4148`

Purpose:
- input clamps
- pulse steering
- experimental shaping
- general logic protection

Why so many:
- these are cheap and you will likely use more than expected during refinement

## 11. Connectors, Headers, and Debug Points

## `1x` serial/debug header

Recommended signals:

- `GND`
- `+5V`
- `TX`
- `RX`
- `RESET`

Purpose:
- firmware debug
- key event monitoring
- bring-up logging

## `1x` logic-observation header

Recommended breakout:

- `SCAN A`
- `SCAN B`
- `SCAN C`
- `SCAN D`
- `KS0`
- `KS1`
- `KS2`
- `KS3`
- `KS4`
- `KS7`

Purpose:
- scope or logic-probe access
- fast fault isolation

## `10x` to `20x` test posts or wire loops

Purpose:
- easy clip-on probing

Recommendation:
- add more than you think you need

The most useful probe points are:

- raw `KS` inputs
- comparator outputs
- row-driver outputs
- regulator output
- MCU scan outputs

## 12. Wire-Wrap Construction Supplies

## `1x` spool `30 AWG` wire-wrap wire

Purpose:
- all digital interconnects

Recommendation:
- use multiple colors if possible

Suggested color plan:

- red: `+5 V`
- black: `GND`
- yellow: `SCAN`
- blue: `KS`
- green: logic/control
- white: debug or temporary changes

## `1x` wire-wrap tool

Purpose:
- proper square-post wraps

## Square-post sockets or wire-wrap sockets for all DIP ICs

Purpose:
- required for reliable wire-wrap construction

Recommendation:
- use proper wire-wrap sockets rather than trying to improvise on low-profile stamped sockets

## Small hand tools

- flush cutters
- fine needle-nose pliers
- continuity meter
- oscilloscope
- logic probe or analyzer

## Strongly Recommended Instrumentation For Bring-Up

These are not parts of the card, but they matter as much as the BOM:

- `1x` oscilloscope with at least moderate bandwidth
- `1x` bench supply with current limiting
- `1x` continuity meter / DMM
- optional logic analyzer

Why:
- the keyboard relies on pulse behavior
- this is not a “blink LED and hope” project

## Suggested First-Build Quantities Summary

This is the most practical shopping list for a scanner-only first revision.

### Essential semiconductors

- `1x` `ATmega328P-PU`
- `1x` `74LS138`
- `2x` `LM339AN`
- `1x` `74LS14`
- `8x` `2N3904` or `2N2222A`
- `20x` `1N4148`
- `1x` `1N5819`

### Optional semiconductors

- `1x` `74LS123`
- `1x` `74LS245`
- `1x` `74LS373` or `74LS574`

### Sockets

- `1x` 28-pin wire-wrap DIP socket
- `1x` 16-pin wire-wrap DIP socket
- `3x` 14-pin wire-wrap DIP sockets
- `1x` 20-pin wire-wrap DIP socket

Quantity varies depending on which optional ICs you include.

### Passives

- `20+` assorted `1/4 W` resistors
- `10+` `0.1 uF` ceramic capacitors
- assorted timing capacitors
- `2x` to `4x` electrolytics
- `1x` trim pot

### Mechanical / wiring

- `1x` `100-pin` edge-compatible vector/wire-wrap card
- `1x` spool wire-wrap wire
- test posts
- headers
- reset switch
- programming header

## Recommended Phase Order

## Phase 1: Power and Controller

Populate:

- MCU
- power conditioning
- decoupling
- programming header
- debug UART

Goal:
- stable powered controller in the slot card

## Phase 2: Scan Generator

Populate:

- `74LS138`
- row driver transistors

Goal:
- generate visible, measurable `SCAN A-D` behavior

## Phase 3: Sense Front End

Populate:

- `LM339AN`
- threshold network
- `74LS14`

Goal:
- detect real key pulses from `KS` lines

## Phase 4: Firmware Decode

Goal:
- report row/column and key identity reliably

## Phase 5: Optional Bus Emulation

Populate only if needed:

- `74LS245`
- optional latch

Goal:
- present emulated keycode output to another subsystem

## Risks And Part Choices To Avoid

Avoid for the first build:

- very fast comparators unless you already know the layout is clean
- `3.3 V` MCU-only builds without careful level planning
- SMT-only parts unless mounted on adapters
- direct MCU drive of keyboard row windings
- direct backplane bus driving before standalone keyboard scanning is stable

## Best Practical Recommendation

If you want the lowest-risk, most buildable wire-wrap version, start with this exact core:

- `ATmega328P-PU`
- `74LS138`
- `2x LM339AN`
- `74LS14`
- `8x 2N3904`
- `1N4148` assortment
- resistor and capacitor tuning assortment
- wire-wrap sockets
- `100-pin` edge-compatible card

That gives you a realistic keyboard scanner replacement that can be built, tuned, repaired, and modified without committing too early to full bus emulation.
