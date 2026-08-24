# HP 1611A XA5-Slot Keyboard Replacement Vector Card Sketch

This is a practical sketch for a replacement board that plugs into the `XA5` position on the `A1` main board and reads the original `A4` keyboard without using the original `A5` card.

The goal is not to recreate all of `A5`.

The goal is to reproduce the keyboard scan/sense method closely enough to:

- use the original `A4` keyboard
- fit a vector board with the same `100-pin` card edge
- use existing `A1` backplane wiring
- produce a modern, readable keycode output

## Recommendation

Use a small mixed-signal controller card in the `XA5` slot with:

- a microcontroller
- one row-scan driver stage
- one key-sense analog front end
- optional latch/bus output stage if you want to present a code onto backplane lines

The simplest modern implementation is:

- `MCU`: RP2040, STM32, or AVR
- `row decoder`: `74LS138` plus transistor/MOSFET row drivers
- `column sense`: comparators or fast transistor amplifiers for `KS0-KS4`, `KS7`
- `power`: local `+5 V` logic, optional `3.3 V` regulator for MCU
- `optional output`: `74LS245` or open-collector/tri-state buffer stage to drive a chosen code onto bus lines

## What The Original Keyboard Needs

The original `A4` keyboard is not a simple switch matrix.

It expects:

- row scan excitation on `SCAN A-D`
- column pulse sensing on `KS0-KS4` and `KS7`

The key produces a short coupled pulse when:

1. the proper row is excited
2. the key is held down
3. the matching sense column is monitored

So the replacement board must recreate the scan and detect the pulses.

## Mechanical Concept

## Board Form

- Vector/proto board cut to original card outline
- `100-pin` edge connector matching the `XA5` card fingers
- low-profile parts near the edge to avoid slot interference
- one top-edge header for debug and optional external keycode output

## Keep-Out Guidance

- preserve insertion depth and finger spacing exactly
- avoid tall parts where adjacent cards `XA6`, `XA7`, `XA8`, `XA10` crowd the slot area
- keep analog sense front end away from noisy digital clock routing

## Minimum Pins To Use From XA5 Slot

For a keyboard-only replacement, you only need a small subset of the `XA5` edge pins.

### Keyboard interface pins

| XA5 pin | Signal | Direction |
| --- | --- | --- |
| `3` | `KS0` | input from keyboard |
| `4` | `KS1` | input from keyboard |
| `5` | `KS2` | input from keyboard |
| `6` | `KS3` | input from keyboard |
| `7` | `KS4` | input from keyboard |
| `8` | `KS7` | input from keyboard |
| `9` | `KS GND` | return |
| `10` | `KS GND` | return |
| `13` | `SCAN D` | output to keyboard |
| `14` | `SCAN A` | output to keyboard |
| `15` | `SCAN B` | output to keyboard |
| `16` | `SCAN C` | output to keyboard |

### Personality-switch pins if you want them too

| XA5 pin | Signal |
| --- | --- |
| `17` | `SW0` |
| `18` | `SW1` |
| `19` | `SW2` |
| `20` | `SW3` |
| `21` | `SW4` |
| `22` | `SW5` |
| `23` | `SW6` |
| `24` | `SW7` |

### Power pins

| XA5 pin | Signal | Note |
| --- | --- | --- |
| `1`, `2` | `+5 V` | verify slot power before use |
| `29`, `30`, `31`... | `GND` | use several grounds |
| `99` | `-12 V` | not needed unless you intentionally use analog bipolar stages |
| `100` | `+12 V` | not needed for a simple replacement |

For a modern replacement, `+5 V` and `GND` are enough.

## Suggested Architecture

## 1. Row Scan Generator

Replicate the original behavior in a simpler way:

- MCU outputs a `4-bit` scan value
- `SCAN A-C` select one of `8` rows
- `SCAN D` acts as row-enable
- a `74LS138` decodes the row number
- a driver bank sinks the selected row pulse current

Suggested hardware:

- `74LS138`
- `8` NPN transistors or small NMOS devices for row pulse sinking
- one pulse capacitor and resistor network to generate sharp excitation pulses

### Why use a driver stage

The original keyboard rows are pulse-driven through inductive primaries. Do not drive them directly from MCU pins.

Use the MCU only as logic source; let the driver stage handle row current.

## 2. Column Sense Front End

The `KS` lines produce small pulses, not rail-to-rail logic.

Use one front end per column:

- AC-coupled or threshold-detected pulse input
- clamp/protection diodes
- comparator or transistor amplifier
- MCU capture input

A good practical option is:

- `LM339` quad comparator plus a second comparator package
- or `MCP6566`/similar faster comparators if you want cleaner timing margins

Suggested conditioning per `KS` line:

- series resistor
- clamp diodes to logic rails
- adjustable threshold around the original `1-2 V` pulse region
- short monostable stretch to make pulses easier for MCU capture

