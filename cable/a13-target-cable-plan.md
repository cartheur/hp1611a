# A13 Target Cable Plan

## Purpose

Restore the missing cable needed to use the `A13` probe's `ZIF` socket with a live target system.

Without this cable, a `6809` inserted into the `A13` probe body is not connected back into the powered target board, so `NO CLOCK` results are not meaningful as a CPU diagnosis.

This cable-recreation effort is specifically intended to reproduce the function of HP part `01611-61610`, the documented `40-pin` male plug cable for the `A13` probe path.

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

Confirmed from bench inspection and photo review:

- the `A13` probe connector presents `male` pins
- the probe connector is arranged as `2 rows of 20` pins
- the pins appear `round` or machined in the closeup photo, not obviously `.025 in.` square posts
- the target system uses a standard `40-pin DIP` socket

This means the replacement cable should currently be treated as:

- `A13 end`: `40-position dual-row female receptacle`, connector family still to be confirmed
- `cable`: `40-conductor` ribbon cable
- `target end`: `40-pin DIP male plug`

Important implication:

- a standard IDE-style IDC receptacle is only a candidate if bench measurement confirms standard `0.100 in.` dual-row spacing and a compatible pin diameter/profile
- the photo evidence does not support treating the probe connector as a confirmed mate for `.025 in.` square-post IDC sockets

## Recommended Build Strategy

Do not try to recreate HP's molded cable first.

Safer first build:

1. Identify a compatible `40-position` female receptacle for the `A13` end before committing to IDC tooling or parts.
2. Use a short `40-conductor` ribbon cable.
3. Terminate the target end with a small passive interposer that converts the ribbon cable to a `40-pin DIP male plug`.
4. Insert that male DIP plug into the target board's CPU socket, preferably through the `40-pin` protection socket if available.

Why this is the preferred first build:

- it keeps the electrical mapping simple while leaving the probe-side connector choice open
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
4. Measure one pin diameter or cross-section and determine whether the contact is `round` or `.025 in.` square-post style.
5. Confirm there is enough clearance around the probe header for the IDC body and strain relief.
6. Mark or verify `pin 1` before pressing the connector onto the ribbon cable.
7. Check mating depth: until disproved by bench fit, prefer a probe-side receptacle body/depth of at least `12 mm`, since typical `10 mm` IDC cable ends may bottom out before fully engaging the recessed pins.

Interpretation:

- if the row spacing is `0.100 in.` and the pins are truly `.025 in.` square posts, a standard `40-position` `2x20` IDC receptacle such as `3M 89140-0103` remains a plausible probe-side mate
- if row spacing or pin pitch differs from `0.100 in.`, the common IDE/IDC candidate is not correct
- if the pins are round or otherwise not close to `.025 in.` square-post geometry, check alternate receptacle families before ordering
- if the probe-side plastic shroud recess demands more than about `10 mm` of effective reach, prioritize taller/deeper dual-row female connectors over typical PC IDE cable ends

Photo note:

- the closeup image [cable/probe-end.jpg](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/cable/probe-end.jpg) visually supports `2x20` pin count but suggests a `round-pin` mating style rather than a typical IDE header

### IDC Ribbon Cable Parts

- `3M 89140-0103`: `40-position` IDC receptacle, `2x20`, `0.1 in.` pitch, for `26-28 AWG` ribbon cable, still only a conditional candidate
- `3M N2540-6002-RB`: mating `40-position` boxed header, `2x20`, `0.1 in.` pitch, useful as a dimensional reference for standard IDC geometry
- `3M 3365/40 100`: `40-conductor`, `28 AWG`, `0.050 in.` ribbon cable with red stripe
- `3M 3365/40-CUT-LENGTH`: same `3365/40` ribbon-cable family in user-specified cut length, appropriate for the HARTING `SEK-18` cable-side IDC connector

Current references:

- DigiKey: `3M 89140-0103`
  https://www.digikey.com/en/products/detail/3m/89140-0103/2767074
- DigiKey: `3M N2540-6002-RB`
  https://www.digikey.com/en/products/detail/3m/N2540-6002-RB/1306234
- DigiKey: `3M 3365/40 100`
  https://www.digikey.com/en/products/detail/3m/3365-40-100/22532470

### Current Mouser Candidate Connectors For The Probe End

These are the best current candidates found so far, with important caveats.

Most promising family from current review:

- `Samtec ESW` / `ESQ` elevated socket strips on `0.100 in.` pitch
- reason: they are available in `40-position`, `2-row` configurations and offer taller bodies than typical IDC cable ends

Current Mouser examples:

