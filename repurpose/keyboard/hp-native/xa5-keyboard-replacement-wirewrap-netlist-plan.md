# HP 1611A XA5 Keyboard Replacement Wire-Wrap Netlist Plan

This is a first-pass netlist-style wiring plan for a replacement board that plugs into the `XA5` slot on the `A1` main board and reads the original `A4` keyboard.

This plan is intentionally scoped to the `scanner-only` version:

- powers from the `XA5` slot
- drives `SCAN A-D`
- reads `KS0-KS4` and `KS7`
- decodes keys in firmware
- exposes results on debug/programming headers

It does **not** yet attempt full `A5` emulation.

It is written to match the recommended BOM in:

- [xa5-keyboard-replacement-wirewrap-bom.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native/xa5-keyboard-replacement-wirewrap-bom.md)

## Assumed Parts In This Plan

- `U1`: `ATmega328P-PU`
- `U2`: `74LS138` row decoder
- `U3`: `LM339AN` comparator bank A
- `U4`: `LM339AN` comparator bank B
- `U5`: `74LS14` Schmitt inverter / logic cleanup
- `Q1-Q8`: `2N3904` row driver transistors

This plan also assumes:

- `5 V` logic throughout
- no separate `3.3 V` domain
- no bus-output section populated yet

## Naming Convention

- `XA5-n` means the `n`th contact on the `XA5` slot edge
- `U1-PB0` style names refer to MCU signals conceptually
- exact DIP pin numbers are included where helpful, but the signal-level wiring is the main point

## Functional Summary

The replacement board performs four jobs:

1. takes `+5 V` and `GND` from the `XA5` edge
2. drives keyboard row scan lines through existing `XA5` connections to `A4`
3. senses returned keyboard pulses on the `KS` lines
4. reports decoded key events through the MCU

## Section 1: Backplane Power And Ground

### Required power intake

| From | To | Notes |
| --- | --- | --- |
| `XA5-1` | `+5V_MAIN` | primary `+5 V` feed |
| `XA5-2` | `+5V_MAIN` | second `+5 V` feed, tie with `XA5-1` |
| `XA5-29` | `GND_MAIN` | ground |
| `XA5-30` | `GND_MAIN` | ground |
| `XA5-31` | `GND_MAIN` | ground |
| `XA5-32` | `GND_MAIN` | optional additional ground |
| `XA5-33` | `GND_MAIN` | optional additional ground |

### Power protection

| From | To | Notes |
| --- | --- | --- |
| `+5V_MAIN` | fuse / polyfuse input | recommended |
| fuse output | `+5V_FUSED` | protected local supply |
| `+5V_FUSED` | Schottky diode anode | optional polarity/transient protection |
| Schottky cathode | `+5V_LOGIC` | protected logic rail |

### Decoupling

| Net | Part | Notes |
| --- | --- | --- |
| `+5V_LOGIC` to `GND_MAIN` | `0.1 uF` at `U1` | mandatory |
| `+5V_LOGIC` to `GND_MAIN` | `0.1 uF` at `U2` | mandatory |
| `+5V_LOGIC` to `GND_MAIN` | `0.1 uF` at `U3` | mandatory |
| `+5V_LOGIC` to `GND_MAIN` | `0.1 uF` at `U4` | mandatory |
| `+5V_LOGIC` to `GND_MAIN` | `0.1 uF` at `U5` | mandatory |
| `+5V_LOGIC` to `GND_MAIN` | `10 uF` bulk cap | local energy storage |
| `+5V_LOGIC` to `GND_MAIN` | `47 uF` bulk cap | input smoothing |

## Section 2: MCU Core Connections

## U1 `ATmega328P-PU`

### Power and reset

| From | To |
| --- | --- |
| `+5V_LOGIC` | `U1 VCC` |
| `+5V_LOGIC` | `U1 AVCC` |
| `GND_MAIN` | `U1 GND` |
| `GND_MAIN` | `U1 AGND` |
| `U1 RESET` | `10k` pull-up to `+5V_LOGIC` |
| reset pushbutton | `U1 RESET` to `GND_MAIN` |

### Clock

Use either:

- internal oscillator for earliest bring-up
- or external `16 MHz` crystal for final stability

If external crystal is used:

| From | To |
| --- | --- |
| crystal pin 1 | `U1 XTAL1` |
| crystal pin 2 | `U1 XTAL2` |
| `22 pF` cap | `U1 XTAL1` to `GND_MAIN` |
| `22 pF` cap | `U1 XTAL2` to `GND_MAIN` |