## 3. Controller

The MCU continuously scans rows and columns in firmware.

Recommended jobs:

- generate scan sequence
- issue narrow excitation pulse
- sample or interrupt on `KS` pulse
- map `row + column` to key identity
- hold the key state while depressed
- expose result over UART, GPIO, or optional backplane bus emulation

Suitable parts:

- `ATmega328P`: simple and plenty fast
- `STM32G0`: robust industrial choice
- `RP2040`: easiest if you want programmable timing flexibility

## 4. Optional “Original-Style” Bus Output

If you only need decoded keys for a modern add-on, stop at the MCU.

If you want the replacement card to present an original-style keycode to the rest of the machine, add:

- output latch
- tri-state bus drivers
- optional status-bit generator

The closest emulation target is:

- `M0-M5`: keyscan count
- `M6-M7`: status bits such as new key / held key / no key

This would let your replacement look more like the original keyboard scanner function, although not a full `A5` replacement.

## Recommended Two-Mode Design

Build the card with a jumper or switch for two modes.

### Mode 1: Standalone Keyboard Reader

- scan keyboard
- decode keys in MCU
- output results over serial/header LEDs/debug pins
- safest for first bring-up

### Mode 2: Backplane Keycode Emulator

- scan keyboard
- generate equivalent `M0-M7` style code
- drive selected backplane lines through buffers

This mode is only recommended after you fully understand what else in the mainframe is still connected and expecting `A5`.

## Firmware Sketch

## Scan Loop

1. Set `SCAN D` inactive
2. Set `SCAN A-C` for row `0..7`
3. Enable row by asserting `SCAN D`
4. Fire a short excitation pulse
5. Sample the `KS` comparators
6. Advance row
7. After all rows in a selected column context, move to the next column interpretation

For a modern implementation, you do not have to duplicate the original counter exactly. You only need deterministic row/column identification.

## Debounce / Hold Logic

Because the keyboard is pulse-coupled, debounce should be done in logic rather than with RC across keys.

Recommended rule:

- require `2-3` identical detections before declaring “new key”
- once declared, hold that key active until detections disappear for `N` scan cycles

## Key Map

Store a table:

`keycode[row][column] -> logical key name`

You can choose either:

- original-style numeric code
- symbolic name like `TRACE`, `STORE`, `HEX`, etc.

## Suggested Block Diagram

```text
A1/XA5 edge
  -> +5V / GND
  -> SCAN A-D ---------------------> Row decode / row drivers ------> A4 keyboard rows
  -> KS0-KS4, KS7 <---------------- Column sense amplifiers <-------- A4 keyboard columns
                                          |
                                          v
                                   MCU capture / state machine
                                          |
                      +-------------------+-------------------+
                      |                                       |
                      v                                       v
                Debug / UART output                   Optional M0-M7 bus emulation
```

## Practical Circuit Suggestion

If you want a first-pass build that is realistic on vector board:

- `1x` MCU module or DIP MCU
- `1x 74LS138`
- `8x` row driver transistors
- `2x LM339`
- `1x 74LS123` optional pulse stretcher / monostable
- `1x 74LS245` optional bus output buffer
- `1x` `5 V -> 3.3 V` regulator if MCU is `3.3 V`
- trim pot for comparator threshold during bring-up
- test points for all `SCAN` and `KS` lines

## What I Would Actually Build First

Phase 1:

- `XA5` plug-in vector board
- powers from backplane
- uses original keyboard pins only
- MCU + comparators
- UART/USB output only

Phase 2:

- add optional output latch/buffer
- emulate `M0-M7` keycode presentation if needed

That gives you a safe bring-up path without risking the rest of the backplane.

## Risks / Caveats

- The keyboard pulse amplitude is modest and may vary by key condition.
- The original scan uses short pulses; too-slow firmware-only GPIO toggling may miss good behavior unless the analog front end stretches pulses.
- If other cards remain installed, do not drive arbitrary backplane lines until you confirm contention risk.
- If you use `3.3 V` MCU logic, level-shift or protect all `5 V`-domain signals.

## Bottom-Line Recommendation

The best replacement is not a full `A5` clone.

It is a small `XA5-slot` keyboard interface card that:

- uses the original `A4` keyboard and `A1` wiring
- recreates `SCAN A-D`
- senses `KS0-KS4` and `KS7`
- decodes the pressed key in an MCU
- optionally exports an original-style code later

That is the lowest-risk and most practical vector-board design.

## Related Files

- [keyboard-to-bus-summary.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native/keyboard-to-bus-summary.md)
- [a1-interconnect-pin-by-pin.csv](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/a1-interconnect-pin-by-pin.csv)
- [a1-card-to-card-connection-table.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/a1-card-to-card-connection-table.md)
