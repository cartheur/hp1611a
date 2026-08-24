# HP 1611A External `PS/2` Keyboard BOM

This bill of materials covers only the additional hardware needed to add an external `PS/2` keyboard feature.

It is intentionally separated from the native HP keyboard BOM so the feature sets stay clean.

Base design assumed:

- the native replacement design in `repurpose/keyboard/hp-native`
- a `5 V` MCU already present on the replacement board
- spare MCU GPIO available for `PS/2 CLK` and `PS/2 DATA`
- all TTL glue logic in the native keyboard design remains constrained to the `74LS` family

## Core `PS/2` Additions

### `1x` `PS/2` keyboard connector

Examples:

- `TE Connectivity 5749180-1` right-angle through-hole female `Mini-DIN-6`
- panel-mount `Mini-DIN-6` female
- short captive `PS/2` pigtail if panel space is awkward

Purpose:

- physical connection for an external `PS/2` keyboard

Recommendation:

- preferred current choice: `TE Connectivity 5749180-1`
- this part fits well when the connector is mounted on an internal PCB
- use a panel-mount connector if you want the feature to feel like part of the instrument
- use a pigtail if panel clearance is limited

### `2x` `4.7k` pull-up resistors

Purpose:

- pull `PS/2 CLK` and `PS/2 DATA` high to `+5 V`

Notes:

- `2.2k` to `10k` is usually workable
- `4.7k` is a good starting value

### `2x` series resistors for `PS/2` lines

Suggested value:

- `330 ohm`

Purpose:

- limit transient and fault current into the MCU-side input path
- provide a simple and wire-wrap-friendly first level of protection

Recommendation:

- place one resistor in series with `PS/2 CLK`
- place one resistor in series with `PS/2 DATA`
- for rev 1, this simple series-resistor approach is preferred over an SMT ESD array

### `4x` optional clamp diodes

Suggested part:

- `1N4148`

Purpose:

- optional discrete clamp network from `CLK` and `DATA` to `+5 V` and `GND`

Notes:

- this is optional for the first build
- if the `PS/2` wiring remains short and internal, rev 1 can omit the clamp network entirely
- if later protection is desired, this is easier to integrate on vector board than an SMT TVS array

### `1x` mode-select jumper or switch

Purpose:

- selects `HP native`, `PS/2`, or a development mode if you expose one

Recommendation:

- even if the final behavior is firmware-driven, a simple strap header is very useful during bring-up

### `1x` optional external active `USB`-to-`PS/2` converter

Purpose:

- allows use of modern `USB` keyboards that do not support native `PS/2`

Notes:

- this is an external accessory, not part of the onboard electronics
- do not assume passive adapters will work

## Firmware Dependency

This hardware assumes firmware support for:

- `PS/2` frame reception
- make and break code parsing
- translation from `PS/2` scan codes to HP 1611A logical key events

## Related Files

- [External PS/2 feature note](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/external-ps2/ps2-keyboard-feature.md)
- [Native HP BOM](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native/xa5-keyboard-replacement-wirewrap-bom.md)
