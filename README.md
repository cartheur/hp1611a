# hp1611a

Repository for research and development with the hp 1611A Logic State Analyzer

![unit](/images/2.jpg)

## Accessory Part Numbers

- `01611-62101`: External 8-bit Probe (`A12`)
- `01611-61609`: 40-pin dual in-line clip with 12-inch cable
- `01611-61610`: 40-pin male plug with 12-inch cable
- `01611-61612`: 40-pin male plug with 3-inch cable
- `1200-0682`: 40-pin protection socket

Bench inventory update:

- `01611-62101` External 8-bit Probe has been found and photographed: [01611-62101.jpg](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/images/01611-62101.jpg)

For the `6809` setup specifically:

- `01611-62116`: 6809 microprocessor probe (`A13`) for Option `A09`, bench-confirmed from the user's hardware
- `A13`: A09 Microprocessor Probe assembly name used by the `10266A` Option `A09` documentation

## Manuals

Markdown versions of the PDFs in `docs/` live in `docs-classified/`.

- [docs-classified/mainframe/README.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/mainframe/README.md:1): Mainframe manual overview, including which manual is primary and how the two differ.
- [docs-classified/mainframe/1611a-mainframe-composed-repair-reference.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/mainframe/1611a-mainframe-composed-repair-reference.md:1): Source-of-truth mainframe repair reference for a diagnostics and repair specialist agent, fused section-by-section from the 1980 manual with preserved 1978 deltas.
- [docs-classified/service-manual/01611-90909.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/service-manual/01611-90909.md:1): Primary mainframe repair manual. Later `115` page revision printed `July 1980`.
- [docs-classified/operating-and-service-manual/01611-90905.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/operating-and-service-manual/01611-90905.md:1): Companion mainframe manual. Earlier `106` page combined manual printed `April 1978`.
- [docs-classified/operators-guide/10266-90902.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/operators-guide/10266-90902.md:1): Option A09 operator's guide for the 10266A personality module used with 6809 repair sessions.
- [docs-classified/field-training-manual/5922-2029.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/field-training-manual/5922-2029.md:1): Use for training context and examples. OCR is noisier.
- [docs-classified/mainframe/figures/README.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/mainframe/figures/README.md:1): Rendered figure and service-sheet pages for both mainframe manuals.
- [docs-classified/operators-guide/figures/README.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/operators-guide/figures/README.md:1): Rendered figure pages from the A09 operator's guide.
- [docs-classified/field-training-manual/figures/README.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/docs-classified/field-training-manual/figures/README.md:1): Rendered figure pages from the field training manual.
- [repairs/a13-target-cable-plan.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repairs/a13-target-cable-plan.md:1): Plan for finding or reproducing the missing A13-to-target 40-pin cable needed for live 6809 testing.

### Mainframe Difference Note

- The `115` page `01611-90909` service manual is the primary repair source.
- The `106` page `01611-90905` operating-and-service manual is not a duplicate; it remains useful as a companion reference.
- They share the same broad section structure, but the later manual has newer serial coverage and revised service content.

Status achieved.

Unit needs attention to the slide-out information sheet, as the tab is broken off. It should look like this:

![image](/images/hp_1611a_opt09.jpg)

### The reals

Given we have a clock failure scenario, I have (finally) the one.

![1611a-a09](/images/1611A-6809.jpg)