Recommended crystal/load-cap combination:

- `CTS ATS16B-E`
- `2x KEMET C315C220J3G5TA`

Recommended firmware assumption:

- configure the AVR for external `16 MHz` crystal operation for the stable build
- use `9600` baud for initial UART debug output

Why this is the preferred bring-up choice:

- `9600` baud at `16 MHz` gives generous timing margin
- the selected `22 pF` `C0G` capacitors are a solid practical fit for the chosen crystal and board style

### Programming header

| Header pin | To |
| --- | --- |
| `MISO` | `U1 MISO` |
| `MOSI` | `U1 MOSI` |
| `SCK` | `U1 SCK` |
| `RESET` | `U1 RESET` |
| `VCC` | `+5V_LOGIC` |
| `GND` | `GND_MAIN` |

### Suggested UART / debug header

| Header pin | To |
| --- | --- |
| `TX` | `U1 TXD` |
| `RX` | `U1 RXD` |
| `VCC` | `+5V_LOGIC` |
| `GND` | `GND_MAIN` |

## Section 3: MCU GPIO Assignment

This mapping is chosen to make firmware and debugging straightforward.

### Outputs from MCU

| MCU signal | Function | Destination |
| --- | --- | --- |
| `PD2` | `ROW_A0` | `U2 A` |
| `PD3` | `ROW_A1` | `U2 B` |
| `PD4` | `ROW_A2` | `U2 C` |
| `PD5` | `SCAN_D_EN` | row enable network |
| `PD6` | `PULSE_FIRE` | optional pulse-shaping / row strobe control |
| `PB5` | status LED or debug toggle | optional |

### Inputs to MCU

| MCU signal | Function | Source |
| --- | --- | --- |
| `PC0` | `KS0_DIG` | `U5` cleaned output |
| `PC1` | `KS1_DIG` | `U5` cleaned output |
| `PC2` | `KS2_DIG` | `U5` cleaned output |
| `PC3` | `KS3_DIG` | `U5` cleaned output |
| `PC4` | `KS4_DIG` | `U5` cleaned output |
| `PC5` | `KS7_DIG` | `U5` cleaned output |

This leaves other pins free for:

- debug LEDs
- future bus emulation
- mode straps

## Section 4: Backplane Keyboard Signals

These are the backplane lines you actually need from the `XA5` slot.

### Keyboard return lines

| XA5 pin | Signal | Use |
| --- | --- | --- |
| `3` | `KS0` | comparator input |
| `4` | `KS1` | comparator input |
| `5` | `KS2` | comparator input |
| `6` | `KS3` | comparator input |
| `7` | `KS4` | comparator input |
| `8` | `KS7` | comparator input |
| `9` | `KS_GND` | dedicated return |
| `10` | `KS_GND` | dedicated return |

### Keyboard drive lines

| XA5 pin | Signal | Use |
| --- | --- | --- |
| `13` | `SCAN_D` | enable |
| `14` | `SCAN_A` | row address bit 0 |
| `15` | `SCAN_B` | row address bit 1 |
| `16` | `SCAN_C` | row address bit 2 |

### Recommended ground handling

Tie:

- `XA5-9`
- `XA5-10`
- `GND_MAIN`

together at one local star-ish point near the comparator front end.

This gives the keyboard sense return a clean local reference.

## Section 5: SCAN Output Wiring

There are two ways to handle scan output:

1. directly reproduce `SCAN A-D` on the existing `XA5` edge pins so the keyboard sees the same wiring as before
2. internally decode rows and use `SCAN A-D` only as symbolic control

Because the keyboard already expects the original wiring through `A1`, the simplest method is to drive the original `SCAN` lines on the `XA5` edge.

### Direct scan-line drive

| MCU / logic | XA5 edge |
| --- | --- |
| `U1 PD2` | `XA5-14` (`SCAN_A`) |
| `U1 PD3` | `XA5-15` (`SCAN_B`) |
| `U1 PD4` | `XA5-16` (`SCAN_C`) |
| `U1 PD5` | `XA5-13` (`SCAN_D`) |

### Series protection resistors

Add:

- `330 ohm` to `1k` in series with each `SCAN` output

Recommended:

| Signal | Resistor |
| --- | --- |
| `SCAN_A` | `470 ohm` |
| `SCAN_B` | `470 ohm` |
| `SCAN_C` | `470 ohm` |
| `SCAN_D` | `470 ohm` |

