# A13 Target Cable Plan

## Purpose

Restore the missing cable needed to use the `A13` probe's `ZIF` socket with a live target system.

Without this cable, a `6809` inserted into the `A13` probe body is not connected back into the powered target board, so `NO CLOCK` results are not meaningful as a CPU diagnosis.

## What Is Missing

The missing piece is the cable that runs:

- from the `A13` microprocessor probe body
- to the target system's `40-pin` CPU socket

This is the cable described in the `A09` guide:

- remove the microprocessor from the circuit
- install it in the socket on microprocessor probe `A13`
- then connect the cable with `40-pin` connectors from the probe back to the circuit where the CPU was removed

Relevant manual text:

- [docs-classified/operators-guide/10266-90902.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/operators-guide/10266-90902.md:1846)
- [docs-classified/field-training-manual/5922-2029.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/field-training-manual/5922-2029.md:450)

## Original HP Accessories

The mainframe manuals list three related probe-side accessories:

- `01611-61609`: `40-pin` dual in-line clip with `12 in.` cable
- `01611-61610`: `40-pin` male plug with `12 in.` cable
- `01611-61612`: `40-pin` male plug with `3 in.` cable
- `1200-0682`: `40-pin` protection socket

Relevant manual text:

- [docs-classified/operating-and-service-manual/01611-90905.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/operating-and-service-manual/01611-90905.md:744)

Working interpretation:

- if the missing piece is the socket-to-target-plug cable, the original HP part was most likely either `01611-61610` or `01611-61612`
- `01611-61609` is the alternate direct-clip method, not the socket-plug cable

## Current Decision

Best path:

1. Keep watching for an original HP cable or complete `A13` accessory set.
2. In parallel, build a reversible replacement cable so diagnosis can continue.

Reason:

- original HP cable availability is uncertain
- the replacement is electrically simple if built as a passive `1:1` interconnect

## Electrical Requirements

The replacement cable should be:

- `40` conductors
- `1:1` pin mapping, straight through
- no active components
- red stripe aligned to `pin 1`
- short enough to minimize loading, with `12 in.` as the most clearly documented reference length

Important:

- do not swap rows or mirror the connector
- verify continuity pin-by-pin before connecting to the analyzer or target board
- use the `40-pin` protection socket on the target if available

## Confirmed Connector Geometry

Confirmed from bench inspection:

- the `A13` probe connector presents `male` pins
- the target system uses a standard `40-pin DIP` socket

This means the replacement cable should be treated as:

- `A13 end`: `40-position IDC receptacle`
- `cable`: `40-conductor` ribbon cable
- `target end`: `40-pin DIP male plug`

## Recommended Build Strategy

Do not try to recreate HP's molded cable first.

Safer first build:

1. Use a standard `40-position IDC receptacle` at the `A13` end.
2. Use a short `40-conductor` ribbon cable.
3. Terminate the target end with a small passive interposer that converts the ribbon cable to a `40-pin DIP male plug`.
4. Insert that male DIP plug into the target board's CPU socket, preferably through the `40-pin` protection socket if available.

Why this is the preferred first build:

- it uses standard, currently sold IDC parts
- it matches the now-confirmed `A13` male-pin geometry directly
- it preserves a clear `pin 1` orientation
- it is easier to inspect and buzz out than a hand-soldered freeform cable
- it is reversible and easier to repair

Less-preferred fallback:

- hand-build a direct ribbon-to-DIP male plug termination without an interposer PCB

This may work, but it is mechanically weaker and easier to miswire or mirror.

## Current Off-The-Shelf Parts For A Reproduction Build

These are current examples, not yet a final BOM.

## Bench Checklist For IDC Receptacle Fit

Before ordering or crimping the probe-side receptacle, confirm these points at the `A13` header:

1. Count pins: `40 total`, arranged as `2 rows of 20`.
2. Measure pitch along one row: `0.100 in.` / `2.54 mm` center-to-center.
3. Measure row-to-row spacing: `0.100 in.` / `2.54 mm` centerline-to-centerline.
4. Measure one post thickness: approximately `.025 in.` / `0.64 mm` square.
5. Confirm there is enough clearance around the probe header for the IDC body and strain relief.
6. Mark or verify `pin 1` before pressing the connector onto the ribbon cable.

