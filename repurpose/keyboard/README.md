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
