# HP 1611A A1 Main Board Card-to-Card Connection Table

This is a practical summary of the `A1` main board backplane interconnects from HP `1611A` Figure `8-7`, Service Sheet `1` (Sheets `1` to `3` of `4`).

It is organized by card pair instead of raw backplane pin order.

## Cards

- `XA5`: Microprocessor board
- `XA6`: RAM and display board
- `XA7`: Comparator board
- `XA8`: Data store and counters board
- `XA9P1`: Personality board
- `XA10P1`: ROM board
- `A1P1`: Keyboard cable connector
- `A1P2`: Personality-panel switch connector

## Reading Notes

- Signal names are preserved from the manual.
- Pin references are slot connector pins, for example `A5P1-78`.
- Shared backplane nets appear once per pair summary even if they are multi-drop.
- Routine power and ground rails are mostly omitted from the pair table unless they help identify a direct relationship.

## Pairwise Connection Summary

| From | To | Signal family / purpose | Connector details |
| --- | --- | --- | --- |
| `XA5` | `XA6` | Shared address bus | `A0-A13`: `A5P1-78..91` to `A6P1-78..91` |
| `XA5` | `XA6` | Shared data bus | `D0-D7`: `A5P1-68..75` to `A6P1-68..75` |
| `XA5` | `XA6` | Machine-state bus | `M0-M7`: `A5P1-60..67` to `A6P1-60..67` |
| `XA5` | `XA6` | Read/write timing | `HWRT`: `A5P1-77` to `A6P1-77`, `LREAD`: present on `A5P1-76` and forwarded to `XA7/XA8` rather than `XA6` |
| `XA5` | `XA6` | Local control / housekeeping | `HmPCY`: `A5P1-42` to `A6P1-42`, `LLSRE`: `A5P1-50` to `A6P1-50` |
| `XA5` | `XA6` | Clocking | `200 ns CK`: `A5P1-56` to `A6P1-56`; `2 Hz CK` originates at `A6P1-59` and is distributed onward |
| `XA5` | `XA7` | Shared address bus | `A0-A4`, `A7`, `A9-A13`: `A5P1-78..82`, `85`, `87..91` to `A7P1-78..82`, `85`, `87..91` |
| `XA5` | `XA7` | Shared data bus | `D0-D7`: `A5P1-68..75` to `A7P1-68..75` |
| `XA5` | `XA7` | Machine-state bus | `M0-M7`: `A5P1-60..67` to `A7P1-58`, `A5P1-60`, and `A5P1-61..67` via backplane nets; practical shared state/timing bus |
| `XA5` | `XA7` | Read/write and trigger-related control | `LREAD`: `A5P1-76` to `A7P1-76`; `HWRT`: `A5P1-77` to `A7P1-77` |
| `XA5` | `XA8` | Shared address bus | `A0-A4`, `A7`, `A9-A13`: `A5P1-78..82`, `87..91` to `A8P1-78..82`, `87..91` |
| `XA5` | `XA8` | Shared data bus | `D0-D7`: `A5P1-68..75` to `A8P1-68..75` |
| `XA5` | `XA8` | Machine-state bus | `M0-M7`: `A5P1-60..67` shared with `A8P1-60..67` |
| `XA5` | `XA8` | Read/write control | `LREAD`: `A5P1-76` to `A8P1-76`; `HWRT`: `A5P1-77` to `A8P1-77` |
| `XA5` | `XA9P1` | Timing / machine-state distribution | `200 ns CK` path feeds `A7/A9`; `1 ms CK`: `A5P1-58` to `A9P1-58` via backplane; no broad direct address/data bus from `XA5` to `XA9P1` |
| `XA5` | `XA10P1` | Shared address bus | `A0-A13` subsets at `A5P1-78..91` connect to `A10P1-78..91`, except lines omitted in manual where not present on that slot |
| `XA5` | `XA10P1` | Machine-state bus | `M0-M7`: `A5P1-60..67` shared with `A10P1-60..67` |
| `XA6` | `XA7` | Shared address bus | `A0-A4`, `A7`, `A9-A13`: `A6P1-78..82`, `87..91` to `A7P1-78..82`, `87..91` |
| `XA6` | `XA7` | Shared data bus | `D0-D7`: `A6P1-68..75` to `A7P1-68..75` |
| `XA6` | `XA7` | Control | `HWRT`: `A6P1-77` to `A7P1-77`; `A13`: `A6P1-91` to `A7P1-91` |
| `XA6` | `XA8` | Shared address bus | `A0-A4`, `A7`, `A9-A13`: `A6P1-78..82`, `87..91` to `A8P1-78..82`, `87..91` |
| `XA6` | `XA8` | Shared data bus | `D0-D7`: `A6P1-68..75` to `A8P1-68..75` |
| `XA6` | `XA8` | Control / timing | `HWRT`: `A6P1-77` to `A8P1-77`; `2 Hz CK`: `A6P1-59` to `A9P1-59` through shared backplane distribution |
| `XA6` | `XA10P1` | Shared address bus | `A0-A13` subset: `A6P1-78..91` to `A10P1-78..91` where populated |
| `XA6` | `XA10P1` | Machine-state bus | `M0-M7`: `A6P1-60..67` shared with `A10P1-60..67` |
| `XA7` | `XA8` | Personality input bus | `INP D0-D7`: `A9P1-11..18` are presented to both `A7P1-11..18` and `A8P1-11..18`; `INP A0-A15`: `A9P1-23..38` presented to both `A7P1-23..38` and `A8P1-23..38` |
| `XA7` | `XA8` | Shared address/data/control observation bus | `D0-D7`, major address lines, `LREAD`, `HWRT`, and `A13` are common across both boards through A1 |
| `XA7` | `XA8` | Dedicated control cross-links | `LDLYL`: `A7P1-92` to `A8P1-92`; `HDSBL`: `A7P1-93` to `A8P1-93`; `HTRG`: `A7P1-94` to `A8P1-94`; `HARM`: `A7P1-95` to `A8P1-95`; `HRMC`: `A7P1-45` to `A8P1-45`/option-dependent net; `HENB/HDSB/LRST/NCNT`: `A7P1-51..55` to `A8P1-54..55` and option nets as noted in manual |
| `XA7` | `XA9P1` | Personality input bus source | `INP D0-D7`: `A9P1-11..18` to `A7P1-11..18`; `INP A0-A15`: `A9P1-23..38` to `A7P1-23..38` |
| `XA7` | `XA9P1` | Control cross-links | `PEXCK`: `A9P1-47` to `A10P1-47` rather than to `XA7`; `NCP`: `A9P1-50` to `A7P1-50`; option net at `A9P1-45` ties into `A7P1-45`/`A8P1-45` area |
| `XA8` | `XA9P1` | Personality input bus source | `INP D0-D7`: `A9P1-11..18` to `A8P1-11..18`; `INP A0-A15`: `A9P1-23..38` to `A8P1-23..38` |
| `XA8` | `XA9P1` | Flag and control lines | `FLAG0`: `A9P1-19` to `A8P1-19`; `FLAG1`: `A9P1-20` to `A8P1-20`; `FLAG2`: `A9P1-21` to `A8P1-21`; `FLAG3`: `A9P1-22` to `A8P1-22`; `LDSTOR`: `A8P1-46` to `A9P1-46`; `NSTOR`: `A9P1-49` to `A8P1-49`; `LDLYL`: `A7P1-92` also reaches `A9P1-92` through `A8P1-92` |
| `XA8` | `XA10P1` | External probe / ROM-side lines | `EXT0-EXT7`: `A10P1-3..10` to `A8P1-3..10`; `PEXCK`: `A9P1-47` to `A10P1-47`; shared address and machine-state buses also land on both cards |
| `XA9P1` | `XA10P1` | Control | `PEXCK`: `A9P1-47` to `A10P1-47` |
| `A1P1` | `XA5` | Keyboard matrix | `KS0-KS7`, `SCAN A-D`, and keyboard ground returns land on `A5P1-3..10` and `A5P1-13..16` |
| `A1P2` | `XA5` | Personality-panel switches | `SW0-SW7` land on `A5P1-17..24` |
| `XA6` | `XA3` | Display-driver video/sync | `HVSY`: `A6P1-94` to `A3P1-A`; `HHSY`: `A6P1-95` to `A3P1-L`; `VIDEO`: `A6P1-96` to `A3P1-S` |

## High-Value Bus Groups

These are the most important shared contact groups if you are repurposing the backplane:

| Bus group | Members |
| --- | --- |
| CPU data bus | `XA5`, `XA6`, `XA7`, `XA8` on `D0-D7` (`P1-68..75`) |
| CPU address bus | `XA5`, `XA6`, `XA7`, `XA8`, `XA10P1` on major `A0-A13` lines (`P1-78..91`, with some board-specific omissions) |
| Machine-state bus | `XA5`, `XA6`, `XA8`, `XA10P1` on `M0-M7` (`P1-60..67`); `XA7` also taps timing/state nets including `1 ms CK` |
| Personality input bus | `XA9P1` feeds `XA7` and `XA8` on `INP D0-D7` and `INP A0-A15` |
| External input bus | `XA10P1` feeds `XA7` and `XA8` on `EXT0-EXT7` |
| Keyboard / switch scan | `A1P1` and `A1P2` terminate at `XA5` |

## Source

- Manual transcription: `docs-classified/service-manual/01611-90909.md`
- Relevant span: lines `15688` to `17140`