Notes:
- this protects the MCU during mistakes or bus contention
- for a keyboard-only replacement this is very cheap insurance

## Section 6: Optional Local Row Decoder Wiring

If you want the card to include an explicit `74LS138` row decode stage for local monitoring or future pulse-driver shaping, wire it like this:

### U2 `74LS138`

| From | To |
| --- | --- |
| `U1 PD2` | `U2 A` |
| `U1 PD3` | `U2 B` |
| `U1 PD4` | `U2 C` |
| `GND_MAIN` | `U2 G2A` |
| `GND_MAIN` | `U2 G2B` |
| `+5V_LOGIC` or gated enable | `U2 G1` |
| `+5V_LOGIC` | `U2 VCC` |
| `GND_MAIN` | `U2 GND` |

### U2 outputs to row-driver bases

| U2 output | To |
| --- | --- |
| `Y0` | base resistor for `Q1` |
| `Y1` | base resistor for `Q2` |
| `Y2` | base resistor for `Q3` |
| `Y3` | base resistor for `Q4` |
| `Y4` | base resistor for `Q5` |
| `Y5` | base resistor for `Q6` |
| `Y6` | base resistor for `Q7` |
| `Y7` | base resistor for `Q8` |

This stage is optional for first keyboard-only operation if you choose to drive `SCAN A-D` directly from the MCU.

It becomes useful if you later want to mimic the original row-pulse behavior more closely.

## Section 7: Row Driver Stage

## Q1-Q8 row driver transistors

Use one transistor per decoded row channel.

### Generic NPN wiring pattern

For each `Qn`:

| Node | Connection |
| --- | --- |
| base | from `U2 Yn` through `2.2k` resistor |
| emitter | `GND_MAIN` |
| collector | row-drive network node |

### Purpose of this stage

This stage is not directly connected to the keyboard by a separate cable in the current first-pass plan, because the keyboard row addressing is still being conveyed through the existing `SCAN A-D` path.

So for the scanner-only build:

- you may populate the transistors but leave their collectors on test pads
- or you may omit `Q1-Q8` completely in revision 1

Recommendation:

- omit `Q1-Q8` in the absolute first functional build unless you specifically want to experiment with sharper row-pulse drive

## Section 8: KS Analog Front End

Each `KS` line should go into a small protection and comparator chain.

### Raw KS input mapping

| XA5 pin | Signal | Comparator channel |
| --- | --- | --- |
| `XA5-3` | `KS0_RAW` | `U3A` |
| `XA5-4` | `KS1_RAW` | `U3B` |
| `XA5-5` | `KS2_RAW` | `U3C` |
| `XA5-6` | `KS3_RAW` | `U3D` |
| `XA5-7` | `KS4_RAW` | `U4A` |
| `XA5-8` | `KS7_RAW` | `U4B` |

### Per-channel input network

For each `KSx_RAW`:

| From | To | Part |
| --- | --- | --- |
| `KSx_RAW` | series node | `4.7k` resistor |
| series node | `+5V_LOGIC` | clamp diode (`1N4148`) optional |
| series node | `GND_MAIN` | clamp diode (`1N4148`) optional |
| series node | comparator input | direct |

### Comparator threshold reference

Create one shared threshold rail:

| From | To |
| --- | --- |
| `+5V_LOGIC` | top of `10k` trim pot |
| `GND_MAIN` | bottom of `10k` trim pot |
| trim wiper | `KS_THRESH` |

Then feed `KS_THRESH` to one side of each comparator.

Recommended topology:

- `KS` pulse to non-inverting input
- `KS_THRESH` to inverting input

This way, a positive enough `KS` pulse produces a clean comparator event.

### Comparator power

| From | To |
| --- | --- |
| `+5V_LOGIC` | `U3 VCC` |
| `GND_MAIN` | `U3 GND` |
| `+5V_LOGIC` | `U4 VCC` |
| `GND_MAIN` | `U4 GND` |

### Comparator output pull-ups

For each used comparator output:

| Output | Pull-up |
| --- | --- |
| `U3A_OUT` | `10k` to `+5V_LOGIC` |
| `U3B_OUT` | `10k` to `+5V_LOGIC` |
| `U3C_OUT` | `10k` to `+5V_LOGIC` |
| `U3D_OUT` | `10k` to `+5V_LOGIC` |
| `U4A_OUT` | `10k` to `+5V_LOGIC` |
| `U4B_OUT` | `10k` to `+5V_LOGIC` |

## Section 9: Schmitt Cleanup Stage

