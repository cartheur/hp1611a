# HP 1611A Agent Repair Playbook

This playbook is the fast path for an agent diagnosing HP `1611A` mainframe faults and bad measurement conditions while using installed personality modules, especially the `A09` (`10266A`) module for `6809` work.

## Scope

- Primary mainframe source: `docs-classified/mainframe/1611a-mainframe-composed-repair-reference.md`
- Primary `6809` source: `docs-classified/operators-guide/10266-90902.md`
- Mainframe figures and service sheets: `docs-classified/mainframe/figures/`
- `A09` rendered figures: `docs-classified/operators-guide/figures/`

## Source Of Truth Rules

- Treat the fused `1611A` mainframe reference as canonical for mainframe diagnostics, adjustments, troubleshooting flow, service sheets, and serial-sensitive repair notes.
- Treat the `A09` operator's guide as canonical for `6809` hookup, indicator meaning, probe-test behavior, trigger setup, and operator-level checks.
- When the two differ in emphasis, use the mainframe reference for internal repair and the `A09` guide for personality-module behavior.
- When OCR text is unclear, cite the Markdown page number and inspect the matching rendered figure page.

## 1611A Reality Check

- The `1611A` is not a general-purpose pod-style logic analyzer in the `1615A` sense; it is a microprocessor-oriented logic state analyzer whose practical behavior depends on the installed personality module.
- The bare mainframe manual is intentionally incomplete for full operating and performance-test behavior. The manuals explicitly defer detailed operation and complete performance tests to the installed personality-module supplement.
- For `A09`, the analyzer is centered on synchronous `6809` bus observation around the target `E-clock`, not free-form asynchronous threshold experimentation.
- The primary measurement families here are `TRACE`, `TRACE TRIGS`, `COUNT TRIGS`, and `TIME INTVL`, with `TRACE SINGLE STEP` and `TRACE THEN HALT` available through the personality-panel `TEST MODE`.
- The rear `A12` external probe is supplemental qualification input. It is not the primary source of microprocessor-state capture.
- `PROBE TEST` proves probe/analyzer line handling against the panel's test pattern. It does not prove that the target CPU is alive, clocked, or running in-circuit.

## First Split: Mainframe Fault Or Measurement Fault

Ask this first:

1. Does the symptom change when probe hookup, CPU insertion method, target grounding, or target power state changes?
2. Does the `1611A` show the expected turn-on display and respond normally in probe-test and module-specific front-panel use?
3. Is the problem clearly tied to one installed personality module or one target system?

Treat it as a measurement-condition problem first when:

- the symptom only appears on one target board
- changing probe orientation or target hookup changes the symptom
- the analyzer indicators are otherwise sensible
- the `A09` indicator points to a missing target condition such as `NO CLOCK`

Treat it as a mainframe fault first when:

- the turn-on display is wrong or inconsistent
- probe-test behavior is wrong with a known-good setup
- the CRT display path is blank or incoherent
- the same failure appears across multiple modules or targets

## Fast Triage Workflow

1. Confirm the correct manual pair for the session:
   - mainframe repair: fused `1611A` reference
   - `6809` operation: `10266-90902.md`
2. Confirm the analyzer is being used in a way the `1611A` actually supports:
   - installed personality module matches the target CPU family
   - desired measurement is one of the supported module modes
   - the target presents the required synchronous bus activity
3. Check for operator/setup faults before internal repair:
   - correct module installed
   - `TEST MODE` in the intended position
   - CPU/probe orientation correct
   - target system live and grounded
4. Use the `A09` probe-test routine before blaming the mainframe:
   - `PROBE TEST` socket behavior and lamp sequence: `A09` guide, Pages `62` to `63`
5. If the symptom persists with a known-good setup, route into `Section VIII` of the fused mainframe reference for troubleshooting trees, service sheets, and signature-analysis flow.
6. Only after setup and troubleshooting evidence agree should you use `Section V` adjustments.

## Symptom Routing

## 1. `NO CLOCK` Stays Lit

Use when:

- the `NO CLOCK` lamp remains on during attempted `6809` measurements
- the analyzer will not observe program activity
- the user believes the analyzer is "not reading the CPU"

Primary pages:

- `A09` indicator meaning: Page `24`
- `A09` hookup methods: Page `40`
- `A09` probe-test routine: Pages `62` to `63`

Agent actions:

1. Restate that `NO CLOCK` means no valid `E-clock` is reaching the analyzer, or that the `E-clock` period is too long.
2. Confirm the CPU is being observed in a live target system, not just inserted into the probe by itself.
3. Confirm probe orientation and target grounding.
4. Remember that `A09` expects TTL-like logic thresholds and synchronous `E-clock`-qualified activity; this is not a variable-threshold rescue case.
5. If the target is `6809E`-based, suspect the external clock chain early.
6. Only after those checks should the agent suspect an A09 or mainframe fault.

Working rule:

- `NO CLOCK` is usually a target-clock or hookup problem before it is a `1611A` hardware problem.

## 2. Probe-Test Fails Or Lamps Behave Wrong

Use when:

- the `PROBE TEST` sequence does not behave as described
- the expected lamp sequence is missing
- `HALTED BY 1611A` does not light in `TRACE SINGLE STEP`

Primary pages:

- `A09` indicator descriptions: Pages `22` to `24`
- `A09` probe-test routine: Pages `62` to `63`
- mainframe display/probe-test setup references: fused mainframe reference, Pages `15` to `16`

Agent actions:

