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