Use `U5 74LS14` to turn comparator outputs into clean MCU-safe logic edges.

### Comparator outputs into U5

| Comparator output | U5 input | U5 output name |
| --- | --- | --- |
| `U3A_OUT` | `U5A_IN` | `KS0_DIG` |
| `U3B_OUT` | `U5B_IN` | `KS1_DIG` |
| `U3C_OUT` | `U5C_IN` | `KS2_DIG` |
| `U3D_OUT` | `U5D_IN` | `KS3_DIG` |
| `U4A_OUT` | `U5E_IN` | `KS4_DIG` |
| `U4B_OUT` | `U5F_IN` | `KS7_DIG` |

### U5 outputs to MCU

| U5 output | MCU input |
| --- | --- |
| `KS0_DIG` | `U1 PC0` |
| `KS1_DIG` | `U1 PC1` |
| `KS2_DIG` | `U1 PC2` |
| `KS3_DIG` | `U1 PC3` |
| `KS4_DIG` | `U1 PC4` |
| `KS7_DIG` | `U1 PC5` |

### U5 power

| From | To |
| --- | --- |
| `+5V_LOGIC` | `U5 VCC` |
| `GND_MAIN` | `U5 GND` |

## Section 10: Debug Test Points

Add test points for these nets:

| Test point | Net |
| --- | --- |
| `TP1` | `+5V_LOGIC` |
| `TP2` | `GND_MAIN` |
| `TP3` | `SCAN_A` |
| `TP4` | `SCAN_B` |
| `TP5` | `SCAN_C` |
| `TP6` | `SCAN_D` |
| `TP7` | `KS0_RAW` |
| `TP8` | `KS1_RAW` |
| `TP9` | `KS2_RAW` |
| `TP10` | `KS3_RAW` |
| `TP11` | `KS4_RAW` |
| `TP12` | `KS7_RAW` |
| `TP13` | `KS_THRESH` |
| `TP14` | `KS0_DIG` |
| `TP15` | `KS1_DIG` |
| `TP16` | `KS7_DIG` |

Minimum useful set:

- all `SCAN`
- all raw `KS`
- one cleaned `KS` output
- threshold rail
- power and ground

## Section 11: Firmware Expectations

For this wiring plan, firmware should:

1. drive `SCAN A-C` with row count `0..7`
2. assert `SCAN D` during active row timing
3. wait a short settling interval
4. sample all six `KS_DIG` inputs
5. map detected row + sensed column to a key identity
6. debounce in firmware
7. emit key events on UART or debug interface

### Suggested key sense mapping

| Input | Keyboard column |
| --- | --- |
| `KS0_DIG` | column `KS0` |
| `KS1_DIG` | column `KS1` |
| `KS2_DIG` | column `KS2` |
| `KS3_DIG` | column `KS3` |
| `KS4_DIG` | column `KS4` |
| `KS7_DIG` | column `KS7` |

## Section 12: Recommended Population Order

### Stage 1

Populate:

- power section
- MCU
- programming header
- debug UART

Verify:

- clean `+5V_LOGIC`
- successful programming

### Stage 2

Populate:

- direct `SCAN` output wiring from MCU to `XA5-13..16`

Verify:

- `SCAN A-D` appear on the backplane pins

### Stage 3

Populate:

- comparator input section
- threshold pot
- `74LS14`

Verify:

- raw `KS` pulses visible on scope
- clean digital pulse appears on corresponding `KSx_DIG`

### Stage 4

Write firmware to:

- scan rows
- detect column pulses
- print decoded row/column

### Stage 5

Only after stable operation:

- add optional pulse enhancement
- add optional local row-driver experiments
- add optional bus emulation

## Section 13: Deliberate Omissions In This First Plan

These are intentionally not wired yet:

- personality switch inputs `SW0-SW7`
- `M0-M7` output emulation
- original `A5` timing generator functions
- original CPU bus interaction
- original `A5` RAM/control functions

That keeps this build focused on the keyboard reuse problem only.

## Bottom-Line Wiring Core

If you want the absolute minimal working netlist summary, it is this:

- `XA5-1,2 -> +5V_LOGIC`
- several `XA5` grounds -> `GND_MAIN`
- `U1 PD2/PD3/PD4/PD5 -> XA5-14/15/16/13` through series resistors
- `XA5-3/4/5/6/7/8 -> protection resistors -> LM339 comparators -> 74LS14 -> U1 PC0..PC5`
- `U1` programmed to scan rows and decode sensed columns

That is the cleanest first wire-wrap implementation.
