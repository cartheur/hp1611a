# HP 1611A CRT Whine Repair Bench Plan

Date: August 21, 2026

## Symptom

The CRT starts normally with the unit, then after about a minute a high-frequency whine appears.

Based on the HP manuals, the first area to inspect is the `A3` display driver board. In the `1611A`, the horizontal deflection circuit and the CRT high-voltage supply are linked together on `A3`, which makes that board the most likely source of a warm-up-related squeal.

Relevant manual notes:

- `Display Driver A3` generates the CRT display drive and includes the horizontal deflection and high-voltage functions.
- The manual explicitly says that if `A3U6`, `A3Q1`, or `A3Q9` fail, check `A3C2`, `A3C7`, and `A3C27`, because reduced capacitance or open circuits can raise peak voltages and cause breakdown stress.

## Goal

Narrow the fault to the `A3` horizontal/HV section and work through the most likely capacitor failures before widening the search.

## Safety

- This is CRT/high-voltage circuitry. Do not probe casually.
- Power down and discharge safely before touching the `A3` board or CRT-related wiring.
- Avoid handling the CRT neck or anode wiring unnecessarily.

## Bench Worksheet

### 1. Baseline the symptom

Power the unit and let it run until the whine starts.

Record what changes at the same moment:

- screen width
- brightness
- focus
- horizontal stability
- vertical height or linearity

Interpretation:

- If width, brightness, or focus change with the whine, suspect the `A3` horizontal/HV section first.
- If only vertical geometry changes, the vertical sweep section on `A3` moves up the list.

### 2. Visual inspection of `A3`

With power removed:

- inspect for cracked capacitors
- inspect for ring-cracked or dull solder joints
- inspect for heat-darkened resistors
- inspect `Q1`, `Q9`, and nearby parts for heat stress
- inspect transformer/inductor areas for looseness or evidence of arcing
- inspect the high-voltage section for carbon tracking or contamination

### 3. First replacement pass

Replace or test these first:

- `A3C2`
- `A3C7`
- `A3C27`

Reason:

- HP specifically calls these out as likely causes of overstress around `A3U6`, `A3Q1`, and `A3Q9`.

### 4. First re-test

Power up and let the unit warm again.

Observe:

- Is the whine gone?
- Does the display remain stable after warm-up?
- Did width, brightness, or focus improve?

If yes, stop here and proceed to final adjustment checks only if needed.

### 5. Second pass if the whine remains

Inspect or replace next:

- `A3C8`
- check `A3Q1`
- check `A3Q9`

Reason:

- `A3C8` is part of the horizontal sweep correction path.
- `Q1` and `Q9` are in the stressed horizontal/HV area and may have been weakened by a bad capacitor.

### 6. Vertical-section pass if the symptom points there

If the display height or vertical linearity changes when the whine starts, inspect or replace:

- `A3C14`
- `A3C15`
- `A3C19`
- `A3C20`

### 7. Final adjustment check

Only after the fault is stable:

- check `A3R45` for focus
- check `A3R6` for horizontal size
- check `A3R18` for vertical size

Do not adjust these early unless the display is unusable for testing.

## Suspect Capacitor Values

These values were recovered from the HP parts list and service text. `A3C8` is the least certain due to OCR quality and should be confirmed visually on the board before ordering.

- `A3C2`: `240 pF`, `+-5%`, `300 WVDC`, mica
- `A3C7`: `0.022 uF`, `+-5%`, `400 WVDC`, polyester film
- `A3C8`: `5 uF`, `+-10%`, `50 WVDC`, metallized film, visually confirm before ordering
- `A3C14`: `0.08 uF`, `+-5%`, `50 WVDC`, metallized film
- `A3C15`: `0.08 uF`, `+-5%`, `50 WVDC`, metallized film
- `A3C19`: `0.022 uF`, `+-5%`, `400 WVDC`, polyester film
- `A3C20`: `150 uF`, `+-10%`, `20 VDC`, tantalum
- `A3C27`: `8200 pF`, `+-10%`, `1000 WVDC`, polyester film

## Modern Replacement Guidance

- Keep the capacitance the same whenever possible.
- Equal or higher voltage rating is acceptable.
- `A3C2`: use silver mica if possible.
- `A3C7` and `A3C19`: modern `630 V` film parts are suitable.
- `A3C27`: use `8.2 nF` film rated `1 kV` or higher; pulse-rated is preferred.
- `A3C8`: keep it as a non-polar film type, not a standard electrolytic.
- `A3C14` and `A3C15`: modern `0.082 uF` film parts are the closest standard substitute.
- `A3C20`: tantalum is closest to original, but a suitable modern low-leakage replacement may be acceptable if needed.

## Fault Localization Without Freeze Spray

If you do not have freeze spray, use these lower-risk alternatives:

### Warm-up timing comparison

- Start the unit from cold and note how long it takes for the whine to begin.
- After powering off and cooling, repeat and confirm the timing is consistent.
- If the onset is repeatable, that supports a thermal drift fault rather than a random arc.

### Gentle insulated pressure test

With the unit powered off first, identify suspect parts on `A3`.

During a later powered test, only if it can be done safely and without entering the HV area, use a non-conductive stick to very gently touch or nudge:

- larger film capacitors
- transformer or inductor bodies
- nearby soldered joints

If the pitch changes immediately, the noise may be mechanical or caused by a cracked joint or stressed part.

### Directed warm air

Use very gentle warm air from a safe distance, not a heat gun on high.

- warm one suspect area at a time
- do not overheat the board
- stop if plastic or insulation is at risk

If the whine starts earlier when one area is warmed, that area is a stronger suspect.

### Cool-down pause

If the whine appears, power down and let only the `A3` area cool fully before the next run.

- If the symptom resets after cool-down, thermal drift remains likely.

## Priority Order

1. `A3C2`
2. `A3C7`
3. `A3C27`
4. `A3C8`
5. `A3Q1`
6. `A3Q9`
7. `A3C14`, `A3C15`, `A3C19`, `A3C20` if the symptom looks vertical

## Notes For Next Session

- Confirm the actual marking and style of `A3C8` before ordering.
- Start with the smallest, highest-confidence capacitor set: `A3C2`, `A3C7`, `A3C27`.
- Record any display change that appears exactly when the whine begins.
