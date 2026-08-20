# Diagnostics Notes

## 2026-08-17 - A09 + M6809 shows `NO CLOCK`

Scenario:
Using the HP 1611A with the A09 personality module and an M6809 inserted, the operator attempted to read the CPU according to the quick-start/operator procedure, but the `NO CLOCK` LED remained lit.

Manual evidence:
- The A09 operator's guide states: `NO CLOCK` lights when no `E-clock` from the microprocessor under test is present, or when the `E-clock` period is greater than approximately `12.5 usec`.
- The same guide's hookup procedure says the probe must be connected to the `6809 microprocessor you are going to test`, either by removing the CPU from the target circuit and inserting it into the A13 probe socket while the probe cable connects back into the target socket, or by clipping directly onto the installed CPU.
- The probe-test procedure is separate and uses the personality panel `PROBE TEST` socket only to verify probe/analyzer operation.

Most likely diagnosis:
The error is probably not in the HP 1611A itself. The A09 is not receiving a valid live `E` clock from the target 6809 system.

Most likely causes, in order:
1. The CPU was inserted into the A13 probe/socket without being connected into a powered target system, so there is no live `E` clock to observe.
2. The target board is not generating `E` clock, or the clock is too slow for the analyzer to accept.
3. The probe/clip orientation or grounding is wrong, so the `E` clock is not reaching the A09 correctly.
4. The target is a `6809E`-type arrangement whose external clock source is absent or failed.

Best next checks:
1. Confirm the 6809 is still part of a live, powered target circuit while being probed.
2. Confirm probe orientation and ground connection.
3. Verify `TEST MODE` is `NORMAL` for actual measurements, not just probe-test.
4. Scope or logic-probe the target `E` clock at the CPU.
5. If the device is a `6809E`, verify the external oscillator/clock chain first.

Current conclusion:
`NO CLOCK` strongly suggests a missing target-system clock path, not a generic "cannot read CPU" condition.

Bench interpretation update:
- New evidence strongly supports that simply plugging a `6809` into the personality-panel face area is not enough to perform a live measurement.
- The `A09` guide distinguishes between:
  - the front-panel `PROBE TEST` socket, which accepts the microprocessor probe for synthetic test-pattern checks
  - the actual `A13` microprocessor probe hookup to a live `6809` target system
- This makes the earlier `NO CLOCK` result much more likely to be a setup misunderstanding than a defect in the `1611A` or `A09`.

Practical implication:
- A complete, cleaned, usable `A13` microprocessor probe setup is likely required before meaningful `6809` diagnosis can begin.
- Therefore, the spare `1611A/A09` system with probe hardware may be the best next path for resolving the original `NO CLOCK` question.

## 2026-08-17 - Agent Repair Playbook Assessment

Observation:
An `agent-repair-playbook.md` file was added and reviewed for diagnostic value.

Assessment:
- The playbook does improve diagnostic quality by forcing an early split between `instrument fault` and `measurement-condition fault`.
- Its strongest contribution is process discipline: reversible checks first, self-test before adjustment, and explicit attention to grounding, threshold, and probe-routing effects.
- That reasoning style is directly useful for future `1611A` repair sessions because it reduces premature board-level conclusions.

Important limitation:
- The playbook is currently for the `HP 1615A`, not the `HP 1611A`.
- Its manual references, self-test sequences, board names, and symptom routing cannot be treated as authoritative for the current `1611A` + `A09` case.
- It should therefore be used as a `diagnostic method template`, not as a direct technical source for `1611A` troubleshooting.

Effect on the current `NO CLOCK` diagnosis:
- It strengthens confidence that the first proving step should be a measurement-condition check.
- It does not change the present conclusion that the most likely problem is missing or invalid live `6809 E-clock` at the A09 probe.

Recommended next improvement:
- Create a `1611A`-specific repair playbook using the fused mainframe reference and the A09 operator's guide, preserving the same triage structure but replacing all `1615A`-specific citations and procedures.

## 2026-08-20

Microprocessor probe cable assembly is available to understand if this can sort the error.

Probe did not make the difference. No clock led clearly lit.