- `Samtec ESW-120-44-T-D`
  - Mouser: `200-ESW12044TD`
  - `40-position`, `2-row`, elevated socket strip
  - lead-style table indicates `B = 0.735 in. / 18.67 mm`
  - useful because it clearly exceeds the current `12 mm` preferred depth target
- `Samtec ESW-120-33-L-D`
  - Mouser: `200-ESW12033LD`
  - `40-position`, `2-row`, elevated socket strip
  - lead-style table indicates `B = 0.635 in. / 16.13 mm`
- `Samtec ESQ-120-44-L-D-LL`
  - Mouser: `200-ESQ12044LDLL`
  - `40-position`, `2-row`, elevated socket strip with locking leads
  - `LL` is Samtec's locking-lead option, which may help if this connector is mounted on a small probe-side adapter PCB
  - same elevated family, worth considering if a PCB adapter is used

Relevant datasheets and family documents:

- Samtec `ESW/ESQ` catalog page:
  https://suddendocs.samtec.com/catalog_english/esw_th.pdf
- Samtec `ESW` print:
  https://suddendocs.samtec.com/prints/esw-1xx-xx-x-x-xx-xx-mkt.pdf
- Samtec `ESQ` `LL` example on Mouser:
  https://www.mouser.com/en/ProductDetail/Samtec/ESQ-120-44-L-D-LL
- Samtec `ESW-120-44-T-D` on Mouser:
  https://www.mouser.com/ProductDetail/Samtec/ESW-120-44-T-D

Important caveats for the `ESW` / `ESQ` family:

- Samtec documents these as mates for `.025 in.` square-post families, not explicitly for round machined pins
- the catalog lists insertion depth as only `0.145 in.` to `0.250 in.` / `3.68 mm` to `6.35 mm`
- so they may solve body-height clearance while still failing if the probe's recessed geometry requires more actual pin engagement depth than that

Likely not suitable from current review:

- `Samtec ESD-120-G-06`
  - Mouser: `200-ESD120G06`
  - reason: the `ESD` precision machined socket strip datasheet lists a lead size range of only `0.015 in.` to `0.022 in.` diameter
  - since the probe pins appear to be about `0.025 in.` diameter, this family is likely too small
- `3M 89140-0103` and similar standard IDC cable sockets
  - still only conditional candidates
  - they are designed around `.025 in.` square-post mating geometry and may be too shallow for the recessed probe connector

Working conclusion from current Mouser review:

- the best currently visible Mouser candidates are the taller `Samtec ESW` / `ESQ` elevated `2x20` socket-strip families
- they are better depth candidates than standard IDE-style IDC cable ends
- they are still not confirmed mates for the probe because the pin style is round and Samtec specifies these families around square-post mating systems
- if no direct mate is confirmed, the safest build path may be a small probe-side adapter using one of these elevated sockets rather than a direct ribbon-cable IDC end

Confirmed cable-side interposer parts:

- PCB header: `HARTING 09 18 540 6904`
  - Mouser: `617-09-18-540-6904`
  - confirmed by local datasheet as a `40-contact`, `2-row`, `2.54 mm` straight male PCB-to-cable header with long levers
- cable receptacle: `HARTING 09 18 540 6804`
  - Mouser: `617-09185406804`
  - confirmed by local datasheet as a `40-contact` IDC female for `1.27 mm` pitch flat cable, `AWG 28/7` to `AWG 26/7`
- ribbon cable: `3M 3365/40-CUT-LENGTH`
  - `40-conductor`, `28 AWG`, `1.27 mm` / `0.050 in.` pitch flat cable
  - matches the HARTING cable-side receptacle requirements

Current best first-buy candidate:

- `Samtec ESW-120-44-T-D`
- reason:
  - `40-position`, `2-row`, `0.100 in.` pitch
  - elevated body dimension `B = 18.67 mm`, which best matches the current recessed-depth concern
  - simpler than the `LL` board-retention variant for a first sacrificial fit test
  - better probe-side mechanical candidate than standard IDC ends
- current limitation:
  - still specified by Samtec around `.025 in.` square-post mating systems, so this is still a fit-test candidate rather than a confirmed final answer

### Socket / Protection-Socket Style References

Useful current references for `40-pin` DIP socket geometry:

- DigiKey: `Aries Electronics 40-6518-10`
  https://www.digikey.com/en/products/detail/aries-electronics/40-6518-10/44025
- DigiKey: `Mill-Max 614-43-640-31-012000`
  https://www.digikey.com/en/products/detail/mill-max-manufacturing-corp/614-43-640-31-012000/1212029

