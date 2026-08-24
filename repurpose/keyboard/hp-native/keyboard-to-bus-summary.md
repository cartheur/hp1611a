# HP 1611A Keyboard To Bus Summary

This note summarizes how a front-panel key press on keyboard assembly `A4` becomes a readable keycode for the `8080` on assembly `A5`.

## Short Version

The keyboard does not place a direct binary keycode on the system by itself.

Instead:

1. `A5` scans the `A4` keyboard matrix.
2. A pressed key generates a pulse on one `KS` sense line.
3. `A5` detects which row and column matched.
4. `A5` freezes that scan state.
5. `A5` places the resulting keycode on internal `MEMORY bus` lines `M0-M7`.
6. The `8080` reads that bus value.

## Assemblies Involved

- `A4`: keyboard assembly
- `A5`: microprocessor, system timing, and keyboard scanner assembly
- `A1`: main board/backplane carrying the interconnects between assemblies

## Signal Groups

- `SCAN A-D`: keyboard row-scan control signals driven from `A5`
- `KS0-KS4`, `KS7`: key-sense return lines from `A4` back to `A5`
- `M0-M7`: internal `MEMORY bus` lines read by the microprocessor

## Physical / Functional Flow

### 1. Keyboard Matrix

The keyboard on `A4` is a `39`-key matrix arranged as `8 rows x 6 columns`.

Each key is a transformer-style switch. When the key is not pressed, there is very little coupling between the two windings. When the key is pressed, the core couples the scan pulse from the row winding into the column sense winding.

Source:
- `01611-90909.md`, keyboard description on Service Sheet 4

### 2. Row Scan Drive

`A5` contains the keyboard scanning circuit. A six-bit keyscan counter continuously steps through the keyboard matrix.

- The `3` least-significant bits drive `SCAN A-C`
- `SCAN D` acts as the enable
- These signals go to keyboard decoder `A4U1`
- `A4U1` selects one keyboard row at a time

When the selected row is driven, a sharp current pulse is sent through all key primaries in that row.

### 3. Column Sense Return

If a key in the active row is pressed, that row pulse couples into the key’s secondary winding and produces a pulse on that key’s column sense line:

- `KS0`
- `KS1`
- `KS2`
- `KS3`
- `KS4`
- `KS7`

Those `KS` lines return to the keyboard scanner circuit on `A5`.

### 4. Row + Column = Key Identity

The same six-bit keyscan counter on `A5` identifies both:

- which row is currently excited
- which column is currently being observed

This is done by:

- using the `3` LSBs to select the row through `A4U1`
- using the `3` MSBs to select the observed column through an `8-to-1` data selector on `A5`

So when a `KS` pulse arrives, `A5` already knows the exact scan count at that moment. That scan count is the key identity.

## What Happens On A Valid Key Press

The manual gives an example with key `D`.

- The keyscan counter reaches count `001 101` (octal `15`)
- That count corresponds to row `5`, column `1`
- The selector is watching `KS1`
- Row `5` is excited
- Because `D` is pressed, a pulse appears on `KS1`

That pulse is detected by the keyboard scanner circuitry on `A5`, which then:

1. drives the selected input path active
2. triggers a monostable
3. clocks a flip-flop
4. forces the keyscan counter into a hold state

The result is that the scan stops on that key instead of continuing to run.

## How The Keycode Reaches The Bus

Once the keyscan counter is locked:

- the `6`-bit keyscan count is routed to `M0-M5`
- `M6` and `M7` provide status bits

This is done through data selectors on `A5`.

So the keyboard-related value seen by the microprocessor is not raw `KS` or `SCAN` wiring. It is a decoded and stabilized keycode presented on the internal `MEMORY bus`.

## First Read vs Held Key

The scanner distinguishes:

- first detection of a key
- key still being held down
- no key pressed

The manual describes it this way:

- first read of a new key: `M6` and `M7` are both high
- subsequent reads while the same key remains held: one status bit changes
- no key depressed: the most-significant indication returns to zero while the scanner resumes free-running

That lets the firmware distinguish a new key event from a held key.

## Relationship To Personality Panel Switches

The microprocessor does not read only the keyboard through this path.

The same selector stage on `A5` can present either:

- keyboard data
- personality-panel switch data (`SW0-SW7`)

So `A5` is the board that arbitrates what the CPU sees when it performs this read.

## Practical Bus-Level Summary

If you want the shortest engineering summary:

- `A4` turns a key press into a pulse on one `KS` line when the proper row is scanned
- `A5` determines which row/column combination caused that pulse
- `A5` freezes the scan count
- `A5` places the encoded result onto `M0-M7`
- the `8080` on `A5` reads the bus and interprets the key press

## Relevant Interconnects

From the existing A1 interconnect notes:

- `SCAN A`: `A5P1-14` to `A4W1-7`
- `SCAN B`: `A5P1-15` to `A4W1-8`
- `SCAN C`: `A5P1-16` to `A4W1-9`
- `SCAN D`: `A5P1-13` to `A4W1-10`
- `KS0`: `A4W1-15` to `A5P1-3`
- `KS1`: `A4W1-2` to `A5P1-4`
- `KS2`: `A4W1-14` to `A5P1-5`
- `KS3`: `A4W1-3` to `A5P1-6`
- `KS4`: `A4W1-13` to `A5P1-7`
- `KS7`: `A4W1-4` to `A5P1-8`
- keyboard ground returns: `A4W1-1,5,12,16` to `A5P1-9,10`

## Source References

- [docs-classified/service-manual/01611-90909.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/service-manual/01611-90909.md:15161)
- [docs-classified/service-manual/01611-90909.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/service-manual/01611-90909.md:17755)
- [docs-classified/service-manual/01611-90909.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/service-manual/01611-90909.md:18576)
- [docs-classified/service-manual/01611-90909.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/service-manual/01611-90909.md:12932)
- [docs-classified/service-manual/01611-90909.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/service-manual/01611-90909.md:13135)
