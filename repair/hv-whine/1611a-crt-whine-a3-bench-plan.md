# HP 1611A CRT Whine Repair Bench Plan

Date: August 23, 2026

## Symptom

The CRT starts normally with the unit, and the display appears stable and normal during warm-up. After at least five minutes of running, a high-frequency whine appears.

Important clarification:

- the screen brightness does not obviously drop when the whine begins
- the display otherwise appears normal when the sound starts
- the sound is high frequency rather than a low hum or buzz
- the sound now seems strongest at the `A2` power supply board rather than the `A3` display board
- one card shows what appears to be an older HP repair replacing `CR1-4`, `CR6`, `CR7`, `CR9`, and `CR10`

The new localization makes the `A2` low-voltage power supply the first place to prove or eliminate. The HP manual shows that `A2` contains a switching `+5 V` regulator using `Q1`, `L1`, `CR11`, and `U1`, plus linear `+12 V` and `-12 V` regulators. A warm-up-related whine from that board is more likely to come from:

- a magnetic component becoming mechanically noisy after warm-up, especially `L1`
- a filter or timing capacitor drifting and pushing the `+5 V` switcher into audible operation
- a cracked solder joint on a heavier `A2` part that changes with heat
- a supply stage running under abnormal load from another board

The older HP diode rework is important history, but it does not by itself prove that the replaced diodes are the present fault. Diodes are less likely to be the physical source of a whine than magnetics, stressed capacitors, or unstable switching behavior.

Relevant manual notes:

- `Power Supply A2` provides the instrument low-voltage rails and includes a switching `+5 V` regulator.
- The manual describes the `+5 V` section as a switcher using `Q1`, `L1`, `CR11`, and controller `U1`.
- `Display Driver A3` still generates the CRT display drive and includes the horizontal deflection and high-voltage functions.
- The manual explicitly says that if `A3U6`, `A3Q1`, or `A3Q9` fail, check `A3C2`, `A3C7`, and `A3C27`, because reduced capacitance or open circuits can raise peak voltages and cause breakdown stress.

## Goal

First prove whether the warm-up whine is coming from `A2` and whether any low-voltage rail changes with it. If the `A2` rails remain solid, then return to the `A3` horizontal/HV section as the next most likely source.

## Safety

- This instrument contains both mains-connected supply circuitry and CRT/high-voltage circuitry. Do not probe casually.
- Power down and discharge safely before touching `A2`, `A3`, or CRT-related wiring.
- Avoid handling the CRT neck or anode wiring unnecessarily.
- Use clip leads with power off first whenever possible.

## Bench Worksheet

### 1. Baseline the symptom

Power the unit and let it run until the whine starts.

Record what changes at the same moment:

- exact warm-up time to onset
- where the sound is physically strongest: `A2`, `A3`, CRT area, or unclear
- screen width
- brightness
- focus
- horizontal stability
- vertical height or linearity

Interpretation:

- If the sound is strongest at `A2`, begin with the low-voltage power supply checks below even if the CRT still looks normal.
- If width, brightness, or focus change with the whine, keep `A3` high on the list even if `A2` is noisy.
- If the display remains visually normal and only the high-frequency whine appears, suspect either `A2` switcher resonance or `A3` horizontal/HV resonance.
- If only vertical geometry changes, the vertical sweep section on `A3` moves up the list.

### 2. `A2` cold-versus-warm voltage pass

Before replacing parts, check whether the low-voltage supply changes when the whine begins.

Suggested rails:

- `+5 V`
- `+12 V`
- `-12 V`

Record each reading:

- immediately after power-on
- just before the whine starts
- after the whine is clearly present

Use `A2` test points from the manual where practical. The manual explicitly uses `A2TP14` and `A2TP6` for the `+5 V` setting/check.

What matters:

- a rail shifting when the sound begins
- a rail that remains near nominal DC but becomes unstable with heat
- a `+5 V` rail that is correct cold but drifts or chatters warm

Quick worksheet:

| Rail | Cold | Just Before Whine | During Whine | Notes |
| --- | --- | --- | --- | --- |
| `+5 V` |  |  |  |  |
| `+12 V` |  |  |  |  |
| `-12 V` |  |  |  |  |

Interpretation:

- If one or more `A2` rails shift with the whine, stay on `A2` first.
- If all three rails remain stable and the display remains normal, move back toward `A3` horizontal/HV resonance.
- If `+5 V` is the only rail that changes, the `A2` switcher becomes the lead suspect.

### 3. Visual inspection of `A2`

With power removed:

- inspect `L1` for looseness, cracked varnish, or obvious mechanical movement
- inspect `Q1`, `CR11`, and nearby components for heat stress
- inspect electrolytics and small timing/filter capacitors around the switcher
- inspect solder joints on heavier or hotter parts
- inspect the area around the earlier HP diode replacements for overheated pads, non-original lead dress, or cracked joints
- inspect for darkened board areas or previous rework that looks stressed again

### 4. Interpretation of the older HP diode repair

The replaced parts `CR1-4`, `CR6`, `CR7`, `CR9`, and `CR10` suggest this board had a significant earlier supply fault or factory/service campaign.

Working interpretation:

- treat that diode cluster as a high-interest inspection area
- do not assume the diodes are the physical noise source
- suspect nearby capacitors, magnetics, or solder joints first if the sound is mechanical
- if one rail is wrong, include the repaired diode network and its surrounding circuit immediately

### 5. First `A2` repair pass if a rail or sound points there

If `A2` proves suspicious, inspect or replace in this order:

- reflow suspect solder joints on heavier `A2` components
- inspect or replace the most stressed electrolytic or timing/filter capacitors around the `+5 V` switcher
- inspect `L1` mechanically
- check `Q1`
- check `CR11`

Then re-test from cold and compare the warm-up time.

### 6. `A3` fallback voltage-check pass

If the `A2` rails stay solid and the sound still seems related to the display section, return to `A3`.

The `A3` display/HV section shows these useful rails in the manual:

- `+35 V`
- `+275 V`
- `-150 V`

Record each reading:

- immediately after power-on
- just before the whine starts
- after the whine is present

Interpretation:

- If `+35 V`, `+275 V`, and `-150 V` remain stable and the display still looks normal, the fault is more likely a resonant capacitor, switching transistor, or magnetic component in the `A3` horizontal/HV section than a gross supply collapse.
- If `+275 V` or the HV-related reading changes with the sound, move `A3C2`, `A3C7`, `A3C27`, `A3C8`, `Q1`, and `Q9` to the very top of the list.
- If `+35 V` changes, include the video/HV coupling area on `A3` in the search even if the screen still appears normal.
- If one rail is already wrong from cold start, repair that condition first before chasing warm-up resonance.

Practical caution:

- Use clip leads where possible with power off first, then power up for the measurement.
- Keep one hand away from the chassis when working around live CRT/HV circuitry.
- Do not move the HV probe around the CRT area while live unless the point and insulation are fully under control.
- If you can safely compare only one `A3` rail cold versus warm, `+275 V` is a strong candidate.

### 7. `A3` first replacement pass if the supply checks out

Inspect or replace next:

- `A3C8`
- check `A3Q1`
- check `A3Q9`

Reason:

- `A3C8` is part of the horizontal sweep correction path.
- `Q1` and `Q9` are in the stressed horizontal/HV area and may have been weakened by a bad capacitor.
- If the sound is high-frequency with little or no visible display change, this raises the odds of a part in this section becoming mechanically resonant or operating under changed peak stress after warm-up.

Also inspect closely at this stage:

- the horizontal/HV transformer and nearby magnetics
- solder joints on heavier components in that area

### 8. Vertical-section pass if the symptom points there

If the display height or vertical linearity changes when the whine starts, inspect or replace:

- `A3C14`
- `A3C15`
- `A3C19`
- `A3C20`

### 9. Final adjustment check

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

1. prove whether `A2` rails change cold versus warm
2. inspect `A2` switcher area around `L1`, `Q1`, `CR11`, and nearby capacitors
3. inspect the older HP diode-repair area for stressed rework or cracked joints
4. reflow any suspect `A2` heavy-component solder joints
5. if `A2` checks out, move to `A3C2`
6. `A3C7`
7. `A3C27`
8. `A3C8`
9. `A3Q1`
10. `A3Q9`
11. inspect transformer/magnetic components and their solder joints in the same horizontal/HV area
12. `A3C14`, `A3C15`, `A3C19`, `A3C20` if the symptom looks vertical

## Notes For Next Session

- Record exact warm-up time to whine onset from a true cold start.
- Record whether the sound is strongest at `A2` every time or only sometimes.
- Measure `+5 V`, `+12 V`, and `-12 V` before swapping parts if possible.
- Inspect and photograph the older HP diode repair area on `A2`.
- Confirm the actual marking and style of `A3C8` before ordering if the fault falls back to `A3`.
- If there is no visible brightness or geometry shift at all and `A2` rails stay solid, treat the problem as likely horizontal/HV resonance or stress on `A3` before treating it as a general CRT brightness fault.