Revised interpretation:
- This weakens the earlier assumption that the symptom was only caused by incomplete hookup hardware.
- With the full A13 probe/cable assembly now tried and `NO CLOCK` still clearly lit, the fault tree should be split into two branches:
- `target-side clock missing or invalid at the 6809`
- `A13/A09/mainframe clock-detect path not recognizing a valid E clock`

Manual evidence now most relevant:
- The A09 guide says `NO CLOCK` means no `E-clock` is present from the microprocessor under test, or the `E-clock` period is slower than about `12.5 usec`.
- The same guide also provides a front-panel `PROBE TEST` routine that verifies microprocessor-probe address, data, and control-line operation using synthetic signals from the analyzer.
- During the A09 indicator-lights test with A13 connected to the `PROBE TEST` socket, the `NO CLOCK`, `HALTED`, `WAITING FOR INTERRUPT`, and `SYNCING` lamps are expected to light in sequence.
- The mainframe repair reference says personality board `A9` both interfaces to the microprocessor under test and generates the front-panel `PROBE TEST` signals; it also states the `1 us CK` timing signal is the master clock for the probe-test generator on `A9`.

Most useful next decision point:
1. Run the A09 `PROBE TEST` routine exactly as documented.
2. If the normal probe-test display appears and the trace-related probe tests pass, then the analyzer, A09 board, and A13 cable are at least substantially alive.
3. If probe test fails, the problem is no longer best explained as only a missing target `E` clock; suspicion shifts toward the A13 probe, A11 panel socket/interconnect, A9 personality board, or shared mainframe timing/support logic.

Updated ranking of likely causes:
1. The target 6809 system still is not presenting a valid `E` clock at the pins the A13 actually sees.
2. Probe orientation, contact quality, or grounding at the target CPU is still bad even with the complete cable assembly.
3. The A09 probe-test generator or probe input path is faulty, so the analyzer is falsely reporting `NO CLOCK`.
4. A shared timing/support fault in the 1611A mainframe is impairing A09 clock recognition or probe-test generation.

Bench checks to do next, in order:
1. Perform the documented A09 front-panel `PROBE TEST` and record whether the expected lamp sequence and trace display occur.
2. If probe test passes, measure or scope the target 6809 `E` pin directly at the CPU and then at the corresponding A13 connection point.
3. Verify whether the CPU under test is a `6809` or `6809E`; if it is a `6809E`, confirm the external clock source chain first.
4. Inspect A13 socket/clip contact condition, orientation, and ground continuity under load, not just visually.
5. If probe test fails, move inward from `A13` to `A11` and `A9`, using the mainframe service text and any available service-sheet access to the `A9` probe-test and clock signals.

Current working conclusion:
- As of `2026-08-20`, the symptom is no longer best treated as a pure setup misunderstanding.
- The best next proof step is the built-in A09 `PROBE TEST`, because it cleanly separates `bad target clock` from `instrument/module/probe path fault`.

## 2026-08-20 - Missing A13 target cable documented

Observation:
- The cable from the `A13` probe body to the target system's `40-pin` CPU socket is missing.

Effect on diagnosis:
- A `6809` inserted into the `A13` `ZIF` socket cannot be tested in its intended live-system mode until this cable is found or reproduced.
- This means earlier `NO CLOCK` results obtained with only the CPU in the probe area must not be treated as valid proof of a bad `6809` or bad target clock.

Original HP accessory candidates:
1. `01611-61610` - `40-pin` male plug with `12 in.` cable.
2. `01611-61612` - `40-pin` male plug with `3 in.` cable.
3. `01611-61609` - alternate `40-pin` dual in-line clip with `12 in.` cable.

Working decision:
1. Keep watch for an original HP cable or complete accessory lot.
2. In parallel, build a passive `1:1` replacement cable so live `6809` testing can resume.

Repo reference:
- Replacement/finding plan documented in `repairs/a13-target-cable-plan.md`.
- Bench-confirmed `A13` probe part number from the user's hardware: `01611-62116`.

Current status:
- Live `6809` diagnosis through the `A13` `ZIF` path is paused until the missing target cable is either found or fabricated.
- Revisit target-clock and live-capture diagnostics only after available cable parts are inventoried and a usable cable assembly is ready.

Additional bench inventory note:
- Found `01611-62101` External 8-bit Probe (`A12`).
- Photo recorded at [images/01611-62101.jpg](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/images/01611-62101.jpg).