1. Run the `A09` probe-test exactly as written with correct pin orientation.
2. Verify that `NO CLOCK`, `HALTED`, `WAITING FOR INTERRUPT`, and `SYNCING` light in sequence in `NORMAL`.
3. Verify that `HALTED BY 1611A` lights in `TRACE SINGLE STEP`.
4. If probe-test fails with known-good orientation, escalate from setup questions to mainframe or module troubleshooting.

## 3. Wrong Turn-On Display Or Suspected Mainframe Fault

Use when:

- the instrument powers up incorrectly
- the CRT output is wrong before target hookup matters
- behavior suggests an internal logic or display fault

Primary pages:

- fused mainframe reference, `Section VIII`, Pages `49` to `51`
- fused mainframe troubleshooting trees and signature-analysis procedures beginning around Page `57`

Agent actions:

1. Record the exact turn-on or display symptom before changing settings.
2. Visually inspect for loose boards, burned parts, and connector faults.
3. Check power-supply voltages before deep logic troubleshooting.
4. Use the `Section VIII` troubleshooting tree and service-sheet flow, not ad hoc part-swapping.

## 4. Measurement Seems Wrong But Indicators Look Plausible

Use when:

- the analyzer captures activity, but the result seems incorrect
- triggering appears mistimed
- the display content looks valid but not credible

Primary pages:

- fused mainframe reference: performance-test entry, Pages `13` to `14`
- `A09` operating sections for trace/count/time setup: Pages `40` to `59`

Agent actions:

1. Confirm the selected measurement type matches the question being asked.
2. Re-check trigger qualification and `TEST MODE`.
3. Confirm the hookup method being used:
   - CPU removed into A13 socket with cable returned to the target socket
   - or clip attached to the installed CPU
4. Remember that on `1611A` the trace is built from recognized microprocessor transactions, not arbitrary channel history in the `1615A` sense.
5. Prefer reproducing the issue with the simplest valid setup before changing internals.

## 5. Internal Repair Or Board-Level Isolation

Use when:

- setup has been proven good
- probe-test or turn-on behavior still fails
- board-level localization is required

Primary pages:

- fused mainframe reference, `Section VIII`
- troubleshooting tree and signature-analysis procedures: Pages `57` onward
- manual changes and serial deltas: around Pages `33` to `48`

Agent actions:

1. Check serial-sensitive manual-change notes before trusting a component designator or adjustment reference.
2. Use the troubleshooting tree to choose the correct signature-analysis procedure.
3. Substitute a known-good mainframe microprocessor when the tree points to `A5U11`, because the manual warns a bad microprocessor can escape some tree checks.
4. Cite the exact page and procedure number when giving repair guidance.

## 6. Adjustment Work

Use when:

- a repair has already localized the fault
- verification shows adjustment is actually required
- the instrument is otherwise stable enough for calibration steps

Primary pages:

- fused mainframe reference, `Section V`, Pages `13` to `15`
- manual-change deltas for adjustment references: around Pages `33` to `34`

Agent actions:

1. Verify the serial range before using comparator-adjustment designators.
2. Check the `+5 V` supply target carefully because the fused reference preserves a `1978` versus `1980` delta.
3. Do not adjust internal controls as a first-pass fix for `NO CLOCK`, bad hookup, or unclear target behavior.

## Verify Before And After Repair

Use when:

- the instrument has been repaired
- a module has been reseated or replaced
- an adjustment has been touched

Primary pages:

- `A09` probe-test routine: Pages `62` to `63`
- fused mainframe performance-test/adjustment entry: Pages `13` to `15`
- fused mainframe troubleshooting guidance: `Section VIII`

Agent actions:

1. Re-run the `A09` probe-test if the session involves `6809` work.
2. Re-test the original symptom on a known-good target setup.
3. Record the module used, target CPU type, hookup method, indicator behavior, and cited pages.
4. If the repair depended on a manual-change delta, record the serial assumption explicitly.

## Adjustment Guardrails

- Do not use internal adjustments to compensate for a missing target `E-clock`.
- Do not treat the `PROBE TEST` socket as proof that the target system clock is present.
- Do not assume the `1978` and `1980` manuals are interchangeable at the component-designator level.
- Do not jump past setup checks when the symptom is module-specific.
- Do not import `1615A` habits such as assuming broad standalone threshold tuning, generic pod swapping, or module-independent performance testing.

## Minimal Citation Pattern For Agents

When answering a `1611A` fault question, cite like this:

- `A09 guide, Page 24`: indicator meanings such as `NO CLOCK`
- `A09 guide, Page 40`: `6809` hookup method
- `A09 guide, Pages 62-63`: probe-test routine
- `1611A fused reference, Page 49`: troubleshooting introduction
- `1611A fused reference, Page 50`: signature-analysis method and troubleshooting prerequisites
- `1611A fused reference, Page 13` or `14`: performance-test and adjustment entry points

## Suggested Answer Strategy For Future Agents

1. Restate the symptom as `measurement-condition fault`, `mainframe fault`, or `uncertain`.
2. Name the first proving step, not the final diagnosis.
3. Prefer reversible checks first:
   - target live/powered confirmation
   - probe orientation and ground
   - `TEST MODE` confirmation
   - `A09` probe-test
4. State explicitly whether the question is about:
   - target-system behavior seen through the `1611A`
   - `A09` module behavior
   - or the `1611A` mainframe itself
5. Escalate to service-sheet and signature-analysis guidance only after setup evidence is coherent.
