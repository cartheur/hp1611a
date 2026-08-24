# HP 1611A External `PS/2` Keyboard Feature

This note describes the cleanest way to add an external `PS/2` keyboard to the keyboard-replacement work without mixing that feature into the native HP keyboard BOM.

## Intent

The `PS/2` path is a companion feature, not a replacement for the native `A4` keyboard work.

Recommended design philosophy:

- keep the native HP scan/sense implementation self-contained in `hp-native`
- let the `PS/2` path feed the same internal logical key-event layer in firmware
- treat modern `USB` keyboard support as an external compatibility problem, not as an onboard `USB host` problem

## How The Feature Works

The MCU on the replacement board gains a second keyboard input source:

- `PS/2 CLK`
- `PS/2 DATA`

Firmware listens for `PS/2` make and break codes, decodes them into key press and key release events, then maps those events onto HP 1611A logical keys such as:

- numeric entry keys
- hex entry keys
- display and trace keys
- transport or control keys

This means the firmware can use one internal key-processing pipeline whether the event came from:

- the original `A4` keyboard scan path
- an external `PS/2` keyboard

## Why `PS/2` Is The Right Boundary

- it stays in a native-feeling `5 V` environment
- it avoids an onboard `USB host` stack
- it keeps the hardware simple enough for wire-wrap or vector-card implementation
- it allows modern `USB` keyboards through an external active converter when necessary

## Important `USB` Note

A passive `USB`-to-`PS/2` plug adapter is only useful if the keyboard itself already supports `PS/2`.

For ordinary modern `USB` keyboards, assume:

- the keyboard is `USB` only
- a passive adapter will not work
- an external active `USB`-to-`PS/2` converter is required

That keeps the instrument-side card simple while still allowing broad keyboard choice.

## Recommended Modes

Expose at least a bring-up strap, jumper, or firmware setting for:

- `HP native only`
- `PS/2 only`
- `mixed / development mode`

## Related Files

- [Native HP BOM](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native/xa5-keyboard-replacement-wirewrap-bom.md)
- [Native HP vector sketch](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native/xa5-keyboard-replacement-vector-card-sketch.md)
- [External PS/2 BOM](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/external-ps2/ps2-keyboard-bom.md)
