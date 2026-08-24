# Keyboard Work Split

This folder separates the keyboard work into two feature sets:

- [hp-native](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native): original HP `A4` keyboard scan/sense replacement work
- [external-ps2](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/external-ps2): external `PS/2` keyboard feature layered on top of the native replacement design

Use the native folder when the goal is to preserve the original HP keyboard electrical path.
Key native files include:

- [Native BOM](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native/xa5-keyboard-replacement-wirewrap-bom.md)
- [Native vector sketch](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native/xa5-keyboard-replacement-vector-card-sketch.md)
- [Native netlist plan](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/keyboard/hp-native/xa5-keyboard-replacement-wirewrap-netlist-plan.md)

Use the `PS/2` folder when the goal is to accept an external keyboard while keeping the instrument-side design in a simple native-style environment.

## Power Entry Protection Note

For multi-board vector-card arrangements, use one resettable fuse per board.

Recommended board-level power entry:

```text
BACKPLANE +5V
   |
   +----> [PPTC RESETTABLE FUSE] ----> [SCHOTTKY / REVERSE-PROTECTION STAGE] ----> +5V_LOCAL
                                                                                      |
                                                                                      +--> [47 uF bulk cap]
                                                                                      |
                                                                                      +--> [10 uF local bulk cap]
                                                                                      |
                                                                                      +--> [0.1 uF at each IC]
                                                                                      |
                                                                                      +--> board logic / CPU / RAM / I/O

BACKPLANE GND ---------------------------------------------------------------> GND_LOCAL
                                                                                |
                                                                                +--> all local grounds
                                                                                +--> all decoupling returns
```

Multi-board view:

```text
backplane +5V
  |-> board A fuse -> board A
  |-> board B fuse -> board B
  |-> board C fuse -> board C

backplane GND
  |-> board A ground
  |-> board B ground
  |-> board C ground
```

Rules:

- one fuse per board
- do not fuse ground
- place the fuse close to the board connector
- place the bulk capacitor close to board entry
- place `0.1 uF` decoupling caps close to each IC

Starting fuse suggestions:

- small logic board: `0.5 A`
- CPU board with about `18` support ICs: `0.75 A`
- heavier board: `1.1 A`