These are useful references for `0.6 in.` row spacing and for handling/protection-socket fit at the target end.

Confirmed current target-end male DIP candidate:

- `Aries Electronics 40-600-21`
- local datasheet: [cable/12032-dip-header.pdf](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/cable/12032-dip-header.pdf)
- confirmation points from the datasheet:
  - `Series 600` DIP header
  - `0.600 in. / 15.24 mm` row spacing for the `40-pin` version
  - fork contacts accept leads up to `0.025 in. / 0.64 mm` diameter
  - `2 A` contact current rating
  - suitable as the current preferred target-end `40-pin DIP` male plug

## Recommended Build Variant

Recommended first-build variant:

1. `A13` end:
- small passive probe-side adapter PCB using `Samtec ESW-120-44-T-D` as the current best first-fit socket candidate
2. Cable:
- `3M 3365/40` or equivalent `40-conductor` ribbon cable
3. Target end:
- small passive adapter board with:
- one `2x20 0.1 in.` header for the ribbon-cable mate
- one `40-pin` `0.6 in.` row-spacing DIP male plug such as `Aries Electronics 40-600-21` that inserts into the target socket

Reason for recommending this variant:

- it still fits the confirmed `40-conductor` and `40-pin DIP` requirements even though the exact probe-side mate remains open
- it keeps the hard-to-source custom shape limited to a small adapter instead of the entire cable
- it makes continuity testing and future repair straightforward

## Probe-Side Interposer Concept

Most workable current concept:

- plug the `A13` probe into a small passive PCB carrying `Samtec ESW-120-44-T-D`
- place a standard `2x20 0.100 in.` male header on that same PCB
- plug a normal `40-position` IDC ribbon-cable receptacle onto the PCB header
- keep the PCB wiring strictly `1:1`

Important:

- the `ESW` / `ESQ` socket does not terminate ribbon cable directly
- the ribbon cable connects to the separate `2x20` male header on the adapter PCB
- the adapter PCB is only a mechanical and pinout bridge

Suggested PCB stack:

1. Probe side:
- `Samtec ESW-120-44-T-D`
2. PCB copper:
- straight-through `1:1` traces
3. Cable side:
- standard `2x20` `0.100 in.` male header, preferably boxed/keyed if clearance allows

Suggested first-build orientation rule:

- when facing the probe-side socket, define `pin 1` before routing anything
- preserve odd/even numbering row-to-row exactly through the adapter
- do not mirror the footprint between probe side and IDC-header side unless the numbering has been checked pin-by-pin

### Probe-Side Interposer 1:1 Mapping Sketch

Concept only, not yet tied to a final footprint origin:

```text
Probe A13 male pins          Adapter PCB             IDC header on PCB
--------------------         -----------             -----------------
Socket pin  1  ----------->  trace  1  ----------->  Header pin  1
Socket pin  2  ----------->  trace  2  ----------->  Header pin  2
Socket pin  3  ----------->  trace  3  ----------->  Header pin  3
...
Socket pin 38  ----------->  trace 38  ----------->  Header pin 38
Socket pin 39  ----------->  trace 39  ----------->  Header pin 39
Socket pin 40  ----------->  trace 40  ----------->  Header pin 40
```

Row concept:

```text
Probe-side socket / PCB header numbering target

Top row:    1   3   5   7   9  11  13  15  17  19  21  23  25  27  29  31  33  35  37  39
Bottom row: 2   4   6   8  10  12  14  16  18  20  22  24  26  28  30  32  34  36  38  40
```

Bench build sequence:

1. Fit-test `Samtec ESW-120-44-T-D` on the probe before designing the final PCB outline.
2. Confirm full seating depth and check for housing interference.
3. Confirm continuity from the probe pin to the socket tail on several positions across both rows.
4. Only then freeze the adapter PCB footprint and pin-1 orientation.
5. After assembly, buzz out all `40` paths from probe-side socket to IDC-header pins.

## Scope Note On The Clip Variant

The clip-style `01611-61609` accessory should remain out of scope for this epic for now.

Reason:

- current Mouser `40-pin` DIP clip candidates are expensive enough to be poor first investments for an unproven branch
- the plug-style `01611-61610` reproduction is simpler, lower risk, and is the direct blocker for live `A13` cable-path testing

Working decision:

- this epic is focused on recreating the function of `01611-61610`
- a future follow-on may revisit a `01611-61609`-style clip version only after the plug-style cable is proven

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

Immediate next step:

- order the selected parts
- when they arrive, assemble the cable and probe-side interposer, then continuity-check all `40` conductors before first live use
