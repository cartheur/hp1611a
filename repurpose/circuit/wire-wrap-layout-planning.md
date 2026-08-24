# Wire-Wrap Layout Planning Notes

This note captures practical layout guidance for wire-wrap and hybrid vector-board builds used in the repurpose work.

## Core Principle

Do not try to treat all passive parts as if they should be wire-wrapped like interconnect wiring.

Use:

- wire-wrap posts and sockets for board interconnect
- short soldered passive connections for local analog, timing, and decoupling networks

Short version:

- wrap for connectivity
- solder for passives

## Why This Matters

Wire-wrap posts, long leads, and long runs add parasitic capacitance and inductance.

That is usually acceptable for:

- ordinary TTL interconnect
- pull-ups and pull-downs
- row-scan logic
- debug and control signals

That is more sensitive for:

- crystal oscillator nodes
- comparator input networks
- very short pulse shaping
- fast edges in noisy areas

So the design rule is:

- use posts freely for normal digital routing
- minimize post count and lead length on sensitive analog and timing nodes

## Board-Level Power Entry Pattern

For each vector board, use one local protection chain at the power entry point.

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

Rules:

- one fuse per board
- do not fuse ground
- place the fuse close to the board connector
- place bulk capacitors near power entry
- place `0.1 uF` decouplers close to each IC

## Example Hybrid Layout

```text
Top view, simplified

   Board edge / power entry
   ------------------------------------------------------

   +5V in -> PPTC -> 1N5819 -> +5V_LOCAL rail
                      |
                      +-- 47uF -- GND rail
                      +-- 10uF -- GND rail

   ------------------------------------------------------

   [LM339AN socket]              [74LS14 socket]

   decouple here                 decouple here
   VCC o--0.1uF--o GND           VCC o--0.1uF--o GND

   KS input posts -> resistor -> clamp diodes -> LM339 input
                                         |
                                   short local wiring

   LM339 outputs -> short posts -> 74LS14 inputs

   ------------------------------------------------------

                 [ATmega328P wire-wrap socket]

         VCC o--0.1uF--o GND
        AVCC o--0.1uF--o GND

         XTAL1 o---- crystal ----o XTAL2
                  |            |
                22pF         22pF
                  |            |
                 GND          GND

   UART / ISP headers near MCU edge

   ------------------------------------------------------
```

## Sensitive Node Guidance

### Decoupling

- mount each `0.1 uF` decoupler directly across the local IC `VCC` and `GND` posts
- keep leads short
- do not route decouplers through unnecessary extra posts

### Crystal Network

- mount the crystal right beside the AVR socket
- solder the `22 pF` capacitors directly from `XTAL1` and `XTAL2` to the nearest ground point
- avoid routing the crystal nodes through multiple posts
- keep the oscillator loop compact

This is one of the areas where parasitics matter most.

### Comparator Front End

- place `KS` input resistors and clamp diodes close to the `LM339AN`
- keep analog input runs short
- avoid letting comparator input wiring wander across the board

### Normal Digital Nets

- a small amount of extra post capacitance is usually acceptable
- one or two extra posts on ordinary TTL nets are not a major concern

## Practical Placement Rules

- digital logic can be mostly wire-wrapped
- passives should usually be soldered between nearby posts or socket pins
- analog front ends deserve tighter placement than ordinary logic
- oscillator parts deserve the shortest and cleanest layout on the board
- local power distribution should be deliberate rather than improvised

## Recommended Construction Style

For this project family, a hybrid approach is preferred:

- DIP wire-wrap sockets for ICs
- wire-wrap wire for logic and power interconnect
- soldered passives for decoupling, timing, and analog conditioning

This gives the flexibility of wire-wrap while keeping the most parasitic-sensitive parts under control.