Interpretation:

- if all four geometry checks match, a standard `40-position` `2x20` IDC receptacle such as `3M 89140-0103` is a plausible probe-side mate
- if row spacing or pin pitch differs from `0.100 in.`, the common IDE/IDC candidate is not correct
- if the posts are not close to `.025 in.` square, check alternate receptacle families before ordering

### IDC Ribbon Cable Parts

- `3M 89140-0103`: `40-position` IDC receptacle, `2x20`, `0.1 in.` pitch, for `26-28 AWG` ribbon cable
- `3M N2540-6002-RB`: mating `40-position` boxed header, `2x20`, `0.1 in.` pitch
- `3M 3365/40 100`: `40-conductor`, `28 AWG`, `0.050 in.` ribbon cable with red stripe

Current references:

- DigiKey: `3M 89140-0103`
  https://www.digikey.com/en/products/detail/3m/89140-0103/2767074
- DigiKey: `3M N2540-6002-RB`
  https://www.digikey.com/en/products/detail/3m/N2540-6002-RB/1306234
- DigiKey: `3M 3365/40 100`
  https://www.digikey.com/en/products/detail/3m/3365-40-100/22532470

### Socket / Protection-Socket Style References

Useful current references for `40-pin` DIP socket geometry:

- DigiKey: `Aries Electronics 40-6518-10`
  https://www.digikey.com/en/products/detail/aries-electronics/40-6518-10/44025
- DigiKey: `Mill-Max 614-43-640-31-012000`
  https://www.digikey.com/en/products/detail/mill-max-manufacturing-corp/614-43-640-31-012000/1212029

These are useful references for `0.6 in.` row spacing and for handling/protection-socket fit at the target end.

## Recommended Build Variant

Recommended first-build variant:

1. `A13` end:
- `3M 89140-0103` or equivalent `40-position` IDC receptacle
2. Cable:
- `3M 3365/40` or equivalent `40-conductor` ribbon cable
3. Target end:
- small passive adapter board with:
- one `2x20 0.1 in.` header for the ribbon-cable mate
- one `40-pin` `0.6 in.` row-spacing DIP male plug that inserts into the target socket

Reason for recommending this variant:

- it directly matches the confirmed connector types at both ends
- it keeps the hard-to-source custom shape limited to a small adapter instead of the entire cable
- it makes continuity testing and future repair straightforward

## Original-Find Track

Items to watch for:

- `HP 01611-61610`
- `HP 01611-61612`
- complete `HP 1611A` probe accessory lots
- `A13` probe assemblies that still include the target cable

Search terms that match the manual wording best:

- `HP 1611A 01611-61610`
- `HP 1611A 01611-61612`
- `HP 1611A A13 probe`
- `HP 1611A 40-pin male plug cable`

As of `2026-08-20`, no verified current listing for the exact HP target cable has been documented in this repo.

## Bench Validation Plan For A Replacement Cable

Before connecting to the analyzer:

1. Confirm `pin 1` marking on both ends.
2. Buzz out all `40` conductors for straight-through continuity.
3. Confirm there are no shorts between adjacent pins.
4. Plug the cable into a sacrificial or protection socket first.
5. Only then connect `A13`, the target cable, and the target board together.

First live use:

1. Connect the target cable between `A13` and the target CPU socket.
2. Insert the `6809` into the `A13` `ZIF`.
3. Power the target and analyzer.
4. Run a simple `TRACE` in `NORMAL`.
5. If `NO CLOCK` persists, scope `E` clock at:
- the target CPU socket
- the far end of the replacement cable
- the `A13` side of the connection

## Next Repo Work

If fabrication is chosen, the next useful repo artifact is:

- a simple `2x20 IDC` to `40-pin DIP` interposer PCB drawing or perfboard wiring map
- a pin-numbered `1:1` cable diagram
