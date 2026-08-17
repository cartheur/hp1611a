# HP 1611A Mainframe Composed Repair Reference

- Primary source: `docs-classified/service-manual/01611-90909.md`
- Companion source: `docs-classified/operating-and-service-manual/01611-90905.md`
- Scope: mainframe diagnostics, adjustments, troubleshooting, repair, service-sheet interpretation, and serial-sensitive cross-checks

## Source Of Truth Rules

- Treat the `July 1980` service manual as the canonical mainframe text.
- Treat the `April 1978` operating-and-service manual as a companion source for earlier serial coverage, older wording, and alternate figure/service-sheet views.
- Do not assume the two manuals are duplicates. The later manual revises serial coverage and service content, while the earlier manual still preserves valid repair context.
- When a section-specific delta is called out below, preserve it exactly. Those notes are the reason this fused file exists.

## Critical Fusion Notes

- `01611-90909` applies directly to serial prefix `2017A`, with manual changes back through `2007A` to `1635A`.
- `01611-90905` applies directly to serial prefix `1723A`, with manual changes back to `1635A`.
- `Section III` and `Section IV` are personality-module dependent in both manuals. For real operating and performance-test procedures, use the installed personality-module guide such as `docs-classified/operators-guide/10266-90902.md`.
- `Section VII` in the `1980` manual is the authoritative manual-change map for later service work. It explicitly carries changes for `1635A`, `1723A`, `2007A`, and `2017A`.
- Mainframe figure sets live in:
  - `docs-classified/mainframe/figures/service-manual-1980/`
  - `docs-classified/mainframe/figures/operating-and-service-manual-1978/`

## Section I Fusion Notes

- Canonical text below is from the `1980` service manual.
- The `1978` companion manual carries the same broad technical description, but is useful when working with direct `1723A` coverage or when cross-checking earlier outline/formatting details.

## Section I Canonical Text

## Page 7

SECTION I
GENERAL INFORMATION

1-1.

INTRODUCTION.

manual pages. The microfiche package also includes the
latest Manual Changes supplement.

1-2. This Operating and Service Manual contains
information required to install, operate, test, adjust,
and service the Hewlett-Packard Model 1611A Logic
State Analyzer.

1-3. In addition to this manual, an Operating and
Service Supplement for each microprocessor personality
module option or accessory ordered with the instrument
is also provided.

1-4. Listed on the title page of this manual is a micro¬
fiche part number. This number can be used to order 4- x
6-inch microfilm transparencies of the manual. Each
microfiche contains up to 96 photo-duplicates of the

1-5. SPECIFICATIONS. Complete instrument per¬
formance specifications are listed in the personality
module Operating and Service Supplement for each
microprocessor option and accessory ordered with the
instrument. These specifications are the performance
standards or limits against which the instrument is
tested. Detailed performance tests are also included
in the personality module Operating and Service
Supplement.
1-6. Table 1-1 lists supplemental characteristics of
the 1611A which are not performance specifications
but are typical characteristics included as additional
information to the user.

Table 1-1. Supplemental Characteristics
CONNECTION BETWEEN pP and 1611A INPUT BUF¬
FERS: one 40 pin dual in-line package connector
with 30.5 cm (12 in.) cable, one 40 pin male socket
with 30.5 cm (12 in.) cable, or one 40 pin male
socket with 7.6 cm (3 in.) cable.
MEMORY DEPTH: 64 memory transactions; 16 lines
are displayed at one time, roll keys permit view¬
ing all 64 transactions.
TIME INTERVAL: accuracy, 0.1% ±1 ps. Maximum
time, 224—1 ps (16.7 seconds).
EVENTS COUNT: 224—1 events (16.7 million) max.
LOGIC PROBE OUTPUT POWER: 5 V dc at 0.1 A
max.
POWER: 100, 120, 220, 240 V ac; —10% +5%; 48 to
440 Hz; 120 VA max.
DIMENSIONS: see outline drawings.
OPERATING ENVIRONMENT
Temperature: 0°C to 55°C.
Humidity: up to 95% relative humidity at 40°C.
Altitude: to 4600 m (15 000 ft).
NOTES: 1. DIMENSIONS ARE FOB GENERAL INFORMATION ONLY. IF
DIMENSIONS ARE REQUIRED FOR BUILDING SPECIAL ENCLOSURES,
CONTACT YOUR HP FIELD ENGINEER.
2. DIMENSIONS ARE IN MILLMETRES AND (INCHES).

Vibration: vibrated in three planes for 15 min. each
with 0.38 mm (0.015 in.) excursions, 10 to 55 Hz.
WEIGHT: net, 15 kg (33 lb); shipping, 19.5 kg
(43 lb).

Model 1611A

## Page 8


General Information

1-7. INSTRUMENTS COVERED BY MAN¬
UAL.
1-8. Attached to the instrument is a serial number
plate. The serial number is in the form: 0000A00000.
It is in two parts; the first four digits and the letter
are the serial prefix and the last five digits are the
suffix. The prefix is the same for all identical instru¬
ments; it changes only when a change is made to the
instrument. The suffix however, is assigned sequen¬
tially and is different for each instrument. The contents
of this manual apply to instruments with the serial
number prefix(es) listed under SERIAL NUMBERS
on the title page.
1-9. An instrument manufactured after the printing of
this manual may have a serial number prefix that is
not listed on the title page. This unlisted serial number
prefix indicates the instrument is different from those
described in this manual. The manual for this newer
instrument is accompanied by a yellow Manual
Changes supplement. This supplement contains
"change information" that explains how to adapt the
manual to the newer instrument.
1-10. In addition to change information, the changes
supplement may contain information for correcting
errors in the manual. To keep this manual as current
and accurate as possible, Hewlett-Packard recom¬
mends that you periodically request the latest Manual
Changes supplement. The supplement for this manual
is identified with the manual print date and part
number, both of which appear on the manual title page.
Complimentary copies of the supplement are avail¬
able from Hewlett-Packard.
1-11. For information concerning a serial number
prefix that is not listed on the title page or in the
Manual Changes supplement, contact your nearest
Hewlett-Packard office.

1-12.

DESCRIPTION.

1-13. The HP 1611A Logic State Analyzer is dedi¬
cated to the design and troubleshooting of micropro¬
cessor based systems. For ease-of-use, a special probe
offers two methods of connection to microprocessors
—a dual in-line clip and a connector plug for interfac¬
ing with microprocessors in sockets. Measurements of
system activity are displayed on the analyzer's CRT
screen in selectable mnemonic or absolute codes of the
microprocessor's own instruction set. The display is
divided into three distinct fields—address, data, and
external. Events and activity displayed in the address
and op code/data fields are collected directly from the
system microprocessor's address and data buses. An
additional eight bits of binary information gathered
by auxiliary probes is displayed in the external field.
1-14. With relational triggering capabilities, the
1611A permits framing of a real-time data window
around virtually any event or set of related events—

1-2

any desired sequence of system operations. The 1611A
will also measure execution time or count selected
events between two keyboard selected events. At a
desired point, defined from a keyboard entry, the
1611A can be commanded to halt microprocessor oper¬
ation; then, if desired, it can control the following
transactions in single or multiple keyed steps. Key¬
board entry of address or data bus trigger words may
be entered in either octal or hexadecimal notation and
the external trigger information is entered in binary
format.
1-15. For increased confidence of instrument opera¬
tion, it performs a self-test during the turn-on period
and indicates test results on the CRT. The micropro¬
cessor probe data-gathering circuits may also be
checked by connecting the probe to the front panel
probe test socket with the test results displayed on
the CRT.

1-16.

OPTIONS.

1-17. The following options for the 1611A are avail¬
able to configure the instrument for specific micro¬
processors and are covered by separate Manual Supple¬
ments.
Option A68: Model 1611A with Model 10257B Personali¬
ty Module for use with any microprocessor that meets
specifications of the Motorola 6800.
✓ Option A80: Model 1611A with Model 10258B Personali¬
ty Module for use with any microprocessor that meets
specifications of the Intel 8080A.
Option 0F8: Model 1611A with Model 10259A Personali¬
ty Module for use with any microprocessor that meets
specifications of the Fairchild F8.
j Option Z80: Model 1611A with Model 10260A Personali¬

ty Module for use with any microprocessor that meets
specifications of the Zilog Z80.
Option A65: Model 1611A with Model 10261A Personali¬
ty Module for use with any microprocessor that meets
specifications of the Rockwell R6502A.
Option A18: Model 1611A with Model 10262A Personal¬
ity Module for use with any microprocessor that meets
specifications of the RCA 1802.
v Option A85: Model 1611A with Model 10263A Personal¬
ity Module for use with any microprocessor that meets
specifications of the Intel 8085.

1-18.

ACCESSORIES SUPPLIED.

1-19. The following accessories are supplied with the
1611A:
External 8-bit Probe, HP Part No. 01611-62101 ✓

General Information

## Page 9


Model 1611A

Model 10260A Personality Module (Z80)<^
Model 10261A Personality Module (6502)
Model 10262A Personality Module (1802)
Model 10263A Personality Module (8085)*''

One Extender Board, HP Part No. 01611-66515
One 2.3 m (7.5 ft) Power Cord (refer to Section II)
One Accessory Bag, HP Part No. 1540-0325
One Keyboard Cover, HP Part No. 5040-0588

1-20.

ACCESSORIES AVAILABLE.
1-22.

RECOMMENDED TEST EQUIPMENT.

1-21. The following accessories are available for the
1611 A:
Model 10257B Personality Module (6800)
Model 10258B Personality Module (8080)“''
Model 10259A Personality Module (F8)

1-23. Equipment required to maintain the Model
1611A is listed in table 1-2. Other equipment may be
substituted if it meets or exceeds the critical specifi¬
cations listed in the table.

Table 1-2. Recommended Test Equipment

Instrument

Critical Specification

Recommended
Model

Use*

Pulse Generators (2)

10 V output into 50 ohms,
External trigger, 0 to
+2.5 V DC offset, 0 to
1.4ps adjustable delay

HP 8013B

P

Digital Voltmeter

±1000 Vdc range, 0.1%
accuracy

HP 3465A

P, A, T

Dual Channel
Oscilloscope

50 MHz BW min

HP 1740A

P, T

Logic State Analyzer

Pattern recognition and state
display

HP 1600A

T

Logic Pulser

Pulse logic circuits

HP 10526T

T

Logic Probe

Monitor digital IC's

HP 10525T

T

500 Feedthroughs (2)

50D feedthrough termination

HP 10100C

P

BNC-to-alligator
Clip Adapters (3)

HP Part No.
8120-1292

P

BNC Tee Connectors
(2)

HP Part No.
1250-0781

P

Current Tracer

HP 547A

T

HP 5004A

T

Signature Analyzer

No Substitute

*P=Performance Test; A=Adjustment, T=Troubleshooting

l-3/(l-4 blank)

Installation

## Page 10


Model 1611A


## Section II Fusion Notes

- Canonical text below is from the `1980` service manual.
- The `1978` companion section is materially similar. Keep it only as a figure/layout cross-check for early units.

## Section II Canonical Text

## Page 10

SECTION II
INSTALLATION

2-1.

INTRODUCTION.

2-2. This section contains information and instruc¬
tions for installing the Model 1611A. Included are
initial inspection procedures, power and grounding
requirements, and instructions for repacking for ship¬
ment.

2-3.

INITIAL INSPECTION.

2-4. Inspect the shipping container for damage. If
the shipping container or cushioning material is dam¬
aged, it should be kept until contents of the shipment
have been checked for completeness and the instru¬
ment has been checked mechanically and electrically.
Procedures for checking electrical performance are
given in Section IV. If the contents are incomplete,
if there is mechanical damage or defect, or if the
instrument does not pass the Performance Tests, notify
the nearest Hewlett-Packard office. If the shipping
container is damaged, or the cushioning material
shows signs of stress, notify the carrier as well as
the Hewlett-Packard office. Keep the shipping materi¬
als for earner's inspection. The HP office will arrange
for repair or replacement at HP option without wait¬
ing for claim settlement.

2-5.

c. For 220- or 240-volt operation, set LINE SE¬
LECTOR switches to 220 V or 240 V respectively.
d.

2-8. POWER CABLE. This instrument is equipped with
a three-wire power cable. When connected to an appro¬
priate ac power receptacle, this cable grounds the
instrument cabinet. The type of power cable plug ship¬
ped with each instrument depends on the country of
destination. Refer to figure 2-1 for the part numbers of
the power cable and plug configurations available.

8120-1692

8120-2956

8120-0696

•

9

•

8120-2296

8120-1521

8120-1703

A Ml w
Figure 2-1. Power Cables Available

PREPARATION FOR USE.

2-6. POWER REQUIREMENTS. The 1611A requires a
power source of 100, 120, 220, or 240 Vac, —10%,
+5%; single-phase; 48 to 440 Hz; 120 VA maximum.

I CAUTION |
The instrument may be damaged if the
LINE SELECTOR switch setting does not
match the input power source.
2-7. LINE VOLTAGE SELECTION. The LINE SELEC¬
TOR switches on the rear panel select either 100-,
120-, 220-, or 240-volt operation. To check or change
positions of the LINE SELECTOR switches, proceed as
follows:

Reconnect power cord.

2-9. PROBE INSTALLATION. To install the Micropro¬
cessor Probe and External Probe, proceed as follows:

a.

Ensure that LINE switch is in OFF position.

b. Connect Microprocessor Probe ribbon cable to
Microprocessor Probe connector on 1611A rear panel
(see figure 2-2). Ensure that cable socket is fully
seated on board edge connector. Red stripe on cable
indicates top edge.

Remove input power cord (if connected).

c. Connect External Probe to External Probe
connector on rear panel in same manner as for
Microprocessor Probe.

b. For 100- or 120-volt operation, set LINE SE¬
LECTOR switches to 100 V or 120 V respectively.

d. Secure probe connectors to rear panel with
screws provided.

a.

2-1

Model 1611A

## Page 11


Installation

RETAINING
SCREWS

EXTERNAL
PROBE CONNECTOR

2-10. PERSONALITY MODULE INSTALLATION. To
install a Personality Module in the instrument, refer
to installation procedures in the manual supplement
supplied with the Personality Module.

2-11.

REPACKING FOR SHIPMENT.

2-12. If the instrument is to be shipped to a HewlettPackard Sales/Service Office for service or repair,
attach a tag showing owner (with address), complete
instrument serial number, and a description of the
service required.
MICROPROCESSOR
PROBE CONNECTOR

Figure 2-2. Rear-panel Probe Connectors

2-2

2-13. Use the original shipping carton and packing
material. If the original packing material is not avail¬
able, the Hewlett-Packard Sales/Service Office will
provide information and recommendations on materi¬
als to be used.

Operation

## Page 12


Model 1611A


## Section III Fusion Notes

- Both manuals intentionally defer detailed operation to the installed personality-module supplement.
- For 6809 repair sessions, the relevant operator text lives in `docs-classified/operators-guide/10266-90902.md`.

## Section III Canonical Text

## Page 12

SECTION III
OPERATION
Detailed operating information is provided in the
Operating and Service Manual Supplement that is sup¬
plied with each Personality Module.

3-1/(3-2 blank)

Performance Tests

## Page 13

Adjustments

Model 1611A


## Section IV Fusion Notes

- Both manuals intentionally defer complete performance tests to the installed personality-module supplement.
- Use the module-specific guide rather than trying to infer full measurement behavior from the bare mainframe manual.

## Section IV Canonical Text

## Page 13

SECTION IV
PERFORMANCE TESTS

Detailed performance tests for the 1611A are
dependent upon the personality module installed in
the instrument. Therefore, complete performance tests
for the 1611A are provided in the appropriate Person¬

ality Module Supplement provided with each 1611A
Option and accessory. 1611A Options and Personality
Module accessories are listed in Section I of this man¬
ual.


## Section V Fusion Notes

- Canonical text below is from the `1980` service manual, but this section is serial-sensitive and must not be flattened.
- The `1978` companion manual records `+5.1 Vdc ±0.025 Vdc` for the power-supply adjustment, while the `1980` manual records `+5.0 Vdc ±0.025 Vdc`.
- The `1978` companion manual uses `A7C4` for the clock-width adjustment in the comparator procedure.
- The `1980` manual states `A7R12`, with an explicit note that `1723A` instruments use `A7C4` instead.
- The `1980` `Section VII` manual-change logic further modifies this area:
  - `1723A` units receive changes `5` through `3`
  - `2007A` units receive changes `5` and `4`
  - `2017A` units receive change `5`
- Because of that, always read `Section V` together with `Section VII` before touching comparator or timing adjustments on a specific unit.

## Section V Canonical Text

## Page 13

SECTION V
ADJUSTMENTS
5-1.

5-7. +5 VOLT POWER SUPPLY ADJUSTMENT. (See figure 5-1 and service sheet 2.)

INTRODUCTION.

5-2. This section contains a complete adjustment
procedure for the 1611A. Power supply and display
adjustments may be made separately following repairs
or in sequence during periodic calibration.

a. Disconnect 1611A power cord.
b. Remove 1611A top cover.

c. Reconnect power cord and place LINE switch
in on position. LINE indicator lamp should light.

WARNING
Read the Safety Summary at the front of
this manual before performing adjustment procedures.

5-3.

d. Connect (+) input of DVM to A2TP14 and connect (-) input of DVM to A2TP6.
e. Adjust A2R6 until DVM indicates +5.0 Vdc
±0.025 Vdc.

EQUIPMENT REQUIRED.

5-4. A list of Recommended Test Equipment is listed
in Section I of this manual.

5-5.

ADJUSTMENT LOCATIONS.

5-6. Adjustments and test point locations are shown
in figures 5-1 and 5-3.
A2TP6
GND TEST POINT

5-8. COMPARATOR ADJUSTMENT. (See
figure 8-13, sheet 1 of 4, for part locations.)
a. Place LINE switch to off position and remove
power cord.
b. Remove 1611A top cover.

c. Connect microprocessor probe to front-panel
probe-test socket.
d. Connect dual-channel oscilloscope to test points
TP1 and TP2 on A7.

A2R6
+5V ADJUSTMENT

e. Adjust delay clock A7R10 for 200-ns delay
(±10 ns) between falling edges of signals at A7TP1 and
A7TP2 (figure 5-2).
NOTE
The signals at A7TP1 and A7TP2 will be
present for approximately 1 second in each
3 seconds.

A2TP14
+5V TEST POINT

Figure 5-1. Power Supply Assy A2, Adjustment Location

f. Adjust clock width A7R12 (A7C4 on instruments
with Serial Prefix 1723A) for 95 ±5 ns between falling
edge and rising edge of signal at A7TP2 (figure 5-2).
4-1/5-1

Model 1611A

## Page 14


Adjustments

NOTE

5-9. DISPLAY ALIGNMENT. (See figure 6-1
for parts locations.)

Some 1611A Options require additional adjustment of the Personality Board. Refer to
the Operating and Service Manual Supplement to determine if additional adjustment is required.

NOTE
Normally, it is not necessary to perform
this procedure unless the CRT has been
replaced.
a. Place LINE switch to off position and remove
power cord.
b. Remove 1611A top cover.

c. Remove screw that secures CRT post-accelerator lead holder (H39) to CRT shield (MP13).
d. Loosen four screws that hold CRT shield
(MP13).
Figure 5-2. Delay and Clock Width Adjustments

A3R60

A3R45

e.

Remove CRT shield MP13.

A3R14
HORIZONTAL

A3R40
VERTICAL

Figure 5-3. Display Assembly A3, Adjustment Locations

5-2

Adjustments

## Page 15


Model 1611A

f.

f.

Loosen clamp on yoke LI.

Turn contrast control A3R61 fully clockwise.

g. Reconnect power cord and place LINE switch
in on position.

NOTE

h. Rotate yoke LI so that horizontal lines on dis¬
play are parallel with top and bottom of display
window.

This control is a service aid only. For nor¬
mal operation, it should always be set
fully clockwise.

i. Set LINE switch to off position and remove
power cord.
j.

Tighten clamp on yoke LI.

g. Adjust intensity control A3R60 cw until re¬
trace lines can be seen, then reduce intensity control
until desired brightness is obtained.

CAUTION
CAUTION

Hand-tighten only. Over tightening will
damage the CRT.
k. Install CRT shield MP13 and PA lead holder
H39.

Excessive intensity will cause permanent
burning of CRT phosphor; however, this
will not degrade display performance.

5-10. DISPLAY ADJUSTMENT. (See figure
5.3 and service sheet 3.)

h. Adjust focus control A3R45 for best overall
focus of display.

a.

Remove 1611A top cover and left side cover.

i. Adjust horizontal size A3R6 and vertical size
A3R18 fully ccw.

b. Connect external probe and microprocessor
probe to their respective connectors on rear panel of
1611 A.
c.

Set front panel switches as follows:
FORMAT.
HEXADECIMAL
TEST MODE.
NORMAL
TRIGGER QUALIFIER
(Option 068 only) .
NORMAL

d. Connect
microprocessor probe
PROBE TEST socket on front panel.

cable

j. Adjust horizontal position A3R14 and vertical
position A3R40 to center display.
k. Adjust linearity control A3R23 so that char¬
acters in top and bottom lines of display are same
height.
l. Adjust horizontal size A3R6 and horizontal
position A3R14 for 20 mm (0.8 in.) margin on each
side of display.

to

e. Press TRACE; a list should be displayed on
CRT. If list is not displayed, set LINE switch to off,
then on, and press TRACE again.

m. Adjust vertical size A3R18 and vertical
position A3R40 for 5 mm (0.2 in.) margins at top and
bottom.
n.

Repeat step k.

5-3/(5-4 blank)

Replaceable Parts

## Page 16


Model 1611A


## Section VI Fusion Notes

- Use the `1980` replaceable-parts content as the primary source.
- For early-unit cross-checks, the `1978` companion parts list may still help identify earlier assemblies or component-locator relationships, but the later manual and its change set take precedence.

## Section VI Canonical Text

## Page 16

SECTION VI
REPLACEABLE PARTS LIST

6-1.

d. A typical manufacturer of the part in a fivedigit code.

INTRODUCTION.

6-2. This section contains information for ordering
parts. Table 6-1 lists abbreviations used in the parts
list and throughout the manual. Table 6-2 lists all
replaceable parts in reference designator order. Table
6-3 contains the names and addresses that correspond
to the manufacturer's code number.

e.

The total quantity for each part is given only once—at
the first appearance of the part number in the list.

6-7.

6-3.

ABBREVIATIONS.

6-4. Table 6-1 lists abbreviations used in the parts
list, the schematics and throughout the manual. In
some cases, two forms of the abbreviation are used,
one all in capital letters, and one partial or no capi¬
tals. This occurs because the abbreviations in the parts
list are always all capitals. However, in the schematics
and other parts of the manual, other abbreviation
forms are used with both lower case and upper case
letters.

6-5.

REPLACEABLE PARTS LIST.

6-6. Table 6-2 is the list of replaceable parts and is
organized as follows:
a. Electrical assemblies and their components in
alphanumerical order by reference designation.
b. Chassis-mounted parts
order by reference designation.
c.

in

alphanumerical

Miscellaneous parts.

The information given for each part consists of the
following:
a.

The Hewlett-Packard part number.

b.

The total quantity (Qty) in the instrument.

c.

The description of the part.

The manufacturers' number for the part.

ORDERING INFORMATION.

6-8. To order a part listed in the replaceable parts
table, quote the Hewlett-Packard part number, indi¬
cate the quantity required, and address the order to
the nearest Hewlett-Packard office.
6-9. To order a part that is not listed in the replace¬
able parts table, include the instrument model number,
instrument serial number, the description and function
of the part, and the number of parts required. Address
the order to the nearest Hewlett-Packard office.

6-10.

DIRECT MAIL ORDER SYSTEM.

6-11. Within the USA, Hewlett-Packard can supply
parts through a direct mail order system. Advantages
of using the system are as follows:
a. Direct ordering and shipment from the HP
Parts Center in Mountain View, California.
b. No maximum or minimum on any mail order
(there is a minimum order amount for parts ordered
through a local HP office when the orders require
billing and invoicing).
c. Prepaid transportation (there is a small handl¬
ing charge for each order).
d. No invoices—to provide these advantages, a
check or money order must accompany each order.
6-12. Mail-order forms and specific ordering informa¬
tion are available through your local HP office. Ad¬
dresses and phone numbers are located at the back
of the 1611A Service Manual.

6-1

Model 1611A

## Page 17


Replaceable Parts

Table 6-1. Reference Designators and Abbreviations
REFERENCE DESIGNATORS
A
B

= assembly
— motor

F

= fuse

MP

= mechanical part

FL

= filter

P

= integrated circuit
= jack

O

= plug
m transistor

R

= resistor

BT

- battery

1C

C

= capacitor

J

U
V

= integrated circuit
= vacuum, tube, neon

VR

= voltage regulator

bulb, photocell, etc.

CP

— coupler

K

= relay

RT

= thermistor

W

■ cable

CR

= diode

L

= inductor

S
T

= switch

X

= socket

= transformer

Y

— crystal

z

= tuned cavity,

= loud speaker

= delay line
= device signaling (lamp)

LS
M

= meter

TB

= terminal board

= misc electronic part

MK

— microphone

TP

= test point

= henries

N/O

= normally open

RMO

= rack mount only

AFC

= amperes
= automatic frequency control

H
HDW

= hardware

NOM

= nominal

RMS

= root-mean square

AMPL

= amplifier

HEX

= hexagonal

NPO

= negative positive zero

RWV

= reverse working

HG

= mercury

(zero temperature
coefficient)

DL
D5
E

network

ABBREVIATIONS
A

BFO

= beat frequency oscillator

HR

= hour(s)

HZ

= hertz

BE CU

= beryllium copper

BH

— binder head

BP

= bandpass

BRS

= brass

IF

= intermediate freq

BWO

= backward wave oscillator

IMPG

= impregnated

INCD

= incandescent

NPN

negative
NRFR

ccw

= counter-clockwise

INCL

= include(s)

= not recommended for
field replacement

NSR

= not separately
replaceable

S-B

= slow-blow

SCR

= screw

SE

= selenium

SECT

= section(s)

SEMICON

= semiconductor

SI
SIL

= silicon
— silver

CER

= ceramic

INS

= insulation(ed)

OBD

= order by description

SL

— slide

CMO

= cabinet mount only

INT

= internal

OH

= oval head

SPG

- spring

COEF

= coefficient

OX

= oxide

SPL

= special

COM

= common

COMP

= composition

COMPL

- complete

LH

= left hand

P

CONN

= connector

LIN

= linear taper

PC

CP

= cadmium plate

LK WASH

— lock washer

PF

CRT

= cathode-ray tube

LOG

CW

= clockwise

LPF

= logarithmic taper
= low pass filter

DEPC

= deposited carbon
= drive

M

K

DR
ELECT
ENCAP
EXT

= electrolytic
= encapsulated
= external

= peak
= printed circuit

STL

= steel

= picofarads = 10-'2

TA

= tantalum

TD

positive

TRIM

P/O

— part of

TWT

= traveling wave tube

POLY
PORC

= polystyrene
= porcelain

U

— micro = 10-6

POS

= position(s)

MFR
MHZ

= manufacturer
= mega hertz

MINAT

— miniature

MET OX

= split ring

= time delay
= toggle
= thread
= titanium
= tolerance
= trimmer

PH BRZ
PIV

MET FLM

= stainless steel

SR

farads

= milli = 10-3
= meg — 106
= metal film
= metallic oxide

MEG

SST

= kilo - 1000

PHL

6-2

= negative-positive-

voltage

PNP

= phosphor bronze
= Phillips
= peak inverse voltage
= positive-negative-

TGI
THD
Tl
TOL

F

= farads

MOM

= momentary

POT

= potentiometer

VAR

FH

= flat head

MOS

= metal oxide substrate

PP

= peak-to-peak

VDCW

= variable
= dc working volts

FIL H

= fillister head

MTG

— mounting

PT

— point

FXD

= fixed

MY

= "mylar"

PWV

= peak working voltage

w/

= with

w

— watts

WIV

= working inverse

G

= giga (109l

N

= nano (10-9)

RECT

= rectifier

GE

= germanium

N/C

RF

= radio frequency

GL

= glass

RH

= round head or

ww

= wirewound

GRD

= ground(ed)

NE
Nl PL

= normally closed
— neon

right hand

w/o

— without

= nickel plate

voltage

Replaceable Parts

## Page 18

Replaceable Parts

## Page 19

Replaceable Parts

## Page 20

Replaceable Parts

## Page 21


Table 6-2. Replaceable Parts

Mfr
Code

HP Part
Number

c

01611-66501
01611-6650?
01611-66579
01611-66504
01611-66505

1
2
3
4
5

BOARD ASSEMBLY, MAIN
BOARD ASSEMBLY,L0« VOLTAGE P0HER SUPPLY
BOARD ASSEMBLY, DISPLAY DRIVER
assembly, keyboard
BOARD ASSEMBLY, MICROPROCESSOR AND
keyboard scan

28460
28480
28460
2B4B0
28480

01611-66501
01611-66502
01611-66574
01611-66504
01611-66505

01611-66506
01611-66577
01611-66535

6
1
1

BOARD ASSEMBLY, RAM A DISPLAY GENERATOR
BOARD ASSEMBLY, COMPARATOR
BOARD ASSEMBLY, DATA STORE 6 COUNTERS
80AR0 ASSEMBLY, PERSONALITY
(SEE MANUAL SUPPLEMENT FOR OPTION
INSTALLED IN YOUR INSTRUMENT)

28680
28480
28480

01611-66506
01611-66577
01611-66535

28480
28480

01611-62101
01611-66515

D

Description

Qty

Mfr Part Number

BOARD ASSEMBLY, ROM
(SEE MANUAL SUPPLEMENT FOP OPTION
INSTALLED IN VOUR INSTRUMENT)
ASSEMBLY, PERSONALITY PANEL
(SEE MANUAL SUPPLEMENT FOR OPTION
Installed in your instrument)
01611-62101
01611-66515

9
7

0160-40?6

8

1

CAPaCITOP-EXD ,?UF y-20* 750VDC ppr

28480

0160-4026

1901-0768

0

1

DIODE-HV RECT 20KV 600UA

27777

H617

assembly, external probe
BOARD, EXTENDER

300N3

1990-0524

3

1

LED-VISIBLE LUM-inTp|mcd ie«20MA.hix

28460

1990 0524

2110-0007
2110-0012

4
1

1
1

FUSE
FUSE

28480
28480

2110-0007
2110-0012

0520-012*
2200-0103
2200-0105
2200-0111
2200-0101

8
2
4
2
0

2
19
5
4
1

SCREW.MACW
SCREW-Mach
SCREP-MACM
SCrEa-MACH
SCREW-MaCh

?.56
«»»o
«-«o
4-40
4-40

,312-IN.LG PAN.HD.POZI
,25-IN-LG PAN-HO-POZI
.112-IN.LG PAN-HD-POZI
,5-1N-LG PAN.HO-POzI
,168-IN-LG PAN-HD-POZI

00000
00000
00000
OOOOO

ORDER
order
ORDER
order
ORDER

2200-01“3

0

5

ScREW-MacH 4-4o
NOT ASSIGNED
ScREW-MaCh 8*52
SCREW.MACH 6-32
screw.mach 6-32

,375-1N-LG PAN-HO-POZI

ooooo

ORDER by DESCRIPTION

,25-IN-LG PAN-md-POZI
,312-IN.LG PAN.HD.POZI
,5-in-lg pan-md-pozi

ooooo
ooooo
ooooo

ORDER BY DESCRIPTION
ORDER BY DESCRIPTION
ORDER bt DESCRIPTION

6-3? ,312-1N-LG 100 DEG
SCREN-MACH 8.12 ,512-IN.LG PAN-HD-POZI
SCRE«-MACH 8-32 ,25-IN-LG 100 DEG
SCREH-MACH 10-52 ,375-IN.LG PAN.HD.POZI
NUT-HEX-DBL-CHAM 2-56-THD ,062-JN-THK

ooooo
ooooo

ORDER by DESCRIPTION
ORDER BY DESCRIPTION
?5t0-0|R?
ORDER 0Y DESCRIPTION
ORDER BY DESCRIPTION

NUT.HEX-DBL-CHAM 4.40-THD ,094-lN-TMK
NUT.HEX-W/LXWR 4-40-ThD ,094-IN.THK
NUT-HEX-rt/LKWR 6-32-ThD ,109-JN-THK
NUT-mex-OBL.CHAM b-32-THD .125.IN.THX
NuT-SPCLY 1/2-24-THD ,125-IN-THK

28680

2360-0113
2360-0115
2360-0121

2
4
2

21
1 1
1

2360-0194
2510-0043
2510-01*2
2680-0099
0610-0001

9
6
6
1
6

9
4
16
6
2

2260-0001
2260-0009
2420-0001
25*0-000“
2950-0038

5
3
5
6
1

2950-0043
7680-017?
1400-0090 ?l9o-0011
Si 90-0016

8
1
9
8
3

4

2190-0017
2110-0467
2190-0019
2190-0037
2190-0112

4

?19o-o910
3050-0066
3050-0071
3o5o-P“25
3050-0194
3050-0235
3050-0791
1400-0017
1400-0335
1400-0540

1
1
4

2

IA 250V TO I.25X.25 UL
,5A 250V NTD 1.25X.25 UL

SCrEW-mACH

ooooo

28480

ooooo
ooooo
ooooo
ooooo
ooooo
28480

ooooo

BY
by
BY
by
BY

DESCRIPTION
DESCRIPTION
DESCRIPTION
description
DESCRIPTION

2260-0001
ORDER BY DESCRIPTION
ORDER BY DESCRIPTION
ORDER by DESCRIPTION
2950-0036

2
6
4

NUT-HEX-DBL-CHAM I/B-32-Tho .OBB-IN-Thk
SCREW.MACH 10-3? .375-IN-LG 100 DEG
FUSEHOLDER COMPONENT FOR USE ON
rtASHER-LK INTL T NO, jo .195-IN-ID
wASHER-LK INTL T 3/8 IN ,377-IN-ID

26480
28480
28460
28480

ORDER BY DESCRIPTION
2680-0172
1400-0090
2140*0011
2190-0016

0
6
8
0

4
1
6
2
2

WASHER-IK HLCL NO. 8 .168-IN.rD
FUSEHOLDER COMPONENT HEX NUTt 1/2-28
WASHER-LK HLCL NO. 4 .115-IN-ID
WASHER-LK INTL T t/? IN .512-IN-ID
WASHER-LK HLCL NO. 2 ,086-IN-ID

28480
2S40O
28480
28480
26480

2190-0017
2110-0467
2190-0019
2190-0037
2140-0!1?

6
8
5
3
3

1
4
2
2

WASHER-LK
WASHER-FL
WASHER-FL
wASHER-FL
WASHER.Fl

INTL T NO. 4 .12-IN-ID
MTLC NO. 6 .147.IN-ID
mTLC MO. 8 .169-IN.ID
mTLC .12S-IN-IP ,312-IN-OD SST
MTLC NO. 1 ,088-lN-ID

28480
28480
28480
26480
28480

2190-0910
3050*0066
3050-0071
3050-0425
3050-0194

2
2
1
2
1

HASHER.EL MTLC NC. U .117-IN.ID
INSULATOR-XSTR NYLON
CLAmp.CABLE ,312-01* ,375-wD NYL
CABLE TIE 1,75-01A ,188-wD NYL
RETAINER RING-LED CLIP 6.270.IN SERRATED

286S0
26480
28480
28480
28u80

3050-0235
3050-0791
1400*0017
1400-0335
1400-0540

1
1

CL-LED-MTG
SC“EP-"ACH 8-32 ,625-IN-LG PAN-Mtl-POZI

2848©
OOOOO

lUOO-OSaT
order bt description

4

CONNECtOr-rF BNc FEv SGL-hOLE-FR 5C-DHM
CONNECTOR.RF BNC FEM SGL-hOLE.FR 6o.Oh“
CDNNECTOR-RE BNC EE" SGL-hOLF-FS Sll-OhM
CONNECTOR.RF BNC FEM SGL-hOLE-FR 50-OHM

28480
28480
28400
28480

1250-0083
1250-00S3
1J50-00S3
1250-0083

3
6
0

5
4

l400-0547
2360-0123

4

1250-00*3
1250-0083
125o-00 P3
1250-0083

1
1
1
1

1

4

See introduction to this section for ordering information
*Indicates factory selected value

„ _
6-0

Model 1611A

## Page 22


Replaceable Parts

Table 6-2. Replaceable Parts (Con’t)

Reference
Designation

HP Part
Number

Description

Qty

Mfr
Code

Mfr Part Number

1
1

YOKE, WJTh cablf

2*480

01611-61603

8
9
4

1
1
4

28480
26480
26480

5020-8805
5020-8806
5020-8835

5060-9040

8

2

FrAmE, F pQNT
FRAME, REAR
STRUT, CORNER
NOT ASSIGNED
COVER, SIDE HANDLE

28480

5060-9940

5060-9991
9320-5699
5061-1933
7120-5696
01611-00215

9
8
5
3
6

1
1
1
1
1

COVER, B0 T T0M
card-instruction
COVER, TOP
NAMEPLATE, 1611a
panel, rear

26460
28480
2*480
28480
28480

5060-9991
9320-3699
5061-1933
T120-56R6
01611-00215

0161!-00101
01610-43101
01611-00601
01611-00602
01611-01202

9
4
5
3

1
1
1
1
1

DECK, majn
GUIDE* CIRCUIT BOARD
SHIELD, CRT
shield# crt flat
BRACKET, PC BOARD FLAT

28480
28480
28480
28480
28480

01611-00101
01610-U3101
01611-00601
01611-00602
01611-01202

01611-04101
01611-01204
01611-20501
01611-2370!
01611-00201

7
5
5
3
0

1
1
1
1
1

COVfP, KEYBOARD
BRACKET * PC BOARD» REA»
HEAT SINK, MA
SHAFT, SWITCH EXTENSION
PANEL, KEYBOARD

28480
28480
28480
28480
26480

0 161 1-005 0J
01611-01204
01611-20501
01611-23701
01611-00201

01611-24103
01830-23201
2110-0465
2110-0470
1540-0325

1
3
8
5
9

1
1
2
1
1

coupler* switch extension
FUSEHOLDER cap EXTR PST, BAYONET, 2oA
FUSEHOLDER BODY EXTR PST, BAYONET, TND
case, CRVG HANDLE

MP29

03«0-0511
5001-0440
!06o-o566
5060-9802
5040-7201

0
1
2
1
8

3
2
1
1
ti

INSULATOR-XSTR kapton
TRIM, SIDE
SUPPORT, KEYBOARD
STRAP* HANDLE
FEET

MPJO
WP31
MP3?
mp3S
MP3«

5040-7202
5040-7675
0370-2989
5040-7219
5040-7220

9
0
1
8
1

1
1
l
2
2

TRIM STRIP, TOP
PUSHBQD* SWITCH
KEY CAP, OFF/LINE
CAP. STRAP HANDLE, front
CAP, STRAP HANDLE REAR

«P35
«P37
mp 3 8
MP39

5041-0676
5041-0677
5041-0678
5o6i-o6?9
5041-0680

9
0
1
2
5

1
1
1
1
1

KEYCAP, l
KEYCAP, 2
KEYCAP, 3
KEYCAP, 4
KEYCAP, 5

28480
28480
28460
28480
26680

5041-0676
5041-0677
5041-0678
5041-0679
5061-0600

MP40
*P4 l
MP4?
MPas
Wptu

5041-0681
5041-0682
5041-0683
Soo1-obSU
5041-0665

6
7
e
9
0

1
1
1
1
1

KEYCAP, 6
KEYCAP, 7
KEYCAP, 8
KEYCAP, 9
KEYCAP, 10

28680
28480
28480
28480
26480

5041*0681
5041-0682
5041-0683
5041-0684
5061-0665

MP45
MPU6
MP«7
MPUB
MP49

5041-0040
5041-0041
5041-0042
5041-0043
5o6i-oo66

1
2
3
4
5

1
1
1
1
1

KEYCAP, A
KEYCAP, B
KEYCAP, C
KEYCAP, 0
KEYCAP, e

28480
28480
28480
28480
28480

5041-0040
5041-0041
5041-0042
5041-0043
5041-0044

MP50
MPSt
MP5 2
«P5J
WP5U

5041-0045
5041-0046
5041-0047
5041-0046
5041-0049

6
7
8
9
0

1
1
1
1
1

KEYCAP, F
KEYCAP, TIME INTRVL
KEYCAP, COUNT TRIGS
KEYCAP, BEFORE TRIG
KEYCAP, AFTER TRIG

26480
28460
26460
28460
28460

5041-0045
5041-0046
5041-0047
5041-0048
5041-0049

MP55
MP56
MP57
MP58
WP59

5041-0050
5041-0051
5041-0052
5041-0053
5041-0060

3
4
5
6
5

1
1
1
2
2

KEYCAP, STOP
KEYCAP, DON'T CARE
KEYCAP, TRIGGER OCCURRENCE
KEYCAP, ARROW
KEYCAP, DATA BUS", LIGHT

28480
26480
26480
26460
28460

5041-0050
5041-0051
5041-0052
5041-0053
5041-0060

«P60
MP61
MP62
MP63
MP64

5041-0065
5041-0073
5041-0074
5041-0075
5041-0076

0
0
1
2
3

1
1
1
1
2

KEYCAP,
KEYCAP,
KEYCAP,
KEYCAP,
KEYCAP,

26460
26480
26460
28460
28460

5041-0065
5041-0073
5041-0074
5061-0073
5041-0076

MP65
MP66
MP67
MP68
MP6*

5041-0086
5041-0089
5041-0630
5041-0631
8061.06S6

7
8
5
6
1

1
1

KEYCAP, DATA BUS ", DARK
KEYCAP, EXT ", DARK
KEYCAP, ADDRESS BU8 ", LIGHT
KEYCAP, TRACE
KEYCAP, ADDRESS BUS ", DARK

28480
28680
28460
28460
26660

5041-0088
5041-0089
5041-0630
5041-0631
3041-0636

Mp?0
MP71

03b0-0016
0360-0053
0390.0006
5061-1230
5040-0588

2
7
3
5
0

LI

01611-61603

Mol

5020-6805
5020-8606
5020-5835

mp7
MPB
Mp9
MPl 0
WP1 1
«P1 i
U p J (J

«Pt5
WPl b
MPl 8
MP20
mp ? i
mp22
MP23B

MP 2 0
MP25
MP?6
MP27

mp7 2

MP73
MP74

8

'■I

ti

■
. -.Bl

FACEPLATE, SAFETY

TRACE TRIGS
MNEMONIC-ABSOLUTE
ADRS BUS ADRS BUS EXT ", LIGHT

TERMINAL-SLDR LUG LK-MTG F0R-P4-SCR
TERMINAL-SLDR LUG LK-MTG FOR-Plo-SCR
IN3ULATOR-FLG-B3HG NYLON
COVER, INSTRUCTION CARD
COVER-KEYBOARD

§*■'' '

1H
KttH
vrm
Hi : 6 ±H

26480
28480
28460
28480
2*480

HTTTH
■TTTTH

■ f'l

See introduction to this section for ordering information
♦Indicates factory selected value

6-6

01611.2M03
01830-23201
2110-0465
345003-010
1540-0325
0340-0511
5001-0440
5040-0564
5060-9802
5040-7201
5040-7202
5040-7675
0370-2989
5060-7219
5040-7220

0360-0016
0360-0053
0390-0006
5061-1230
5040-0588

Replaceable Parts

## Page 23


Model 1611A

Table 6-2. Replaceable Parts (Cont)

Reference
Designation

HP Part
Number

Mfr Part Number

Description

016 4 0-24701

SPACER.CRT SHIELD

01640-24701

1251.2357

CONNECTOR.AC PwR HP-9 hale FLG.mTG

1251-2357

1854.0433

TRANSISTOR NPN SI PDbROW FTijVHZ

1 8SA-0U33

R1

0687.4751

RESISTOR fl.jo* ,5* CC

EBU751

Si

3101-1720

SWITCH.PB DPDT flA 250VAC

3101-1720

T1

9100-3B7P

transformer.line

R100-3878

Ul
U2

1826-0369
1 826-0368

IC-LINEAR REG + 12V
IC-LINEAR REG-12V

1826-0369
1826-0368

VI

5061-1250

assembly, cpy

5061-1250

*1

8120-1521

CABLE

ASSY

notei

for

MP75

Pi
Qi

SEE

TC«0*to0O

ISAWg 1-CNDCT JGK-JKT
other

SECTION

II

power
OF

CORDS

THIS

8120-1521

available

MANUAL.
8120-2309

8120-2309
01611-61601

CABLE AssEMBLY-H.v.

"3

CABLE

ASSEMBLY,

TRANSFORMER

0161 1-6U01

*4

01611-6160?

CABLE

assembly,

CRT

01611-61602

*?

See introduction to this section for ordering information
♦Indicates factory selected value

Model 1611A

## Page 24


Replaceable Parts

Table 6-2. Replaceable Parts (Can’t)

Reference
Designation

HP Part
Number

1

*1

01611*66901

1

MCI

0100-0404

6

MC2

0l6o-0464

6

MCJ

0100-0464

6

A1C«

0160-0228

6

1

board assembly,

3

CAPACITOR.PxD
(NOT SUPPLIED
CAPACITOR-FXD
(NOT SUPPLIED
CAPACIjOR-FxD
(NOT SUPPLIED

6

Mfr
Code

Description

Qty

main

<»500UF + 75.m 25VDC At
W/A1» ORDER SEPARATELY)
4500UF+75.10X 25V0C AL
W/A1 » ORDER SEPARATELY)
4500U^75-10X 25yDC At
W/A1»0RDER SEPARATELY)

Mfr Part Number

2S4S0

01611*66501

26400

0160*0404

28480

8180-0484

28480

0180*0404

CAPaCITOR-FXD 22UP+-1ox 1SVOC Ta

56209

15OO226X9015B2

CONNECTOR-SSL
CONNECTOR.SGL
CONNECTOR-SSL
CONNECTCR.SGL
CONNECTOR-SGL

CONT
CONT
CONT
CONT
CONT

28480
26480
28480
20460
20400

0360-1653
0360*1653
0360*1653
0360-1653
0360-1653

,2S-lN-Ls ,152-lN.IO

00000

ORDER BY OESCRIPYlON

20400
28400
28480
28400
26400

1251-4546
1251-4549
1251*3195
1251*3279
1251-0513

20400

0696-3180

A1 Eli
*1E5

0360*1693
0360*1693
0360*1693
0360*1633
0360-1693

5
5
5
5
5

k 1 Hi

0180-0059

5

1

SPACER.RVT-ON

k\P\

M"5

1251-4546
1251-6540
1251-1195
1251-3279
1251-0513

1
4
4
5
4

2
2
1
1
1

connector
CONNECTOR
CONNECTOR
CONNECTOR
CONNECTOR

MM

0698.3180

2

1

RESISTOR 66 2x

k 1 Ul

1880-1050

7

1

IC BFR TTL S NANO QUAD 2-JNP

01295

8N74S37N

AjXAj
A1 A A3
Ai*A5
A t A A6
Aj *A7

1251.1886
1251-1886
1251-6587
1251-6587
1251.4587

6
6
0
0
0

2

CONNECTOR.PC
CONNECTOR-PC
CONNECTOR.pc
CONNECTOR-PC
CONNECTOR-PC

EDGE 15-C0NT/R0W J.ROWS
EDGE 15-CONT/ROw 2-RO*S
EDGE 50-C0NT/R0W 2-POW8
EDGE 50-cQNT/ROW 2-R0w§
EOGE 50-C0NT/R0N 2-ROwS

20400
20480
20480
284B0
28480

1251-1686
1251-1866
1251-4567
1251-4567
1251-4567

Aj X AA
A1XAlOpl
A } X AQP j

1251-4587
1251-4587
1251-4587

0
0
0

CONNECTOR-PC EDGE 50-CONT/RQW 2-RQW3
CONNECTOR-PC EOGE 50-CONT/ROw 2-rows
CONNECTOR-PC EDGE 50-CONT/ROW 2-ROW0

28400
20400
28480

1251-4567
1251-4587
1251-4587

AlXUl

1200-0838

7

1

SOCKET-IC 14-CONT DIP DIP-3LDR

28480

1200-0638

*2

01611-6650?

2

1

BOARD A8SEu8LY,LOW VOLTAGE ROWER SUPPLY

28480

01611*66502

A?C l
AjC?
A ?C 3
A?Ca
A ?C 5

OlfcO-3508
0160-3508
0160*3508
0160-3508
0180-0091

9
9
9
9
1

9

CAPACITOR-FXD
CAPACITOR-FXD
CAPACITOR-FXD
CAPACITOR-FXD
CAPaCITOR-FXD

1UF 480-20X
lUF +80-20X
1UF +60-20X
1UF fB0-20X
iouf*5o-iox

20400
20400
20400
28480
56289

0160-3500
0160-3508
0160-3508
0160-3508
S00106F1000C2

A?C6
A ?C 7
A ?C S
A?C9
A ?C 1 0

0160*3508
0160-2055
0160-3508
0180-1714
0180-0139

9
9
7
6

1
1

CAPACITOR-PXD
CAPACITOR-FXD
CABACITOR-FXO
CAPACITOR-FXD
CAPACITOR-FXD

1UF *80-20X 50VOC CE»
.01UF A80-20X 100VDC CER
iuF YS0-20X 5OV0C CER
33OUF+-10X 6VDC TA
1OOUF + -20 X 10VDC TA

26480
28460
26480
56289
56289

0160-3508
0160-2055
0160-3506
1500337X900682
1500107X0010R2

A ?C 1 1
A?C12
A ?C l 3

0160-2055
0160-2035
0160*2204

9
9
0

2

CAPACITOR-FXD .01UF *80.20X 100VDC CER
CAPACITOR-FXD ,01UF ♦80-20X 100VDC CER
CAPACITOR-FXD loORF «.5X 3O0V0C MCA

2046o
26480
26480

0160-2055
0160-2055
0160-2204

a?Cri
A ?C R?
A?C*3
A2C««
A?C«5

1901-0662
1901-0662
1901-0662
1901-066?
1901-0028

3
3
3
3
5

DIOOE-PWR
DIOOE-PWR
DIOOE-PWR
DIODE-PwR
DIOOE-PwR

RECT 100V
RECT 100V
RECT 100 V
RECT 100V
RECT UOOV

6A
b*
6A
6A
750MA DO-29

0471 3
04713
0471 3
047 1 3
28480

MR751
MR751
MR751
MR751
1901-0028

A?c«!0

1901-0028
1901*0662
1901-0662
1901-0662
1901-0662

5
3
3
3
3

DIOOE-PWR
OIOOE-PwR
DIODE.PwP
DIOOE-PWR
DIODE-PWR

RECT 400V 750*A DO-29
RECT 100V 6A
RECT l00V 6A
RECT 100V 6A
RECT 10 0 V 6 A

28480
0471 3
0471 3
0471 3
0471 3

1901-0028
MR751
WR751
MR751
MR751

A?C»11
A?C«t?

1901-051l
1901-0028

1
5

1

DIODE-PWR RECT 1N3S89R 50V 12A 200NS
OIOOE-PWR RECT 400V T50WA 00-29

04713
28480

1N3889R
1901-0026

A2F l
A ?F 2
A ?F 3

2110-0003
2110-0003
2110-0014

0
0
3

2

FUSE S» 250V NTD 1.25X.25 UL
FUSE 3A 250V NTD 1.25X.25 UL
Fuse 4A 250V TO 1.25X,25 ul

759J5
75915
75915

312003
312003
313004

A2«l

A^5

2360-0117
2420-0002
2820-0002
2190-0018
2196-0039

6
6
4
5
5

SCREw-mACN 6-32 .375-1N-LG PAN-HD-POjI
NUT-WEX-0BL-CH4M 6-32-THO .109-JN-Thk
NUT.HEX.OBL.CWAM 10-32-THO .09R.1N.THW
WASHER-LK HtCL NO. 6 ,141-JN-IO
WASHER-LK HLCL no. 10 .190-IN.ID

00000
26460
00000
28480
28480

ORDER 8Y DESCRIPTION
2420-0002
ORDER 0Y DESCRIPTION
2190-0018
2190-0034

A?Hfe
A^H?

3050-0066
3050-0027

8
1

WA$HER*FL MTLC NO.
^ASHER-FL MTLC NO.

28400
28480

3050-0066
3050-0027

*1E1
k\t2
kill

A1 P 2
AtPJ
i\PU

A?C»7
A?C Pa
A?c«9

A?H J
A?HU

5

6

1

28

9

8

3

!
?
2
1
A

1
3
1

Pin
PIN
PIN
PIN
PIN

.045-in-SSC-SZ
,04S-IN.BSC.SZ
.045-1N-BSC-SZ
.O45-1N.08C-SZ
,045-IN-BSC-SZ

SQ
SO
SO
SO
SO

8.pin m post type
7-PIN m POST TYPE
4-PIN M POST TYPE
12-PIN f POST TYPE
5-PIN m post TYPE
l*

«0 TCpo—200

5^VDC CER
59VDC CER
50VDC CE»
50VDC CER
100VOC AL

6 ,147-IN-ID
10 ,203-IN-ID

See introduction to this section for ordering information
^Indicates factory selected value

Replaceable Parts

## Page 25


Model 1611A

Table 6-2. Replaceable Parts (Con’t)

Mfr
Code

HP Part
Number

c
D

Qty

9100-3465
9100-3829

0
0

1
1

CHOKE-FILTER 580UH Y-25X 3 20KHZ
INDUCTOR 10UH 10* .6880X1.ISSlG

28480
28480

9100-3465
9100-3829

42MP1

2110-0269
1205-0310

0
2

6
2

rusCHouOER-rtfR type sa .jso.fujE
HEAT SINK SGL T0-3-CS

28960
ES9S0

2110.0269
1205-0510

*201
*202

1853-0062
1864-0082

4
3

1
1

TRANSISTOR PNP SI P0«300M* FT»200MHZ
THYRISTOR.SCR 2N4441 VRRM.So

28480
04713

1653-0062
2N6661

*?R5

0698.4313
0698-4313
0698-4313
0757-0968
0757-0928

5
5
5
3
l

RESISTOR
RESISTOR
RESISTOR
RESISTOR
RESISTOR

Esaso
28480
28480
28480
24546

0698-4313
0696-4313
0698-4313
0757-0688
C4-1/8-T0-1621-F

*2»7
lifts
*2*9
A2R10

2100-3352
0757-0280
0757-0938
0757-0919
0757-0809

7
3
3
0
2

i
i

RESIST0R-TRMR IK 10X C SIDE-ADJ 1-TRN
RESISTOR IK IX .125* F TC»0t-10O
RESISTOR 5.11K IX .125* F TC«0+-100
RESISTOR 681 1* ,125* F TC90A-100
RESISTOR 332 IX ,5* F TC»0+-100

28480
24546
24546
24546
28480

2100-3352
C4-1/6.TO-1001-F
C4-1/8-T0-5111-F
C4-1/6-T0-681R.F
0757-0809

*2R11
ijtii
*2R13
*2Ria
*2R15

0698-3430
0757-0346
0757-0200
0757*0395
0811-2771

5
2
7
1
7

i
2
1
2
2

RESISTOR
RESISTOR
resistor
RESISTOR
RESISTOR

El.5 1* .125* F TC*0+-100
10 IX .125* F TC«0*-100
5.6EK 1* .125H F 7C107-100
56.2 1* .125* F TC«0*-100
.18 3X 3* P* TC«0*-9o

03886
24546
24546
E«5«6
26460

PME55-1/8-T0-21R5-F
C6.1/8.T0.IORO.F
C6.1/8.TO.5621.F
C6.1/J.T0.56R2-F
0811-2771

*2R1 fa
*2R17
*2Rt8
li»!<l

OslI-175S
0757-0346
0757-0395
0811-2771

8
2
1
7

1

RESISTOR
RESISTOR
RESISTOR
RESISTOR

,2a 5X 2W P* TC«O*-8<>0
10 IX .125* F TC«0*-100
56.E 1* ,1E5» F TC.Oy-100
,18 J* JH PW TCpoa-90

750«E
24546
24546
28460

BNH2.2a/100.J
C6.I/S.T0-I0R0-F
C6.1/8.T0.56R2.F
0811-2771

ljU|

1820-0196

6

1

IC 723 V P6LTR TO-l00

28480

1820-0196

1902-310«

6

1

DIODE.ZNR 5.62V 5x DO-35 P0*.4W

26460

1902-3104

CABLE, VOLTAGE REGULATOR
(NOT SUPPLIED *f/A2, ORDER SEPARATELY)
cable, VOLTAGE REGULATOR
(NOT SUPPLIED */A2» ORDER SEPARATELY)
CABLE, VOLTAGE REGULATOR
(NOT SUPPLIED W/A2» ORDER SEPARATELY)

28480

01611-61613

Reference
Designation
i

*?Rl
■FT Hr : M.'.r A

IjVll

o’!

HI

*2"!

016J1.61613

6

1

*2^2

01607.61613

0

1

Description

2K 1% ,5* F TC«0^-50
2K IX .5* F TC-0+-50
2K IX '.5N F TC«0*-50
909K 1* .I25W F TC*0»-100
1.62K lX ,125* F TC«0+-100

Mfr Part Number

28980

01607-61613

28480

01611-61614

bq4r0 assembly, display driver

28480

01611-66579

CAPaCItOr.PxO
CAPACITOR-FXD
CAPACITOR-FXD
CAP»CiTOR*FxO
CAPACITOR.FXD

.olur Y-IOX SOOVOC POLyE
240PF t-5X SOOVDC MICA
47UF*-10X 35VDC TA
6OUFY-E0* 6V0C TA
47UF*-10X 35VDC TA

28480
tE1J(,
56289
56289
56269

0160-0161
DH15F241J0300WV1CP
1500476X903582
1500606X0006B2
1500476X903582

iqUF
j 0X 50VDC MET-ROLYC
,oEEUF .-5* 900VDC POLYE
5uF y-IO* 50V0C «ET*POLYC
1UF+-20X 50VDC TA
1UF*»?0X 50VDC TA

SStlSO
8441 1
26480
56EI9
56289

0160*4455
663U*22354*2
0160-3830
150D105X0050A2
I500I05X0050A2

7

1

01611-66579

S

1

A 5C 1
ASC2
A 3C 3
ijCu
*3C5

0160-0161
0140-0199
0180-0097
0180-0106
0180-0097

4

43C7
*5C8
MC9
A3CI0

0160*4455
0160-3127
0160-3830
0i60-0230
0180-0230

0

CAPACITOR-FXD
CAPACITOR.FXD
CAPACITOR-FXO
CAPACITOR-FXD
CAPACITOR.F*D

IjCn
*?C 1 2
A3C13
ijCn
A 3C 1 5

018o-0?30
0160-3508
0180-1701
0160-3762
0160-3762

o9
2
7
7

CAPACITOR.FXD
CAPACITOR.FxD
CAPACITOR-FXD
CAPACITOR.FXD
CAPACITOR-FXD

|UF*.Jo* SOVDC TA
luF t8o-20X 50yOC CEr
6.8UF+-20X 6VDC TA
,o«UF ,.5* 50VDC “ET.ROLYC
,68UF + -5X 50VDC ^ET-POLVC

56289
28460
56219
26480
28480

1500105X0050*2
0160-3506
15006S5X0006A2
0160-3762
0160-3762

A 3C l 6
*3Cl 7
A3C1*
43C19
43C20

01*0-0097
0190*1819
0180-0097
0160-3127
01S0-2667

7
3
7
8
1

CAPACITOR-FXD
CAPACITOR-FXD
CAPACITOP-FXD
CAPACITOR-FXD
CAPACITOR-FXD

47UF10X 35VDC Ta
100UF+75-10X 50VDC AL
47UF*-10X 35VDC Ta
.022UF +.5X 4noVDC POLYE
150UFY-10* EOyOC TA

56289
56269
56289
84«U
56289

1500676X91)5582
30D107G050DH2
1500679X903582
663U*22354*2
I50D15TX902088

*3C?f
*3C22
*3C ?3
*3C2U
*3 C25

0180-0230
0160-2055
0160-3508
0180-0106
0180-0097

0
9
9
9
7

CAPACIt0r-FXD
CAPACITOR-FXD
CAPACITOR-FXD
CAPACITOR-FXD
CAPACITOR-FXD

1uF*-20X 50yDC TA
.olUF +80-20X 100VDC CER
1uF t80-20X 50V0C CER
bOUF*-20X 6VDC TA
47UF+-10X 35VDC Ta

56289
28480
28480
56289
56289

150D105X0050A2
0160-2055
0160-3508
1500606X0006B2
150D676X9035S2

A 3C 26
A3C27
A3C28
iSCio
A 3C 30

0180-0097
0160-4449
0180-0426
0160-3665
0160-3665

7
9
6
9
9

CAPACITOR-FXO
CAPACITOR-FXD
CAPACITOR-FXD
CAPACITOR-FXD
CAPACITOR-FXO

9TUF+-10X 35VDC TA
8200PF +-10X UOOVDC POLYE
22UF♦100-1 OX 250VDC AL
.OlUF +80-20X 500VDC CER
.OlUF ♦80-20X 500VDC CEB

HESS I
K;!;m
KJil
28680
28680

1500476X903582
0160-6999
0180-0426
0160-3665
0160-3665

•SCSI
A 302
A3C33
A3C30
*3C35

0160-3665
0160-3665
0160-3665
0160-2204
0180-0106

9
9
9
0

CAPACITOB.FxD
CAPACITOR-FXD
CAPACITOR-FXD
CAPACITOR-FXO
CAPACITOR-FXD

,0lUF +80-20X 500V&C CER
.OlUF +80-20X 500VDC CER
.OlUF ♦80-20X 500VDC CER
100PF *-5X JOOVDC "ICA
60UF+-20X 6VDC TA

28480
28400
28480
28480
56289

0160-3665
0160-3665
0160-3665
0160-2204
1500609X000692

A3C36
A3C57

0180-0098
0160-350*

8
9

56289
28480

1500107X002082
0160-3508

*2*3

01611-61614

*3

1
1

7
9
7
7
8
0

lESlI

0

i

t

i
i
5

9

1

♦-

CAPaCItOr-FxD ln0uF*-20X 20vDC ta
CAPACITOR-FXO 1UF +SO-20X 50VDC CEB

_
See introduction to this section for ordering information
* Indicates factory selected value

6-9

Model 1611A

## Page 26


Replaceable Parts

Table 6-2. Replaceable Parts (Con’t)
Reference
Designation

Vr :
H*r '

HP Part
Number
1901-076?
1901-0040
1901-0029
1901-0767
1001-0020

c
D

9
1
6
9

Description

Qty
3
2
5

fa
fa

DIODE.PWR RECT 400V
DI DOE-8WITCHINC 30V
DIODE.PWS RECT 600V
DI0DC-PWR RECT 400V
DI0DE.PWR RECT faOOV
DIODE.RWR
DI0DE-PWR
DI00E.PWR
DI00E-RWR

RECT
RECT
RECT
RECT

40OV
400V
fcOOV
600V

Mfr
Code

Mfr Part Number

6A
SOMa 2NS 00*55
750MA 00-24
6A
750*A DO-29

04713
28480
26480
00713
28480

MR754
IROI-OORO
1R01-002R

750** 00.80
6A
750*A DO-29
TSOMa 00-2R

28480
04713
28480
28460

1R01-0026

ooooo
O0000
26480
26460
28480

ORDER ST DESCRIPTION
ORDER BT DESCRIPTION
2260-0001
2190*0018
2190-0019

1R0I-002R

A3C**9

1001-0020
1901-0767
1901-0029
1901-0029

A jH2
Ajh3
AjH«
ASh5

2360-0201
2420-0003
2260-0001
2190-001B
2190-0019

9
7
5
5
6

10

3CR(W.m«ch 0-5? .5«IN.LG R‘N-HD.P0EI
NUT.HIX.DBL.CHAM ,.J2.TH0 .0RR.IN.THK
NUT-HEX-DBl-ChAm 4-40-ThD ,094-IN-TmK
WASHER.LK HICL NO, 6 ,141-IN.ID
washer-l* hlcl NO. “ .115-IN-ID

A3H7

3050-0016
3050-0235

8
3

6
10

WASHER.FL MTLC NO.
WASHER.FI, MTLC NO.

A .147.IN.ID
R .117.IN.ID

26460
26480

3050-0016
3050-0235

9100-3930
9100-3877
9100-3931
01611-86001
91ao-ol11

4
8
5
8
1

1
1
1
l
1

INDUCTOR J.5HH to*
inductorrf-ch.hld
INDUCTOR 700UH 10X
COIL# FXD
INDUCTORRF-CH-MLD

.6250X1.RSTIC
eromh
.60X1.437LG

26480
28480
26480
26060
26460

9100-3930
9100-3877
9100-3931
01611.66001
9140-0111

1205-0310

2

HEAT SINK SOL T0.5.CS

26460

1205-0310

5
3
1
1

3
1
1
5
l

TRANSISTOR
TRANSISTOR
TRANSISTOR
TRANSISTOR
TRANSISTOR

NPN
NPN
PNP
NPN
NPN

jNsSRO SI TO.J P0*100«
31 OARL PO.TOW FTpl»HZ
81 DARL PD«70* FT»iMHZ
SI P0«S5OMW FTP300HHZ
SI P0»!1W FTrio**hZ

07263
26480
0471 3
04713
26480

2N3840
1656-0558
HJE1090
2N3R0S
1854-0330

2

TRANSISTOR
TRANSISTOR
TRANSISTOR
TRANSISTOR
TRANSISTOR

NPN
NPN
PNP
NPN
NPN

SnS#11*) Si ID'S PORIOOW
SI RO*J5o“W FTrjoOmHZ
3I PD*510mh Ft«250«hz
2N5B«0 SI TO-3 PDrIOOW
SI PO«J5o“w FTrSOOHHZ

07263
04713
28460
07263
04713

2N5840
2NJ904
1853*0036
2N5s«0
2N3904

TRANSISTOR NPN SI PD*S50MW fT*500mhZ
TRANSISTOR NPN SI PDpJ50"w FTpJOOHHZ
TRANSISTOR PNP SI PD»310hw FT*250MhZ

04713
04713
28460

2N3904
2N3R0R
1653-0036

1
!
1
1
6

RESISTOR
RESISTOR
RESISTOR
RESISTOR
RESISTOR

26480
24546
28460
27167
24546

0757-0812
C4.1/6.TO*1002-F
0811-1878
FP«2-2-T00-l5«0-J
C4-1/0-TO-1O1-F

01121

9

RESISTOR.VAR CONTROL CC 50 10* LIN
RESISTOR IK 1* .125W F TCpOt-lOO
RESISTOR 07.5« 1* ,I25» F TCpot-100
RESISTOR 47,5k IX .125* F TC«04-100
RESISTOR 07.5K l* .125W F TCPOT-tOO

73HRG02R8500U
C4-1/8-T0-1001-F
C4.1/8.T0.4752.F
C4.1/S-T0.4752-F
C4-1/8-T0-4752-F

AjLi
A jL 3
*5L«
ML 5

HQi

hi 05

1854-0751
1854-0558
1B5J-0334
1854-0215
1854-0330

9
6

fa

1854-0751
1854-0215
1853-0036
1054-0751
1854-0215

0

A3G13

1W54-0215
1854-0215
1853-0036

1
l
2

A JR 1
A JR2
AJRJ
AjR«
»!*S

0757-0812
0757-0442
0011-1878
0698-3605
0757-0401

7
9
3

l)Q8
•

so 10

A3Q1 1

2
0
1

fa

0

0757-0280
0757.0457
0757-0457
0757-0457

7
3
6
6
6

0757-0457
0757-0283
0757-0283
2100-3252
0757-0283

fa
6
fa
6
6

A jR 1 9
AJR20

0757-0«37
0757-0488
2100-3213
0757-0470
0757-0394

2
3
7
3
(i

A JR21
A JR??
A JR? J
AJR?U
A jR?5

0757-0437
0757-0470
2100-3252
0698-5437
0698-5437

2
3
6
6
6

A jR 2 7
A JR?B
A JR?<3
AJR30

0698*5420
0698-5420
0757-0407
0757-0437
0757-0283

7
7

A JRJ?
A JH 3 3
AJR 34
»5r55

0757-0401
0811-1671
0757-0804
0757-0401
0757-0457

0
4
7
0
6

A JR37
A JR 50
A JRJQ
AJR«0

0757-0457
0757-0457
0757-0457
0757-0280
2100-3252

6
6
6
3
6

A jR8
A JR 1 0
A JR 11
AJR1?
AXR1 3

A JR 1 fa
A JR 1 7

fa
2
fa

6
6
3

3.3UH 1 OX

432 1* ,5W F TCROT-1O0
1 OK 1* ,125w F TC*0*-100
7.5 5X 25* Pw TC*0».2t,0
15 5* 2W HO TC*0t-20O
100 1* .125W F TC»0t-100

. . S
Hu .1.9
h

RESISTOR 07.5k 1* ,125w F TC»0*.loo
RESISTOR 2K 1* ,lE5w F TC*0*-IOO
RESISTOR 2K IX .l?5w F TC«0+-100
RESISTOR.TRMR 5K 10* C TOP.AOJ l-TRN
RESISTOR EK 1* .1B5W F TCpOT.IOO

24546
24546
24546
28400
24546

C4.I/8.T0.4752-F
C4-1/6-T0-200l»F
C4-1/8-T0-2O01-F
2100-3252
C4-1/8-TO-2001-F

RESISTOR 0.75k 1* ,1B5w F TC*OT-IO0
RESISTOR RORK 1* .1S5W F TC*0T-100
RES1STOR-TRMR 200K 10% C TOP-ADJ 1 TURN
RESISTOR 16BK 1* ,1E5W F TC*0.-100
RESISTOR 51.1 1* .125. F TCo0«*100

24546
20480
28400
24546
24546

C4.1/8.T0-4751-F

RESISTOR 0.75K 1* .1E5W F TC*0T.100
RESISTDR 162K IX .125* F TC«0*-10O
RESISTOR-TRMR 5K 1 OX C TOP-ADJ l-TRN
RESISTOR 1EK .1* .1SSW F TC*0t-50
RESISTOR 12K
.125* F TC»0*«50

24546
24540
28480
28480
28480

C4.1/S.T0.R751-F
C4-1/0-TO-1623-F
2100-3252
0698-5437
0698-5437

1

RESISTOR
RESISTOR
RESISTOR
RESISTOR
RESISTOR

28480
26460
24546
24546
24546

0698-5420
0648-5420
C4-1/8-T0-201-F
C4-1/8-T0-4751-F
C4-1/B-T0-2001-F

t
1

RESISTOR 100 1* , 125w F TCoOflOO
RESISTOR 2.7 5* BW Pw TCROt-400
RESISTOR 200 1* ,5W F TCPOT-100
RESISTOR 100 IX ,125* F TC*0*-100
RESISTOR 07.5K t* ,125w F TC*o*.100

24540
75042
28RB0
24540
24546

Ctt-l/8-T0-101-F
BWH2-2R7-J
0757-0804
C4- 1 /0-TO-l01-F

RESISTOR 07,5K |* ,125W F TCpot-100
RESISTOR 07.5k 1* .125. F TC»0**100
RESISTOR 47,5K IX ,125W F TC«0*-100
RESISTOR IK IX .125* F TC«0f-10O
RESISTOR*TRMR SK 10* C TOP.AOJ l-TRN

24546
24346
24546
24546
28480

C4.1/8-T0-4752-F
C4.1/5.T0.PT52.F
C4-1/S-T0-4752-F
C4.1/8-T0-1001-F
2100-3252

4
a

3
1
2
3

2

2

J.S70K .1* ,1E5* F TC«0T"50
3.S70K ,1* ,125* F tC*0v-50
E00 1* ,1E5W F TCi0*-100
0.75K |* .1S5W F TCpot-100
SK 1* .1?5W F TCRO.-IOO

See introduction to this section for ordering information
♦Indicates factory selected value

6-10

i 112!

IR01-002R
1901-0029

2100-3213
C4.i/B-T0-lb23-F

Replaceable Parts

## Page 27


Model 1611A

Table 6-2. Replaceable Parts (Con't)

Reference
Designation
AjRpi
MRU?
UJ
A3RUU

HP Part
Number

1

0757-0280
0757-0280
0S1I-I676
068U-1041
2ioo-o56R

3
3
1
1
2

1

A3RU6
A3«U7
A
U8
A3RU4
AjRSo

0684-lOU!
075T-OU88
0757-0486
0757-0457
0757-0401

1
3
3
6
0

A3R51
A3R52

0757-0159
0757-0394
0757-0394
0698-0090
0757-0412

5
0
0
7
3

A 3«5<7
43*60

0757-0284
0757-0469
0757-0453
0757-0401
2100-0569

7
0
2
0
2

4 3R 6 1
*jR6?

2100-3252
0757-0159

6
5

43T]
4 3T 2

506I-I22F
9100-3927

1
9

1
1

43T®1
A3TP?
43TR3
A3TPU
43TP5

0360-0535
0360-0535
0360-0535
0360-0535
0360-0535

0
0
0
0
0

45

A3TP6
A3Tp7
A3TP8
A3TP*
A IT P 1 0

0360-0535
0360-0535
0360-0535
0360-0535

M«5U
A3R55
*?R5fc
AJR57

1
^b

1
1
1
1
1

Mfr
Code

Description

Qty

Mfr Part Number

20US 0

C4.1/8.T0-I001-F
C4-1/B.T0-1001-F
BWH2-J oR-J
CB1041
2100-0569

RESISTOR
RESISTOR
RESISTOR
RESISTOR
RESISTOR

100« 10X ,25» FC TCp-400/*«00
909K 1* .125* f TC"0*-100
909K jx .125W
TCbC+.1G0
47,5k ix .125W F Tc«0*-100
100 IX ,l25W F TC»0+-100

01121
28480
28480
24546
24546

C B1041
0757-0488
0757-0488
C4-1/A.T0-4752-F
CP-1/8.T0-1O1-F

RESISTOR
RESISTOR
RESISTOR
RESISTOR
RESISTOR

IK ix .5* F TC«0+-100
51.1 IX ,125k F TC*0*-10O
51.1 IX ,125rt F TC«0*-100
464 IX .5" F Tc»0*-I00
365 IX ,|25W F TC-0+-100

28480
24546
24546
28480
24546

0757-0159
C«-1/6.T0-51R1-F
C4-1/8.T0-51R1-F
0698-0090
CP-1/6-T0-565R-F

RESISTOR 150 lx ,l25w F TC«0*-100
RESISTOR 150K IX ,1J5» F TC60»-100
RESISTOR Jo.IK |X .ISSN F TC»OT-100
RESISTOR 100 IX ,l25w F TC*0*-100
RESISTOR-TRMR !m ?0X C TOP-ADJ 1-TRN

24546
24546
2«546
24546
28480

Ca-l/S.TO-151-P
CP-1/P-TO-150J-F
CP-l/6-To-JOU-F
CP-l/S.To-lOl-F
2100-0569

RESISTOR-TRMR 5k 10X C T0R-*DJ
RESISTOR IK IX ,5W F TC«0*-100

28480
28480

2100-3252
OT5T-015R

2S4S0
28480

5041-1228
9100-3927

RESISTOR 1* 13 ,125« F TCbO*-!0C
RESISTOR IK IX .125* F TC«0*-tO0
RESISTOR 10 5X ?w Pw TC«0+-40b
RESISTOR 100K I0X ,SSw FC TC*-«00/tB00
RESISTOR.TPMP 5m 2QX C T0P-ADJ l-TRN

F

1-TRN

TRANSFORMER
transformer-power

■nm
01121

terminal
TERMINAL
TERMINAL
TERMINAL
TERMINAL

test
TEST
TEST
TEST
TEST

point
POINT
POINT
POINT
POINT

pcb
PCB
PCS
PCB
PCB

ooooo
ooooo
ooooo
ooooo
ooooo

ORDER
ORDER
ORDER
ORDER
ORDER

BY
BY
BY
BY
BT

DESCRIPTION
DESCRIPTION
DESCRIPTION
DESCRIPTION
DESCRIPTION

0
0
0
0
0

TERMINAL
TERMINAL
TERMINAL
TERMINAL
TERMINAL

TEST
TEST
test
TEST
TEST

POINT
POINT
POINT
POINT
POINT

PCB
PCB
PCS
PCB
PCS

ooooo
ooooo
ooooo
ooooo
ooooo

OPDER
ORDER
ORDER
ORDER
ORDER

BY
BY
8Y
BY

DESCRIPTION
0E8CRIPTI0N
DESCRIPTION
DESCRIPTION
DESCRIPTION

A3TP11
A3TP12

0360-0535
0360-0535

0
0

TERMINAL TEST POINT PCB
terminal test point pcb

ooooo
ooooo

ORDER BY DESCRIPTION
ORDER BY DESCRIPTION

*5Ut
A3U2
A3U3
A3U4
A3U5

1*26-0254
1826-0254
1826-0254
1826-0254
1820-1422

9
9
9
9
3

4

2

IC
IC
IC
IC
IC

047 13
04713
04713
047 1 3
01295

MC 17418CP1
MCI7P1SCR1
MC174lSCP1
MC1741SCP1
SN74LS122N

A 3U6

1P20-1796

4

1

IC DRVR TTL DUAL 2-JNP

270 14

D33611N

A3VR1
»JV«J

1902-0041
1902-0593

4
1

2
1

OIOOE-ZNR 5.11V 5X 00-35 P0*,«N
DIDDE-ZNP 4J.2V 10X DO-15 PD»|K TC»*.0SX

28460
284S0

1R02-00P1
1902-0593

4

OP
OP
OP
OP
MV

AMP
AMP
AMP
AMP
TTL

CP
GP
CP
GP
LS

8-0IP-R
B-OIP-P
8-OIP-P
8-OIP-P
MQNOSTBL retrig

BY

1

ASSEMBLY,

28460

Otpl1-445SP

MCI
A«C 2
40C3

01*0-0228
0160-2055
0160-0158

6
9
9

1

CAPaCITOR-FXO 22UF7-10X 15V0C TA
CAPACITOR-FXD .01UF ♦80.20X 100VDC CER
CAPaCITOR-FXO 5600PF ♦-10% 200VDC POLYE

56289
28460
28460

I500226XR0I582
0160-2055
0160-0158

AitHl

2360-0113

2

22

SCREW-M»CH 6-J2 ,25-in-ls prn-ho-pozi

ooooo

order by description

A4MP1

01611-04701

3

1

SUPPORT. KEYBOARD

26460

01611-04701

AORI
*P»2

0757-0416
0684-2711

7
4

1
1

RESISTOR 511
RESISTOR 270

24546
011*1

CP-l/S-TO-StlR-F
CS2711

A«S1AuSus

3101-2137

7

SWITCM-PB SPST-NO mOM

APU5

1820-1418
1820-0535
1820-0535
1820-0535
1820-0535

7
7
7
7
7

IC
IC
IC
IC
IC

A4*l

01611-61604

5

A5

01611-66505

5

A5C1
A5C 2
5 3
5
A5C5

0140-01BS
0160-2150
0180-0229
0180-0155
0180-1746

5
5
7
8
1

*4

A«U|
A 4U2
44U3
A«UU

AC
A CU

KEYBOARD

IX .125P P TC»0*-100
10% ,25« FC TC»-400/*600

2

■

1

AbI
1

13

DCDP
DRVR
DRVR
DRVR
ORVR

TTL
TTL
TTL
TTL
TTL

LS BCO-TO-OEC 4-T0-10-LINE
AND DuAL 2-INP
AND DUAL 2-INP
AND DUAL 2-INP
AND DUAL 2-INF

CABLE ASSEMBLY,

KEYBOARD

26460

B
1
B
>1
■ ..1

3101-2137

5N74L842N

01295
01295

SN7545JBF
SN75451BR
SN75451BF
SN75451BF

28480

01611-61604

S S

Board assembly, microprocessor and
KEYBOARD SCAN

2 4 0

01611-66505

CAPACITOR.FXD 200FF *-5x 300VDC MJCA
CAPACITOR-FXO 33PF 7-5X SOOVDC MICA
CAPACITOR.PXO SJUPY-10X 10VDC TA
CAPACITOR-FXD 2.2UF7-20X 20VDC TA
CAPACITOR-FXD 1 5UF +80-20% 100VDC CER

72136

DMl5F20lJ0»00"VlCR
0160-2150
1500 6
2
1500225X0020A2
0180-1746

SJ XROIOS

_
See introduction to this section for ordering information
^Indicates factory selected value

6-11

Model 1611A

## Page 28


Replaceable Parts

Table 6-2. Replaceable Parts (Con’t)

Reference
Designation

45C*
* SC I 0

HP Part
Number

c
D

0160-2055
0160-2055

9
9
9

0180-0229
0160-3951

7

0757-0927
0761-0059

■

1

Mfr
Code

Description

Qty

CAPACITOR.PxD
CAPaCITOR-FXD
CAPaCITOP-FXO
CAPaCITOP-FXO
CAPACITOR.PXD

,0luP ♦80-20% IOOVOC
.OiUF ♦80-20X 100VDC
,01 UR -80-20% IOOVOC
3SUF+-10% 10VDC Ta
,olUF -80-20% IOOVOC

RESISTOR

|,55

I*

330 5% lit MO TC«0 —200
330 5x 1* *0 TC«0+-2O0
IK 1% .125k R TC*0*-l0O
330 10* .25* FC TCb-900/+600

.125*

F

CER
CE«
CER
CER

TCi0t-100

Mfr Part Number

28a6o
28980
28980
56289

0160-2055
0160-2055
0160-2055
1500336X801082

28980

0160-3951

29596
28980
28980
29596

C8-1/S.T0-1501-R
0761-0058

0112]

CB3311

A5RU

0757.02B0

0
e
e
3

A5«5

0689-5311

2

RESI5T0R
RESISTOR
RESISTOR
RESISTOR

* 5k 7

0757-0279
0698-3159

A5R8
*5*9

0757-0280
0757-0929

3.16K
R.22K
IK U
1.82K
|K ix

|% .125W R TCR0--100
1% ,125-f R TC«0*-1"0
'.125* F TC»0+-!00
1% ,I25n R TC*0*-100
.125* F TC»0*-100

C8-1/S.T0-3161-R
C9-1/8-T0-9221-F
C9.1/B-T0-1001-F
C9-1/0-TO-1821-F

0757-0280

RESISTOR
RESISTOR
RESISTOR
RESISTOR
RESISTOR

29596
29596
29596
29596

*5»I0

0
0
3
2
3

29596

Cv-l/S.TO-lOOl-R

i5k 1 ?
A5R1 3

0757-0280
0757-0929
0698.0089
0757-0927

3
2
9

1

RESISTOR
RESISTOR
RESISTOR

IK 1%
1.S2K
2.15K

,1250 R TC.O —100
1% ,1250 R TC«0--100
\% ,125* F TC«0+-1(>0

ca-i/s.To-looi-R
C«.1XS-T0.1S21-E
C9-1/S.T0-2151-F

*5»15

0757-0920

0
3

1

RESISTOR
RESISTOR

1.5k 1% .1250 R TC*0--100
750 1% .1250 R TC*0 —100

29596
29596
29596
29596
29596

0360-0535

0
0

A5TP3

0360-0535
0360-0535

TERMINAL
TERMINAL
TERMINAL

TEST
TEST
TEST

A5R1
A5R2

AST'5

0360-0535

0
0
0

0360-0535

0

HBBH

ASTB?
45TP9

0360-0535

0

POINT
POINT
POINT

OOOOO
ooooo

PCS
PC0
PCB

terminal
TERMINAL

test
TEST

point
POINT

pcb
PCS

TERMINAL
TERMINAL
terminal
TERMINAL

test
TEST
test
TEST

POINT
POINT
point
POINT

PCS
PCS
PCS
PCS

OOOOO
ooooo
ooooo
ooooo
ooooo
ooooo
ooooo

1820-1112
1820-1201
1820-1199

8
6
1

9
a

IC
IC

RR TTL LS 0-TTPE POS-EOGE-TRIG
GATE TTL LS AND QUAD 2.INP

2

1820-0971
1820-1217

0
9

l
1

IC
IC

INV
INV

A5U6

1820-1922

A5U7

1820-1969

3
3
0

2
2

ASU1
45U?
A5U3
A5UU
A5U5

1820-1198
1820-1198
A5U10
A5U1 1
A 5U1 2
A5UI3
A5U1 u
A5U15

1820-1201
1820-1783
1820-1991
1820-120?
1B20-1P25
1821-0001

A5U1 9

1821-0001
1820-1282
1820-1939
1820-1939

45U20

1820-1201

A5U16
A5lil 7

0
6
9

1

6
2

2
1

6
U

2
2

a
3
2
2
6

*5U2 ]

1820-19Q1

A5U22
A5U23
A5U2U

1820-1196
1820-1929

6
8
0

1810-0283
1810-0099

1
7

ASU26
A3U?7
A5U28

1810-0099

»5VRt
A5XU1J

1200-0659

A5KY1

1200-0761

A5Y1

0910-1003

6

A6

0l6ll-66»«6

6

A5U25

1
9

TTL
TTL

LS HEX 1-INP
HEX 1-1Np

BY
BY

DESCRIPTION
DESCRIPTION

ORDER
ORDER

ST
BY

DESCRIPTION
DESCRIPTION

ORDER
ORDER
ORDER

By
BY
By

DESCRIPTION
DESCRIPTION
DESCRIPTION

ORDER

BY

DESCRIPTION

8N79L379AN
SN79LS08N

01295

SN7906N
SN78LS151N

description

SN79LS09N

IC
IC

MV TTL LS MONOSTBL RETRIG
CNTR TTL SIN AsYNCHRO NEG.EDGE-TRIG

01295

IC
IC

GATE
GATE

TTL
TTL

LS
LS

NAND
NAND

SN78LS0SN
SN79LS03N

IC

GATE

TTL

LS

AND

01295
01295
01295
01295

TM86060AN
8N79LS367AN

IC
IC

GATE TTL LS NAND
SCHMITT.TRIG TTL
ARRAY

2-INP
2-INR
2-INR

HEX

QUAD

PL3TC

2-INP

DIP

lA-PJN PLSTC DIP
BAR POS-EOGE-TRIG

MUXP/DATA-SEL TTL LS
MUXR/DATA.SEL TTL LS
GATE TTL LS AND OUAD

2-TO-I-LINE
2-TO-I-LINE
2-INP

SEP TTL LS NON-INV H|X 1-INP
FF TTL LS D.TVPE POS-EOGE-TRIG

IC CNTP TTL
NETWORK.RES
NETWORK-RES

LS OECD SYNCHRO
16-DIP270.0 OHM x 6
12-SIP6.8K OHM x 10

1

NETHDPK-PES
NETWORK-RES

12-SIP6.Sk
9-SIP200.0

1810-0121

7
6
6

NETwORK-RES

9-3iP1,OK

1902-3092

1

1

DIODE-ZNR

8.99v

7

1

SOCKET-IC

PO-CONT

7

1

3DCKET-XTAL

1

CRYSTAL-QUARTZ

1

BOARD

2%

Do-35
dip

2-CONT

ASSEMBLY,RAM

l

SN79LS3ON

01928
01295
01285

C*10«6
8N78LS108AN
3N79L325BAN
8N79LS258AN

01295
01295
01295

8N79LS132N
CA3096

8N79L808N
8N79L8367AN
8N79LSJ79N
INT8LS1S0AN
1810-0263
1810-0099

10
6
8

28960
91637
91637

1810-0088
CSP08C0T-20IJ
C8P08COT-102J

pD».IIH

26980

1902-3082

2SUS0

1200-0659

X
X
x

dip-sldp

HC-6/U

10.000

8N79L808N

01295
01285
0192B

01295
01295

COM

SN79LS122N
8N79393N

28980
26960

OHM
OHM
Ohm

01285

0 1 285

1-INP

B-INP
LS NAND

18-PIN

TRANSISTOR ‘PRAY
IC FF TTL L8 J-K

IC
IC

GUAO

NMO8 8-BIT
LS NON-INV

TRANSISTOR

IC
IC
JC

QUAD
QUAD

5
2
1
2

l8l0-0163

by

ORDER
ORDER

01295
01295
01295
01 295

S-TO-t-LINE

order

MUXR/OATA-SEL

MICPROC
BRR TTL

LS

C 9-1/B-T0-1501-F
C 9-1/6-T0-751—F

IC

IC
IC

TTL

0761-0059

DIP-SLDR

MHZ

DISPLAY

FORMAT

28980

1200-0761

28980

0910-1003

28880

Olbl1*66506

28880
28980
72136
56289
28980

0160-2306
0160-2306
DMl5Pl6U0300HVtCP
1500226X901882

28980

0160-2055

2SPS0
28980
28980
28980

0160-2055
0160-2055
0160-1055
0160-2055

generator
AfeC 1
A6C2
A bC 3

0160-2306
0160-2306
0190-0197

3
3
9

6

AfcCU
A bC 5

0180-0228

net
AbC7

0160-2055

9

0160-2055

AtCS
AbC9

0160-2055
0160-2055

AbC 1 0

0160-2055

9
9
9
9

0160*209?

9

2

CAPACITOP.RXD

2?PR

1

CAPACITOR-RXO
CAPACITOP.RXD

27PR —5% 300V0C MICA
ISOPR --5% 300VDC “ICA

—5%

300VDC

MICA

CAPACITOP.RXD
CAPACITOR-RXO

22UR--10X 15VDC TA
.01UR *80-20% 100V0C

CER

CAPAciTOP-RXO
CAPACITOR-RXO
CAPACIT0P-R%0
CAPACITOP.RXD

.01UR
.OIUR
.01 UR
,01UE

-80-20%
-80.20%
-80-20%
-80.20%

100VOC
IOOVOC
IOOVOC
IOOVDC

CEP
CEP
CEP
CER

CAPACITOR-RXO

.OiuE

-80-20%

IOOVOC

CEP

See introduction to this section for ordering information
♦Indicates factory selected value

6-12

0160-2055

Replaceable Parts

## Page 29


Model 1611A

Table 6-2. Replaceable Parts (Con’t)

Mfr
Code

HP Part
Number

c

AfeCl t
A6C1?
AfcCtJ
A6C14
A6C15

0160-2055
0160-2055
0160-2055
0160-2055
0160-2055

9
9
9
9

capacitor.fxo
CAPACXTOR-FXO
CAPACITOR.FXO
CAPaCITOR-FXD
CAPACITOR.PXD

cer
CER
CER
CER
CER

28RS0
26460
28460
2S4S0
26460

0160-2055
0160-2055
0160-2055
0160-2055
0160-2055

AbClS

0160-2055

9

CAPACITOR.PXD .OIUF *60-S0X IOOVDC CER

26460

0160-2055

1

A6*4
A6»5

0757-0430
0757-0930
0757-0391
0757-0930
0757-0280

5
5
7
5
3

RESISTOR
RESISTOR
RESISTOR
RESISTOR
RESISTOR

*6*6
A6«7

0757-0005
0757-1090

8
5

1
1

AfeT^I
AbTP?
A6TP3
AfeTBu
AfcTPS

03b0-0535
0360-0535
0360-0535
0360-0535
0360-0535
0360-0535
0360-0535
0360-0535

Reference
Designation

*6*1
A6R2

D

Description

Qty

9

.oiuf
,0luF
.OIUF
» 01 UF
.01UP

*eo-2ox
+80-20X
*60.20X
♦80-20X
*60.SOX

ioovdc
IOOVDC
IOOVDC
ioovdc
1O0VDC

2.21* ijj ,125* F TC«06-100
2,21* IX ,125ft F TC"0+-100
39.2 1* ,125ft F TC«0*-100
2.21K IX .125N f TC»0*-100
IK 1* '.125* F TCi0*-100

■T - Wm
*54

Mfr Part Number

C4.1/8.T0.22I1.F
C4.1/S.T0-2211-F
C4.|/6.T0.39R2-F
C«-l/6-T0-2211-F
C4-1/6.TO-1001-F
C4.1/8.T0.2T4R.F
0757-1090

RESISTOR 274
RESISTOR 261

1% ,125" P TCPO*.100
IX ,5W F TC"Ot-100

24546
26480

0
0
0
0
0

TERMINAL
TERMINAL
TERMINAL
TERMINAL
TERMINAL

TEST
TEST
TEST
TEST
TEST

ROINT
POINT
POINT
POINT
POINT

RCB
PCS
PCS
PCB
PCB

00000
00000
ooooo
00000
ooooo

ORDER
ORDER
ORDER
ORDER
ORDER

6Y
BY
BY
SY
BY

DESCRIPTION
DESCRIPTION
DESCRIPTION
DESCRIPTION
DESCRIPTION

0360-0535

0
0
0
0
0

terminal
TERMINAL
terminal
terminal
TERMINAL

test
TEST
TEST
test
TEST

point
PDINT
POINT
POINT
POINT

PCB
PCS
PCB
PCB
PCS

ooooo
ooooo
ooooo
ooooo
ooooo

ORDER
ORDER
ORDER
ORDER
ORDER

by
BY
BY
0V
BY

description
DESCRIPTION
DESCRIPTION
DESCRIPTION
DESCRIPTION

1820-1196
1820-0663
1820-1285

8
b
6

AfeUu
AbU5

1820-1930

3

ff ttl ls d-type POS-EDGE-TRIG COM
INV TTL s hex 1-INP
GATE TTL LS lNO-OR*INV 4-INP
FF TTL LS D-TYPE POS-EDGE-TRIG COM
CNTP TTL LS SIN JVNChPO POS-EDGE-TRIG

01295
012R5
01295
01295
01295

SN74LS174N
SN74304N
3N74LS54N
SN74LS174N
SN74L8161AN

AfeUfe
Abur
AfeUS
AbU9
AbUI 0

1820-1929
1820-1930
1820-1930
1820-1202
1820-1202

0
3
3
7
7

01295
01295
01295
01295
01295

SN74LS160AN
8N74LS161AN
SN74LS16IAN
SN7aLSlON
8N74LS10N

AbUI 1

1820-1930
1820-1930
1818-0237
1820-1092
1818-0348

3
3
1
3
5

01295
01295
14936
01295
07263

SN74LS161AN
SN74L5161AN
RO-3-2513
SN74165N
2102LHPC

AbU20

1018-0308
1616-0)66
1818-0348
1818-0348
1818-0348

3-S
).S
3-3
3-S
3-S

07263
07263
07263
07263
07263

2102LHPC
2102LHPC
2102LHPC
2102LHPC
2102LHPC

AbU2l
AbU22
AbU23
AbU2<J
AbU25

3.3
3-S
TPL 3»INP
ROS-EOGE-TRIG coh
POS-EDGE-TRIG COM

07263
07263
01295
01295
01295

2102LHPC
2102LHPC
SN74LS10N
8N74LS174N
8N74LS174N

IC INV TTL LS HEX
IC GATE TTL S AND-OR-INV DUAL 2-INP
IC FF TTL LS D-type POS-EDGE-TRIG
IC INV TTL LS HEX
IC SCHMITT.TRIG TTL LS NAND DUAL 4.IMP

01295
01295
01295
01295
01295

SN74LS05N
SN74S51N
SN74LS74AN
SN74LS05N
SN74LS13N

IC
IC
IC
IC

01295
01295
01295
01295

SN74LS15?N
SN74L3157N
SN74LS157N
SN74LS00N

DXOdE-ZNP 5,11V 5X 00-35 PD".4ft

26480

1902-0041

AfeTP?
AfcTPS
A b T P9
A6r^1 o
AbUI
A6U2

1

3

6

11

IC
IC
IC
IC
IC

IC CNTR TTL LS DECD SYNCHRO
IC
IC
IC
IC

CNTR
CNTR
GATE
GATE

IC
IC
IC
IC
IC

CNTR TTL LS BIN SYNCHRO
CNTR TTL LS BIN SYNCHRO
RM0S 2.SK ROM CHAR GEN
SHF-RCTR TTL R-S PRL-IN
N“OS 1* RAM STAX S-S

5
5
5
5
5

IC
IC
IC
IC
IC

NMOS
NMOS
NMOS
NMOS
NMOS

1818-0348
1018-0348
1820-1202
1820-1196
1820-1196

5
5
7
8
8

IC
IC
IC
IC
IC

N“OS IK ram STAT
NMOS IK RAM sriT
GATE TTL LS NANO
EF ttl LS D-TYPE
ff TTL LS D-TYPE

AbU?b
AbU27
AbU?a
AbU?9
A6UJ0

1820-1200
1820-1158
1820-1112
1820-1200
1»20-|4|5

5
2
8
5

4

1

A6U3l
AfeU3?
A&U33
A6U5U

1020-1470
1020-1470
1820-1470
1020-1197

1

11

9

AbVRl

1902-0041

a

47

01611*66577

l

1

BOARD ASSEMBLE,

28480

0 1 6l 1-66577

A 7C 1

0140-0196
0160-2308
0160-2055
0121-0201
0180-0228

3

2
1

1
6

1

CaPaCITOR-FXO 150PF +-5X 30OV0C MICA
CAPACIT09-FX0 36^F *-5X 300VDC MICA
CAPACITOR-FXO .01UF *«0-20X 100VOC CER
CAPACITOR-FXD 1 2PF 500WVDC MICA
CAPACITOR-FXD 22UF+-10X 15VDC TA

72136
28480
28400
28480
56289

DM15F151J0300ftVlC«
0160-2300
0160-2055
0121-0201
150D226X9015B2

014Q-0149
OlbO-2058

6
9
9
9
9

1

CAPaCItOr.F*0 47oRF *.5X 300yOC mIC*
CAPACITOR-FXO ,01iif *sO-20X ioovdc CER

72136
20400

0Mi5F471J0300«v1Cr
DlsO-2055

CAPACITOR-FXO
CAPACITOR-FXD
CAPACITOR-FxO

,01UF
.OlUF
,01llF

*SO-SOX
♦80-20X
*80-20X

IOOVDC
IOOVDC
100V0C

CE»
CF»
CEH

28«80

0160-2055
0160-2055
0160-2655

CAPACItOr.F*0
CAPACITOR-FXO
CAPACITOR.FXO

.OIuF
,01UF
.OIUF

*B0-20X
*80-2OX
»80-20X

IOOVDC
IOOVDC
IOOVDC

CER
CER
CE»

20400

CAPaCITOR-FXD
CAPACITOR-FXD

150PF *-5X 3Q0VDC MICA
,tUF ♦B0-20X 5ftVPC CER

A 6U1 3
AbUltt
A6U15
AbUI b
A bU 1 7
AbUI 8

A7C2
A 7C 3

A ?C 4
A7C5
ilCb

A7C7
A 7CS
A 7C 9
A 7C t ft

0160-2055
0160-2055
0160-2055

»7C| 1
A 7C 1 ?
A 7C 1 3
A7C14

0160-P055
01b0-2055
0160-2055
01ao-0196

*7Cl5

0160-3943

5

1
1
8

2
1

1

1

5
9

1

9
9
9
3
1

3

TTL
TTL
TTL
TTL

IK
IK
IK
IK
1*

LS
LS
LS
LS

BIN SYNCHRO P06-EOGE-TRIG
BIN SYNCHRO ROS.EOGE.TRIG
NANO TPL S-INR
NANO TPL )*INP

Ram
RAM
RAM
RAM
RAM

bTaT
STAT
STAT
STAT
STAT

ROS-EOGE-TRIG
ROS.EOGE.TRIG
450-NS )*S
SERIAL-OUT

MUXR/DATA-SEL TTL LS 2-T0-1-LINE QUAD
MUKR/DATA-SEL TTL LS 2-T0-1-LINE QUAD
MUXPyDATA-SEL TTL L3 2-TO-i-LINE QUAD
GATE TTL LS NANO QUAD 2-INP

COMPARATOR

28480
28400

28480
28(100
72136
20400

See introduction to this section for ordering information
indicates factory selected value

0160-2055
0160*2055
0160-2055
DM15F151J0300ftVlCP
0160-3443

6-13

Model 1611A

## Page 30


Replaceable Parts

Table 6-2. Replaceable Parts (Con’t)

HP Part
Number

C

A7CI6
*7C17

0160-3443
oibo-saas

t
t

A 7R1
A7&2
A7R3
A7R4
A7R5

0757-oan
0757-042*
0757.042a
0757-0«2(i
0757-042’

4
2
7
7
2

A7R7
A?R8
A?R*
A ?R 1 0

0757-0438
0757-0438
0757-0401
0757-0015
?100-S“89

3
3 ■
0
6
9

A 7 R1 i
A7R1?

0757-0413
B100-S9B9

A7TRf
A7TR?
A 7 T R1
A7TRA
A7TPS

0380-0535
0360-0535

A7TP6

Reference
Designation

D

Mfr
Code

Description

Qty

Mfr Part Number

CAPACITOR-FXD , 1UF ♦80-201 50VDC CER
capacitor-fxd .iuf *»o-?o* sovoc cer

28480
28460

0160-3443
0160-3443

RESISTOR
RESISTOR
RESISTOR
RESISTOR
RESISTOR

24546
24546
24546
24546
24546

C9.1/8-T0-J9JR-F
C9.1/S.T0.18S1.F
C4-1/8-T0-1101-F
C4-1/6-T0-1101-F
C9-1/8.T0-1BSI.F

RESISTOR 5,11* IX .125* * TC«ot-100
RESISTOR 5.1 IK U ,125« F TC*0»-100
RESISTOR 100 1* .125W F TC»0*-100
RESISTOR 975 IS ,125« F TC*0»-100
RESISTOR.TRMR 5* 10X C 8IDE-ADJ 1-TRN

24546
24546
24546
24546
30*83

ca-i/e-To-5t1l-F
C4-1/8-T0-51H-F
C4-1/6-T0-101-F
C9.1/B.T0-975R-F
ET50X502

4
9

RESISTOR 392 IS .1251* F TC«0*-100
RESISTOR.TRMR 5K 10S C SI0E-60J 1-TRN

24546
30983

C9-1/B.T0-J9JR.F
ET50X502

0
0
0
0
0

TERMINAL
TERMINAL
terminal
terminal
TERMINAL

PCB
PCB
PCB
pcb
PCB

ooooo
00000
ooooo
ooooo
ooooo

ORDER
ORDER
ORDER
ORDER
ORDER

0360-0535

0

TERMINAL TEST FOINT PCB

ooooo

A 7 U1
A 7U2
A7U3
A7U«
A7U5

1820-1782
1616-0*13
1816-0*13
1816-0913
1820-1285

8
6
6
6
6

IC
IC
IC
IC
IC

MV TTL S M0N03TBL RETRIG/RESET DUAL
TTL 8 64-BIT RaM STAT 110-NS 0-C
TTL S 64-BIT RAM STAT 110-NS O-C
TTL 5 64-BIT RAm STAT 110-NS 0-C
CATE TTL LB ANO-OR.INV 9-INP

39335
34335
34335
34335
01295

AM|6S0|PC
AM31L01PC
AMSILOJPC
AM31L01PC
SN74LS54N

A7Ub
A7U7
A7U8
A7U*
A7U10

1820-1112
1820-1285
1820-0691
1820-1202
1816-0*13

8
6
6
7
6

IC
IC
IC
IC
IC

FF TTL LS D.TYPE POS-EDGE-TRIG
GATE TTL LB jND*0R-INV 9-INP
GATE TTL S AND-OR-INv
GATE TTL LS NANO TPL 3-INP
TTL S 64-BIT RAM STAT 110-NS 0-C

012*5
012*5
01295
01295
34335

SN74LS74AN
SN74LS54N
SN74S64N
SN74LS10N
amjiloipc

A7U1I
A 7U1 2
A7UI 3
A7U10
A7U1S

1816-0*13
1*16-091J
1816-0*13
1816-0*13
1816-0*13

6
6
6
6
6

IC
IC
IC
IC
IC

TTL
TTL
TTL
TTL
TTL

34335
34335
34J35
34335
34335

AMJIL01PC
AM31L01PC
AM31L01PC
AM3IL01PC
AMJILOIPC

A7U16
A 7 U1 7
A7UI 8
A7UJ9
A 7U2 0

1816-0*13
lm-oii j
1820-1195
1820-1203
1820-1212

6
6
7
8
9

IC TTL S 64-BIT RAM STAT 110-NS 0-C
IC TTL S 69.BIT RAM STAT 110-NS 0-C
IC FF TTL LS D-TYPE POS-EOGE-TRIG C0«
IC GATE TTL LS AND TPL 3-IN*
IC FF TTL LS J-K NEG-COGE-TRIG

34335
34335
01295
012*5
01295

AM31L01PC
AMJILOl'C
SN74LS175N
SN74LS1IN
8N74L5112AN

A7U21
A 7U22
A 7U23
A ?Ug t*
A7U25

l»J0-06j!
1820-1470
1820-1470
1820-1470
1820-1470

4
1
1
1
1

IC
IC
u
IC
IC

CATE TTL S NaND GUaD
MUXR/DAT4-8EL TTL LS
MUXR/OATA-SEL TTL LS
MUXR/OATA-SEL TTL LS
MUXR/OATA-SEL TTL LS

QUAD
QUAD
GUAD
QUAD

01295
012*5
012*5
012*5
012*5

SN74S00N
SN74LS157N
SN74LS157N
5N74L5157N
SN74LS157N

A7U2b
A 7U27
A7U28
A7U29
A7U30

1820-1470
1820-1470
1820-1470
1820-1470
1820-1418

1
1
1

IC
IC
IC
IC
IC

MUXR/0ATA-3EL TTL LS 2-TO-l-LINE QUAD
muxr/oata-sel TTL LS 2-TO-I-lINE Quad
MUXR/OATA-SEL TTL LS 2-TO-l-LINE QUAD
M(jxR/DATA-SEL TTL LS 2-TO-l-LINE QUAD
DCDR TTL LS BCD-TO-DEC 4-T0-10-LINE

012*5
012*5
012*5
012*5
01295

SN74L8157N
SN7U(.S157N
SN74LS157N
8N74LS157N
8N74LS42N

A 7U31
A7U3?

7

A7U33
A7U3U
A7U38

1820-1202
1620-0691
1820-0686
1820-121?
1810-0041

IC CATE TTL LS NANO TPL 3-INP
IC GATE TTL S AND-OR-INV
IC GATE TTL S AND TPL 3-INP
IC FF TTL LS J-K NEG-EDGE-TRIG
NETWORK-RES *-SlP2.7K OHM X 8

012*5
012*5
012*5
012*5
26460

SN7ULS10N
SN74864N
SN74S1IN
SN74LSJ12AN
1*10-0091

A7U36

1810-0041

9

N£TWORK-RES 9-SIP2.7K OHM

26460

1810-0041

AB

01611-66535

1

1

BOARD ASSEMBLY,

28480

01611-66535

A 8C 1

0140-0203
0140-0203
0160-0196
0180-0228
0160-3451

3
3
5

2

CAPACITOR.FXD 30PF *-5X 5O0VDC mica
CAPACITOR.FXD 2<jPF 4-5X 300VDC MICA
CAPACItOP-FxO 22uFt-I0* 15V0C T‘
CAPACITOR-FXD ,91UF ♦80-20X 100VDC CER

7213b
72136
2848o
56289
28480

DMi5E300Jo500*VlCR
DV15E300J0500WVICR
0160-0196
150D226X9015B2
0160-3451

0160-3451
0160-3451
0160-3451
0160-3451
0160-J951

1
1

1

CAPACITOR-FXD
CAPACITOR-FXD
CAP4CIT0R-FXD
CAPACITOR-FxD
CAPACITOR-FXD

♦b0-20X 100VDC CEP
.80-20X IOOVDC CER
♦80-20X 100VDC CER
+80-20X lOOvDC CER
TB0-20X lOOVOC CER

28480
28480
28480
26480
26460

0161*345 1

ABC*
ABC 9
*»C 1 0

0160-1951
0160-3451
0160-3451
0160-1951

abch
A8Ct?
ABC13
A8C19
ABC1S

0160-3451
0160-3451
0160-3451
0160-3451
0150-0051

1
l
1

CAPACITOR-FXD .OlUF +80-20X lOOVOC CER
CAPACITOR-FXD ,01UF +80-20X IOOVDC CE»
CAPACITOR-FXD .OlUF TB0-20X lOOVOC CER

28480
26480
28480
28480
28480

0160-3451
0160-3451
0160-3451
0160-1951
0150-0051

A 8C 2

A8C3
AgCu
A BC 5

A 8C 7

0360-0535
0360-0535

Hiin

t
11

2

1
1
3
1

1
7

fa
9

]

9
9

2

TE8T
TEST
test
test
TEST

1
1

CAPACITOR-FxD
1

POINT
POINT
POINT
point
POINT

64.BIT
64-BIT
64-BIT
64-BIT
64-0IT

CAPACJTOR-FxD
1

b
1

1
0

S
S
S
S
S

3R2 1* .125W F TCROT-100
1,82* i* ,125* F TC«0t-l00
1.1* 1* .125w F TC*0«-100
I.IK 1* .125" F TC*0*-I00
1,82* i% ,125* F TC«0>-100

RAM STAT 110-NS 0-C
RAM STAT 110-NS 0-C
STAT 110-NS 0-C
RAM STAT 110-NS 0-C
RAM STAT 110-NS 0-C

RAM

2-INR
2-T0-1-LINE
2-T0-1-LINE
2-TO-j.LJNE
2-T0-1-LINE

X

DATA STORE

30P8

,01UF
.01UF
.OlUF
,01UP
.0)JF

,01UF

t-5X

8

AND COUNTERS

500VDC

♦B0-20X

CARaCITOR-FXD 100PF *80-20*

«lCA

100VDC

CER

1KV0C CEP

See introduction to this section for ordering information
indicates factory selected value

6-14

By
BY
BY
BY
BY

DESCRIPTION
DESCRIPTION
DESCRIPTION
DESCRIPTION
DESCRIPTION

ORDER BY DESCRIPTION

Replaceable Parts

## Page 31


Model 1611A

Table 6-2. Replaceable Parts (Con’t)

Reference
Designation
‘SCH,

HP Part
Number
D1BD-344?
J901-0OU0

C
D

Qty

5

1

1

28U80

0698-5068

1

RESISTOR

100

01121

BB1015

terminal

test

point

pcb

ORDER

BY

DESCRIPTION

terminal
terminal

test
test

point
point

pcs
PCB

ORDER
ORDER

BY
BY

DESCRIPTION
DESCRIPTION

TERMINAL
TERMINAL

TEST
test

POINT
point

PCB
PCB

00000
ooooo
00000
ooooo
O0O00

ORDER
ORDER

BY
BY

DESCRIPTION
DESCRIPTION

TERMINAL

test

POINT

PCB

TERMIML
TERMINAL

test
TEST

POINT
POINT

PCS
PCB

ooooo
ooooo
ooooo

ORDER
ORDER
ORDER

BY
8Y
BY

DESCRIPTION
DESCRIPTION
DESCRIPTION

1

MT*1
A8TP?
ABTPJ
ASTPu

0390-0535
0390-0535
0390-0535
0390-0535

0
0
0
0

»BT»S

0390-0535

0

MTp6
A8TP7

0390-0535
0360-0535

0
0

*6TpB

0390-0535

0

A8U1
*8U2

1820-1U9U
1B20-JU25
1820-11UU

3
6
9
u
9

pin

CC

TC«-27o/*540

IC

CNTR

IC
IC
IC
IC

SCHMITT-TRIG ttl LS NiND QUto 2-INP
GATE TTL LS NOP QUAD 2-INP
mV TTL LS MQNOSTBL RETRIG DUAL
FF TTL LS J-K NEG-EDGE-TRIG

IC

CNTR

IC
IC

INV TTL LS HEK l•InP
GATE TTL LS AND-OR-INV

IC
IC

CNTR
CNTR

TTL
TTL

LS
LS

SIN
SIN

SYNCHRO
SYNCHRO

ROS-EDGE-TRIG
POS-EOGE-TRIG

CNTR
GATE

TTL
TTL

LS SIN
S NIND

SYNCHRO
13-lN*

POS-EOGE-TRIG

1

IC
IC

1

IC
IC
IC

CNTR TTL LS BIN STNChRO POS-EOGE-TRI0
CNTR TTL LS BIN SYNCHRO POS-EOGE-TRIG
FF TTL J-K BAR POS-EDGE-TRIG

1
1

ttl

,l25W

.16*0*.J«5CG

asynchro

neg-edge-trig

A 8U5

1820-121?

A8U6
abut
A8U8
A8U9

182o-1U 30
1820-1199

3

1820-1210
1B?0-1U 30

7
3

A8U10

18?0-1U 30

3

A0U1 1
ABU)?
ABU13
ABU1U

M20-1U30

3

1820-1130
182o-1U J0

0
3

18?0-1U30

3

ABU)5

1820-1119

2

ABU) fe
ABU) 7

1820-1U1B
1820-1UJ9

DCD»

1820-1UJ9

7
2
2

IC

ABU1B
A0U) 9

IC
1C

MUXR/DBTA-SEL
MUXR/DATA-SEL

TTL
TTL

LS
LS

2.T0-1-LINE
2-T0-I-LINE

18?0-14 39
1*20-1439

2
2

IC

MUXR/DATA-SEL

TTL

LS

2-TO-i-LINE

IC

MUXR/DATA-SEL

TTL

LS

2-T0-1-IINE

1820-1439

2
2
6
7
1

IC
IC

MUXR/oATA-Sel
MUXR/DATA-SEL

ttl
TTL

LS
LS

s-to-i-line
2-TO-t-LINE

IC
IC

GATE
DCOB

IC

TTL

ABU?)
ABU??
ABU23
ABU2U
A8U25

1820-1U39
1820-1201
1820-1u1B
18)6-0728

]
1

u

1
1

A8U27

1816-0728
1816-0728
1816-0728

1

A8U30

1810-0055

0
8

A8U32
A8U33

1810-0055
1810-0055
1810-0055

2
2
5

A8XU28

1200-0567
1200-0567
1200-0567

1

1

4

1
1
1

TTL

TTL

IS

LS

BIN

SYNCHRO

BCD.TO.DEC

POS-EOGE-TRIG
DUAL

2-INP

4-TO.IO-LINE

01295
012R5
01295
01295
01295

SN7U393N
SN7ULS132N
3N74LSQ2N

01295
01295
01295
01295

SN7ULS16MN

01295
01295
01395
01295
01295
01295

SN7ULS123N
SN7ULS112AN

SN74LS0UN
SN74LS51N
5N74u5161 AN
SN74LS161AN
SN7«LSl6l*N
SN7US133N
8N7ULS161AN
SN74LSIM*N
8N7U109N

01255
01295
01295
01295
01295

SN74LSU2N

01295

SN74LS258AN
SN74LS258AN

SN7ULS256AN
SN7ULS258AN
SN7ULS258AN
8N7 RlS?5SA N

0-C

01295
01295
01295
1B32U

IC TTL S RAM STAT 50-NS 0-C
IC TTL S RAM STAT 50-NS 0-C
IC TTL S RAM STAT 50-NS 0-C
IC GATE TTL LS AND DUAL 4-INP
IC FF TTL LS D TYPE POS-EDGE TRIG

18324
18324
18324
01295
01295

N82S09I

IC MUXR/DATA-SEL TTL LS 2-T0-1 -LINE
NETWORK-RES 9-SIP 10.0K OHM X8
NETWORK-RES 9-SIP 10.0K OHM x8

01295
28480
28480

SN74LS258AN
1810-0055
1810-0055

SOCKET-IC 28-CONT DIP DIP-SLDR
SOCKET-IC 28-CONT DIP DIP-SLDR
SOCKET-IC 28-CONT DIP DIP-SLDR
SOCKET-IC 28-CONT DIP DIP-SLDR

28480
28480
28480
28480

1200-0567
1 200-0567

TTL
TTL
S

RAM

LS
LS

AND QUAD 2-INP
BCD-TO.DEC A.TO.IO-LINE

STxT

50.NS

SN74LS0BN
SN74LS42N
N82S09I

1200-0567

BOARD ASSEMBLY, PERSONALITY
BOARD ASSEMBLY-PERSONALITY
(SEE MANUAL SUPPLEMENT FOR OPTION

A9
A9

INSTALLED

IN

VOUR

INSTRUMENT)

A)0

BOARD ASSEMBLY-ROM
(SEE MANUAL SUPPLEMENT FOR OPTION
INSTALLED IN YOUR INSTRUMENT)

All

assembly-personality panel
(SEE MANUAL SUPPLEMENT FOR OPTION
INSTALLED IN VOUR INSTRUMENT)

A1 2

9140-0210

C4.W8.T0.5t 1 t-F
C4.W6.T0.S92R.F
CU-l/B-TO-511t-F

0998.JI|J

ASU20

19(11-0040

28480

C4.WB.To.lm-F

5X

5*

0160-3UU7

24546
24546
2U5U9

ObRB.50bB

100UH

DO-35

20U0O

24546

MRS

?NS

20400

5,llK 1* ,125>» f TC»ot.loo
5.11K 1* ,125» F TC«0*-100
592 1* ,125H F TC«0*-!00
5,1 1K IX ,125/J F TC«0 + -100
50 IX .1?5* F TC*0*-25

3
9

50yA

CE»

RESISTOR
RESISTOR
RESISTOR
RESISTOR
RESISTOR

3
3
a

30V

1KVDC

1

1

0757.0U38
0757-0U3B

1820-1U2S

4-10)5

INDUCTOBRf.CH.Mt0

R)UO-0?10

ABUS
ABUtt

U?0PF

1

»*»l
A0R2
M*J
MRU

»»»*

CAPACITOR-FXO

Mfr Part Number

DIODE-SWITCHING

Mil

0757.o*l3
0757-0U3B

Mfr
Code

Description

01611-62101

9

1

ASSEMBLY,

EXTERNAL

PROBE

2t«l0

See introduction to this section tor ordering information
^Indicates factory selected value

01611-62101

6-15

Model 1611A

## Page 32


Replaceable Parts

Table 6-2. Replaceable Parts (Con’t)

Reference
Designation

HP Part
Number

1

Mfr
Code

Description

Qty

Mfr Part Number

0141 I.66516

8

BOARD

ASSEMBLY.PROBE

28480

10230-62101

7

9

PROBE

ASSEMBLY,

28480

10230-62101

2200-011l

4
6

SGRE*.TPG

A 1

3
2

28480
00000

0624-0306
order b* description

A1?mP1
M2*P2
A1?«p3
A i

504o-8?61
5040-6260
7120-5707
5040-0563
1540-0320

2

1

BOTTOM

POD

1
1
1
1

COVER,

POD

28680
28480
28480
28480
28480

5040-8261

1
7

01611-6162?

7

28480

01611-61622
5061-1215
5061-1217
5061-1218
5061-1219

41?M

iii»P5
4l2*l
Ai 2*?
A 1 2*3
A 1 2 *5

1
4

.5- IN.LG PAN.hd.POZI STL
4-40 ,e -IN-LG Pan-md-POZI

2.28

SCPE**MACH

LABEL» EXTERNAL
CONNECTOR CLIP

PROBE

5061-1216
5061.12l»

0

1
1
1
*1
1
1
1
2

00000

28480

01611-61203

28480
56289

0160-3451

28480

1901-0025

28480
28480

1480-1473
1460-1473

28480
26480

1460-1473
1460-1473

28680

1460-1473

26460
28460

J460-1473
1460-1473
1460-1473

8
9

M2*?

5061-1221
5061-122?

A 1 2*0

5061-1223
5061-1224

1
1

CASE#
CA01E#
cable,

VINYL

cable,
CABLE,

external PROBE
black, pin adapter
WHITE/BLACK PIN ADAPTER
*hITE/BR0*N PIN ADAPTER

CABLE#

*HITE/RED

cable#
C8BUE,
CABLE *
cable,
CABLE.

whITE/ORANGE pin ADAPTER
6HITE/YELL06 PIN 40»PTE9
6HITE/G9EEN PIN ADAPTEP
WHITE/BLUE PIN ADAPTER

PIN

6HITE/VI0LET

28680
28480
28480
28480

ADAPTER

PIN

2200-0061

7

J050.0255

A 12*1H4

2190-0016
2260-0002

3
6
6

v)

Sc&EW*pach 6-60 .562-IN.LG pan-md-POZI
WASHER-EL MTLC NO. 0 .117.IN.ID
wAShER-IK HLCl NO. 4 ,115-1N.10
-40-TMD .062-IN.THK
NUT-HEX.DBL.CHAM

A 12*1Mp1

01611-61203

0

1

CABLE

0160-3451
‘|2MC?

0160-0225

1
b

iU»iC0|

1501.0025

2

AiJA\ Ej

1460-1473

A 1 2A 1 E?

0
0

A 1 2 A1 E U

1460-1473
1460-1473
1460-1473

M?4lE5

1060-167!

0

A 1 ? A1 £<i
A12A1E7
A 1 2 41 E R
A l 2 A 1 E<5

1460-1473
1460-1473

0
0

1460-1473
1460-1473

0
0

1620-1829

4

1520-1826

a

1910-0293
1810-0293

3
3

.01 UP +80-20! IOOVOC
22UF*-10X 15VDC TA

1

DIODE.SEN

100V

9

SPRING-CONT

BE

CU

NI

5PRING-C0NT
SPRING-CONT
SPRING-CONT
SPRING-CONT

BE
BE
BE
BE

CU
CU
CU
CU

NX
NI

SPRING.CONT

BE

CU

NI

SPRING-CONT
SPRING-CONT

BE
BE

CU
CU

NI
NI

SPRING-CONT

BE

CU

NI

0
0

2

IC
IC

?

NEThORK-RC
NETWORK.RC

PRP

200MA

5061-1220
5061-1221
5061-1222
5061-1223
5061-1224

28480
28480
00000

CLAMP

CAPacIT09-F*D
CAPACITOR.FXD

28480
28480
?8480
28480
28480

ADAPTEP

412*1w?

A1 2 A1 Ufl

5040-8260
7120-5707
5040-0563
1560.0520

fa

3
4
5
6
7

A1 2A1 U1
Al241U?

01611-66516

5061-1215
5061-1217

5061-1220

A 1 2* 1 0

HOOK-TYPE

C£B

DO.7

NI
NI

26460
26480

■JUJU
11
11

PIN
PIN

SIPf
SIP|

0,1
0.1

IN
IN

SPACING
SPACING

HUI'fl

0P0E9 8* DESCRIPTION
3050-0235
2190-0019
ORDER 97 DESCRIPTION

1500228X001582

1460-1473
1B20-1829
1820-1829
1810-0293
1810-0293

Table 6-3. List of Manufacture’s Codes

6-16

Mfr
No.

Manufacturer Name

00000
01121
01295
01928
03888
04713
07263
14936
18324
24546
27014
27167
27777
28480
30983
34335
56289
72136
75042
75915
84411
91637

ANY SATISFACTORY SUPPLIER
ALLEN-BRADLEY CO
TEXAS INSTR INC SEMICOND CMPNT DIV
RCA CORP SOLID STATE DIV
KOI PYROFILM CORP
MOTOROLA SEMICONDUCTOR PRODUCTS
FAIRCHILD SEMICONDUCTOR DIV
GENERAL INSTR CORP SEMIDON PROD GP
SIGNETICS CORP
CORNING GLASS WORKS BRADFORD)
NATIONAL SEMICONDUCTOR CORP
CORNING GLASS WORKS 'WILMINGTON)
VARO SEMICONDUCTOR INC
HEWLETT-PACKARD CO CORPORATE HQ
MEPCO / ELECTRA CORP
ADVANCED MICRO DEVICES INC
SPRAGUE ELECTRIC CO
ELECTRO MOTIVE CORP SUB IEC
TRW INC PHILADELPHIA DIV
LITTELFUSE INC
TRW CAPACITOR DIV
DALE ELECTRONICS INC

Zip
Code

Address
MILWAUKEE
DALLAS
SOMERVILLE
WHIPPANY
PHOENIX
MOUNTAIN VIEW
HICKSVILLE
SUNNYVALE
BRADFORD
SANTA CLARA
WILMINGTON
GARLAND
PALO ALTO
SAN DIEGO
SUNNYVALE
NORTH ADAMS
WILLIMANTIC
PHILADELPHIA
DES PLAINES
OGALLALA
COLUMBUS

Wl
TX
NJ
NJ
AZ
CA
NY
CA
PA
CA
NC
TX
CA
CA
CA
MA
CT
PA
IL
NE
NE

See introduction to this section for ordering information
indicates factory selected value

53204
75222
08876
07981
85062
94042
11802
94086
16701
95051
28401
75040
94304
92121
94086
01247
06226
19108
60016
69163
68601

Manual Changes

## Page 33


Model 1611A


## Section VII Fusion Notes

- This is one of the most important sections in the fusion.
- The `1980` manual-change table is broader and more authoritative than the `1978` one.
- The `1978` manual-change table only covers `1635A` and installed options `068/080`.
- The `1980` table expands that into explicit change sets for `1635A`, `1723A`, `2007A`, and `2017A`.
- For repair work, use the `1980` change logic as canonical and only refer back to the `1978` table if you are deliberately reconstructing earlier documentation context.

## Section VII Canonical Text

## Page 33

SECTION VII
MANUAL CHANGES

7-1.

INTRODUCTION.

7-2. This section contains information for adapting
this manual to instruments for which the content does
not apply directly.

7-3.

MANUAL CHANGES.

7-4. To adapt this manual to your instrument, refer to
table 7-1 and make all of the manual changes listed
opposite your instrument serial number. Perform these
changes in the sequence listed.
7-5. If your instrument serial number is not listed on
the title page of this manual or in table 7-1 below, it may
be documented in a yellow MANUAL CHANGES supplement. For additional information about serial number coverage, refer to INSTRUMENTS COVERED BY
MANUAL in Section I.

Table 7-1. Manual Changes
Serial Prefix

Make Changes

1635A

5 thru 1

Instruments with Options
068 or 080 installed

5 thru 2

1723A

5 thru 3

Table 6-2,
A7: Change HP Part No. and Mfr Part No. to 0161166507.
A7C2: Change to HP Part No. 0160-2204, CAPACITOR-FXD 100PF +-5% 300WVDC MICA, Mfr Code
28480, Mfr Part No. 0160-2204.
A7C4: Change to HP Part No. 0121-0202, CAPACITOR-FXD 15PF +-5% 500WVDC CER, Mfr Code
72136, Mfr Part No. DM15C150J0500WV1CR.
A7C6: Change to HP Part No. 0140-0199, CAPACITOR-FXD 240PF ±5% 300WVDC MICA, Mfr Code
72136, Mfr Part No. DM15F241J0300WV1CR.
Delete: A7R9.
Delete: A7R10.
Delete: A7U34.
A7U36: Change Reference Designation to A7U34.
A8: Change HP Part No. and Mfr Part No. to 0161166508.
Delete: A8U30.
Delete: A8U31.
Figure 8-13, Service Sheet 7 (Sheet 4 of 4):
Replace with figure 7-1.
Figure 8-14, Service Sheet 8 (Sheet 1 of 6):
Replace with figure 7-2.
Figure 8-14, Service Sheet 8 (Sheet 2 of 6):
Replace with figure 7-3.
Figure 8-14, Service Sheet 8 (Sheet 4 of 6):
Replace with figure 7-4.

CHANGE 2
Figure 8-4 (8 Sheets):
Replace with figure 7-5 (5 Sheets).

CHANGE 3

7-6.

2007A

5 and 4

2017A

5

Table 6-2,
A7: Change HP Part No. and Mfr Part No. to 0161166507, Rev B.
A7C4: Change to HP Part No. 0121-0434, CAPACITOR-VAR TRMR-AIR 2-19, 3 PF 350V, Mfr Code
74970, Mfr Part No. 189-0507-125.
Delete: A7R12.
Figure 8-13, Service Sheet 7 (sheet 4 of 4): Replace
with figure 7-6.

MANUAL CHANGE INSTRUCTIONS.
CHANGE 4
CHANGE 1

Paragraph 5-8,
Delete: 5-8. COMPARATOR ADJUSTMENT.

Table 6-2,
MP10: Change HP Part No. and Mfr Part No. to 0161100202, CD 1.

7-1

Model 1611A

## Page 34


Manual Changes

CHANGE 5

Table 6-2,
A3: Change HP Part No. and Mfr Part No. to 0161166503, CD 3.
A7: Change HP Part No. and Mfr Part No. to 0161166507, CD 7.
H14: Change HP Part No. and Mfr Part No. to 26800128, CD 7.
Add: MP4, HP Part No 1520-0063, CD 0, Qty 1, Description MOUNT, VIBRATION, Mfr Code 70485,
Mfr Part No. OBD.
MP10: Change HP Part No. and Mfr Part No. to 0161100202, CD 1.
Delete: MP27.
Delete: MP75.
A1XU1: Change HP Part No. and Mfr Part No. to 12000474, CD 9.
A3C28: Change to HP Part No. 0160-3665, CD 9, Qty 6,
Description CAPACITOR-FXD .01UF + 80-20% 500
WVDC CER, Mfr Code 28480, Mfr Part No. 0160-3665.
A3C29: Delete Qty.
A3R45: Change Qty to 1.
A3R60: Change to HP Part No. 2100-3214, CD0, Qty 1,
Description RESISTOR-TRMR 100K 10% C TOPADJ 1-TRN, Mfr Code 73138, Mfr Part No. 72-112-0.
Delete: A7C15.
A7C16: Change to HP Part No. 0160-2055, CD 9, De¬
scription CAPACITOR-FXD .01UF +80-20% 100

7-2

WVDC CER, Mfr Code 28480, Mfr Part No. 01602055.
Delete: A7C17.
A7U35: Change HP Part No. and Mfr PartNo. to 18200041, CD 0.
A7U36: Change HP Part No. and Mfr Part No. to 18200041, CD 0.
A8C6: Delete Qty.
Delete: A8C13.
Delete: A8C14.
Delete: A8C15.
Delete: A8C16.
Delete: A8R5.
Delete: A8R6.
A8U25: Change to HP Part No. 1816-0728, CD 1, Qty 4,
Description IC 82S09I RAM TTL, Mfr Code 18324, Mfr
Part No. 82S09I.
A8U26: Change to HP Part No. 1816-0728, CD 1, De¬
scription IC 82S09I RAM TTL, Mfr Code 18324, Mfr
Part No. 82S09I.
A8U27: Change to HP Part No. 1816-0728, CI) 1, De¬
scription IC 82S09I RAM TTL, Mfr Code 18324, Mfr
Part No. 82S09I.
A8U28: Change to HP Part No. 1816-0728, CD 1, De¬
scription IC 82S09I RAM TTL, Mfr Code 18324, Mfr
Part No.82S09I.
A12W1H1: Change to HP Part No. 2200-0111, CD 2, De¬
scription SCREW-MACH 440,5-IN-LGPAN-HD-POZI,
Mfr Code 28480, Mfr Part No. 2200-0111.
A12W1MP1: Change HP PartNo. and Mfr No. to0161161201,CD 8.

Model 1611A

## Page 35


Manual Changes

Replacement for figure 8-13,
Service Sheet 7, (Sheet 4 of 4)
7-3/(7-4 blank)

Manual Changes

## Page 36


Model 1611A

A

B

C

D

E

F

G

Data Store and Counters Board A8 Component Locator
(01611-66508)

ICs ON THIS SCHEMATIC
REF
DESIG

GRID
LOC

REF
DESIG

Cl
C2
C3
C4
C5
C6
C7
C8
C9
CIO
Cl 1
Cl 2
CR 1
LI
R1
R2
R3
R4
TP1
TP2

C-4
D-4
D-4
B-1
B-4
B-3
D-3
G-3
C-2
B-1
E-2
E-2
F-3
F-3
C-4
D-4
D-4
D-4
A-4
B-4

TP3
TP4
TP5
TP6
TP7
TP8
U1
U2
U3
U4
U5
U6
U7
U8
U9
U10
U1 1
U12
U13
U14

GRID
LOC

REF
DESIG

GRID
LOC

1C REF DES

B-4
B-4
C-4
C-4
G-4
A-3
A-4
B-4
C-4
D-4
D-4
E-4
F-4
G-4
A-3
B-3
C-3
D-3
D-3
E-3

U15
U16
U17
U18
U19
U20
U21
U22
U23
U24
U25
U26
U27
U28
U29

F-3
G-3
A-2
B-2
C-2
D-2
D-2
E-2
F-2
G-2
A-2
B-2
D-2
E-2
G-2

U32
U33

A-2
A-2

U1
U2
U3
U4
U5
U6, 9-11,
13, 14
U7
U8
U12
U15
U16, 24
U17-22
U23
U25-28
U29
U32, 33

HP PART NO. MFR PART NO.
1820-1464
1820-1425
1820-1144
1820-1423
1820-1212
1820-1430

SN74393N
SN74LS132N
SN74LS02N
SN74LS123N
SN74LS112N
SN74LS161N

1820-1199
1820-1210
1820-1130
1820-1116
1820-1418
1820-1439
1820-1201
1816-0728
1820-1205
1810-0055

SN74LS04N
SN74LS51N
SN74S13N
SN74109N
SN74LS42N
SN74LS258N
SN74LS08N
82S09I
SN74LS21N
1810-0055

Figure 7-2. Replacement for Figure 8-14. Service Sheet 8, Assembly A8 Component Locator (Sheet 1 of 6)
7-5/(7-6 blank)

Manual Changes

## Page 37


Model 1611A

I

I
S2©

NSTOR
,49

Model 1611A

## Page 38


Manual Changes

## Page 39


Figure 7-4.
Replacement for figure 8-14,
Service Sheet 8 (Sheet 4 of 6)
7-9/(7-10 blank)

Manual Changes

## Page 40


Model 1611A
NOTE

Procedures in this figure apply only to in¬
struments with Option 068 or 080 installed.

SIGNATURE ANALYSIS PROCEDURE NO. 1.
a.

Set 1611A LINE switch to off position.

MEASUREMENT
NUMBER

104
(Cont'd)

b. Remove A6, A7, A8, and A10 assemblies from
1611A.
NOTE

The boards installed in the 1611A for the
following measurements depend upon
the Troubleshooting Tree. Follow the
procedure given in the Troubleshooting
Tree.

105

c. Ground A5U3, pin 6.
d. Set signature analyzer controls as follows:
START
STOP..
.... j
CLOCK
HOLD .
Released
e. Connect signature analyzer probe to the fol¬
lowing circuit points:

.... x

START. A5U11, Pin 36
STOP. A5U11, Pin 36
CLOCK. A5U11, Pin 18
GND .
A5TP9 (GND)
f. Set 1611A LINE switch to on position.

106

g. Verify that signature measurements called
out in troubleshooting tree match following table.
MEASUREMENT
NUMBER

TEST POINT

SIGNATURE

101

VH

102

MEMORY BUS
A5U9, PIN 13
A5U9, PIN 9
A5U9, PIN 1
A5U9, PIN 5
A5U8, PIN 13
A5U8, PIN 9
A5U8, PIN 1
A5U8, PIN 5

VH
VH
VH
VH
VH
VH
VH
VH

DATA BUS
A5U20, PIN 8
A5U20, PIN 11
A5U20, PIN 6
A5U20, PIN 3
A5U10, PIN 8
A5U10, PIN 11
A5U10, PIN 6
A5U10, PIN 3

H335
vlp
vlp
H335
H335
H335
VLP
vlp

MP OUTPUTS
A5U11, PIN 10

H335

103

104

107

755U
108

109

110

TEST POINT

A5U11, PIN 9
A5U11, PIN 8
A5U11, PIN 7
A5U11, PIN 3
A5U11, PIN 4
A5U11, PIN 5
A5U11, PIN 6
ADDRESS BUS
A5U2, PIN 13
A5U2, PINS 9, 8
A5U12, PINS 2, 3
A5U2, PINS 1, 3
A5U2, PINS 4, 6
A5U12, PINS 4, 5
A5U12, PINS 6, 7
A5U12, PINS 14, 13
A5U12, PINS 12, 11
A5U12, PINS 10, 9
A5U21, PINS 12, 11
A5U21, PINS 10, 9
A5U21, PINS 2, 3
A5U21, PINS 4, 5
A5U21, PINS 6, 7

SIGNATURE

MEASUREMENT
NUMBER

Vlp
vlp
H335
H335
H335
VLP
vlp

64 HU
9P9F
HPF6
UF9P
A8H9
2225
0258
H6PP
074P
HU57
F1PF
722H
050U
F44F
A66A

A6U30, PIN 5
A6U30, PIN 4
A6U30, PIN 1
A6U29, PIN 11

9P9F
HPF 6
A8H9
UF9P

A6U29, PIN 10
A6U30, PIN 6
A6U29, PIN 8

89F1
HA34
AU6C

A5U11, PIN 17
A5U3, PIN 4

vlp
VHP

A8U17, PIN 15
A8U18, PIN 15
A8U19, PIN 15
A8U20, PIN 15
A8U21, PIN 15
A8U22, PIN 15

VH
VH
VH
VH
VH
VH

A8U24, PIN 2
A8U24, PIN 1
A8U24, PIN 12
A8U24, PIN 13
A8U24, PIN 14
A8U24, PIN 15
A8U29, PIN 6
A8U29, PIN 8
A8U29, PIN 5
A8U29, PIN 4
A8U29, PIN 10

VH
VH
VH
722H
050U
F44F
vl
A41U
H335
vlp
AC99

111

112

TEST POINT

SIGNATURE

A6U26, PIN 12
A6U26, PIN 10
A6U26, PIN 8
A6U26, PIN 6
A6U26, PIN 4
A6U26, PIN 2
A6U29, PIN 2
A6U29, PIN 6

1079
VH
VH
1079
1079
1079
VH
VH

A6U25, PIN 2
A6U25, PIN 5
A6U25, PIN 7
A6U25, PIN 10
A6U25, PIN 12
A6U25, PIN 15
A6U28, PIN 9
A6U28, PIN 5

6526
VL
vl
6526
6526
6526
VL
vl

MEASUREMENT
NUMBER

(Cont'd)

a.

f. Connect signature analyzer probe to the fol¬
lowing circuit points:
START. A5U11, Pin 36
STOP. A5U11, Pin 36
CLOCK.
A6TP3
GND .
A5TP9 (GND)

202

A6U33, PIN 12
A6U33, PIN 9
A6U33, PIN 7
A6U33, PIN 4
A6U32, PIN 12
A6U32, PIN 9

6H44
PF45
7H02
355A
3P32
9A40

1

e.

Set signature analyzer controls as follows:

h. Verify that signature measurements called out
in troubleshooting tree match following table.
MEASUREMENT
NUMBER

SIGNATURE

7A70

Ground A5U3, pin 6.

g. Set 1611A LINE switch to on position.

h. Verify that signature measurements called out
in troubleshooting tree match following table.

VH

d.

START.
A6TP4
STOP.
A6TP4
CLOCK.
A6TP2
GND . A6TP10 (GND)

Set 1611A LINE switch to on postion.

201

Reinstall A6 on extender board A14.

f. Connect signature analyzer probe to the fol¬
lowing circuit points:

1_

Released

c.

START. "1
STOP. r
CLOCK. p
HOLD. Released

.... J

TEST POINT

Set 1611A LINE switch to off position.

b. Remove A6, A7, A8, A9, and A10 assemblies
from 1611 A.

b. Remove A6, A7, A8, and A10 assemblies from
1611A.
c. Reinstall A6 on extender board A14.
d. Ground A5U3, pin 6.
e. Set signature analyzer controls as follows:

MEASUREMENT
NUMBER

AAHA
A077
F86A
AF5U
VLP

SIGNATURE ANALYSIS PROCEDURE NO. 3

a. Set 1611A LINE switch to off position.

g.

SIGNATURE

Vh = 7A70, VLP = 0000

SIGNATURE ANALYSIS PROCEDURE NO. 2

....

A6U32, PIN 7
A6U32, PIN 4
A6U31, PIN 12
A6U31, PIN 9
A6U31, PIN 7

202

VH = 755U, VHP = 755U, Vl = 0000, Vlp = 0000

START
STOP..
CLOCK
HOLD .

TEST POINT

1

TEST POINT

SIGNATURE

301

VH

7092

302

A6U15, PIN 12
A6U16, PIN 12
A6U17, PIN 12
A6U18, PIN 12
A6U19, PIN 12
A6U20, PIN 12
A6U21, PIN 12
A6U22, PIN 12

5U1F
vl or vlp
Vl or vlp
5U1F
5U1F
5U1F
vl or vlp
vl or vlp

Bin ■ A6U33, PIN 12
A6U33, PIN 9
A6U33, PIN 7
A6U33, PIN 4
A6U32, PIN 12
A6U32, PIN 9

H93A
5UA3
U869
57PC
PPPP
U6P0

Figure 7-5 (Sheet 1 of 5).
Replacement for figure 8-4. 1611A Troubleshooting

7-11

Manual Changes

## Page 41


DO
O
CO

MEASUREMENT
NUMBER

(Cont'd)

304

TEST POINT

START. r
STOP. -|
CLOCK. r
HOLD.
Depressed

SIGNATURE

A6U32, PIN 7
A6U32, PIN 4
A6U31, PIN 12
A6U31, PIN 9
A6U31, PIN 7

05F9
065F
1U2U
2U8P
VHP

A6U33, PIN 14
A6U33, PIN 11
A6U33, PIN 5
A6U33, PIN 2
A6U32, PIN 14
A6U32, PIN 11
A6U32, PIN 5
A6U32, PIN 2
A6U31, PIN 14
A6U31, PIN 11

H93A
5UA3
U869
57PC
PPPP
U6P0
05F9
065F
1U2U
2U8P

e- Connect signature analyzer probe to the fol¬
lowing circuit points:
START.
STOP.
CLOCK.
GND .

f.

d. Release ground on A5C3 and take reading.
Verify that reading matches value in following table.
e. Repeat steps a thru d for each measurement.

e.

Set signature analyzer controls as follows:

501

START. •]
STOP. r
CLOCK. f
HOLD. Released
f. Connect signature analyzer probe to the fol¬
lowing circuit points:
START.
A6TP4
STOP.
A6TP4
CLOCK.
A6TP7
GND . A6TP10 (GND)
g.

Setl611A LINE switch to on position.

h. Verify that signature measurements called out
in troubleshooting tree match following table.
MEASUREMENT
NUMBER

VH

31PA

A6U24, PIN 2
A6U24, PIN 5
A6U24, PIN 7
A6U24, PIN 10
A6U24, PIN 12

8791
VL or VLP
Vl or VLP
8791
8791

a.

Set 1611A LINE switch to off position.

b. Remove A6, A7, and A8 assemblies from from
1611A.
c.

504

Reinstall A6 on extender board A14.

d. Set signature analyzer controls as follows:

TEST POINT

A6U21, PINS 12,11
A6U22, PINS 12,11

FCA9
P530

A5U11, PIN 10
A5U11, PIN 9
A5U11, PIN 8
A5U11, PIN 7
A5U11, PIN 3
A5U11, PIN 4
A5U11, PIN 5
A5U11, PIN 6

0FUF
7F81
2HP8
H5CF
P022
P8FP
FCA9
P530

Set 1611A LINE switch to off position.

b. Remove A6, A7, and A8 assemblies from
1611A.
c.

Reinstall A6 on extender board A14.

d.

Set signature analyzer controls as follows:
START. J
STOP. r
CLOCK. jHOLD. Depressed

SIGNATURE

e. Connect signature analyzer probe to the fol¬
lowing circuit points:
A6U26, PIN 12
A6U26, PIN 10
A6U26, PIN 8
A6U26, PIN 6
A6U26, PIN 4
A6U26, PIN 2
A6U29, PIN 2
A6U29, PIN 6

496A
3917
687P
902A
A5C4
AH58
8P3U
A0A6

A6U25, PIN 2
A6U25, PIN 5
A6U25, PIN 7
A6U25, PIN 10
A6U25, PIN 12
A6U25, PIN 15
A6U28, PIN 9
A6U28, PIN 5

0FUF
7F81
2HP8
H5CF
P022
P8FP
FCA9
P530

A6U15, PINS 12,11

0FUF

A6U16, PINS 12,11
A6U17, PINS 12,11
A6U18, PINS 12,11
A6U19, PINS 12,11
A6U20, PINS 12,11

7F81
2HP8
H5CF
P022
P8FP

START.
A6U33, Pin 13
STOP.A6U33, Pin 13
CLOCK.
A6TP3
GND .
A5TP9 (GND)
f.

Set 1611A LINE switch to on position.

MEASUREMENT PROCEDURE

a.

Ground (+) side of A5C3.

b. Place signature analyzer probe on pin to be
measured.
c.

Press and release RESET on probe.

d. Release ground on A5C3 and take reading.
Verify that reading matches value in following table.
e. Repeat steps a thru d for each measurement.
MEASUREMENT
NUMBER

601

TEST P0INT

SIGNATURE
SIGNATURE

A6U15, PINS 11, 12
A6U16, PINS 11, 12
A6U17, PINS 11, 12
A6U18, PINS 11, 12
A6U19, PINS 11, 12
A6U20, PINS 11, 12
A6U21, PINS 11, 12
A6U22, PINS 11, 12

*Pins 11 and 12 of each IC should have the same
reading.

Figure 7-5 (Sheet 2 of 5). Replacement for figure 8-4. 1611A Troubleshooting

7-12

SIGNATURE

SIGNATURE ANALYSIS PROCEDURE NO. 6
a.

Press and release RESET on probe.

MEASUREMENT
NUMBER

TEST POINT

SETUP PROCEDURE

Ground (+) side of A5C3.

b. Place signature analyzer probe on pin to be
measured.

b. Remove A6, A7, A8, A9, and A10 assemblies
from 1611 A.

Ground A5U3, pin 6.

Set 1611A LINE switch to on position.

a.

Set 1611A LINE switch to off position.

d.

A6U33, Pin 13
A6U33, Pin 13
A5U11, Pin 18
A5TP9 (GND)

MEASUREMENT PROCEDURE

c.

Reinstall A6 on extender board AHA.

I 503 1 *
(504 1 *
(Cont’d)

NOTE

SIGNATURE ANALYSIS PROCEDURE NO. 4.

c.

MEASUREMENT
NUMBER

Connect CLOCK probe to A6TP3 for mea¬
surements 503, 504, and 505.

Vh = 7092, VHP = 7092, Vl = 0000, VLP = 0000

a.

Model 1611A

Manual Changes

## Page 42


Model 1611A

1611A INITIAL SETUP:
1.
2.
3.

NOTE: CURSOR IN TRIGGER FIELD
SHOULD BE BLINKING
ADDRESS

AORS

DATA

OPCODE'DATA

DISCONNECT EXTERNAL AND MICROPROCESSOR PROBES.
SET OCTAL/HEXADECIMAL SWITCH TO HEXADECIMAL POSITION.
ENSURE THAT ALL BOARDS ARE PROPERLY INSTALLED.
REPEAT
POWER ON
DISPLAY
CHECK.

ALL PROCEDURES IN THESE TROUBLESHOOTING TREES
(PAGE 713, 7-14, and 7-15) APPLY ONLY TO OPTIONS
068 AND 080. IF OTHER OPTIONS ARE INSTALLED
IN YOUR 1611A. REFER TO SECTION VIII FOR
SIGNATURE ANALYSIS PROCEDURES.

EXTERNAL

EXTERNAL

IS
POWER ON
DISPLAY
CORRECT?

SELF TEST COMPLETED

POWER ON DISPLAY

TIME INTERVAL
AT A5TP3
«160 ms?

PERFORM ROM CHECK.
SEE SERVICE SHEET
S4 IN OPTION
SUPPLEMENT.

GROUND A5U3,
PIN 6

IS
DISPLAY AS
SHOWN IN
PHOTOGRAPH?

EXAMPLE OF BAD POWER ON
DISPLAY WITH CORRECT
CHARACTER AND RASTER SIZE
(A31NT. ADJUSTMENT FULL CW)

GROUND A5U3, PIN 6
WITH A5,A6
ASSEMBLIES INSTALLED

DISPLAY AS
SHOWN IN
PHOTOGRAPH

SET UP TEST
NO. 1 WITH A6
INSTALLED

A6U26 & A6U29
OUTPUTS

1>11A-02S-01-11.7b

Figure 7-5 (Sheet 3 of 5).
Replacement for figure 8-4.1611A Troubleshooting
7-13

CHECK A5U4

## Page 43

AND A5U2.

A5U18,U8,U9
OR U19 BAD.

A5U11
BAD

Model 1611A

## Page 44


SET UP
TEST NO. 3

Vu CORRECT?

CHECK
A6U15-U22,
PIN 12.

CHECK
A6U33,U32,U31
OUTPUTS

CHECK
A6U33,U32,U31
INPUTS

CHECKTIMING
GENERATOR.
SEE SERVICE SHEET 5.

A6U24 0R U13
BAD

SET UP
TEST NO. 2

A6U6,U7,U8
U11, OR U12
BAD.

A6U33.U32, OR
U31 BAD.

VHCORRECT?

REPAIR A5
SEE SERVICE SHEET 5.

BAD

/ CHECK
A6U30B
PINS 10, 12, 13
WAVEFORMS
(SERVICE SHEET 6)

CHECK
A6U33,U32,U31
OUTPUTS.
A5U3 OR A5U11
BAD.

SET UP TEST
NO. 1 WITH A6
INSTALLED.

A6U29 OR
U30 LOADING
ADDRESS BUS

ARE
ADDRESS LINES
A10, All, A12, A13
CORRECT?

A6U30B BAD.

CHECK
ADDRESS DECODER
A6U29/U30.

A6U33.U32
OR U31 BAD.

REPLACE A7 AND A8
SEPARATELY TO FIND
BAD BOARD

A8
'v \
^

SET UP TEST

7

AS INSTALLED

BAD
\
/

A6U29 OR
U30A BAD.

CHECK ADDRESS
BUS.

SET UP
TEST NO. 1
WITH A7 INSTALLED

CHECK
DATA BUS

CHECK ADDRESS
BUSTO FIND
LOADED LINE

REMOVEA5AND
FIND BAD 1C WITH
CURRENTTRACER
& PULSER

CHECK
MEMORY BUS

CHECK
A8U17-U22,
PINS 15

USE CURRENT
TRACER & PULSER
TO FIND BAD 1C

REMOVE A5 AND
FIND BAD 1C
ON A8 WITH CURRENT
TRACER & PULSER

CHECK ADDRESS
DECODER ON A8

1611A-029-03-01-77

Manual Changes

## Page 45


Manual Changes

## Page 46


4

3

2

1

G

F

E

D

C

B

A
1611A-003-01 -03-78

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

Cl
C2
C3
C4
C5
C6
C7
C8
C9
CIO
C11
Cl 2
Cl 3
Cl 4
Cl 5
Cl 6
Cl 7
Cl 8
Cl 9

E-2
E-3
E-2
D-2
C-2
C-2
D-2
D-2
C-4
C-4
C-4
C-4
B-1
A-1
A-1
A-1
F-2
A-2
B-2

C20
C21
C22
C23
C24
C25
C26
C27
C28
C29
C30
C31
C32
C33
C34
C35
C36
C37
CR1

C-2
B-3
B-3
C-3
E-4
F-4
F-4
F-4
G-3
G-3
F-3
F-3
G-3
F-3
F-2
G-2
F-2
G-2
D-2

CR2
CR 3
CR4
CR5
CR6
CR7
CR8
CR9
LI
L2
L3
L4
L5
Q1
Q2
Q3
Q4
Q5
Q6

B-1
G-4
E-4
F-4
G-3
D-2
G-3
G-2
C-2
B-4
F-4
D-3
G-2
E-2
C-4
C-4
B-1
B-2
B-3

Q7
Q8
Q9
Q10
Q1 1
Q12
Q13
R1
R2
R3
R4
R5
R6
R7
R8
R9
RIO
R1 1

B-3
B-3
F-3
F-2
F-2
G-2
G-2
E-2
E-2
D-3
C-3
D-2
D-3
C-4
C-4
C-4
C-4
C-4

R 12
R13
R1 4
R1 5
R1 6
R1 7
R18
R1 9

C-4
C-4
C-3
C-4
B-1
B-1
A-2
B-2
B-2
B-2
B-2
B-2
B-2
B-2
B-2
B-2
B-2
B-2

R30
R31
R32
R33
R34
R35
R36
R37
R3S
R39
R40
R41
R42
R43
R44
R45
R46
R47

B-2
B-2
A-2
B-3
B-3
C-3
B-3
C-3
B-3
B-3
B-3
B-3
C-3
E-4
F-3
F-3
F-3
F-3

R48
R49
R50
R51
R 52
R53
R54
R55
R56
R 57
R58
R59
R60
R61
R62
T1
T2
TP1

G-3
G-2
G-2
G-3
F-2
F-2
F-1
G-2
G-2
F-2
G-2
G-2
G-3
F-1
B-2
E-3
D-4
F-4

TP2
TP3
TP4
TP5
TP6
TP7
TP8
TP9
TP 1 0
TP1 1
TP 1 2
U1
U2
U3
U4
U5
U6
VR 1
VR2

E-3
F-2
F-2
F-1
F-2
E-2
D-2
B-2
B-2
B-1
C-3
C-4
B-3
B-1
B-2
E-2
E-3
E-2
E-2

CT) U1

REF
DESIG

R21
R22
R23
R24
R25
R26
R27
R28
R29

ICs ON THIS SCHEMATIC
IC REF DES

HP PART NO.

MFR PART NO.

Ul-4
U5
U6

1826-0254
1820-1422
1820-1796

MC1741SCP1
SN74LS122N
DS3611N

Figure 7-6. Replacement for figure 8-9. Service Sheet 3, Display Driver Assembly A3

Model 1611A

## Page 47


Service

Figure 7-7. Replacement for Figure 8-13, Service Sheet 7,
RAM Comparator Assembly A7 (Sheet 4 of 4)
7-17

Model 1611A

## Page 48


Service

ETCHED CIRCUIT BOARD

(925)

WIRE COLORS ARE GIVEN
BY NUMBERS IN PARENTHESIS
USING THE RESISTOR COLOR
CODE

FRONT PANEL MARKING
(925) IS WHT-RED-GRN
5 - GREEN
0-BLACK
1 - BROWN
6 - BLUE
7 - VIOLET
2 - RED
3 - ORANGE
8 - GRAY
4 - YELLOW
9 - WHITE

I-1
l

1

REAR-PANEL MARKING

i_I

9

MANUAL CONTROL
OPTIMUM VALUE SELECTED
AT FACTORY, TYPICAL
VALUE SHOWN; PART MAY
HAVE BEEN OMITTED.

4

?

SCREWDRIVER ADJUSTMENT

TP1

UNLESS OTHERWISE INDICATED:
RESISTANCE IN OHMS
CAPACITANCE IN PICOFARADS
INDUCTANCE IN MICROHENRIES

ELECTRICAL TEST POINT
TP (WITH NUMBER)

NUMBERED WAVEFORM
NUMBER CORRESPONDS TO
ELECTRICAL TEST POINT NO.
LETTERED TEST POINT
NO MEASUREMENT AID
PROVIDED

(UP
P/O
NC
CW

=
=
=

MICROPROCESSOR
PART OF
NO CONNECTION
CLOCKWISE END OF VARIABLE
RESISTOR

COMMON CONNECTIONS. ALL LIKE-DESIGNATED POINTS ARE CONNECTED.

03

NUMBER ON BLACK BACKGROUND = OFF-PAGE CONNECTION.
LARGE NUMBER ADJACENT = SERVICE SHEET NUMBER FOR OFF-PAGE CONNECTION

O

CIRCLED LETTER = OFF-PAGE CONNECTION BETWEEN PAGES OF SAME SERVICE
SHEET.

S7

S PREFIX TO SERVICE SHEET NUMBER INDICATES SERVICE SHEET IS IN
MANUAL SUPPLEMENT

INDICATES SINGLE SIGNAL LINE

NUMBER OF LINES ON A BUS

INDICATES GROUPING OF LINES (BUSES)

(UP BUSES AND CONTROL LINES ARE SHOWN IN RED ON SHEMATICS

STD-20-01-77

Figure 8-1. Schematic Diagram Notes

8-0

Service

## Page 49


Model 1611A


## Section VIII Fusion Notes

- Canonical text below is from the `1980` service manual.
- The `1978` companion section is broadly similar in structure and still useful, but the later service manual should drive troubleshooting flow, repair work, and service-sheet interpretation.
- If a service-sheet page or locator is hard to read in the canonical section, cross-check the rendered pages in `docs-classified/mainframe/figures/operating-and-service-manual-1978/`.
- Signature-analysis guidance exists in both manuals; the fused rule is to use the `1980` text first and consult the `1978` companion only when you need alternate wording or a cleaner earlier sheet.

## Section VIII Canonical Text

## Page 49

SECTION VIII
SERVICE

8-1.

INTRODUCTION.

8-2. This section contains instructions for troubleshooting and repairing the Hewlett-Packard Model
1611A Logic State Analyzer.
8-3. Principles of operation and troubleshooting
information are located opposite the schematics on
foldout Service Sheets. The rest of this section has
general service information that should help you to
quickly service and repair the 1611A.

8-4.

PRINCIPLES OF OPERATION.

8-5. Principles of operation appear on pages opposite
the block diagram and schematics on the Service
Sheets. Figure 8-1 explains symbols that appear on the
schematics. Figure 8-5 is an overall block diagram that
briefly describes overall instrument operation. It is
keyed, by Service Sheet numbers in the blocks, to
schematics on the Service Sheets. These Service
Sheets provide a stage-by-stage description of circuits
on the schematics. The stages are keyed to the descriptions by stage names that appear on the schematics.
An overall view of instrument program operation is
presented in the macro flowchart shown in figure 8-6.
8-6. LOGIC CONVENTIONS. Positive logic convention
is used in describing logic variables and circuits within
the 1611A. Positive logic convention defines a logic
"1" as the more positive voltage (high) and a logic "0"
as the more negative voltage (low). The integrated
circuits in the 1611A are almost entirely transistortransistor-logic (TTL). Major exceptions are the 8080A
microprocessor, ROMs, and some RAMs. All these
devices have TTL drive capability.
8-7. MNEMONICS. Signals in the 1611A have been
assigned mnemonics that describe the active state and
function of the signal line. A prefix letter (H, L, P, or
N) indicates the active state of the signal, and the
remaining letters indicate its function. An H prefix
indicates the function is active in the high state; an L
prefix indicates the function is active in the low state.
For edge-controlled devices, the prefix P indicates the
function is active on the positive-going transition;
prefix N indicates the function is active on the negative-going transition. Mnemonic functional defini-
tions and points of origin are listed alphabetically in
table 8-1.

8-8.

TROUBLESHOOTING.

Read the Safety Summary at the front of
this manual before troubleshooting the
instrument.
8-9. The most important prerequisites for successful troubleshooting are an understanding of instrument functional operation and the correct use of front
panel controls. Suspected malfunctions may be caused
by improper control settings. Before performing the
test and/or troubleshooting procedures, refer to the
Operating and Service Manual Supplement (provided
with each microprocessor personality module) for an explanation
of controls, connectors, and general operating con-
siderations, and to the service sheets in this section for
an explanation of circuit functional operation.
8-10. If trouble is suspected, visually inspect the instrument. Look for loose or burned components that
might suggest a source of trouble. Check to see that all
circuit board connections are making good contact and
are not shorting to an adjacent circuit. If no obvious
trouble is found, check the instrument power-supply
voltages, and external power sources.
8-11. FAULT ISOLATION. Figure 8-4 is a 1611A
troubleshooting tree which can be used to isolate problems that cause an incorrect turn-on display. Refer to
Service Sheets 7 and 8 for measurement problems such
as improper triggering or incorrect measurement
results. Some paths in the troubleshooting tree
reference ROM test procedures. These procedures are
provided in the personality module supplement for
this manual.
8-12. Many measurements in the troubleshooting tree
are made with an HP Signature Analyzer. Each signature is measured under specific conditions described in
the test procedures accompanying the troubleshooting
tree. Each signature measurement in the tree is assigned a three-digit number. This refers to a measure-
ment step in the test procedures. If the measured
signature matches the signature given in the test pro-
cedure, the circuit is functioning correctly at the node
being measured. An incorrect signature indicates a
malfunction somewhere in the circuit leading up to
the measured node. An oscilloscope can be used in
place of the signature analyzer, but problems other
than nodes stuck at one level will be difficult to find.

8-1

Model 1611A

## Page 50


Service

Figure 8-2. 5004A Block Diagram
8-13. Troubleshooting with the HP Signature Analyzer (SA). The SA is a service tool designed to analyze
complex digital signals. The instrument provides a
unique four-digit alphanumeric signature for each
monitored data pattern. Figure 8-2 is a simple block
diagram of the SA. The SA collects data between the
occurrence of START and STOP signals. The data
probe input is read on the selected clock edge. Data
is routed to a 16-bit shift register through a parity
generator. Parallel outputs of the shift register drive
the four-digit display. START, STOP, and CLOCK
signals are selected so that normally they are not
dependent on the circuitry being analyzed.
8-14. Signatures of some nodes are designated with
special symbols. These nodes are at one state (high or
low) every time the clock edge occurs. These symbols
are:
VH-Corresponds to signature displayed when
the SA data probe is at a node that is always high.
This signature should be checked at the +5 V supply
on the board before test measurements are made. A
correct signature verifies that clock and time intervals
are correct. The probe-tip indicator is on continuously at VH.
VHP-Indicates node is high whenever a clock edge occurs. The signature is the same as VH, but
the probe-tip indicator flashes on and off, rather
than staying on continuously.
VL-Indicates node being measured is always
low; signature for VL is 0000. The probe-tip indi-
cator always remains off when probing a VL node.
VLP-Indicates node is low whenever a clock
edge occurs. The VLP signature is 0000 as for VL,
but the probe-tip indicator flashes.
A reading other than VH, VHP, VL, or VLP indi-
cates that the state of the node varies on the clock
edge during the measurement interval.
8-15. TROUBLESHOOTING
MICROPROCESSOR
PROBLEMS. The troubleshooting tree can be used to
isolate some microprocessor (A5U11) problems.
However, it is sometimes difficult to isolate microprocessor failures due to complexity of the device. It is possible for

8-2

the 1611A to pass all tests in the troubleshooting tree and still have a faulty microprocessor. Therefore, it is recommended that a good microprocessor be substituted for the one
in the instrument before attempting to isolate a problem that could be caused by a faulty microprocessor. A5U11
is mounted in a 40-pin socket for easy removal.
8-16. TROUBLESHOOTING
WITH
LOGIC
TEST
EQUIPMENT. Dedicated logic test equipment is
required to efficiently and effectively troubleshoot
most faults in the 1611A. The following equipment is
recommended:
HP 547A Current Tracer—used for precise localization of low-impedance faults. The hand-held probe
senses the magnetic field generated by a pulsing cur-
rent internal to the circuit or by current pulses supplied
by an external stimulus such as the HP 10526A Logic
Pulser.
HP 1600A Logic State Analyzer—used to monitor
counters, address decoders, and data selectors within
the 1611A.
HP 10525T Logic Probe—used to check operation of
gates and flip-flops.
HP 10526T Logic Pulser—used with the HP 547A
to provide a high-current pulse.

8-17.

RECOMMENDED TEST EQUIPMENT.

8-18. Equipment required for troubleshooting is
listed in the Recommended Test Equipment Table in
Section I. Any equipment that satisfies the critical
specifications given in the table may be substituted for
the recommended model(s).

8-19.

SERVICE AIDS.

8-20. TEST POINTS. Test points shown on schematics
correspond to pins protruding from circuit boards and
do not necessarily correspond to waveform measure¬
ment points.
8-21. EXTENDER BOARD. An extender board (HP
Part No. 01611-66515) is supplied with the 1611A to
provide access to circuits on plug-in boards while the
instrument is operating.

Service

## Page 51


Model 1611A
8-22. PART LOCATION AIDS. The locations of assem¬
blies, chassis-mounted parts, and hardware are shown
in the Illustrated Parts Breakdown in Section VI. The
locations of individual components mounted on print¬
ed circuit boards or other assemblies are shown on
the page opposite the appropriate schematic diagram
page. The part reference designator is the assembly
designator plus the part designator (for example,
A6R9 is R9 on the A6 assembly). For specific compo¬
nent description and ordering information, refer to the
parts list in Section VI.

8-23.

REPAIR.

8-24.

CRT REPLACEMENT PROCEDURE. (See figure

e-1-)

a. Set LINE power switch to off position and dis¬
connect power cord.
b.

Remove top, bottom, and side covers.

c. Disconnect diode CR1 from PA (post-accelera¬
tor) cable W2.
d. Remove 3 screws that hold A3 board to comer
strut MP3 and remove A3 board from instrument.
e. Remove PA cable clamp H39 from CRT shield
MP13.
f. Loosen, but do not remove, 4 screws securing
CRT shield MPI3.
g. Remove MP13 from instrument.
h. Disconnect yoke cable (P/O LI) and CRT
cable W4 from connectors P3 and P4 on main board Al.
i. Remove 2 lower screws H12 that hold CRT to
Keyboard Support MP27 through bottom of instru¬
ment.
j. Remove 2 upper screws H12 that hold CRT to
MP27 through top of instrument.

k. Slide CRT back from MP27 and remove con¬
trast filter.
l. Remove CRT from instrument with CRT cable
W4 and yoke assembly LI attached.
m.

Remove CRT cable and LI from CRT.

n. Install LI on new CRT with yoke cable on bot¬
tom of CRT (see figure 8-3).
o. Install CRT cable W4 on new CRT.
p. Install CRT in instrument by reversing steps a
through 1.
q. Perform Trace Alignment Procedure (Sec¬
tion V).

Table 8-1. 1611A Mnemonics
MNEMONIC

DESCRIPTION

ORIGIN

A0-A13

Microprocessor Address Bus. Address lines from 8080A pP on A5
board. Bus is shown in red on schematics.

Schematic 5,
A5P1, PINS 78-91

A0*-A9*

Display RAM address lines. Lines originate from pP ADDRESS
BUS or display format generator, depending on the state of
HpPCY.

Schematic 6,
A6U31-A6U33

D0-D7

Microprocessor Data Bus. Data that 8080A pP A5U11 is output¬
ting. Bus is shown in red on schematics.

Schematic 5,
A5P1, PINS 68-75

EXT 0-EXT 7

External Inputs 0-7. Inputs from External Probe.

Schematic S4,
A10P1, PINS 3-10

FLAG 0-FLAG 3

Flags 0-3. Status bits indicating the type of machine cycle
being executed by the pP under test. A 4-bit flag byte is stored
for each of the 64 words stored in High-Speed Memory.

Schematic S2,
A9P1, PINS 19-22

8-3

Service

## Page 52


Model 1611A
Table 8-1. 1611A Mnemonics (Cont'd)

MNEMONIC

DESCRIPTION

ORIGIN

HAND

High, AND. Determines whether the two outputs LTRGl and
LTRG2 from RAM Comparator A7 will be logic ANDed or
logic ORed.

Schematic 7,
A7U11, PIN 11

HARM

High, Armed. Signal is true when /uP under test is between the
Enable and Disable trace specifications.

Schematic 7,
A7U33A, PIN 12

HBLINK

High, Blink. Signal is true when character being read from RAM
is to be displayed in a blinking mode.

Schematic 6,
A6U22, PIN 12

HCT

High, Count Triggers. Signal is true when 1611A is executing a
a COUNT TRIGS measurement.

Schematic 7,
A7U18, PIN 15

HCTOF

High, Counter Overflow. Signal is true when delay counter over¬
flows during Trace, Time Interval, or Count Trigs measurement.

Schematc 8,
A8U15A, PIN 7

HDLEN

High, Delay Enable. Signal Enables Delay Counter on A8. True
when Pass Counter = Terminal Count.

Schematic 7,
A7U21B, PIN 6

HDSB

High, Disable. Signal assumes true state when Disable trace
specification is met.

Schematic 7,
A7P1, PIN 53

HDSBL

High, Disable Latched. Signal is latched in true state when
Disable trace specification is met.

Schematic 7,
A7U20A, PIN 5

HDSPC

High, Display Cycle. Signal is true when Display Format
Generator is accessing RAM on A6. Rising edge of HDSPC is
used to latch data onto MEMORY bus.

Schematic 6,
A6U31, PIN 7

HENB

High, Enable. Signal assumes true state when Enable trace
specification is met.

Schematic 7,
A7P1, PIN 51

HENBL

High, Enable Latched. Signal is latched in true state when Enable
trace specification is met.

Schematic 7,
A7U20B, PIN 9

HHBLK

High, Horizontal Blank. Signal is true when display is blanked
during horizontal retrace.

Schematic 6,
A6U4, PIN 15

HHSY

High, Horizontal Sync. Positive edge of signal starts horizontal
retrace.

Schematic 6,
A6U34C, PIN 8

HINVS

High, Inverse. Signal is true when character being generated is
displayed in inverse video (black character on white background).

Schematic 6,
A6U4, PIN 7

HMCOF

High, Memory counter Overflow. Signal is true when memory
state counter reaches count of 64 or greater.

Schematic 8,
A8U3D, PIN 13

HNORM

High, Normal. Signal is true when character being generated
is displayed normally (white character on dark background).
Signal is false when character is displayed in inverse video.

Schematic 6,
A6U4, PIN 5

HPCTC

High, Pass Counter Terminal Count. Signal is true when pass
counter MSD (A8U11, pin 15) reaches terminal count.

Schematic 8,
A8U9, PIN 15

HRADR

High, RAM Address. Signal is true when jjP ADDRESS Bus
(A0-A13) is equal to RAM address (320008-337778).

Schematic 6,
A6U29D, PIN 8

8-4

Model 1611A

## Page 53


Service
Table 8-1. 1611A Mnemonics (Cont'd)

—
MNEMONIC

DESCRIPTION

ORIGIN

HRMC

High, Reset Memory Counter. Signal resets memory state
counter and clears memory counter overflow flip-flop A8U3.

Schematic 7,
A7U18, PIN 7

HTI

High, Time Interval. Signal is true when 1611A is executing
Time Interval measurement.

Schematic 7,
A7U33B, PIN 6

HTRC

High, Trace. Signal is true when 1611A is executing Trace or
Trace Trigs measurement.

Schematic 7,
A7U18, PIN 2

HTRG

High, Trigger. Signal is true when trigger specification is met
and LCPCK is low.

Schematic 7,
A7U8, PIN 8

HTSTOR

High, Trigger Store. Signal is true when 1611A is executing
Trace Trigs measurement.

Schematic 8,
A8U15B, PIN 10

HVBLK

High, Vertical Blank. Signal is true when display is blanked for
vertical retrace.

Schematic 6,
A6U4, PIN 10

HWRT

High, Write. Signal is true when microprocessor A5U11 is outputting data on the data bus.

Schematic 5,
A5U3A, PIN 2

HmPCY

High, Microprocessor Cycle. Signal is high when 8080 p.P
A5U11 is addressing RAM on A6. Signal is low when character
generator is addressing RAM.

Schematic 5,
A5U14A, PIN 3

INP A0-A15

Input Address Bus. Address Lines from /J.P under test.

Schematic S2,
A9P1, PINS 23-38

INP D0-D7

Input Data Bus. Data lines from mP under test.

Schematic S2,
A9P1, PINS 11-18

KS0-KS4, KS7

Key Sense Lines. Lines are tied to keyboard matrix columns.
Depressed key in a column will generate a 1 to 2 volt pulse
output on appropriate sense line.

Schematic 4,
A4W1J1

LCPCK

Low, Compare Clock. When true, signal enables outputs of
RAM Comparator (LTRG1 and LTRG2) to be gated through
A7U8.

Schematic 7,
A7U1B, PIN 9

LCTOF

Low, Counter Overflow. When True, signal indicates Delay
Counter has reached terminal count.

Schematic 8,
A8U15B, PIN 7

LDLYDS

Low, Delayed Disable. Delayed HDSBL. Signal allows trigger
to be recognized if HDSB and HTRG are true on same cycle.

Schematic 7,
A7U6B, PIN 8

LDLYL

Low, Delaying Latched. Signal is true after pass counter reaches
terminal count when executing Trace measurement.

Schematic 7,
A7U9B, PIN 6

LDSBL

Low, Disable Latched. Signal is true when Disable trace speci¬
fication is met.

Schematic 7,
A7U20A, PIN 5

LDSTOR

Low, Data Store. Signal enables write mode of high-speed RAM
(A8U25-28) and clocks memory counter during measurements.

Schematic 8,
A8U8B, PIN 8

LLSRE

Low, Load Shift Register Enable. Signal enables character
shift register A6U14 to parallel load when 200 ns CLK is low.

Schematic 5,
A5U22, PIN 15

LMCOF

Low, Memory Counter Overflow. Signal is true when memory
counter counts pass 63.

Schematic 8,
A8U3C, PIN 10

8-5

Service

## Page 54


Model 1611A
Table 8-1. 1611A Mnemonics (Coni'd)

MNEMONIC

ORIGIN

DESCRIPTION

LREAD

Low, Read. Signal is true when /uP A5U11 is reading from
MEMORY Bus.

Schematic 5,
A5U3B, PIN 4

LRST

Low, Reset. Signal Clears Enable and Disable flip-flops on A7
board, inhibits pass and delay counters on A8 board, and inhibits
Trace Point Output.

Schematic 7,
A7U18, PIN 11

LTRGl

Low, Trigger 1. Signal is true when = and « trigger conditions
are met.

Schematic 7,
A7U7, PIN 6

LTRG2

Low, Trigger 2. Signal is true when > trigger conditions are met.

Schematic 7,
A7U5, PIN 6

LTSTOR

Low, Trigger Store. Signal is true when 1611A is executing
Trace Trigs measurement.

Schematic 8,
A8U15B, PIN 9

M0-M7

MEMORY Bus. Data that is read by /uP A5U11. BUS lines are shown Schematics 6, 8,
and 10
in red on schematics.

MSCO-5

Memory State Count. Signal indicates address of high-speed
RAM (A8U25-28) that is being written into or read from.

Schematic 8,
A8U1A/B

NCNT

Negative, Count. Negative edge of signal clocks pass and delay
counters when enabled.

Schematic 7,
A7U32, PIN 8

NCP

Negative Compare. Negative edge of signal indicates that
personality board A9 has valid data ready for comparator.

Schematic S2,
A9P1, PIN 50

NMCCK

Negative, Memory Counter Clock.
clocks memory counter.

Negative edge of signal

Schematic 8,
A8U2C, PIN 8

NSTOR

Negative, Store. Negative edge of signal enables LDSTOR
when executing Trace measurement.

Schematic S2,
A9P1, PIN 49

PEXCK

Positive, External Clock. Positive edge of signal latches data
from external probe.

Schematic S2,
A9P1, PIN 47

PRWCK

Positive, RAM Write Clock, Signal enables RAM on A6 to be
written into.

Schematic 5,
A5U3E, PIN 10

PHLTEN

Positive, Halt Enable. Positive edge of signal enables personality
board A9 to halt /aP under test in Trace Then Wait or Trace
Then Halt Test modes.

Schematic 8,
A8U8A, PIN 6

SCAN A-D

Four signals scan keyboard.

Schematic 5,
A5U7/A5U17

SWO-7

Switch lines 0-7. Signals indicate personality panel switch
positions. SWO=HEXADECIMAL/OCTAL switch, SW7=TEST
MODE. Some lines are not used by all options.

Schematic S3,
A11W1

VIDEO

Z-axis blanking signal from character generator.

Schematic 6,
A6U2A, PIN 2

lpS ck

Signal provides timing clock for Time Interval measurements
and is master clock for porbe test generator.

Schematic 5,
A5U23, PIN 11

2 Hz CLK

Signal provides blanking signal for A6 assembly. It is also used
by probe test generator.

Schematic 6,
A6U5, PIN 13

8-6

Service

## Page 55


Model 1611A

NOTE
The following procedures do not apply to
Options 068 and 080. If either of these Personality Panel Modules are installed in your
1611A, refer to Section VII for Signature
Analysis Procedures.

d.

Jumper A6U31 pin 7 to pin 8.

e. Connect signature analyzer probes to the following circuit points:
START .A6U33, Pin 13
STOP.A6U33, Pin 13
CLOCK
A6TP3
GND
.A6TP(GND)

SIGNATURE ANALYSIS PROCEDURE NO. 1.
See Service Sheet S4 in the manual supplement sup¬
plied with your option for ROM Test signatures and
flow chart procedure.

SIGNATURE ANALYSIS PROCEDURE NO. 2.
a.

Set 1611A LINE switch to off position.

b.

Remove A7 and A8 boards from 1611 A.

c.

Install A6 board on extender board A14.

g.

Set 1611A LINE switch to on position.

h. Verify that signature measurements called out
in troubleshooting tree match following table.

Figure 8-4.
1611A Troubleshooting (Sheet 1 of 8)
8-7

Model 1611A

## Page 56


Service

MEASUREMENT
NUMBER

press
ABSOLUTE/
MNEMONIC key
while reading
signatures.

203

205

press
ABSOLUTE/
MNEMONIC key
while reading
signatures

SIGNATURE

MEASUREMENT
NUMBER

2A42 or 5216

207

A6U15, PIN 12
A6U16, PIN 12
A6U17, PIN 12
A6U18, PIN 12
A6U19, PIN 12
A6U20, PIN 12
A6U21, PIN 12
A6U22, PIN 12

44AC or CC27
007A or 7U7H
2P47 or U140
05P3 or 9405
6FP5 or AF05
2P78 or H6CC
8235 or C811
A8CU or F81A

press
ABSOLUTE/
MNEMONIC key
while reading
signatures.

A6U31, PIN 9
A6U31, PIN 12
A6U32, PIN 4
A6U32, PIN 7
A6U32, PIN 9
A6U32, PIN 12
A6U33, PIN 4
A6U33, PIN 7
A6U33, PIN 9
A6U33, PIN 12

C51U or A8C3
4405 or 6405
U21A or 636C
C0P6 or U40F
A70H or 4P5F
H597 or 461F
2HP1 or H24C
1892 or 2U1P
PP62 or C6A7
7A70 or 72A0

A6U31, PIN 13
A6U31, PIN 10
A6U32, PIN 13
A6U32, PIN 10
A6U32, PIN 6
A6U32, PIN 3
A6U33, PIN 13
A6U33, PIN 10
A6U33, PIN 6
A6U33, PIN 3

4405 or 6405
C51U or A8C3
H597 or 461F
A70H or 4P5F
C0P6 or U40F
U21A or 636C
7A70 or 72A0
PP62 or C6A7
1892 or 2U1P
2HP1 or H24C

TEST POINT

A5U11, PIN 25
A5U11, PIN 26
A5U11, PIN 27
A5U11, PIN 29
A5U11, PIN 30
A5U11, PIN 31
A5U11, PIN 32
A5U11, PIN 33
A5U11, PIN 34
A5U11, PIN 35
A5U11, PIN 1
A5U11, PIN 40
A5U11, PIN 37
A5U11, PIN 38

C51U or A8C3
4405 or 6405
U21A or 636C
C0P6 or U40F
A70H or 4P5F
H597 or 461F
2HP1 or H24C
1892 or 2U1P
PP62 or C6A7
7A70 or 72A0
VHP or VHP
VLP or VLP
VHP or VHP
VHP or VHP

A6U15, PIN 11
A6U16, PIN 11
A6U17, PIN 11
A6U18, PIN 11
A6U19, PIN 11
A6U20, PIN 11
A6U21, PIN 11
A6U22, PIN 11

44AC or CC27
007A or 7U7H
2P47 or U140
05P3 or 9405
6FP5 or AF05
2P78 or H6CC
8235 or C811
A8CU or F81A

I

TEST POINT

SIGNATURE

A5U11, PIN 10
A5U11, PIN 9
A5U11, PIN 8
A5U11, PIN 7
A5U11, PIN 3
A5U11, PIN 4
A5U11, PIN 5
A5U11, PIN 6

44AC or CC27
007A or 7U7H
2P47 or U140
05P3 or 9405
6FP5 or AF05
2P78 or H6CC
8235 or C811
A8CU or F81A

MEASUREMENT
NUMBER
304

TEST POINT

CLOCK.J"
HOLD .Released

SIGNATURE

A6U10, PIN 4
A6U10, PIN 5

81UF
9PP0

A6U27, PIN 13
A6U27, PIN 10

2F02
31PA and 0000
Alternating

A6U1, PIN 3
A6U1, PIN 4
A6U1, PIN 6
A6U1, PIN 14

5H5A
HF38
7F9C
8AH9

A6U1, PIN 2
A6U1, PIN 5
A6U1, PIN 7
A6U1, PIN 10
A6U1, PIN 12
A6U1, PIN 15

7A8U
3P84
5CP4
408A
VL
8F56

A6U14, PIN 5
A6U14, PIN 4
A6U14, PIN 3
A6U14, PIN 14
A6U14, PIN 13

F33H
047F
29C3
288A
186A

309

A6U14, PIN 2
A6U14, PIN 9
A6U14, PIN 7

VHP
PU0H
HPP7

310

A6U3, PIN 6
A6U2, PIN 2

HA0H
PCP7

g.

Set 1611A LINE switch to on position.

h. Verify that signature measurements called out
in troubleshooting tree match following table.

I

MEASUREMENT
NUMBER

TEST POINT

SIGNATURE

A6U15, PIN 12
A6U16, PIN 12
A6U17, PIN 12
A6U18, PIN 12
A6U19, PIN 12
A6U20, PIN 12
A6U21, PIN 12
A6U22, PIN 12

5U1F
VL or VLP
VL or VLP
5U1F
5U1F
5U1F
VL or VLP
VL or VLP

403

A6U33, PIN 12
A6U33, PIN 9
A6U33, PIN 7
A6U33, PIN 4
A6U32, PIN 12
A6U32, PIN 9
A6U32, PIN 7
A6U32, PIN 4
A6U31, PIN 12
A6U31, PIN 9
A6U31, PIN 7

H93A
5UA3
U869
57PC
PPPP
U6P0
05F9
065F
1U2U
2U8P
VHP

404

A6U33, PIN 14
A6U33, PIN 11
A6U33, PIN 5
A6U33, PIN 2
A6U32, PIN 14
A6U32, PIN 11
A6U32, PIN 5
A6U32, PIN 2
A6U31, PIN 14
A6U31, PIN 11

H93A
5UA3
U869
57PC
PPPP
U6P0
05F9
065F
1U2U
2U8P

SIGNATURE ANALYSIS PROCEDURE NO. 3.
307
a.

Set 1611A LINE switch to off position.

b. Remove A6, A7, A8, A9, and A10 assemblies
from 1611 A.
c.

Reinstall A6 on extender board A14.

d.

Ground A5U3, pin 6.

e. Connect signature analyzer probe to the fol¬
lowing circuit points:
START .A6TP4
STOP.A6TP4
CLOCK.A6TP7
GND.A6TP (GND)
f.

Set signature analyzer controls as follows:
START .~[_
STOP. F
CLOCK.r
HOLD.Released

g.

VH=31PA, VHP=31PA, VL=0000, VLP=0000

SIGNATURE ANALYSIS PROCEDURE NO. 4
a.

Set 1611A LINE switch to on position.

h. Verify that signature measurements called out
in troubleshooting tree match following table.
MEASUREMENT
NUMBER

TEST POINT

A6U24, PIN 2
A6U24, PIN 5
A6U24, PIN 7
A6U24, PIN 10
A6U24, PIN 12
A6U24, PIN 15
A6U1, PIN 13
A6U27, PIN 9
303

A6TP5

Set 1611A LINE switch to off position.

b. Remove A6, A7, A8, A9, and A10 assemblies
from 1611 A.
c.

Reinstall A6 on extender board A14.

d.

Ground A5U3, pin 6.

VH=7092, VHP=7092, VL=0000, VLP=0000

SIGNATURE

8791
VL or VLP
VL orVLP
8791
8791
8791
VL or VLP
VL or VLP

e. Connect signature analyzer probe to the fol¬
lowing circuit points:

SIGNATURE ANALYSIS PROCEDURE NO. 5
START .A6TP4
STOP.A6TP4
CLOCK.A6TP2
GND.A6TP (GND)
f.

Set 1611A LINE switch to off position.

b. Remove A6, A7, A8, and A10 assemblies from
1611A.

Set signature analyzer controls as follows:
START
STOP..

4UF5

a.

c.

Reinstall A6 on extender board A14.

d.

Ground A5U3, pin 6.

Figure 8-4.1611A Troubleshooting (Sheet 2 of 8)

8-8

Service

## Page 57


Model 1611A
e. Connect signature analyzer probe to the fol¬
lowing circuit points:
START .A5U11, Pin 36
STOP.A5U11, Pin 36
CLOCK.A6TP3
GND.A5TP (GND)

CLOCK.A5U11, Pin 18
GND.A5TP (GND)
e.

g. Set 1611A LINE switch to on position.
h. Verify that signature measurements called out
in troubleshooting tree match following table.
MEASUREMENT
NUMBER

TEST POINT

SIGNATURE

501

VH

7A70

502

A6U33, PIN 12
A6U33, PIN 9
A6U33, PIN 7
A6U33, PIN 4
A6U32, PIN 12
A6U32, PIN 9
A6U32, PIN 7
A6U32, PIN 4
A6U31, PIN 12
A6U31, PIN 9
A6U31, PIN 7

6H44
PF45
7H02
355A
3P32
9A40
AAHA
A077
F86A
AF5U
VLP

_

a.

MEASUREMENT
NUMBER

TEST POINT

SIGNATURE

601

VH

755U

602

MEMORY BUS
A5U9, PIN 13
A5U9, PIN 9
A5U9, PIN 1
A5U9, PIN 5
A5U8, PIN 13
A5U8, PIN 9
A5U8, PIN 1
A5U8, PIN 5

VH
VH
VH
VH
VH
VH
VH
VH

DATA BUS
A5U20, PIN 8
A5U20, PIN 11
A5U20, PIN 6
A5U20, PIN 3
A5U10, PIN 8
A5U10, PIN 11
A5U10, PIN 6
A5U10, PIN 3

H335
VLP
VLP
H335
H335
H335
VLP
VLP

MP OUTPUTS
A5U11, PIN 10
A5U11, PIN 9
A5U11, PIN 8
A5U11, PIN 7
A5U11, PIN 3
A5U11, PIN 4
A5U11, PIN 5
A5U11, PIN 6

H335
VLP
VLP
H335
H335
H335
VLP
VLP

603

604

b. Remove A6, A7, A8, and A10 assemblies from
1611A.
NOTE

c.

Ground A5U3, pin 6.

d. Connect signature analyzer probe to the fol¬
lowing circuit points:
START .A5U11, Pin 36
STOP.A5U11, Pin 36

A6U30, PIN 5
A6U30, PIN 4
A6U30, PIN 1
A6U29, PIN 11

9P9F
HPF6
A8H9
UF9P

607

A6U29, PIN 10
A6U30, PIN 6
A6U29, PIN 8

89F1
HA34
AU6C

608

A5U11, PIN 17
A5U3, PIN 4

VLP
VHP

609

A8U17, PIN 15
A8U18, PIN 15
A8U19, PIN 15
A8U20, PIN 15
A8U21, PIN 15
A8U22, PIN 15

VH
VH
VH
VH
VH
VH

A8U24, PIN 2
A8U24, PIN 1
A8U24, PIN 12
A8U24, PIN 13
A8U24, PIN 14
A8U24, PIN 15
A8U29, PIN 6
A8U29, PIN 8
A8U29, PIN 5
A8U29, PIN 4
A8U29, PIN 10

VH
VH
VH
722H
050U
F44F
VL
A41U
H335
VLP
AC99

A6U26, PIN 12
A6U26, PIN 10
A6U26, PIN 8
A6U26, PIN 6
A6U26, PIN 4
A6U26, PIN 2
A6U29, PIN 2
A6U29, PIN 6

1079
VH
VH
1079
1079
1079
VH
VH

A6U25, PIN 2
A6U25, PIN 5
A6U25, PIN 7
A6U25, PIN 10
A6U25, PIN 12

6526
VL
VL
6526
6526

g. Verify that signature measurements called out
in troubleshooting tree match following table.

Set 1611A LINE switch to off position.

The boards installed in the 1611A for the
following measurements depend upon the
Troubleshooting Tree. Follow the procedure
given in the Troubleshooting Tree.

722H
050U
F44F
A66A

605
(Cont’d)

Set 1611A LINE switch to on position.

VH=7A70, VLP=0000

SIGNATURE ANALYSIS PROCEDURE NO. 6

SIGNATURE

A5U12, PINS 11,
12
A5U12, PINS 9,
10
A5U21, PINS 11,
12
A5U21, PINS 9,
10
A5U21, PINS 2,3
A5U21, PINS 4,5
A5U21, PINS 6,7

J“

f.

TEST POINT

MEASUREMENT
NUMBER

Set signature analyzer controls as follows:
START .1_
STOP.
CLOCK. J"
HOLD.Released

f. Set signature analyzer controls as follows:
START .1_
stop.jCLOCK.1_
HOLD .Released

MEASUREMENT
NUMBER

605

|

ADDRESS BUS
A5U2, PIN 13
A5U2, PINS 9, 8
A5U12, PINS 2,3
A5U2, PINS 1, 3
A5U2, PINS 4, 6
A5U12, PINS 4,5
A5U12, PINS 6,7
A5U12, PINS 13,
14

606

|

64HU
9P9F
HPF6
UF9P
A8H9
2225
0258
H6PP

610

611

612

612
(Cont’d)

074P

TEST POINT

SIGNATURE

A6U25, PIN 15
A6U28, PIN 9
A6U28, PIN 5

6526
VL
VL

HU57

VH=755U, VHP755U, VL=0000, VLP=0000
F1PF

SIGNATURE ANALYSIS PROCEDURE NO. 7.
a.

Set 1611A LINE switch to off position.

b. Remove A8 board from 1611A and reinstall on
Extender Board A14.
c. Connect signature analyzer probes to the fol¬
lowing circuit points:
START .A8U15, Pin 10 (TP7)
STOP.A8U15, Pin 10 (TP7)
CLOCK. A5U11, Pin 17 (DBIN)
GND.A8TP (GND)
d. Set signature analyzer controls as follows:
START ._T
STOP.
CLOCK.
HOLD .Released

“L
~L

e. Hold DON’T CARE key down and set LINE
switch to on position. Keep DON’T CARE key held
down for several seconds to force 1611A into loop to
check error in hardware.
NOTE
“ERROR IN HARDWARE”message must
be displayed during test no. 7 in order for
correct signatures to occur. If a wrong key
is pressed or circuit pins are shorted together,
repeat the power up sequence.
f. Verify that signature measurements called out
in troubleshooting tree match the following table.
MEASUREMENT
NUMBER

TEST POINT

SIGNATURE

701

VH

7C3U

702

A8U18, PIN 4
A8U18, PIN 7
A8U18, PIN 9
A8U18, PIN 12
A8U19, PIN 4
A8U19, PIN 7
A8U19, PIN 9
A8U19, PIN 12
A8U21, PIN 4

FAH7
3608
21FU
A6C8
FAH7
3608
21 FU
A6C8
7081

Figure 8-4.
1611A Troubleshooting (Sheet 3 of 8)
8-9

Model 1611A

## Page 58


Service

MEASUREMENT
TNUMBER

702
(Cont’d)

704

705 |

706

TEST POINT

SIGNATURE

A8U21, PIN 7
A8U21, PIN 9
A8U21, PIN 12
A8U22, PIN 4
A8U22, PIN 7
A8U22, PIN 9
A8U22, PIN 12

4H2C
68H2
C799
7081
4H2C
68H2
C799

A8U18, PIN 15
A8U18, PIN 1
A8U19, PIN 15

51F1
693U
C83P

A8U7, PIN 13
A8U7, PIN 3
A8U7, PIN 4
A8U7, PIN 11
A8U7, PIN 10
A8U29, PIN 13
A8U29, PIN 12
A8U29, PIN 9
A8U29, PIN 8
A8U2, PIN 5
A8U2, PIN 4
A8U2, PIN 6
A8U24, PIN 15
A8U24, PIN 14
A8U24, PIN 13

1200
VLP
VH
VLP
VHP
P9UU
P9UU
P9UU
P9UU
VHP
P9UU
92F0
38H3
756A
8AU8

A8U18, PIN 3
A8U18, PIN 6
A8U18, PIN 10
A8U18, PIN 13
A8U18, PIN 2
A8U18, PIN 5
A8U18, PIN 11
A8U18, PIN 14
A8U19, PIN 3
A8U19, PIN 6
A8U19, PIN 10
A8U19, PIN 13
A8U21, PIN 3
A8U21, PIN 6
A8U21, PIN 10
A8U21, PIN 13
A8U22, PIN 3
A8U22, PIN 6
A8U22, PIN 10
A8U22, PIN 13
A8U22, PIN 2
A8U22, PIN 5
A8U22, PIN 11
A8U22, PIN 14

A575
897A
4648
F534
F4CP
749F
FF87
F34F
3555
P463
A27P
6U1A
1A2U
58UF
73C9
5607
8F4A
6HF8
C936
5A3C
3420
4247
5864
PAH5

A8U14, PIN 3
A8U14, PIN 4
A8U14, PIN 5
A8U14, PIN 6
A8U9, PIN 3

AUUC
34U8
7P27
CU13
HU89

MEASUREMENT
NUMBER

706
(Cont’d)

f 707 1

TEST POINT

SIGNATURE

A8U9, PIN 4
A8U9, PIN 5
A8U9, PIN 6
A8U6, PIN 3
A8U6, PIN 4
A8U6, PIN 5
A8U6, PIN 6
A8U10, PIN 3
A8U10, PIN 4
A8U10, PIN 5
A8U10, PIN 6
A8U13, PIN 3
A8U13, PIN 4
A8U13, PIN 5
A8U13, PIN 6
A8U11, PIN 3
A8U11, PIN 4
A8U11, PIN 5
A8U11, PIN 6

6UF4
37P2
9CU1
AUUC
34U8
7P27
CU13
HU89
6UF4
37P2
9CU1
AUUC
34U8
7P27
CU13
HU89
6UF4
37P2
9CU1

A8U6, U9, U10,
Ull, U13, U14
PIN 1
A8U6, U9, U10,
Ull, U13, U14,
PIN 2
A8U6, U9, U10,
Ull, U13, U14,
PIN 7

VH

■■Hill
A8U6, U10,

MEASUREMENT
NUMBER

711

H576
846A
965P
HA14
45HC
47HH

A8U1, PIN 12
A8U1, PIN 13

VLP
4P18

A7U18, PIN 7
A7U18, PIN 5

VLP
CU13

714

A7U18, PIN 9

VHP

715

A7U30, PIN 15
A7U30, PIN 14
A7U30, PIN 13
A7U30, PIN 12
A7U31, PIN 8
A7U31, PIN 11
A7U31, PIN 10
A7U31, PIN 9
A7U19, PIN 11
A7U19, PIN 10
A7U19, PIN 9

VLP
VLP
VLP
VHP
VHP
VHP
VLP
VHP
VHP
VLP
VHP

A8U2, PIN 9
A8U2, PIN 10

VH
9443

713

VLP

VL
716
A69P
717

A8U8, PIN 1
A8U8, PIN 11

VL
VL

718

A8U4, PIN 13
A8U4, PIN 3

VL
VL

A8U5, PIN 15

VLP

PIN 9

708

710

A8U11, U13,
PIN 9

C86H

A8U7, PIN 13
A8U7, PIN 12
A8U16, PIN 15
A8U16, PIN 14
A8U16, PIN 13
A8U16, PIN 12
A8U7, PIN 11
A8U7, PIN 10
A8U29, PIN 13
A8U29, PIN 12
A8U29, PIN 9
A8U29, PIN 8
A8U2, PIN 1
A8U2, PIN 3

F4A8
1PU3
1PU3
2F2P
0001
VLP
VLP
VHP
VHP
VHP
VHP
VHP
VHP
VLP

A8U5, PIN 15
A8U5, PIN 5

VLP
VL

A8U2, PIN 13
A8U2, PIN 12
A8U2, PIN 11

719
720

VHP
VH
VLP

SIGNATURE

A8U21, PIN 2
A8U21, PIN 5
A8U21, PIN 11
A8U21, PIN 14
A8U19, PIN 2
A8U19, PIN 5

712

50PA

TEST POINT

A7U18, PIN 11
A7U18, PIN 12

VL
7P27

721

A7U18, PIN 7
A7U18, PIN 5

VLP
CU13

722

A7U20, PIN 14

VL

723

A7U33, PIN 11

VL

724

A7U18, PIN 12

7P27

725

A7U32, PIN 6
A7U32, PIN 10
A7U32, PIN 12

VL
VL
VL

MEASUREMENT
NUMBER

■
H

■

727

■

TEST POINT

SIGNATURE

A7U33, PIN 3
A7U33, PIN 4
A7U33, PIN 5

VH
VL
VH

A7U18, PIN 13
A7U18, PIN 4
A7U18, PIN 12
A7U18, PIN 5

AUUC
34U8
7P27
CU13

SIGNATURE ANALYSIS PROCEDURE NO. 8
a.

Set 1611A LINE switch to off position.

b. Remove A8 board from 1611A and reinstall on
Extender Board A14.
c. Connect signature analyzer probes to the fol¬
lowing circuit test points.
START.A5U11, Pin 36
STOP.A5U11, Pin 36
CLOCK.A5U11, PIN 18
GND.A5TP (GND)
d.

Set signature analyzer controls as follwos:
START,

•J

STOP .

•T

._r

CLOCK
HOLD..

Released

e.

Ground A5U3, pin 6.

f.

Set 1611A LINE switch to on position.

MESUREMENT
NUMBER
!■. •

TEST POINT
A8U15, PIN 10
A8U15, PIN 14
A8U15, PIN 12
A8U16, PIN 15
A8U16, PIN 14
A8U16, PIN 13
A8U16, PIN 12
A8U7, PIN 12
A8U7, PIN 13
A8U7, PIN 11
A8U7, PIN 10
A8U29, PIN 13
A8U29, PIN 12
A8U29, PIN 9
A8U29, PIN 8
A8U2, PIN 1

SIGNATURE
VL
H335
C719
H335
F44F
050U
H140
H335
A66A
HPF6
AC99
A8H9
UF9P
9P9F
A41U
VHP

VH=755U, VHP=755U, VL=0000, VLP=0000

Figure 8-4.1611A Troubleshooting (Sheet 4 of 8)

8-10

Service

## Page 59


Model 1611A

NOTE:

THE FOLLOWING PROCEDURES 00 NOT APPLY TO
OPTIONS 068 AND 080 IF EITHER OF THESE
PERSONALITY PANEL MODULES ARE INSTALLED IN
YOUR 1611A REFER TO SECTION VII FOR SIGNATURE
ANALYSIS PROCEDURES.

EXAMPLE OF BAD POWER-ON
DISPLAY WITH CORRECT
CHARACTER ANO RASTER SIZE
(A3 INT. ADJUSTMENT FULL CW)

1611A-010-01-11-78

Figure 8-4.
1611A Troubleshooting (Sheet 5 of 8)
8-11

Model 1611A

## Page 60


Service

|9e9e9e9e9e9e9@9e9@9@9e9e9e9@9^1
|9e9©S'{»9e9©9@9@9(g3e9@Se9l2r9e9e9@9@

■9J2:S'<?9(»l9@9(»9(59(29e9e.9@91g9e,9l(?g!|&9e^)i,
|9@9@9&9@9(»9e9e9e9e9e9e9@9@9(3,9l@^
■9@9@;9@:9@:9@:9(i>9@9@9(»9@9@3@9@9339£9g>
■9e9@9@9e9@9e9(s!9e9®9@9@9e9e9<»9e^f?

9e9ef9(»9e9@9e9<ii9Q9e9e9e,9e9e9(?3@9@
9®9<?9@9®9©9e9©9®9@9@9©9©9g9@9<ag©
9©9e9@9®9®9@9@9e9e9®9@9®9@9@9@9®
9©9®9»9@9<»9@9®9©9©9@9©3®9©9©9©^
9®9®9® 9© 9®9©9©9© 9©9© 9® 9©9©9®9©9©

SET UP TEST
NO. 4

301

9e9@9@989e9e9e9@9e9@9(?9ii>9(i9e9(i9,i
'9®9©9®9@9©9©9©9©9®9©9®9©9©:9®9(»3e
9@9@9e9e9@9e9S9§9@9@9@9@9(a9g9g9rJ
9® 9® 9® 9® 9® 9® 9©9©9© 9©9©9@9©9©3@<=« iV

A6TP7 CORRECT?
SEE WAVEFORMS ON
SERVICE SHEET 6

<^VHtt

9©9©9@9@9@9@9®9©9@9©9esH(»9©9©9@9€*
9©9©9©9©9©9©9©9®9©9©9®9@9®9©9®3e

CONNECT OSCILLOSCOPE
TO A5TP3

YES

REPAIR VERTICAL
SEE SERVICE SHEET 6

&e9@9@9@389e989ll9e9e989@9e9K>(»'*.

401

9©9©9@9®9©9©9©9®9®9®9®9e9©9@3©<*i*
9@9©9©9©9@9®9®9®9®9®9®9©9®9©9<i<<*r9®9@9®9®9®9®9®9ffi9®9®9®9©9®9®9©9©
5<®9®9©9®9®9®9®9®9®9©9©3CI*9©S»©9e91©

302
NO

CHECK
^
A6U24 OUTPUTS
U1 PIN 13 AND U27
^
PIN 9

DISPLAY WITH A5U3, PIN 6 GROUNDED
WAVEFORM A
PRESENT AT
A5 TP3?

CHECK TIMING

IS
VH CORRECT?
^

REMOVE GROUND
FROM A6TP1

SERVICE SHEET 5
"

REPAIR TIMING
GENERATOR. (SEE SERVICE
SHEET 5.)

)

402

^
A6TP5
\
SIGNAL CORRECT?

i__

i__i

REPAIR HORIZONTAL
SYNC GENERATOR
SEE SERVICE SHEET 6.

ON SERVICE
^\SHEET

\'

J
\/
403

404
|

CHECK A6U26. U29
OUTPUTS SHOULD BE HIGH

1

NO

/

niSPlAY
\
SAME AS SHOWN
JN FIGURE ABOVE?.

x—-v

304
THROUGH

CHECK REMAINING ICs
IN CHARACTER
GENERATOR

\
GOOD

OR U31 BAD

^

CHECK
A6U33. U32, U31
INPUTS

CHECK
A6U33, 32, U31
OUTPUTS

A6U6. U7, U8
U11, OR U12
BAD

SET UP TEST 5

310

502
^^CHECK
DISPLAY RAMS
A6U15U22
OUTPUT
\ PIN 12 ^

GOOD
s
>

\
/

SUSPECT A6U25, U28 OR
A6U26. U29

CHECK
A6U30B. PINS
10/12/13 WAVEFORMS SERVICE
\
SHEET 6
/

204

SUSPECT
A6U31, U32. U33 OR
A6U15-U22

REPAIR TIMING
GENERATOR. SEE
SERVICE SHEET 5

CHECK
RAM ADDRESS
SELECT SWITCH OUTPUT
A6U31, U32.
U33

CHECK
RAM ADDRESS ^
SELECT SWITCH INPUT
\ A6U31. U32.^-''
__'—

CHECK
A6U33. U32, U31
OUTPUTS

IS
VH CORRECT?

BAD
/

A6U31. U32, OR
U33 BAD

GOOD
\
'

A5U10. U20
OR A6U15-U22 BAD

SET UP TEST NO 6
WITH A6 INSTALLED

603
SET UP TEST 6
WITH A6 INSTALLED

206

205

1_
CHECK

CHECK
U2. U3. U12. U21

Bio^OUTPUTS

\
\

A6U15-U22
PIN 11

GOOD
\
-7

SUSPECT A6U15-U22
U27, U1

606

1

1

NO

^

207

SUSPECT A6U31. U32. U33
OR A5 U2. U3. U12, U21

^

CHECK
A5U11 DATA
OUTPUTS

SUSPECT A5U11.
U10. U20

j

A10. All, A12. A13
CORRECT?

607

608

|_

|

A6U29/U30

SUSPECT A5U10. U20
A6U15-U22

<r^

N , BAD

CHECK
^s**"
A5U11 PIN 17
AND A5U3
PIN 4

1611A-010-02-04-78

Figure 8-4.1611A Troubleshooting (Sheet 6 of 8)

8-12

Model 16UA

## Page 61


711
SET UP TEST NO 7

.

SET POWER SWITCH TO OFF
HOLD ' DON'T CARE' KEY
DOWN. AND SET LINE SWITCH
TO ON POSITION

REINSTALL A8 OARD IN 1611 A,
AND INSTALL A BOARD DN
EXTENDER BOA D A14

N '

HOLD "DON'T C/ RE" KEY DOWN
AND SET LINE S WITCH TO ON
POSITION

CHANGE CLOCK TO
A5U11 PIN 18
CLOCK EDGE = _f~
VH = HA5C

SUSPECT PASS COUNTER
OR DELAY COUNTER
OR OPEN TRACES
FROM A5U11

BAD
/ .

//
<

r

CHECK
A7U18 CLOCK
PIN 9

SUSPECT USA OR U4A

REINSTALL A8 BOARD IN 1611 A.
AND INSTALL A7 BOARD ON
EXTENDER BOARD A14
CHECK
A7U30 INPUTS

SUSPECT A7U18 OR OPEN
TRACE BETWEEN A5U11
AND A7U18

0 G)®0

SUSPECT A7U18
OR U33C

REPLACE SUSPECT ICs

SUSPECT A7U30
OR A7U18

Service

## Page 62


Service

## Page 63


BLOCK DIA

Each block
assembly in 1
areas are desc
rear of this m
the personalit;
ment for a p,
are described
each personali

POWER SUPP
—12, and +5 v

DISPLAY DRIV
three digital s
deflection, vei
that drive the
also developed

KEYBOARD. K
of keys for ent
1611 A. The k<
through a keyl
SEE SERVICE SHEET S2 IN
OPTION MANUAL SUPPLEMENT
FOR A9 TROUBLESHOOTING

j

Ag

MICROPROCE
BOARD SCAN
contains an 8'
1611A, a timii
signals used ii
ning circuit '
read the keyl
its instruction
processor read
the personality
A6, A7, and A
red).

RAM AND FI
contains the
display infon
resulting from
board. RAM is
and the displ
continuously ;

1611A-010-04-04-78

Figure 8-4.1611A Troubleshooting (Sheet 8 of 8)
8-14

Service

## Page 64


BLOCK DIAGRAM DESCRIPTION
Each block in the diagram represents a board
assembly in the 1611 A. Blocks in the gray-shaded
areas are described in detail on service sheets at the
rear of this manual. The remaining blocks make up
the personality module which configures the instru¬
ment for a particular microprocessor. These blocks
are described in detail in a manual supplement for
each personality module.

POWER SUPPLY. Power supply A2 provides the +2,
—12, and +5 volts required for operation of the 1611 A.
DISPLAY DRIVER AND CRT. Display Driver A3 uses
three digital signals from A6 to generate horizontal
deflection, vertical deflection, and blanking signals
that drive the CRT. Dc high voltages for the CRT are
also developed on this board.
KEYBOARD. Keyboard Assembly A4 contains a matrix
of keys for entering measurement parameters into the
1611A. The keyboard is read by the microprocessor
through a keyboard scanning circuit on A5.
MICROPROCESSOR, SYSTEM TIMING, AND KEY¬
BOARD SCANNER ASSEMBLY. This assembly (A5)
contains an 8080A microprocessor that controls the
1611A, a timing generator that provides basic clock
signals used in the instrument, and a keyboard scan¬
ning circuit which enables the microprocessor to
read the keyboard. The 8080 microprocessor gets
its instructions from ROM Board A10. The micro¬
processor reads the keyboard, monitors switches on
the personality panel, and controls and monitors the
A6, A7, and A8 assemblies via the buses (shown in
red).
RAM AND FORMAT GENERATOR. Assembly A6
contains the random-access memory that stores
display information and temporary information
resulting from trace specifications entered on the key¬
board. RAM is time shared between the microprocessor
and the display character generator. The RAM is
continuously scanned by the character generator

1611A-010-04-04-78

Figure8-4.1611A Troubleshooting (Sheet 8 of 8)

8-14

Model 1611A

which converts display information stored in RAM into
a video signal that drives the display. Horizontal and
vertical sync signals that control Display Driver A3
are also generated on this board.
COMPARATOR. Comparator A7 consists of the trigger
comparator and measurement control circuits. This
board compares the information from the system
under test with the trace specification and supplies
the appropriate measurement signals to the A8 board.
DATA STORE AND COUNTERS. A8 contains the high¬
speed memory where data from the microprocessor
under test is stored and counters that count time,
delay, and trigger occurrences.
PERSONALITY BOARD. Personality Board A9 inter¬
faces the 1611A to the microprocessor under test. It
collects address, data, and status information during
each machine or instruction cycle of the micro¬
processor under test and provides a clock that tells
the A7 and A8 boards when to process the informa¬
tion. The Personality Board also contains circuitry
which allows the 1611A to halt the microprocessor
under test and a circuit which generates the test
signals available at the PROBE TEST socket on All.
ROM BOARD. ROM Board A10 provides a read-only
memory which contains instructions for the micro¬
processor on A5 and data latches which store infor¬
mation from External Probe A12.
PERSONALITY PANEL. Personality Panel All contains
switches that control measurement mode and display
format. Panel indicators show status of the micro¬
processor under test. A probe test socket on the
personality panel allows
the operator to make a
quick operational check of the instrument.
EXTERNAL PROBE. Probe A12 is used to monitor up
to eight lines of information in the system under test.
MICROPROCESSOR PROBE. A13 is a dedicated probe
that connects the 1611A to the microprocessor under
test. It monitors the address, clock, data, and status
lines of the microprocessor.

Service

## Page 65


Model 1611A

1611A-028-03-78

Figure 8-5. 1611A Block Diagram

1S11A-030-01-77

Figure 8-6.
1611A Macro Flowchart
8-15

Model 1611A

## Page 66


Service
XA1A3 INTERCONNECTION LIST (CONT'D)

A1XA2 INTERCONNECTION LIST
PIN
A
1
B
2
C
3
D
4
E
5
F
6
H
7
J
8
K
9
L
10
M
11
N
12
P
13
R
14
S
15

ORIGIN

COM
NC
COM
COM
+5V
COM
+5V
COM
-12V
+5V
COM
+5V
COM
+5V
+12V
COM
+12V
-12V
-12V
XFMR SEC
COM
XFMR SEC
COM
XFMR SEC
+12V
XFMR SEC
COM
XFMR SEC
COM
XFMR SEC

A2P1-A

A1C3

L

A2P1-B
A2P1-2
A2P1-C
A2P1-3
A2P1-D
A2P1-4
A2P1-E
A2P1-5
A1P5-1
A2P1-6
A1P5-1
A2P1-7
A2P1-J
A2P1-8
A2P1-K
A2P1-9
A2P1-L
A1P5-4
A2P1-M
A1P5-4
A2P1-N
A1P5-5
A2P1-P
A1P5-5
A1P5-1
A1P5-3
A1P5-1
A1P5-2

A1C3
ALL BOARDS
A1C3
ALL BOARDS
A1C3
ALL BOARDS
A1C2
ALL BOARDS
A2P1-F, A3P1, CRT GND
ALL BOARDS
A2P1-H, A3P1, CRT GND
ALL BOARDS
A1C1
ALL BOARDS
A3P1-2, A5P1-100 THROUGH A10P1-100
A5P1-99 THROUGH A10P1-99
A1P4-1, A3P1-C
A2P1-10
A3P1-3
A2P1-11
A3P1-3
A2P1-12
A3P1-K, R
A2P1-13
A2P1-R, A3P1, CRT GND
A2P1-14
A2P1-S, A3P1, CRT GND
A2P1-15

M

CONNECTS TO

10
11
N
12
P
13
R
14
S
15

PIN
NO.

A
1
B
2
C
3
D
4
E
5
F
6
H
7
J
8
K
9

CONNECTS TO

SIGNAL

ORIGIN

HVSY
VERT GND
NC
+12V
-12V
COM
V YOKE
V YOKE
H YOKE
H YOKE
H YOKE
H YOKE
H YOKE
H YOKE
H YOKE
H YOKE
+12V
COM

A6P1-94
A2P1

A3P1-A
A3P1-1

A2P1-K
A2P1-L
A2P1
A3P1-D
A3P1-4
A3P1-E
A3P1-5
A3P1-F
A3P1-6
A3P1-H
A3P1-7
A3P1-J
A3P1-8
A2P1-P
A1P5-1

A3P1-2
A3P1-C

ORIGIN

HHSY
HORIZ GND
GRID 1
FOCUS
CATHODE
GRID 2
+5V
COM
+12V
-12V
VIDEO
VIDEO GND

A6P1-95
A2P1
A3P1-M
A3P1-11
A3P1-N
A3P1-12
A2P1
A1P5-1
A2P1-P
A2P1-L
A6P1-96
A2P1

CONNECTES TO
A3P1-L
A3P1-10
A1P4-4
A1P4-3
A1P4-6
A1P4-5
A3P1-P
A3P1-13
A3P1-R
A3P1-14
A3P1-S
A3P1-15

A1 INTERCONNECTION LIST (XA5, XA6)

A1XA3 INTERCONNECTION LIST
PIN

SIGNAL

PIN

SIGNAL

A1P3-2
A1P3-1
A1P3-3
A1P3-3
A1P3-3
A1P3-3
A1P3-4
A1P3-4
A1P3-4
A1P3-4
A3P1-K
A3P1-9

CONNECTS TO

ORIGIN

SIGNAL

1
2
3
4
5

+5V
+5V
KS0
KS1
KS2

A2P1
A2P1
A4W1-15
A4W1-2
A4W1-14

A5P1-1, A6P1-1
A5P1-2, A6P1-2
A5P1-3
A5P1-4
A5P1-5

6
7
8
9
10

KS3
KS4
KS7
KS GND
KS GND

A4W1-3
A4W1-13
A4W1-4
A4W1-1, 5, 12, 16
A4W1-1, 5, 12, 16

A5P1-6
A5P1-7
A5P1-8
A5P1-9
A5P1-10

11
12
13
14
15

GND on XA5, +5V on XA6
GND on XA5,+5V on XA6
SCAN D
SCAN A
SCAN B

A2P1
A2P1
A5P1-13
A5P1-14
A5P1-15

A5P1-11, A6P1-11
A5P1-12, A6P1-12
A4W1-10
A4W1-7
A4W1-8

16
17
18
19
20

SCANC
SWO
SW1
SW2
SW3

A5P1-16
A11W1-14
A11W1-1
A11W1-13
AUW1-2

A4W1-9
A5P1-17
A5P1-18
A5P1-19
A5P1-20

21
22
23
24
25

SW4
SW5
SW6
SW7
NC

A11W1-12
A11W1-3
A11W1-11
A11W1-4

A5P1-21
A5P1-22
A5P1-23
A5P1-24

26
27
28
29
30

NC
GND on XA5, +5V on XA6
GND on XA5.+5V on XA6
GND
GND

A2P1
A2P1
A2P1
A2P1

A5P1-27, A6P1-27
A5P1-28, A6P1-28
A5P1-29, A6P1-29
A5P1-30, A6P1-30

Figure 8-7. Service Sheet 1, Main Board Assembly Al, Interconnections (Sheet 1 of 4)
8-16

Model 1611A

## Page 67

A1 INTERCONNECTION LIST (XA5, XA6) (CONT’D)

A1 INTERCONNECTION LIST (XA5, XA6) (CONT’D)
PIN
NO.

SIGNAL

ORIGIN

CONNECTSTO

A5P1-31, A6P1-31
A5P1-32, A6P1-32
A5P1-33, A6P1-33
A5P1-34, A6P1-34
A5P1-35, A6P1-35

76
77
78
79
80

LREAD
HWRT
A0
Al
A2

A5P1-76
A5P1-77
A5P1-78
A5P1-79
A5P1-80

A7P1-76, A8P1-76
A6P1-77, A7P1-77, A8P1-77
A6P1-78, A7P1-78, A8P1-78, A10P1-78
A6P1-79, A7P1-79, A8P1-79, A10P1-79
A6P1-80, A7P1-80, A8P1-80, A10P1-80

A2P1
A2P1
A2P1
A5P1-39
A2P1

A5P1-36, A6P1-36
A5P1-37, A6P1-37
A5P1-38, A6P1-38
A6P1-39
A5P1-40, A6P1-40

81
82
83
84
85

A3
A4
A5
A6
A7

A5P1-81
A5P1-82
A5P1-83
A5P1-84
A5P1-85

A6P1-81, A7P1-81, A8P1-81, A10P1-81
A6P1-82, A7P1-82, A10P1-82
A6P1-83, A7P1-83, A10P1-83
A6P1-84, A7P1-84, A10P1-84
A6P1-85, A10P1-85

GND
HmPCY
GND
GND
NC

A2P1
A5P1-42
A2P1
A2P1

A5P1-41, A6P1-41
A6P1-42
A5P1-43, A6P1-43
A5P1-44, A6P1-44

86
87
88
89
90

A8
A9
A10
All
A12

A5P1-86
A5P1-87
A5P1-88
A5P1-89
A5P1-90

A6P1-86, A10P1-86
A6P1-87, A7P1-87, A8P1-87, A10P1-87
A6P1-88, A7P1-88. A8P1-88, A10P1-88
A6P1-89, A7P1-89, A8P1-89, A10P1-89
A6P1-90, A7P1-90, A8P1-90, A10P1-90

46
47
48
49
50

LDSTOR
PEXCK
NC
NC
LLSRE

A8P1-46
A9P1-47

A9P1-46
A10P1-47

A5P1-50

A6P1-50

91
92
93
94
95

A13
LDLYL
HDSBL
HTRG
HARM

A5P1-91
A7P1-92
A7P1-93
A7P1-94
A7P1-95

A6P1-91, A7P1-91, A8P1-91, A10P1-91
A8P1-92, A9P1-92
A8P1-93
A8P1-94
A8P1-95

51
52
53
54
55

NC
NC
NC
NC
NC

96
97
98
99
100

LTPT
GND
GND
-12V
+12V

A8P1-96
A2P1
A2P1
A2P1
A2P1

A1U1-5

56
57
58
59
60

200 ns CK
NC
1 ns CK
2 Hz CK
M0

A5P1-56

A6P1-56

A5P1-58
A6P1-59
A6P1, A8P1, A10P1-60

A7P1-58, A9P1-58
A9P1-59
A5P1-60

61
62
63
64
65

Ml
M2
M3
M4
M5

A6P1, A8P1, A10P1-61
A6P1, A8P1, A10P1-62
A6P1, A8P1, A10P1-63
A6P1, A8P1, A10P1-64
A6P1, A8P1, A10P1-65

66
67
68
69
70

M6
M7
DO
D1
D2

71
72
73
74
75

D3
D4
D5
D6
D7

PIN
NO.

SIGNAL

31
32
33
34
35

GND
GND
GND
GND
GND

A2P1
A2P1
A2P1
A2P1
A2P1

36
37
38
39
40

GND
GND
GND
PRWCK
GND

41
42
43
44
45

ORIGIN

CONNECTSTO

A1 INTERCONNECTION LIST (XA7, XA8, XA9P1, XA10P1)
PIN
NO.

SIGNAL

ORIGIN

A5P1-61
A5P1-62
A5P1-63
A5P1-64
A5P1-65

1
2
3
4
5

+5 V
+5 V
EXT0
EXT 1
EXT 2

A2P1
A2P1
A10P1-3
A10P1-4
A10P1-5

A7P1-3, A8P1-3
A7P1-4, A8P1-4
A7P1-5, A8P1-5

A6P1, A8P1, A10P1-66
A6P1, A8P1, A10P1-67
A5P1-68
A5P1-69
A5P1-70

A5P1-66
A5P1-67
A6P1-68, A7P1-68, A8P1-68
A6P1-69, A7P1-69, A8P1-69
A6P1-70, A7P1-70, A8P1-70

6
7
8
9
10

EXT 3
EXT 4
EXT 5
EXT 6
EXT 7

A10P1-6
A10P1-7
A10P1-8
A10P1-9
A10P1-10

A7P1-6, A8P1-6
A7P1-7, A8P1-7
A7P1-8, A8P1-8
A7P1-9, A8P1-9
A7P1-10, A8P1-10

A5P1-71
A5P1-72
A5P1-73
A5P1-74
A5P1-75

A6P1-71, A7P1-71, A8P1-71
A6P1-72, A7P1-72, A8P1-72
A6P1-73, A7P1-73, A8P1-73
A6P1-74, A7P1-74, A8P1-74
A6P1-75, A7P1-75, A8P1-75

11
12
13
14
15

INP
INP
INP
INP
INP

A9P1-11
A9P1-12
A9P1-13
A9P1-14
A9P1-15

A7P1-11, A8P1-11
A7P1-12, A8P1-12
A7P1-13, A8P1-13
A7P1-14, A8P1-14
A7P1-15, A8P1-15

DO
D1
D2
D3
D4

CONNECTS TO

Service

## Page 68

A1 INTERCONNECTION LIST (XA5, XA6) (CONT’D)

A1 INTERCONNECTION LIST (XA7, XA8, XA9P1, XA10P1) (CONT'D)

PIN
NO.

SIGNAL

ORIGIN

CONNECTSTO

PIN
NO.

SIGNAL

76
77
78
79
80

LREAD
HWRT
A0
A1
A2

A5P1-76
A5P1-77
A5P1-78
A5P1-79
A5P1-80

A7P1-76, A8P1-76
A6P1-77, A7P1-77, A8P1-77
A6P1-78, A7P1-78, A8P1-78, A10P1-78
A6P1-79, A7P1-79, A8P1-79, A10P1-79
A6P1-80, A7P1-80, A8P1-80, A10P1-80

16
17
18
19
20

INP D5
INP D6
INP D7
FLAG0
FLAG 1

A9P1-16
A9P1-17
A9P1-18
A9P1-19
A9P1-20

A7P1-16, A8P1-16
A7P1-17, A8P1-17
A7P1-18, A8P1-18
A8P1-19
A8P1-20

81
82
83
84
85

A3
A4
A5
A6
A7

A5P1-81
A5P1-82
A5P1-83
A5P1-84
A5P1-85

A6P1-81, A7P1-81, A8P1-81, A10P1-81
A6P1-82, A7P1-82, A10P1-82
A6P1-83, A7P1-83, A10P1-83
A6P1-84, A7P1-84, A10P1-84
A6P1-85, A10P1-85

21
22
23
24
25

FLAG 2
FLAG 3
INP A0
INP A1
INP A2

A9P1-21
A9P1-22
A9P1-23
A9P1-24
A9P1-25

A8P1-21
A8P1-22
A7P1-23, A8P1-23
A7P1-24, A8P1-24
A7P1-25, A8P1-25

86
87
88
89
90

A8
A9
A10
All
A12

A5P1-86
A5P1-87
A5P1-88
A5P1-89
A5P1-90

A6P1-86, A10P1-86
A6P1-87, A7P1-87, A8P1-87, A10P1-87
A6P1-88, A7P1-88. A8P1-88, A10P1-88
A6P1-89, A7P1-89, A8P1-89, A10P1-89
A6P1-90, A7P1-90, A8P1-90, A10P1-90

26
27
28
29
30

INP
INP
INP
INP
INP

A3
A4
A5
A6
A7

A9P1-26
A9P1-27
A9P1-28
A9P1-29
A9P1-30

A7P1-26, A8P1-26
A7P1-27, A8P1-27
A7P1-28, A8P1-28
A7P1-29, A8P1-29
A7P1-30, A8P1-30

91
92
93
94
95

A13
LDLYL
HDSBL
HTRG
HARM

A5P1-91
A7P1-92
A7P1-93
A7P1-94
A7P1-95

A6P1-91, A7P1-91, A8P1-91, A10P1-91
A8P1-92, A9P1-92
A8P1-93
A8P1-94
A8P1-95

31
32
33
34
35

INP
INP
INP
INP
INP

A8
A9
A10
All
A12

A9P1-31
A9P1-32
A9P1-33
A9P1-34
A9P1-35

A7P1-31, A8P1-31
A7P1-32, A8P1-32
A7P1-33, A8P1-33
A7P1-34, A8P1-34
A7P1-35, A8P1-35

96
97
98
99
100

LTPT
GND
GND
-12V
+12V

A8P1-96
A2P1
A2P1
A2P1
A2P1

A1U1-5

36
37
38
39
40

INP A13
INP A14
INP A15
MSC 0
MSC 1

A9P1-36
A9P1-37
A9P1-38
A8P1-39 \
A8P1-40 j

A7P1-36, A8P1-36
A7P1-37, A8P1-37
A7P1-38, A8P1-38

41
42
43
44
45

MSC 2
MSC 3
MSC 4
MSC 5
HRMC

A8P1-41\
A8P1-42
A8P1-43
A8P1-44J
A7P1-45

NOT USED WITH ALL
1611A OPTIONS

46
47
48
49
50

LDSTOR
PEXCK
PHLTEN
NSTOR
NCP

A8P1-46
A9P1-47
A8P1-48
A9P1-49
A9P1-50

A9P1-46
A10P1-47
A9P1-48
A8P1-49
A7P1-50

51
52
53
54
55

HENB
HDSB
LRST
NCNT

A7P1-51 (
A7P1-52
A7P1-53 1
A7P1-54
A7P1-55

56
57
58
59
60

HPCTC
HDLEN
1 ms CK
2 Hz CK
M0

A8P1-56
A7P1-57
A5P1-58
A6P1-59
A6P1, A8P1, A10P1-60

A1 INTERCONNECTION LIST (XA7, XA8, XA9P1, XA10P1)
PIN
NO.

SIGNAL

1
2
3
4
5

+5 V
+5 V
EXT0
EXT 1
EXT 2

A2P1
A2P1
A10P1-3
A10P1-4
A10P1-5

A7P1-3, A8P1-3
A7P1-4, A8P1-4
A7P1-5, A8P1-5

6
7
8
9
10

EXT 3
EXT 4
EXT 5
EXT 6
EXT 7

A10P1-6
A10P1-7
A10P1-8
A10P1-9
A10P1-10

A7P1-6, A8P1-6
A7P1-7, A8P1-7
A7P1-8, A8P1-8
A7P1-9, A8P1-9
A7P1-10, A8P1-10

11
12
13
14
15

INP
INP
INP
INP
INP

A9P1-11
A9P1-12
A9P1-13
A9P1-14
A9P1-15

A7P1-11, A8P1-11
A7P1-12, A8P1-12
A7P1-13, A8P1-13
A7P1-14, A8P1-14
A7P1-15, A8P1-15

DO
D1
D2
D3
D4

ORIGIN

CONNECTS TO

ORIGIN

CONNECTS TO

NOT USED WITH ALL OPTIONS

A8P1-45, A9P1-45

NOT USED WITH ALL
1611A OPTIONS
A8P1-54
A8P1-55
A7P1-56
A8P1-57
A7P1-58, A9P1-58
A9P1-59
A5P1-60

Figure 8-7. Service Sheet 1,
Main Board Assembly A1 Interconnections (Sheet 2 of 4)
8-17

Service

## Page 69


PIN
NO.

SIGNAL

ORIGIN

61
62
63
64
65

Ml
M2
M3
M4
M5

A6P1, A8P1, A10P1-61
A6P1, A8P1, A10P1-62
A6P1, A8P1, A10P1-63
A6P1, A8P1, A10P1-64
A6P1, A8P1, A10P1-65

A5P1-61
A5P1-62
A5P1-63
A5P1-64
A5P1-65

66
67
68
69
70

M6
M7
DO
D1
D2

A6P1, A8P1, A10P1-66
A6P1, A8P1, A10P1-67
A5P1-68
A5P1-69
A5P1-70

A5P1-66
A5P1-67
A6P1-68, A7P1-68, A8P1-68
A6P1-69, A7P1-69, A8P1-69
A6P1-70, A7P1-70, A8P1-70

71
72
73
74
75

D3
D4
D5
D6
D7

A5P1-71
A5P1-72
A5P1-73
A5P1-74
A5P1-75

A6P1-71, A7P1-71, A8P1-71
A6P1-72, A7P1-72, A8P1-72
A6P1-73, A7P1-73, A8P1-73
A6P1-74, A7P1-74, A8P1-74
A6P1-75, A7P1-75, A8P1-75

76
77
78
79
80

LREAD
HWRT
A0
A1
A2

A5P1-76
A5P1-77
A5P1-78
A5P1-79
A5P1-80

A7P1-76, A8P1-76
A6P1-77, A7P1-77, A8P1-77
A6P1-78, A7P1-78, A8P1-78, A10P1-78
A6P1-79, A7P1-79, A8P1-79, A10P1-79
A6P1-80, A7P1-80, A8P1-80, A10P1-80

81
82
83
84
85

A3
A4
A5
A6
A7

A5P1-81
A5P1-82
A5P1-83
A5P1-84
A5P1-85

A6P1-81, A7P1-81, A8P1-81, A10P1-81
A6P1-82, A7P1-82, A10P1-82
A6P1-83, A7P1-83, A10P1-83
A6P1-84, A7P1-84, A10P1-84
A6P1-85, A10P1-85

86
87
88
89
90

A8
A9
A10
All
A12

A5P1-86
A5P1-87
A5P1-88
A5P1-89
A5P1-90

A6P1-86, A10P1-86
A6P1-87, A7P1-87, A8P1-87, A10P1-87
A6P1-88, A7P1-88, A8P1-88, A10P1-88
A6P1-89, A7P1-89, A8P1-89, A10P1-89
A6P1-90, A7P1-90, A8P1-90, A10P1-90

91
92
93
94
95

A13
+5 V
+5 V
HVSY
HHSY

A5P1-91
A2P1
A2P1
A6P1-94
A6P1-95

A6P1-91, A7P1-91, A8P1-91, A10P1-91

96
97
98
99
100

VIDEO
GND
GND
-12 V
+12 V

A6P1-96
A2P1
A2P1
A2P1
A2P1

A3P1-S

CONNECTS TO

T

A1P1 INTERCONNECTION LIST

A1 INTERCONNECTION LIST (XA7, XA8, XA9P1, XA10P1) (CONT'D)
PIN NO.

SIGNAL

ORIGIN

CONNECTS TO

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16

KS GND
KS1
KS3
KS7
KS GND
+5 V
SCAN A
SCAN B
SCAN C
SCAN D
GND
KS GND
KS4
KS2
KS0
KS GND

A4W1-1
A4W1-2
A4W1-3
A4W1-4
A4W1-5
A2P1
A5P1-14
A5P1-15
A5P1-16
A5P1-13
A2P1
A4W1-12
A4W1-13
A4W1-14
A4W1-15
A4W1-16

A5P1-9, 10
A5P1-4
A5P1-6
A5P1-8
A5P1-9, 10
A4W1-6
A4W1-7
A4W1-8
A4W1-9
A4W1-10
A4W1-11
A5P1-9, 10
A5P1-7
A5P1-5
A5P1-3
A5P1-9, 10

A1P2 INTERCONNECTION LIST
PIN NO.

SIGNAL

ORIGIN

CONNECTS TO

G
1
2
3
4
5
6
7
8
9
10
11
12
13
14

SW1
SW3
SW5
SW7
+5 V
+5 V
+5 V
GND
GND
GND
SW6
SW4
SW2
SWO

A11W1-1
A11W1-2
A11W1-3
A11W1-4
A2P1
A2P1
A2P1
A2P1
A2P1
A2P1
A11W1-11
A11W1-12
A11W1-13
A11W1-14

A5P1-18
A5P1-20
A5P1-22
A5P1-24
A11W1-5
A11W1-6
A11W1-7
A11W1-8
A11W1-9
A11W1-10
A5P1-23
A5P1-21
A5P1-19
A5P1-17

A3P1-A
A3P1-L

8-18

Model 1611A

## Page 70


Service

A1P1 INTERCONNECTION LIST
PIN NO.

SIGNAL

ORIGIN

CONNECTS TO

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16

KS GND
KS1
KS3
KS7
KS GND
+5 V
SCAN A
SCAN B
SCANC
SCAND
GND
KS GND
KS4
KS2
KSO
KS GND

A4W1-1
A4W1-2
A4W1-3
A4W1-4
A4W1-5
A2P1
A5P1-14
A5P1-15
A5P1-16
A5P1-13
A2P1
A4W1-12
A4W1-13
A4W1-14
A4W1-15
A4W1-16

A5P1-9, 10
A5P1-4
A5P1-6
A5P1-8
A5P1-9, 10
A4W1-6
A4W1-7
A4W1-8
A4W1-9
A4W1-10
A4W1-11
A5P1-9, 10
A5P1-7
A5P1-5
A5P1-3
A5P1-9, 10

A1P2 INTERCONNECTION LIST
PIN NO.

1
2
3
4
5
6
7
8
9
10
11
12
13
14

SIGNAL

ORIGIN

CONNECTS TO

SW1
SW3
SW5
SW7
+5 V
+5 V
+5 V
GND
GND
GND
SW6
SW4
SW2
SWO

A11W1-1
A11W1-2
A11W1-3
A11W1-4
A2P1
A2P1
A2P1
A2P1
A2P1
A2P1
A11W1-11
A11W1-12
A11W1-13
A11W1-14

A5P1-18
A5P1-20
A5P1-22
A5P1-24
A11W1-5
A11W1-6
A11W1-7
A11W1-8
AllWl-9
A11W1-10
A5P1-23
A5P1-21
A5P1-19
A5P1-17

1611A-001-01 -01-77

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

Cl
C2
C3
C4
PI
P2
P3
P4
P5
R1

E-3
F-3
E-3
A-3
A-1
A-2
F-2
F-3
F-3
D-1

U1
XA2
XA3
XA5
XA6
XA7
XA8
XA9P1
XA10P1

B-4
D-3
G-2
A-2
B-2
B-2
C-2
C-2
D-2

Main Board A1 Component Locator
(01611-66501)

Figure 8-7. Service Sheet 1, Main Board Assembly A1 Interconnections (Sheet 3 of 4)
8-18

Model 1611A

## Page 71


Service

Model 1611A

## Page 72


Service

SERVICE SHEET 2
PRINCIPLES OF OPERATION
+5V POWER SUPPLY. The +5V supply is a switching
regulator with current limiting and over-voltage pro¬
tection. The series element Ql in the switching regula¬
tor is either saturated or in the cut-off condition.
Therefore, very little power is dissipated in Ql. This
keeps power supply efficiency high.
The regulator operates as follows: A2U1 compares
output voltage of the power supply and a reference
voltage established by the VreF output of A2U1 and
divide network R4 through R8. When the output volt¬
age drops below the reference voltage, A2U1 turns Ql
on through A2Q1. When Ql is turned on, its emitter
voltage is very close to the unregulated DC at the in¬
put. R4 then increases the voltage reference that is
compared to the output voltage. As a result, the refer¬
ence voltage is higher when Ql is on than when it is
off. This dual threshold determines peak-to-peak
ripple of the supply. When Ql is on, current is supplied
to the load through LI. When the upper threshold is

met, A2U1 turns Ql off and the emitter voltage of Ql
goes to -0.6 volts. When Ql is off, the energy stored in
LI supplies current to the load. This current flows
through CR11. When the output voltage of the regulator
drops below the lower voltage reference threshold, Ql
again turns on and the cycle repeats.
The +5 volt regulator is protected against short cir¬
cuits and overloads. When Ql is on and the peak cur¬
rent through LI reaches 5 amperes, the voltage
between current limit and current sense of A2U1 is
sufficient to cause A2U1 to turn Ql off. After Ql is
turned off the current through LI must fall below
3.75 amperes and output of the supply must fall below
the lower voltage reference before Ql is turned on
again. As the load increases, the on time of Ql de¬
creases. If there is a malfunction in the regulator and
the output of the +5 volt supply goes above 5.6 volts,
the voltage developed across R18 will turn on SCR Q2
and blow fuse F3.
±12 V POWER SUPPLIES. The ±12 volt supplies are
three-terminal voltage regulators. They are internally
protected against thermal and current overloads.

CONNECTS TO A1XA2

A

B

C

D

E
1611A-002-01 -06-80

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

Cl
C2
C3
C4
C5
C6
C7
C8
C9
CIO
C11
Cl 2
Cl 3
CR1

B-1
B-2
B-1
B-2
B-4
D-3
D-3
C-4
E-2
E-2
C-1
D-1
D-3
C-2

CR2
CR3
CR4
CR5
CR6
CR7
CR8
CR9
CR10
CR11
CR 12
FI
F2
F3

C-2
C-2
C-2
B-1
B-2
C-2
C-2
D-2
D-2
B-3
B-4
D-4
E-4
D-4

LI
L2
MP2
Ql
Q2
R1
R2
R3
R4
R5
R6
R7
R8
R9

C-3
D-2
B-3
B-4
C-4
C-1
C-1
D-1
E-3
E-3
E-3
E-3
D-3
B-4

RIO
R11
R12
R13
R1 4
R1 5
R1 6
R17
R18
R19
TP1
TP2
TP3
TP4

B-4
B-4
D-3
D-3
E-3
D-2
D-2
C-4
C-4
E-2
B-4
B-4
B-4
C-4

TP5
TP6
TP7
TP8
TP9
TP1 0
TP1 1
TP1 2
TP1 3
TP1 4
U1
VR1
W1
W2
W3

C-4
C-4
D-4
D-4
D-3
D-4
D-3
E-4
E-3
E-2
D-3
D-3
A-4
A-2
A-1

Power Supply A2 Component Locator
(01611-66502)

Figure 8-8. Service Sheet 2, Low Voltage Power Supply A2 (Sheet 1 of 2)

8-20

Model 1611A

## Page 73


Service

## Page 74


Service

## Page 75


SERVICE SHEET 3
PRINCIPLES OF OPERATION
Display Driver A3 generates signals to drive the dis¬
play. The display is a magnetically-deflected, rasterscanned CRT. Display format is 24 lines of 32
characters each; each line consists of 10 horizontal
scans of the CRT. Three signals from the A6 assembly,
HVSY, HHSY, and VIDEO control the horizontal de¬
flection, vertical deflection, and video amplifier cir¬
cuits.
HORIZONTAL SYNC. HHSY (horizontal sync)
controls the horizontal deflection circuit and the highvoltage supply. The HHSY signal is applied to U5
where, under normal operation, it is inverted, and
used to drive U6. If the HHSY signal has an incorrect
repetition rate or pulse width, U5 prevents the out¬
puts of U6 from being on continuously, which would
result in damage to U6. U6 provides a current pulse
to the primary of Tl. The secondary of T1 drives the
horizontal deflection and high voltage circuits.
HIGH-VOLTAGE SUPPLY. The HV supply provides
dc voltages for the CRT, bias voltage for the horizontal
deflection circuit, and +35 volts for the video ampli¬
fier.
When Q9 is on, the current through L3 and the
primary of T2 increases. When Q9 is turned off, energy
stored in L3 and the primary of T2 rapidly charges
C27. The result of the rapid charging is a large positive
voltage across L3. This voltage is rectified by CR5 to
provide the CRT accelerator grid bias. The positive
voltage is also coupled to the secondaries of T2 where
it is rectified.
HORIZONTAL DEFLECTION CIRCUIT. The second¬
ary of Tl also controls the horizontal deflection circuit.
Just before Ql is turned off, current is flowing in the
deflection coil and the beam is at the right side of the
CRT. When Ql is turned off, the deflection coil cur¬
rent changes direction as C7 charges rapidly. After all
the energy is transferred to C7, it then discharges
through the coil, causing another change in direction
of coil current. The rapid charge and discharge of C7
causes a rapid retrace of the beam. At the end of re¬
trace, the voltage across the coil attempts to go nega¬
tive and charge C7 again. When voltage across the coil
reaches a few volts positive, CR1 turns on and be¬
comes the current path for the coil. This voltage clamp¬
ing by CR1 causes a constant rate of change in coil
current. This accounts for the first half of horizontal
scan. CR1 is turned on at a positive voltage, rather
than zero, to compensate for resistive elements in the
coil current path. This keeps the rate of current change
from being greater at the beginning of the sweep than
at the center or right side of the sweep.

When the beam reaches center screen, the deflection
coil current is zero. At this time, Ql is turned on and
the current flow changes direction. This deflects the
CRT beam toward the right side of the screen until Ql
turns off. When Ql turns off, retrace begins.
Compensation for the deflection rate at the sides of
the CRT is accomplished using C8. During the first
half of the sweep the charge on C8 increases slightly.
At center screen, when Ql is turned on, C8 is slowly
discharged, until the beam reaches the end of the
sweep. This reduces voltage across the deflection coil
at the beginning and end of the sweep, reducing the
rate of current change in the coil.
Size of the horizontal scan is controlled by R6. R6 con¬
trols the voltage available to the deflection circuit by
decreasing the coil current rate of change. Since the
period of the sync signal does not vary, the scan will
be shorter if the deflection rate is decreased.
Horizontal position is accomplished by injecting a
constant current into the deflection coil. R14 deter¬
mines the current. U1 compares voltage drops across
Cl2 and R4, and drives Q2 and Q3 until the voltage
drops are equal. This establishes a constant current
through R4.
VERTICAL DEFLECTION CIRCUIT. This circuit gen
erates the vertical sweep and controls height, linearity,
and position of the sweep. One vertical sweep of the
CRT occurs every 13.7 msec. Vertical sync (HVSY)
from A6 controls a ramp generator, which in turn con¬
trols current through the deflection coil. When HVSY
goes high, Q4 is turned on; this discharges C14 and
C15 through R20. HVSY remains high for 0.5 milli¬
seconds (until capacitor charge returns to a few milli¬
volts). When HVSY goes low, Q4 is turned off and C14
and C15 charge at a rate determined by R18 and R19.
R18 controls amplitude of the vertical sweep. Since the
period of HVSY is constant (13.7 milliseconds), R18
can be used to control the distance the beam is deflect¬
ed within that period.
The voltage ramp developed atthe junction of R20 and
C14 is applied to U4. Part of the output of U4 is fed
back to C14 and C15 to correct the voltage input of
U4 which compensates the ramp generator. R23 con¬
trols the amount of feedback, which in turn controls
the shape of the sweep generated. The ramp at the out¬
put of U4 drives current amplifier U3/Q5/Q6 which
maintains a current through the emitter of Q6 that is
proportional to the ramp voltage. U3 compares the
ramp voltage to voltage across R32. U3 drives Q5 until
the inputs to U3 are equal.

responds with the beam being at the top of the display.
As the Q6 current increases, more current from the +5
volt supply flows through Q6 and less through the de¬
flection coil. Coil current decreases and Q6 current
increases until the beam reaches center screen. At that
time, coil current has reached zero and begins to flow
in the opposite direction as Q6 current starts to draw
current from the coil and the +5 volts supply. When
the beam reaches the bottom of the screen, coil cur¬
rent is about the same as it was at the top of the screen
but is flowing in the opposite direction.
At the end of the sweep, Q6 is turned off abruptly,
and the current through R32 is reduced to zero. This
sudden change in coil current results in a positive
voltage pulse at the collector of Q6. This charges C19,
using energy stored in the deflection coil. This causes
the beam to return to center screen as C19 reaches its
peak voltage. C19 then discharges through R62 and the
deflection coil. Discharge current and the current
through L2 change the coil current direction and return
the beam to the top of the CRT. At this time, Q6 starts
conducting again and the sweep starts over.
Compensation for deflection rate at the top and bot¬
tom of the CRT is accomplished by C20 in a manner
similar to that used in the horizontal deflection circuit.
Position control is maintained by injecting a constant
current into the deflection circuit through R33.
VIDEO. This circuit amplifies the video signal to
drive the CRT cathode. Gain control R61 is provided
for contrast adjustment of the display.

TROUBLESHOOTING
Before attempting to repair the A3 assembly, verify
that horizontal sync, vertical sync and video signals
from A6 are present (see waveforms). If these signals
are incorrect, see service sheet 6.
The presence of deflection currents can be checked
at A3TP8 and TP9. Isolation of deflection circuits and
positioning circuits can be accomplished by removing
A3R4 or A3R33; this will cause only a slight shift in
position of the display. The horizontal deflection cir¬
cuit and the video amplifier require voltages from the
high voltage supply. Always check the HV supply be¬
fore troubleshooting deflection or video problems.

5

c

-C2t

• —CR3-

4
R60
• -CR8• — CR6—
— R48-

—C28 —

If A3U6, A3Q1 or A3Q9 should fail, check capacitors
A3C2, A3C7 or A3C27. Open circuits or a decrease in
capacitance can cause the peak voltage across U6 or
Q9 to increase, causing breakdowns.

•

Deflection correction magnets on the coils are per¬
manently attached and are not adjustable. However,
they should be inspected for damage if display dis¬
tortion is evident.

—R 59-

MONOSTABLE U5 TIMING EQUATION
T = 0.4 RC
Where
R=kQ
C=pF
T=ns

NOTE.
BASE AND EMI"
ON Q1.Q6 AND
VIEWED FROM

A

^ "6

+ 275V 7\

+35V

BLANK

REF
DESIG

GRID
LOC

Cl
C3
C4
C5
C6
C7

C2
C4
B2
C3
E2
E2
D2

C8
C9

D2
E5

CIO
Cl 1
C12
C13

E5
E5
E4

C14
C15
C16
C1 7
C18

G2
G2
G1
B3
G3

BLANK
C2

+ 10V—I

UNBLANK

I—UNBLANK

START
RETRACE
27 ps

TTL

K

nr

—CR9—•

+-C35-

50 /Us

At the beginning of the sweep a very small current is
flowing through Q6 and a large current is flowing from
the +5 volt supply through deflection coil LI. This cor¬

-*•- 0.5 ms
TTL
j^- 13.7 ms-*13.7 ms

8-22

FI

Model 1611A

## Page 76


Service
responds with the beam being at the top of the display.
As the Q6 current increases, more current from the +5
volt supply flows through Q6 and less through the de¬
flection coil. Coil current decreases and Q6 current
increases until the beam reaches center screen. At that
time, coil current has reached zero and begins to flow
in the opposite direction as Q6 current starts to draw
current from the coil and the +5 volts supply. When
the beam reaches the bottom of the screen, coil cur¬
rent is about the same as it was at the top of the screen
but is flowing in the opposite direction.
At the end of the sweep, Q6 is turned off abruptly,
and the current through R32 is reduced to zero. This
sudden change in coil current results in a positive
voltage pulse at the collector of Q6. This charges C19,
using energy stored in the deflection coil. This causes
the beam to return to center screen as C19 reaches its
peak voltage. C19 then discharges through R62 and the
deflection coil. Discharge current and the current
through L2 change the coil current direction and return
the beam to the top of the CRT. At this time, Q6 starts
conducting again and the sweep starts over.
Compensation for deflection rate at the top and bot¬
tom of the CRT is accomplished by C20 in a manner
similar to that used in the horizontal deflection circuit.
Position control is maintained by injecting a constant
current into the deflection circuit through R33.
VIDEO. This circuit amplifies the video signal to
drive the CRT cathode. Gain control R61 is provided
for contrast adjustment of the display.

+ 275V -A

TROUBLESHOOTING
Before attempting to repair the A3 assembly, verify
that horizontal sync, vertical sync and video signals
from A6 are present (see waveforms). If these signals
are incorrect, see service sheet 6.
The presence of deflection currents can be checked
at A3TP8 and TP9. Isolation of deflection circuits and
positioning circuits can be accomplished by removing
A3R4 or A3R33; this will cause only a slight shift in
position of the display. The horizontal deflection cir¬
cuit and the video amplifier require voltages from the
high voltage supply. Always check the HV supply be¬
fore troubleshooting deflection or video problems.
If A3U6, A3Q1 or A3Q9 should fail, check capacitors
A3C2, A3C7 or A3C27. Open circuits or a decrease in
capacitance can cause the peak voltage across U6 or
Q9 to increase, causing breakdowns.
Deflection correction magnets on the coils are per¬
manently attached and are not adjustable. However,
they should be inspected for damage if display dis¬
tortion is evident.
MONOSTABLE U5 TIMING EQUATION
T = 0.4 RC
Where
R=kO

C=pF
T=ns

A

DC ^+35V

+35V * q

BLANK

REF
DES1G

GRID
LOC

REF
DESIG

+10V —I

UNBLANK

Cl

C2
C4
B2
C3
E2
E2

C2
C3
C4

UNBLANK

50 gs

C5
C6
C7

&

C8
C9
CIO
C11
C12
C13

START
RETRACE
27 jUs
TTL

H

h*

n_r

H
+150V i

G

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

C19

E3

C37

F2

R26
R27

F3
G3
F3
F3
B4

F2
F2 .
F2
F3
F2
F3

R45
R46
R47
R48
R49

A4
A3
A4

T2
TP1
TP2
TP3
TP4

D4
A5
C3

Q5
Q6
Q7

R8
R9
RIO
R11

R43
R44

C4

E5
F2

B5
E4

R25

CR1
CR2
CR3

02
Q3
Q4

R7

E2
F4

A3
D2
F2
A4
B4

E4

C20
C21
C22

BLANK

■ 8 Ids

-12V-

GRID
LOC

\rrn- 50 gs

I

13.7 ms

D2
D2
E5
E5
E5
E4

C1 4
Cl 5

FI
G2
G2

C16
Cl 7
C18

G1
B3
G3

C23
C24
C25

F4
E4
C4
B4

C26
C27

A4
B4

C28
C29
C30
C31

A3
A3

C32
C33
C34
C35
C36

B3
A3
A3
B3
B2
A2
B2

CR4
CR5
CR6
CR7
CR8
CR9
LI
L2
L3
L4
L5
MP1
MP2
Q1

B4
A4
D3
A4

Q8
Q9
Q10

A3

Ql 1

E3
F4

Q12
Q13

B5
D3
A2
B4
G4
C2

R1
R2
R3
R4
R5
R6

A2
A2
A3
A3
C2
C3
C3
B4
D3
D3

R12
R13
R14
R15
R16
R17
R18
R19
R20
R21
R22
R23
R24

E5
E5
E4
E4
E4
E4
E4
F2
F2
G2
F2
F2
G2
F2
G2
F2

R28
R29
R30
R31
R32
R33
R34
R35
R36
R37
R38
R39
R40
R41
R42

G2
F3
F3
E3
F3
E3
F4
F4
F4
F4
E3

R50
R51
R52
R53
R54
R55
R56
R57
R58
R59
R60
R61
T1

Figure 8-9. Service Sheet 3, Display Driver Assembly A3 (Sheet 1 of 2)
8-22

A4

A3
A2
A2

TP5

A3
B2

TP6
TP7
TP8
TP9

B2
A2
A2
A2

TP10
TP11
TP12
U1

A3
A3
A2
A4
B2
C4

U2
U3
U4
U5
U6
VR1
VR2

A2
A2
B2
B3
C3
D2
F3
F2
F2
E3
E4
F3
F2
F2
B3
C3
C3
C3

Service

## Page 77

Service

## Page 78


Figure 8-9. Service Sheet 3,
Display Driver Assembly A3 (Sheet 2 of 2)

Model 1611A

## Page 79


Service

SERVICE SHEET 4
PRINCIPLES OF OPERATION. (Also refer to keyboard
scanner circuit description on Service Sheet 5.)
KEYBOARD. The 1611A keyboard contains 39
switches wired in a matrix of 8 rows by 6 columns.
Each switch has two, one-turn coils wrapped around
a core. When a key is not pressed, the magnet is held
so that its field permeates the core, saturating it
completely; thus, there is very little coupling between
coils. If the key is pressed, the magnet is released and
the core and windings act as a transformer.

The primary (scan) windings of the switches are
wired together in eight rows. All windings in each
row are connected in series between R1/C3 and the
buffered outputs of BCD-To-Decimal decoder Ul. The
secondary (sense) windings are wired together in 6
columns. All windings in each column are connected
in series between ground and key-sense lines KSOKS4, and KS7. The key-sense lines go to the Keyboard
Scanner circuit on A5 (Service Sheet 5). Three sepa¬
rate ground paths are provided to switch columns for
isolation between column grounds.
The rows of switches are scanned by Ul. The out¬
puts of Ul are buffered by U2-U5 to increase their
current sink capability. The BCD inputs of Ul are
driven by SCAN A-C from the three LSB outputs of the
Keyscan Counter on A5. SCAN D functions as an
enable for Ul. Each time SCAN D goes low, SCAN A,
B, and C are interpreted as a count, driving the
selected output of Ul low.

When an output of Ul goes low, C3 is discharged
through the row of switches connected to that output.
This provides a sharp current pulse through the
primary winding of each switch. Since the discharge
rate of C3 is limited only by inductance of the switches,
a pulse width of approx 100 ns is obtained. If a key in
a row is pressed when that row is excited, a pulse is
generated on the key-sense line for that column due
to coupling between the primary and secondary
windings in the switch. This pulse is routed to the
Keyboard Scanner circuit on A5.

TROUBLESHOOTING
If the 1611A does not respond to a key or group
of keys, check the junction of A4R1 and A4C1 for the
proper waveform (shown on schematic). Adjust the
oscilloscope to observe at least eight cycles. If a pulse
is missing, a key may be open or one output of U2
through U5 may not be driving a row of switches. If
no pulses are detected at the junction of R1/C3, and
the inputs of U2 through U5 are being driven, one of
the outputs of U2 through U5 is shorted. Disconnect
A4W1 from Main Board A1 and use a current tracer
and logic pulser to detect the shorted output.
If the waveform at R1/C3 is correct, check the
output voltage of the keysense lines; It should be
from 1 to 2 volts when a key is depressed. If there
is no output voltage, a key switch in the monitored
column is faulty.

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRIO
LOC

REF
DESIG

GRID
LOC

Cl
C2
C3
R1
R2
SI
S2
S3
S4
S5
S6
S7

E-2
E-2
E-2
E-2
F-2
A-2
B-2
B-2
C-3
D-3
D-3
E-3

S8
S9
S10
SI 1
SI 2
SI 3
SI 4
SI 5
SI 6
SI 7
SI 8
SI 9

F-3
A-2
B-2
B-2
B-2
C-2
D-2
D-2
E-2
F-2
A-2
A-2

S20
S21
S22
S23
S24
S25
S26
S27
S28
S29
S30
S31

B-2
B-2
C-2
D-2
D-2
E-2
C-2
C-2
D-2
D-2
E-2
A-1

S32
S33
S34
S35
S36
S37
S38
S39
S40
S41
S42
S43

B-1
B-1
C-1
C-1
D-1
D-1
E-1
F-1
A-2
E-3
F-3
A-2

S44
S45
S46
S47
S48
Ul
U2
U3
U4
U5
W1

B-2
C-2
F-2
F-2
A-1
E-2
E-2
E-2
E-2
E-2
E-3

Keyboard A4 Component Locator
(01611-66504)

Figure 8-10. Service Sheet 4, Keyboard Assembly A4 (Sheet 1 of 2)

8-24

Model 1611A

## Page 80


o

FROM A5

5

FROM A2

2

Service

## Page 81


Cl 3
R1,2
SI 39
U1 5
W1

1G11A-004-02-1' -78

Figure 8-10. Service Sheet 4,
Keyboard Assembly A4 (Sheet 2 of 2)
8-25

SERVICE SHEET 5

## Page 82

PRINCIPLES OF OPERATION
MICROPROCESSOR AND I/O. 8080 Microprocessor
Ull is an N-channel MOS device with a separate
16-line address bus and an 8-line bidirectional data
bus. The microprocessor monitors both keyboard and
personality panel switches and configures the 1611A
circuits for selected operating modes and measure¬
ments. The microprocessor controls all data acquisi¬
tion and data manipulation in the 1611A. In addition,
it provides diagnostic routines for self-test, and gen¬
erates error and status messages.
The data bus on the microprocessor chip is the
only bidirectional bus in the 1611 A. During micro¬
processor read operations, DBIN (Ull, pin 17)
enables NAND gates U8/U9. This routes all data on
the MEMORY bus through to pins D0-D7 of the
microprocessor. During microprocessor write opera¬
tions, DBIN enables AND gates U10/U20. U10/U20
transfer data on pins D0-D7 of the microprocessor
to the pP DATA bus (PI, pins 68-75). NAND gates
U8/U9 are open collector devices which present a
high impedance to microprocessor data lines during
write operations.
Buffers U12/U21 and AND gates U2A/B/C buffer
the microprocessor address bus to increase the
limited drive capability of the MOS microprocessor.
The ij.P ADDRESS bus accesses ROM (ROM Board
A10) and RAM (Service Sheet 6). It also controls
most hardware in the instrument.
Microprocessor Power-up Circuit. C3, R6/R7, and
NAND gate U14C form the power-up circuit that
resets the microprocessor to its startup routine at
instrument turn on. The output of U14C holds the
RESET pin of the microprocessor high for a time
interval determined by RC network C3/R6/R7. The
microprocessor program counter is cleared during
this time. When RESET goes low, the microprocessor
starts at location 0 in memory.
TIMING GENERATOR. System timing signals for the
1611A are provided by the Timing Generator. The
Timing Generator consists of 10-MHz crystal Yl,
decade counter U23, hex "D" latch U22, and as¬
sociated gating.
The 10-MHz cystal oscillator drives decade counter
U23. U23 divides the 10-MHz signal to 1 MHz (1 ps CK)
and 5 MHz (200 ns CK). The 1 ps CK is used as the time
base for 1611A timing measurements and as the
clock for the probe Test Generator on A9. 200 ns CK is
routed to the display generator circuit on A6 and to
Hex "D" latch U22.
U22 is wired as a six-bit shift register. Eight-input
NAND gate U13 provides a low to the first stage of
the shift register only when outputs of the first five
stages are high. Therefore only one bit of the six-bit

shift register can be low at any time. Thus, the shift
register divides 200 ns CK by six and yields 833-kHz
outputs. U22 and RS latch U14A/B provide the twophase, non-overlapping clock for the microprocessor
(01 and 02), and other system timing signals required
by the instrument, (see timing diagram on this
service sheet.)
KEYBOARD SCANNER
Keyboard Scan. Keyboard scanning is accomplished
by six-bit Keyscan Counter U17B/U17A/U7A, which
is driven by 4-bit binary counter U7B. U7B divides
the 833-kHz system clock down to 52 kHz. The three
LSB's from the Keyscan Counter address the switch
rows on the keyboard through BCD-to-decimal
decoder A4U1 (Service Sheet 4). The three MSB's from
the counter address the switch columns through
8-to-l data selector U5. Thus the counter points to one
column of switches and scans each switch in the
column, then points to the next column of switches
and scans each switch in that column. In this manner
the Keyscan Counter repetitively scans the keyboard
until a depressed key is sensed.
Key Sense. Operation of the keysense circuit is best
explained by the following example: Assume the D
key is pressed; keycode for D is 15 (octal). Thus, the
switch is in row 5 of column 1 on the keyboard
matrix (see Service Sheet 4). When the keyscan count
reaches 001 101 (octal 15), data selector U5 is pointing
to KS 1 (D1 input) and row 5 of the matrix is excited.
Since D is held down, a pulse is generated on KS1
and applied to the base of U15Q2 (pin 6). Transistor
arrays U15 and U16 form a differential amplifier
The bases of Q4 in both arrays are connected in
parallel. Base voltage of each transistor is determined
by a voltage divider network consisting of a 20012
resistor (P/O U27), three 680012 resistors (P/O U26),
and R14. The voltage divider maintains the bases of
the two transistors at +0.7 V. Therefore, the pulse
(>+0.7 V) on KS1 turns U15Q2 on, forcing the D1
input of U5 low. Since the keyscan counter is pointing
to the D1 input of U5, the W output goes high,
triggering monostable U6. U6 clocks the Q output of
D flip-flop UlA high and places the first stage of the
keyscan counter in its hold state. This locks the
counter at state 15 and clears D flip-flop U1B. The
counter remains locked as long as D is depressed
because the monostable is re-triggered each time
SCAN D occurs and not allowed to time out.
The Keyscan Count (key code) is routed to the six
LSB of the MEMORY bus (M0-M5) through quad
2-to-l data selectors U18/U19. The two MSB's of
MEMORY bus (M6, M7) come from monostable U6
and D flip-flop UlA. The first time the micro¬
processor reads the keyboard, both lines are high.
The microprocessor sees 3158 on its data bus, indi¬
cating that key D is being read for the first time. At
the end of the first read, the positive-going edge on

the select line of U18/U19 clears UlA by clocking
U1B. Thus, on subsequent reads, the microprocessor
sees 1158 on its data bus. The 1 in the MSD indi¬
cates that the information has been read but the key is
still depressed. This condition is held until the D key
is released. The monostable then times out and un¬
locks the counter.
The counter then continues to scan the keyboard
until another depressed key is sensed. When the
counter is scanning, a 0 in the MSD of the keycode
indicates to the microprocessor that no key is
depressed.
Data selectors U18/U19 are enabled during a
microprocessor read operation by A14 (Ull, pin 39).
The data selectors select either the keyboard or the
switch lines (SW0-SW7) from personality panel All
under control of A15 (Ull, pin 36).
TROUBLESHOOTING
Most failures on the A5 assembly result in a faulty
display at turn-on. The troubleshooting tree in figure 8-4
should be used to isolate problems affecting the display.
The keyboard and personality panel can cause
problems that will not be seen until the power-up
routine is completed. If the 1611A fails to respond to
personality panel switches, check the switches as
follows: Toggle the HEXADECIMAL/OCTAL format
switch between both positions and verify that A5U18
pin 3 changes levels. Toggle the TEST MODE switch
while monitoring A5U19 pin 10. Verify that the signal
changes levels. Also check A5U19 pin 15 for a low
pulse. If the pulse is not present, check A5U4 and A5U2.
Check A5U19 pin 1 for presence of a toggling signal.
This signal determines whether the microprocessor
reads data from the personality panel or the keyboard.
If inputs are correct and the gating signal (U18/19 pin
15) and select signal (U18/19 pin 1) are present, U18 or
U19 is bad.
If the 1611A does not respond to the keyboard or
responds incorrectly, check U19 pins 1 and 15 as done
for the personality panel switches. Verify that U6 pin 8
is high only when a key is depressed. Verify that the
outputs of U17 and U7 do not toggle while U6 pin 8 is
high. If the instrument does not respond to a key,
check TP1 for presence of a clocking signal to U6.
Check for a pulse at one of the inputs of U5. If no
pulse is present, check keysense lines KS0-4 and KS7.
A pulse with amplitude of more than one volt indicates
that a key is depressed.
Incorrect key codes can be checked by pressing a key
while monitoring the outputs of keyscan counter
U17/U7 with a logic analyzer. The codes of each key
is shown on the keyboard schematic (see Service Sheet
4). Incorrect codes can result from U5 selecting the
wrong keysense line or from a fault on the keyboard. If
all signals from the Keyboard Scanner are correct,
replace U18 or U19.

DATA SELECTOR U5 TRUTH TABLE
INPUTS

OUTPUTS
TP1 TP2 TP3

SELECT

STROBE

□

C

B

A

S

Y

W

X
L
L
L
L
H
H
H
H

X
L
L
H
H
L
L
H
H

X
L
H
L
H
L
H
L
H

H
L
L
L
L
L
L
L
L

L
DO
D1
D2
D3
D4
D5
D6
D7

H
DO
D1
D2
D3
D4
D5
D6
D7

□

□

GND

□

I I
cc

cc

I l

BINARY COUNTER U7 TRUTH TABLE
OUTPUT
COUNT

0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15

Qd

QC

qb

Qq

L
L
L
L
L
L
L
L
H
H
H
H
H
H
H
H

L
L
L
L
H
H
H
H
L
L
L
L
H
H
H
H

L
L
H
H
L
L
H
H
L
L
H
H
L
L
H
H

L
H
L
H
L
H
L
H
L
H
L
H
L
H
L
H

DATA SELECTORS U18/U19 TRUTH TABLE
INPUTS
OUTPUT SELECT
CONTROL
X
L
L
H
II

H
L
L
L
L

OUTPUT Y
A

B

X
L
H
X
X

X
X
X
L
H

Z
H
L
H
L
Z=high impedance (off)

IdP HARDWARE ADDRESSES
ADDRESS
075300g

175700g

l>

UT'

G
1611A-005-01-01-77
REF
DESIG

GRID
LOC

Cl
C2
C3
C4
C5
C6
C7
C8
C9
CIO
R1
R2
R3
R4
R5
R6
R7
R8
R9
RIO
R11

B-4
B-4
A-2
C-4
F-3
C-4
E-3
C-2
B-2
F-1
E-3
C-4
C-4
C-2
C-3
A-3
B-3
A-2
B-4
B-4
B-4

MONOSTABL1

T = 0.4 RC

FUNCTION
Reads position of personality panel
switches
Reads keyboard

DECADE COU

COUNT E
TC = CET
PRESET =
RESET = i

s, the shift

## Page 83

ds 833-kHz
ie the two•oprocessor
ils required
n on this

complished
J7A, which
r7B divides
. The three
the switch
i-to-decimal
VlSB's from
is through
)ints to one
tch in the
of switches
bis manner
e keyboard

cuit is best
ume the D
. Thus, the
; keyboard
scan count
is pointing
: is excited,
ed on KS1
Transistor
amplifier
nnected in
determined
of a 200C
:P/0 U26),
ie bases of
the pulse
ng the D1
is pointing
goes high,
} output of
tage of the
locks the
U1B. The
depressed
each time
t.
. to the six
Dugh quad
MSB's of
ostable U6
the microare high,
bus, indist time. At
ig edge on

Service

the select line of U18/U19 clears U1A by clocking
U1B. Thus, on subsequent reads, the microprocessor
sees 1158 on its data bus. The 1 in the MSD indi¬
cates that the information has been read but the key is
still depressed. This condition is held until the D key
is released. The monostable then times out and un¬
locks the counter.
The counter then continues to scan the keyboard
until another depressed key is sensed. When the
counter is scanning, a 0 in the MSD of the keycode
indicates to the microprocessor that no key is
depressed.
Data selectors U18/U19 are enabled during a
microprocessor read operation by A14 (Ull, pin 39).
The data selectors select either the keyboard or the
switch lines (SW0-SW7) from personality panel All
under control of A15 (Ull, pin 36).
TROUBLESHOOTING
Most failures on the A5 assembly result in a faulty
display at turn-on. The troubleshooting tree in figure 8-4
should be used to isolate problems affecting the display.
The keyboard and personality panel can cause
problems that will not be seen until the power-up
routine is completed. If the 1611A fails to respond to
personality panel switches, check the switches as
follows: Toggle the HEXADECIMAL/OCTAL format
switch between both positions and verify that A5U18
pin 3 changes levels. Toggle the TEST MODE switch
while monitoring A5U19 pin 10. Verify that the signal
changes levels. Also check A5U19 pin 15 for a low
pulse. If the pulse is not present, check A5U4 and A5U2.
Check A5U19 pin 1 for presence of a toggling signal.
This signal determines whether the microprocessor
reads data from the personality panel or the keyboard.
If inputs are correct and the gating signal (U18/19 pin
15) and select signal (U18/19 pin 1) are present, U18 or
U19 is bad.
If the 1611A does not respond to the keyboard or
responds incorrectly, check U19 pins 1 and 15 as done
for the personality panel switches. Verify that U6 pin 8
is high only when a key is depressed. Verify that the
outputs of U17 and U7 do not toggle while U6 pin 8 is
high. If the instrument does not respond to a key,
check TP1 for presence of a clocking signal to U6.
Check for a pulse at one of the inputs of U5. If no
pulse is present, check keysense lines KS0-4 and KS7.
A pulse with amplitude of more than one volt indicates
that a key is depressed.
Incorrect key codes can be checked by pressing a key
while monitoring the outputs of keyscan counter
U17/U7 with a logic analyzer. The codes of each key
is shown on the keyboard schematic (see Service Sheet
4). Incorrect codes can result from U5 selecting the
wrong keysense line or from a fault on the keyboard. If
all signals from the Keyboard Scanner are correct,
replace U18 or U19.

Model 1611A

DATA SELECTOR U5 TRUTH TABLE
INPUTS

OUTPUTS

SELECT

STROBE

C

B

A

S

Y

W

X
L
L
L
L
H
H
H
H

X
L
L
H
H
L
L
H
H

X
L
H
L
H
L
H
L
H

H
L
L
L
L
L
L
L
L

L
DO
D1
D2
D3
D4
D5
D6
D7

H
DO
D1
D2
D3
D4
D5
D6
D7

BINARY COUNTER U7 TRUTH TABLE
OUTPUT
COUNT

0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15

Qd

QC

Qb

Qq

L
L
L
L
L
L
L
L
H
H
H
H
H
H
H
H

L
L
L
L
H
H
H
H
L
L
L
L
H
H
H
H

L
L
H
H
L
L
H
H
L
L
H
H
L
L
H
H

L
H
L
H
L
H
L
H
L
H
L
H
L
H
L
H

DATA SELECTORS U18/U19 TRUTH TABLE
INPUTS
OUTPUT
SELECT
CONTROL
H
L
L
L
L

X
L
L
H
H

OUTPUT Y
A

B

X
L
H
X
X

X
X
X
L
H

Z
H
L
H
L
Z=high impedance (off)

D
1611A-005-01 -01-77

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

Cl
C2
C3
C4
C5
C6
C7
C8
C9
CIO
R1
R2
R3
R4
R5
R6
R7
R8
R9
RIO
R1 1

B-4
B-4
A-2
C-4
F-3
C-4
E-3
C-2
B-2
F-1
E-3
C-4
C-4
C-2
C-3
A-3
B-3
A-2
B-4
B-4
B-4

R12
R13
R14
R15
TP1
TP2
TP3
TP4
TP5
TP6
TP7
TP8
TP9
U1
U2
U3
U4
U5
U6
U7
U8

B-4
F-2
F-3
F-3
G-4
G-4
F-4
B-4
B-4
A-4
C-2
A-2
G-3
F-4
E-4
B-4
B-4
G-3
F-3
E-3
E-3

U9
U10
Ull
U12
U1 3
U14
U1 5
U16
U17
U18
U19
U20
U21
U22
U23
U24
U25
U26
U27
U28
VR1
Y1

D-3
D-3
C-2
B-3
B-3
A-3
G-2
F-2
E-2
E-2
D-2
D-2
B-2
B-2
A-2
E-1
D-3
F-2
F-1
D-1
C-3
C-4

MONOSTABLE U6 TIMING EQUATION

/uP HARDWARE ADDRESSES
ADDRESS
0753008

175700g

T = 0.4 RC

FUNCTION
Reads position of personality panel
switches

where R is in kfl
C is in pF
T is in ns

DECADE COUNTER U23 COUNT EQUATION
COUNT ENABLE^ CEP • CET ■ PE
TC = CET •QO • Q1 • Q2 • Q3
PRESET ^JPE • CP+
RESET = MR

Reads keyboard

C

B

Microprocessor Board A5 Component Locator
(01611-66505)

1611A-005-01-03-78

ICs ON THIS SCHEMATIC
1C REF DES

HP PART NO.

MFR PART NO.

U1
U2, 10, 20
U3
U4
U5
U6
U7
U8, 9
Ull
U12, 21
U13
U14
U15, 16
U17
U18, 19
U22
U23
U24
U25, 26
U27
U28

1820-1112
1820-1201
1820-1199
1820-0471
1820-1217
1820-1422
1820-1464
1820-1198
1820-1783
1820-1491
1820-1207
1820-1425
1821-0001
1820-1282
1820-1439
1820-1196
1820-1429
1810-0283
1810-0049
1810-0163
1810-0121

SN74LS74N
SN74LS08N
SN74LS04N
SN7406N
SN74LS151N
SN74LS122N
SN74393N
SN74LS03N
8080AP
SN74LS367N
SN74LS30N
SN74LS132N
CA3046
SN74LS109N
SN74LS258N
SN74LS174N
SN74LS160N
1810-0283
1810-0049
1810-0163
1810-0121

Figure 8-11. Service Sheet 5, Microprocessor and Key Board Scan Assembly A5 (Sheet 1 of 2)
8-26

Model 1611A

## Page 84


tttt

tn - CHARACTER ROW SELECT, BLANKING, BLINKING, INVERSE VIDEO AND CHARACTER
ARE CLOCKED INTO U1 AND U24 FOR CHARACTER BEING DISPLAYED.
t1 - COUNTERS FOR DISPLAY ADDRESS ARE CLOCKED.
t2- DATA FROM RAM IS LATCHED INTO U25 AND U28 IF INTERNAL/iP IS ADDRESSING A6.
t3 - BLANKING AND CLOCK INHIBIT (U14) SIGNALS ARE LATCHED INTO U4 FOR NEXT
CHARACTER. DISPLAY DATA FROM CHARACTER ROM IS LOADED INTO SHIFT REGISTER
U14.

A6 Timing Diagram

nn

•ONLY WHEN 8080A ON A5 IS WRITING TO THE A6 ASSEMBLY (ADD=320008-327778)

Service

## Page 85


Figure 8-11. Service Sheet 5,
Microprocessor and Keyboard Scan Assembly A5 (Sheet 2 of 2)
8-27

© S3

## Page 86

A5 MICROPROCESSOR BD (01611-66505)

f 0 PI »=

KSO

SERVICE SHEET 6

## Page 87

PRINCIPLES OF OPERATION
RAM and Display Format Generator Assembly A6
consists of several circuits, lk-by-1 RAMs U15
through U22 form a lk-by-8 random access memory.
This memory stores display information for the
Character Generator and provides temporary data
storage for pP A5U11. The RAM is time shared
between the pP and the Character Generator. This is
accomplished with RAM Address Select Switch
U31-33. U31-33 are quad 2 line-to-1 line data selectors
that form a 10-pole, two-position switch. The switch
toggles between the pP ADDRESS Bus and the output
of the counter chain. The counter chain is made up of
Display Column Counter U8/U7, Character Line
Counter U6, and Display Line Counter U11/U12. The
switch is controlled by HpPCY.
The CRT displays 24 lines of 32 characters. Each
character is displayed as a 10-by-6 dot matrix. The
display has a horizontal raster scan with 240 scan lines
(24 lines of characters X 10 lines per character). Each
character displayed on the CRT corresponds to an
address in RAM. The upper left character is stored in
location 0. This character location corresponds with a
display column count of 0 and a display line count of 0.
The character next to the upper left character hori¬
zontally is stored in location 1 in RAM. The upperright character is stored in location 31; the second line
of characters correspond with addresses 32 through 63
in RAM, etc. The lower right character corresponds
to address 767io in RAM. Address 767i0 is read
when the display column count equals 31 and the dis¬
play line count equals 23. Character Line Counter U6
determines which of the ten lines of a character is
being written on the CRT screen by the Character
Generator.
The Character Generator provides the video signal
for Display Driver Assembly A3. The Character
Generator consists of 64-by-8-by-5 character generator
ROM U13, 8-bit shift register U14, AOI U3, and data
Latches Ul, U4, and U24. The Horizontal and Vertical
Sync Generators synchronize the raster scan with the
displayed data. The 2-Hz clock generator blinks the
display and drives the probe test generator on
personality board A9.
RAM. The 1024-by-8 RAM is controlled by the
pP when HpPCY is high. When the pP is addressing
RAM (HRADR=1), NAND gate U30B and data latches
U25 and U28A/B are enabled. When the pP is writing
to RAM (HWRT=1), U30B pulls the WE lines on the
RAMs low, writing information on the pP DATA Bus
into RAM. During pP read operations, the data out¬
puts from RAM are latched into data latches U25 and
U28A/B on the positive-going edge of HDSPC
(complement of HpPCY). Outputs of the latches are

applied to the MEMORY bus through open-collector
buffers U26 and U29. If the pP is not addressing RAM
(HRADR=0), write gate U30B is disabled and the data
latches are held in the clear state. This prevents the
open collector buffer outputs from driving the
MEMORY bus.
During the time that HpPCY is low, RAM is ad¬
dressed by the five LSBs of the Display Column
Counter and the five LSBs of the Display Line
Counter. The Character Generator reads from RAM
the character code for the character to be displayed.
The information is latched in data latches Ul and
U24 on the positive-going edge of HpPCY. DO through
D5 from RAM provides the character code. D6
determines whether the character is displayed in
inverse video (D6=l) or normal video (D6=0). D7
determines whether or not the character is blinked on
the display.
DISPLAY COLUMN COUNTER AND HORI¬
ZONTAL SYNC GENERATOR. Six-bit Display Column
Counter U8/U7 keeps track of which of the 32
characters on the displayed line is being addressed.
In addition to supplying the five LSB's of RAM
address, the counter also controls horizontal blanking
and the Horizontal Sync Generator.
When Display Column Counter MSB (U7, pin 13)
goes high on count 32, the condition is latched in U4.
This pulls pin 1 of AOI U3 high (HHBLK=1). HHBLK
forces the video signal to the Display Driver Assembly
high, blanking the CRT. At count 35, the Horizontal
Sync Generator is set. This generates HHSY which
initiates horizontal retrace. The counter continues to
count up to 41. The additional time is required by the
CRT for retrace. At count 41, the counter is reset
through U9B and the Character Line Counter is
incremented. The Display Column Counter starts over
and a new trace is initiated. At count 16, the Hori¬
zontal Sync Generator is reset. This forces HHSY low,
completing the cycle.
CHARACTER LINE COUNTER. Character line
Counter U6 keeps track of which of the 10 lines in
the 10-by-6 dot character is being written on the dis¬
play. The three LSB's of the counter output address
the three line select inputs (A1-A3) of character gen¬
erator U13 through data latch Ul. The MSB of the
counter output blanks lines 8 and 9 of the character
dot matrix to provide spacing between lines of
characters on the display. The MSB output also
increments the Display Line Counter when the tenth
line of a character is written on the display.
DISPLAY LINE COUNTER AND VERTICAL SYNC
GENERATOR. 5-bit Display Line Counter U11/U12
keeps track of which of the 24 rows of characters on
the display is being addressed. It supplies the five
MSB's of RAM address and controls vertical blanking
and the Vertical Sync Generator.

When the display line count reaches 24, the condition
is detected by NAND gate U10B and latched in U4
through Ul and U2F. This places HVBLK in the high
state. HVBLK forces VIDEO high through AOI U3,
blanking the CRT. At a count of 25, the Vertical Sync
Generator is set by the QC output of U6, the LSB of
the Display Line Counter, and HVBLK. This sets
HVSY high for 0.5 milliseconds, initiating vertical
retrace. During vertical retrace, the count of 25 is
detected by NAND gate U10C. U10C then resets the
Display Line Counter to 0.
CHARACTER GENERATOR. The Character Gen¬
erator consists of character generator ROM U13, 8-bit
shift register U14, AOI U3, and data latches U1/U4/
U24. The data latches store information needed by
the character generator to display each character. Ul
stores the three LSB's of character line count, vertical
and character-line blanking information, and inverse
video field information (D6 From RAM). U4 stores
blanking and inverse video information from Ul and
the horizontal blanking signal from the Display
Column Counter. U24 stores the six-bit character code
from RAM.
U13 is a 64-by-8-by-5 character generator ROM. It
is capable of generating the 64 characters in the modi¬
fied ASCII set. Each ROM character is an 8-by-5 dot
matrix. The actual displayed character is a 10-by-6
matrix. The first line of each character is always
blanked by U13. The last two lines of each character
are blanked by Character Line Counter U6. The first
column of each character is blanked by the H input of
shift register U14 (see character dot-matrix on this
Service Sheet).
Input A4 through A9 of U13 provide the 6-bit
character code that tells U13 which character to output.
Inputs A1 through A3 determine which line of the
character is generated. A1 through A3 are addressed
by the stored character line count from Ul. The code
for each line of a character is output to inputs G
through C of shift register U14 in parallel format.
The shift register outputs the character code in serial
format in sequence H through C.
The output code for the number 9 shown in the matrix
illustration is as follows:
CHARACTER
LINE NO.

05

0
1
2
3
4
5
6
7

0
0
1
1
0
0
0
1

U13 CODE OUTPUT
04
03
02
01
0
1
0
0
1
0
0
1

0
1
0
0
1
0
0
1

0
1
0
0
1
0
1
0

0
0
1
1
1
1
0
0

CHAR.
LINE

BLANKED BY H INPUT
OF SHIFT REGISTER
p-H
J- BLANKED BY U13

BLANKED BY
- CHARACTER
LINE COUNTER
0

1

2

3

4

5

Character Dot Matrix (9)
On the negative-going edge of the first 200 ns CLK
after LLSRE goes low, the shift register is parallel
loaded from the character generator. The H output
of the shift register is immediately presented at the
output. Since H is tied to ground, the first dot in each
character line is blanked. This provides the hori¬
zontal spacing between characters of the display. On
the next clock, the shift register starts outputting the
code in serial format beginning with G. After inputs
G through C are shifted out, LLSRE loads the shift
register with the code for the same character line of
the next character in the display line. The character
Generator writes line 0 of all 32 characters in a display
line, then horizontal retrace occurs. The Character
Generator then writes line 1 of all 32 characters in
the display line, and so forth until line 7 of all 32
characters has been written on the display. At this
point, the Character Line Counter is incremented to
eight, inhibiting the shift register for two scan lines.
This generates two blank lines on the display. The two
blank lines provide the vertical spacing between
characters on the CRT screen.
AOI U3 controls normal and inverse video, vertical
blanking, and horizontal blanking. When normal video
is displayed, HNORM enables U3 to Gate the H
output of U14 through to Display Driver Assembly A3.
When inverse video is displayed, U3 gates the H
output of U14 through to A3. In this manner, VIDEO
is inverted when inverse video is selected. AOI U3
blanks the display any time HVBLK or HHBLK is true.
Blinking characters are generated by alternately
displaying the character in normal video for 32 scans,
then blanking the character for 32 scans. This is
accomplished by gating the blinking signal (D7)
with the 2 Hz clock through U27B and U4. When the
2 Hz clock signal is low, D7 inhibits Ul4 from shifting.
This results in the character being blanked.
Relative timing between events on the A6 assembly
is shown in the timing diagram on this service sheet.

lgh open-collector

## Page 88

t addressing RAM
bled and the data
This prevents the
om driving the

low, RAM is adDisplay Column
le Display Line
reads from RAM
• to be displayed,
latches U1 and
PCY. DO through
racter code. D6
is displayed in
ideo (D6=0). D7
iter is blinked on

t AND HORIt Display Column
hich of the 32
being addressed.
LSB's of RAM
izontal blanking
SB (U7, pin 13)
is latched in U4.
BLK=1). HHBLK
Driver Assembly
i, the Horizontal
es HHSY which
iter continues to
i required by the
counter is reset
ane Counter is
inter starts over
nt 16, the Hori>rces HHSY low,

Character Line
the 10 lines in
tten on the disoutput address
’ character genhe MSB of the
)f the character
;ween lines of
!B output also
when the tenth
iplay.
RTICALSYNC
unter U11/U12
f characters on
ipplies the five
irtical blanking

When the display line count reaches 24, the condition
is detected by NAND gate U10B and latched in U4
through U1 and U2F. This places HVBLK in the high
state. HVBLK forces VIDEO high through AOI U3,
blanking the CRT. At a count of 25, the Vertical Sync
Generator is set by the QC output of U6, the LSB of
the Display Line Counter, and HVBLK. This sets
HVSY high for 0.5 milliseconds, initiating vertical
retrace. During vertical retrace, the count of 25 is
detected by NAND gate U10C. U10C then resets the
Display Line Counter to 0.
CHARACTER GENERATOR. The Character Gen¬
erator consists of character generator ROM U13, 8-bit
shift register U14, AOI U3, and data latches U1/U4/
U24. The data latches store information needed by
the character generator to display each character. U1
stores the three LSB's of character line count, vertical
and character-line blanking information, and inverse
video field information (D6 From RAM). U4 stores
blanking and inverse video information from U1 and
the horizontal blanking signal from the Display
Column Counter. U24 stores the six-bit character code
from RAM.
U13 is a 64-by-8-by-5 character generator ROM. It
is capable of generating the 64 characters in the modi¬
fied ASCII set. Each ROM character is an 8-by-5 dot
matrix. The actual displayed character is a 10-by-6
matrix. The first line of each character is always
blanked by U13. The last two lines of each character
are blanked by Character Line Counter U6. The first
column of each character is blanked by the H input of
shift register U14 (see character dot-matrix on this
Service Sheet).
Input A4 through A9 of U13 provide the 6-bit
character code that tells U13 which character to output.
Inputs A1 through A3 determine which line of the
character is generated. A1 through A3 are addressed
by the stored character line count from Ul. The code
for each line of a character is output to inputs G
through C of shift register U14 in parallel format.
The shift register outputs the character code in serial
format in sequence H through C.
The output code for the number 9 shown in the matrix
illustration is as follows:
CHARACTER
LINE NO.
0
1
2
3
4
5
6
7

U13 CODE OUTPUT
05
04
03
02
01
0
0
1
1
0
0
0
1

0
1
0
0
1
0
0
1

0
1
0
0
1
0
0
1

0
1
0
0
1
0
1
0

0
0
1
1
1
1
0
0

CHAR.
LINE

BLANKED BY H INPUT
OF SHIFT REGISTER
r-H

TROUBLESHOOTING

j- BLANKED BY U13

Most problems on the A6 assembly can be isolated
using the troubleshooting tree in figure 8-4. Horizontal
and vertical sync problems can be found using a logic
state analyzer.
VERTICAL SYNC PROBLEMS. Using A6U8 pin 2 as
a clock, monitor Display Column Counter A6U7/U8
with a logic state analyzer. The counter should count
from 0 to 41 and then start at zero again. If the count
is correct, the vertical sync problem is caused by
A6U9, U34, or U4.

BLANKED BY
- CHARACTER
LINE COUNTER
0

1

2

3

4

5

HORIZONTAL SYNC PROBLEMS. Using A6U6 pin 7
as a clock, monitor Character Line Counter U6. The
counter should count from 0 to 9 repetitively. Display

Blinking characters are generated by alternately
displaying the character in normal video for 32 scans,
then blanking the character for 32 scans. This is
accomplished by gating the blinking signal (D7)
with the 2 Hz clock through U27B and U4. When the
2 Hz clock signal is low, D7 inhibits tJ14 from shifting.
This results in the character being blanked.
Relative timing between events on the A6 assembly
is shown in the timing diagram on this service sheet.

INVERSE VIDEO PROBLEMS. Data line D6 from
A6U21 controls the inverse video field. After the
power-up sequence, D6 should be toggling. If inverse
video problems occur, trace the signal through Ul, U2,
and U4.
BLINKING PROBLEMS. Data line D7 from A6U22
controls blinking characters. After the power-up se¬
quence, D7 should be toggling. Check the 2-Hz signal
from U5 pin 13. If the blanking between display lines
is correct and a blinking problem exists, then U22, U5,
or U27 is bad.

U14 TRUTH TABLE

Character Dot Matrix (9)
On the negative-going edge of the first 200 ns CLK
after LLSRE goes low, the shift register is parallel
loaded from the character generator. The H output
of the shift register is immediately presented at the
output. Since H is tied to ground, the first dot in each
character line is blanked. This provides the hori¬
zontal spacing between characters of the display. On
the next clock, the shift register starts outputting the
code in serial format beginning with G. After inputs
G through C are shifted out, LLSRE loads the shift
register with the code for the same character line of
the next character in the display line. The character
Generator writes line 0 of all 32 characters in a display
line, then horizontal retrace occurs. The Character
Generator then writes line 1 of all 32 characters in
the display line, and so forth until line 7 of all 32
characters has been written on the display. At this
point, the Character Line Counter is incremented to
eight, inhibiting the shift register for two scan lines.
This generates two blank lines on the display. The two
blank lines provide the vertical spacing between
characters on the CRT screen.
AOI U3 controls normal and inverse video, vertical
blanking, and horizontal blanking. When normal video
is displayed, HNORM enables U3 to Gate the H
output of U14 through to Display Driver Assembly A3.
When inverse video is displayed, U3 gates the H
output of U14 through to A3. In this manner, VIDEO
is inverted when inverse video is selected. AOI U3
blanks the display any time HVBLK or HHBLK is true.

Row Counter U11/U12 can be checked using A6U11
pin 2 as a clock. Ull/12 should count from 0 to 25
repetitively. If the count is correct, the horizontal sync
problem is in U23, U34, U10, Ul, or U4.

INPUT
SHIFT/
LOAD

CLOCK
INHIBIT

CLOCK

L
H
H
H
H

X
L
L
L
H

X
L
i
t
1

SERIAL
X
X
H
L
X

INTERNAL
OUTPUTS

PARALLEL
A. . . H

Qfi

a. . . h
X
X
X
X

INPUTS
SELECT

A

B

H
L
L
L
L

X
L
L
H
H

X
L
H
X
X

X
X
X
L
H

a

b

h

Qao

Qbo
Qao

Qho
QGn
QGn
Qho

QAji

Qao

Qbo

pP HARDWARE ADDRESSES
OUTPUT Y

STROBE

Qh

Ob

H
L

U31-33 TRUTH TABLE

OUTPUT

U5/7/8/11/12 COUNT EQUATIONS
COUNT ENABLE = EP • ET • PE
TC = ET • QA • QB • QC • QD
PRESET ^_PE • CK+
RESET = MR

L
L
H
L
H

ADDRESS

FUNCTION

320008
through

Accesses Display RAM

32377g
334008
through
337778

Accesses Temporary Storage

U6 COUNT EQUATIONS
COUNT ENABLE_= EP* ET• PE
RC = ET • QA • QB • QC • QD
PRESET ^_PE • CK+
RESET = MR

Service

## Page 89


TROUBLESHOOTING
Most problems on the A6 assembly can be isolated
using the troubleshooting tree in figure 8-4. Horizontal
and vertical sync problems can be found using a logic
state analyzer.
VERTICAL SYNC PROBLEMS. Using A6U8 pin 2 as
a clock, monitor Display Column Counter A6U7/U8
with a logic state analyzer. The counter should count
from 0 to 41 and then start at zero again. If the count
is correct, the vertical sync problem is caused by
A6U9, U34, or U4.
HORIZONTAL SYNC PROBLEMS. Using A6U6 pin 7
as a clock, monitor Character Line Counter U6. The
counter should count from 0 to 9 repetitively. Display

Model 1611A

Row Counter U11/U12 can be checked using A6U11
pin 2 as a clock. Ull/12 should count from 0 to 25
repetitively. If the count is correct, the horizontal sync
problem is in U23, U34, U10, Ul, or U4.

4
INVERSE VIDEO PROBLEMS. Data line D6 from
A6U21 controls the inverse video field. After the
power-up sequence, D6 should be toggling. If inverse
video problems occur, trace the signal through Ul, U2,
and U4.

3

BLINKING PROBLEMS. Data line D7 from A6U22
controls blinking characters. After the power-up se¬
quence, D7 should be toggling. Check the 2-Hz signal
from U5 pin 13. If the blanking between display lines
is correct and a blinking problem exists, then U22, U5,
or U27 is bad.

2

U14 TRUTH TABLE
INPUT
SHIFT/
LOAD
L
H
H
H
H

CLOCK
INHIBIT

CLOCK

SERIAL
X
X
H
L
X

X
L
t
1
1

H

INTERNAL
OUTPUTS

PARALLEL

a*

Qb

a. . . h
X
X
X
X

a

b

h

Qao
H
L

Qbo
Qao
QAn
Qbo

Qho
QGn
QGn
Qho

Qao

SELECT

A

B

H
L
L
L
L

X
L
L
H
H

X
L
H
X
X

X
X
X
L
H

1

pP HARDWARE ADDRESSES
OUTPUT Y

STROBE

Qh

A. . . H

U31-33 TRUTH TABLE
INPUTS

OUTPUT

U5/7/8/11/12 COUNT EQUATIONS
COUNT ENABLE = EP • ET • PE
TC = ET • QA • QB • QC • QD
PRESET ^PE • CK+
RESET = MR

L
L
H
L
H

ADDRESS
320008
through

FUNCTION
Accesses Display RAM

32377g
33400s
through
337778

Accesses Temporary Storage

U6 COUNT EQUATIONS

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

Cl
C2
C3
C4
C5
C6
C7
C8
C9
CIO
C11
C12
Cl 3
Cl 4
Cl 5
Cl 6
R1

D-4
A-4
F-4
G-1
F-4
D-4
C-4
A-4
G-3
E-3
D-3
B-3
A-3
F-2
B-2
A-2
D-2

R2
R3
R4
R5
R6
R7
TP1
TP2
TP3
TP4
TP5
TP6
TP7
TP8
TP9
TP10
Ul

D-2
C-2
D-2
D-2
E-4
G-3
G-4
A-4
D-4
A-4
A-4
E-4
F-4
G-4
E-4
A-4
G-4

U2
U3
U4
U5
U6
U7
U8
U9
U10
Ul 1
Ul 2
Ul 3
Ul 4
Ul 5
Ul 6
Ul 7
Ul 8

F-4
F-4
E-4
E-4
D-4
D-4
C-4
C-4
B-4
B-4
A-4
G-3
F-3
E-3
E-3
D-3
D-3

Ul 9
U20
U21
U22
U23
U24
U25
U26
U27
U28
U29
U30
U31
U32
U33
U34
VR1

C-3
C-3
B-3
B-3
A-3
G-2
F-2
E-2
E-2
E-2
D-2
C-2
C-2
B-2
B-2
A-2
G-3

COUNT ENABLE_= EPj ET • PE
RC = ET • QA • QB • QC • QD
PRESET ^JPE • CK+
RESET = MR

1C REF DES

HP PART NO.

MFR PART NO.

Ul,4,24,25
U2
U3
U5,7,8,11,12
U6
U9,10,23
U13
U14
U15-22
U26,29
U27
U28
U30
U31,32,33
U34

1820-1196
1820-0683
1820-1285
1820-1430
1820-1429
1820-1202
1818-0237
1820-1042
1818-0348
1820-1200
1820-1158
1820-1112
1820-1415
1820-1470
1820-1197

SN74LS174N
SN74S04N
SN74LS54N
SN74LS161N
SN74LS160N
SN74LS10N
2513
SN74165N
AM9102APC
SN74LS05N
SN74S51N
SN74LS74N
SN74LS13N
SN74LS157N
SN74LS00N

RAM and Display Format Generator Board A6 Component Locator
(01611-66506)

Figure 8-12. Service Sheet 6, and Display Format Generator Assembly A6 (Sheet 1 of 2)
8-28

Model 1611A

## Page 90


SEGMENT OF
CHARACTER DISPLAYED

t0 - CHARACTER ROW SELECT, BLANKING, BLINKING, INVERSE VIDEO AND CHARACTER
ARE CLOCKED INTO U1 AND U24 FOR CHARACTER BEING DISPLAYED.
tt - COUNTERS FOR DISPLAY ADDRESS ARE CLOCKED.
t2- DATA FROM RAM IS LATCHED INTO U25 AND U28 IF INTERNAL jUP IS ADDRESSING A6.
t3 - BLANKING AND CLOCK INHIBIT (U14) SIGNALS ARE LATCHED INTO U4 FOR NEXT
CHARACTER. DISPLAY DATA FROM CHARACTER ROM IS LOADED INTO SHIFT REGISTER
U14.

A6 Timing Diagram

Service

## Page 91

Service

## Page 92


05

PARTS ON THIS SCHEMATIC

gP DATA BUS

—*- ^ 3

>94>—3

^59>—0S2
>95>—- ^3

Figure 8-12. Service Sheet 6,
RAM and Display Format Generator Assembly A6 (Sheet 2 of 2)
8-29

SERVICE SHEET 7

## Page 93

PRINCIPLES OF OPERATION
The A7 assembly compares data from the microproces¬
sor (pP) under test to the trace specification and gen¬
erates signals that control the counters and memory
on the A8 assembly. A7 also outputs status signals that
are used by the internal pP to determine the status of
a measurement. A7 can be divided into these func¬
tions: an Address Decoder, a Trigger Gating circuit
which controls various signal outputs dependent on
measurement mode set-up, and a RAM Comparator
circuit that generates triggers when trace specifica¬
tions shown on the display are met.
The Address Decoder detects addresses of the RAM
comparator (370008-371378) and of measurement
mode control latch A7U18 (361408). When 370008
thru 371378 is detected on the pP ADDRESS bus,
information on the pP DATA bus is loaded into the
RAMs on A7. When address 36140 is detected, A7U18
is clocked by A7U30. The clock causes the four least
significant bits of the pP DATA bus to be latched to
the output of A7U18. A7U18 and A7U33B generate
five signals (HRMC, LRST, HTRC, HTI, HCT) that
initialize circuitry on A7 and A8 and control the type
of measurement (COUNT TRIGGERS, COUNT
TIME or TRACE) made by the 1611 A.
The RAM comparator uses random access memory
to generate triggers that meet trace specifications
shown on the display. Figure 1 shows a basic 4-bit

FROM
SYSTEM
UNDER TEST

correct state. The data loaded is the complement of
the output desired because the RAM shown in figure 1
has an inverted output. After loading is completed,
the control pP selects the A input to the data selector
and puts the RAM in a READ MODE£ (WE=HIGH).
When the input to A is equal to 5, output of the RAM
will go high. All other inputs will produce a low output.
Table 1.

Data at B Input

Data Loaded
For TRIG = 5

0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15

1
1
1
1
1
0
1
1
1
1
1
1
1
1
1
1

A RAM comparator can also be used to generate a trig¬
ger when the input is less than or greater than a
specific trigger. This is accomplished by changing
the pattern loaded into the RAM by the control pP.
Table 2 shows some examples of the loaded patterns
for different triggers.
Table 2.

FROM
CONTROL
MICROPROCESSOR

Data Loaded for Specified
Trigger Condition

Data at B

TRIG=5 TRIG>5 TRIG>5 TRIG<5 TRIG<5

Figure 1.

4-Bit RAM Comparator

RAM comparator. Before the RAM comparator can
generate triggers, it must first be loaded (written to)
with a pattern that will provide a high output when
the trigger condition is met and a low output when it
is not. This is done in the 1611A by allowing pP
A5U11 to control the data and address information to
the RAM. To load the RAM, the pP first selects the
B input to the data selector and drives the WE (write
enable) input to the RAM low. This allows the pP to
load RAM with a pattern that will detect the trigger
selected. Table 1 shows how the RAM is loaded when
the selected trigger is 5. Notice that the B input goes
through all 16 possible combinations of a 4-bit input.
This ensures that each cell in RAM is set to the

0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15

1
1
1
1
1
0
1
1
1
1
1
1
1
1
1
1

1
1
1
1
1
1
0
0
0
0
0
0
0
0
0
0

1
1
1
1
1
0
0
0
0
0
0
0
0
0
0
0

0
0
0
0
0
1
1
1
1
1
1
1
1
1
1
1

0
0
0
0
0
0
1
1
1
1
1
1
1
1
1
1

Figure 2.

16 Bit RAM Comparator (= ONLY)

A RAM comparator can easily be expanded to more
than 4 bits by adding more DATA SELECTORS and
RAM plus some additional decoding circuitry. Figure 2
shows a 16 bit RAM comparator.
This circuitry employs the wired AND capability of
the open collector outputs of the RAMs. The decoder
determines when the RAM comparator is to be loaded
and which RAM will be loaded. Since the trigger
specified may be different for each group of A inputs,
the RAMs must be loaded separately. When the
RAMs are loaded, the control pP selects the A inputs.
When all four A inputs are equal to the selected trig¬
ger, the output will go high. Anytime the trigger
condition is not met in one or more of the RAMs, the
output will be pulled low.
The circuit shown in figure 2 works only when a trig¬
ger is needed for A inputs equal to the specified value.
To permit ? or < triggering, additional RAMs and gat¬
ing are necessary. In the 1611 A, 16-by-4 RAMs are
used instead of 16-by-l RAMs. This allows four dif¬
ferent trigger patterns, for the same 4 input bits to be
loaded in one RAM. Figure 3 shows a 16-bit compara¬

tor connected for triggering using two outputs of a
16-by-4 RAM. All RAMs except the one looking at the
four least significant bits must provide two outputs,
one for equal to and one for greater than triggering.
These additional outputs are needed because con¬
ditions exist where less than 16 bits determine whether
the trigger conditions are met. For example, if the A3
inputs are the most significant and they are greater
than the specified trigger value for those bits, then the
> condition has been met regardless of the value of the
remaining 12 bits. Gating on the RAM outputs allows
the less significant bits to be compared if the most
significant bits equal the specified trigger.
The RAM comparator on A7 has four outputs (HENB,
HDSB, LTRG1, LTRG2). ENABLE (HENB) and DIS¬
ABLE (HDSB) are derived from 32 inputs made up of
the Input Address bus (INP A0-A15), Input Data bus
(IND D0-D7) and external inputs (EXTO-7) from the
pP under test. Both outputs produce a high level only
when the inputs are equal to the trigger specified. LTRG1
is used for = or < trigger conditions depending on the
trace specification field selected. LTRG2 is used for

Service

## Page 94

+5V

A0-A3
A4-A7
A8-A11
A12-A15
D0-D3
D4-D7
Ext 0-3
Ext 4-7

FROM
SYSTEM
UNDER
TEST

HENB

HDSE

U14 (11)
U15 (9)
U16 (9)
U17 (9)
U12 (9)
U13 (9)
U10 (9)
Ull (9)

U14
U2 (5
U3
U4
U12
U13
U10<
Ull

LTRGl: = or «
LTRG2: > only

FROM
CONTROL
MICROPROCESSOR

Figure 3.
Figure 2.

16 Bit RAM Comparator (- ONLY)

ator can easily be expanded to more
ding more DATA SELECTORS and
iditional decoding circuitry. Figure 2
lM comparator.
nploys the wired AND capability of
outputs of the RAMs. The decoder
the RAM comparator is to be loaded
will be loaded. Since the trigger
iifferent for each group of A inputs,
be loaded separately. When the
the control pP selects the A inputs,
nputs are equal to the selected trig■vill go high. Anytime the trigger
let in one or more of the RAMs, the
ed low.
rn in figure 2 works only when a trig^ inputs equal to the specified value,
riggering, additional RAMs and gatr. In the 1611A,
16-by-4 RAMs are
6-by-l RAMs. This allows four dif;erns, for the same 4 input bits to he
M. Figure 3 shows a 16-bit compara¬

16 Bit RAM Comparator (>)

The RAM comparator has one output, A7U11 pin 11
(HAND), that is not data dependent. HAND deter¬
mines whether the two triggers LTRGl, and LTRG2
are combined in a logical AND or a logical OR at
A7U3 to produce HTRG. HAND is true only when the
Address Bus < specification is greater than the Address
Bus * specification.

assembly. Each time a 32-bit word is captured by the
A9 assembly, it may produce a compare command
(NCP). NCP is delayed 270 ns by A7U1A. It then
clocks A7U1B which produces a low pulse (LCPCK)
for 75 ns. The 270 ns delay allows time for the data
from A9 to propagate through the data selectors and
to access the RAMs. The negative edge of LCPCK
clocks enable-disable latches U20A and U20B. If
HENB or HDSB are true on this edge, they are latched
by U20 (HENBL and HDSBL). On the positive edge of
LCPCK, A7U6B is clocked. If the disable trigger HDSB
was true on the negative edge of LCPCK, A7U6 pin 8
(B) (LDLYDS) will go low. In some measurement
modes LDLYDS allows processing of an HTRG from
A7U8 when HDSB occurs at the same time. During the
time that LCPCK is low, A7U8 is enabled. If a trigger
is produced by LTRGl or LTRG2 during this time,
A7U8 pin 8 (HTRG) goes high. If HAND is true, both
LTRGl and LTRG2 must be true before HTRG can go
high. If HAND is low only one of the triggers is need¬
ed.

The Trigger Gating circuit detects the presence of
the four triggers and generates signals for the A8

The remaining signals on A7 are discussed in the
measurement mode description on Service Sheet 8.

only. LTRGl and LTRG2 use address, data, and ex¬
ternal information to detect a trigger. When the
ADDRS BUS > and ADDRS BUS < are used with Data
and External specifications, the > or < applies only to
the address bus. Data and External trigger conditions
are the same for LTRGl and LTRG2. Table 3 shows the
RAM outputs associated with each of the four outputs.
All outputs in the HENB or HDSB columns must be
true before HENB or HDSB goes high. LTRGl or
LTRG2 goes low when outputs of the RAM comparing
the data and external inputs go high and a combination
of outputs for the addresses go high that satisfy the
LTRGl ( = or <) or LTRG2 (>) conditions.
>

tor connected for triggering using two outputs of a
16-by-4 RAM. All RAMs except the one looking at the
four least significant bits must provide two outputs,
one for equal to and one for greater than triggering.
These additional outputs are needed because con¬
ditions exist where less than 16 bits determine whether
the trigger conditions are met. For example, if the A3
inputs are the most significant and they are greater
than the specified trigger value for those bits, then the
* condition has been met regardless of the value of the
remaining 12 bits. Gating on the RAM outputs allows
the less significant bits to be compared if the most
significant bits equal the specified trigger.
The RAM comparator on A7 has four outputs (HENB,
HDSB, LTRG1, LTRG2). ENABLE (HENB) and DIS¬
ABLE (HDSB) are derived from 32 inputs made up of
the Input Address bus (INP A0-A15), Input Data bus
(IND D0-D7) and external inputs (EXTO-7) from the
pP under test. Both outputs produce a high level only
when the inputs are equal to the trigger specified. LTRG1
is used for = or < trigger conditions depending on the
trace specification field selected. LTRG2 is used for

G

F

E

ICs ON THIS SCHEMATIC
1C REF DES

HP PART NO.

MFRF

U1
U2-4, 10-17
U5, 7
U6
U8, 32
U9, 31
U18
U19
U20, 34
U21
U22-29
U30
U33
U35, 36

1820-1782
1816-0913
1820-1285
1820-1112
1820-0691
1820-1202
1820-1195
1820-1203
1820-1212
1820-0681
1820-1470
1820-1418
1820-0686
1810-0041

AM2
AM3
SN7^
SN7^
SN7^
SN7'
SN7'
SN7^
SN7'
SN7'
SN7<
SN7'
SN7'
1810

Figure 8-13. Service Si
8-30

Model 1611A

## Page 95


Service
Table 3.

A0-A3
A4-A7
A8-A11
A12-A15
D0-D3
D4-D7
Ext 0-3
Ext 4-7

FROM
SYSTEM
UNDER
TEST

HENB

HDSB

LTRGl =

LTRGl<

LTRG2=

LTRG2>

U14 (11)
U15 (9)
U16 (9)
U17 (9)
U12 (9)
U13 (9)
U10 (9)
Ull (9)

U14 (5)
U2 (5)
U3 (5)
U4 (5)
U12 (5)
U13 (5)
U10 (5)
Ull (5)

U14 (9)
U15 (5)
U16 (5)
U17 (5)
U12 (7)
U13 (7)
U10 (7)
Ull (7)

U14 (9)
U15 (7)
U16 (7)
U17 (7)
none
none
none
none

U14 (7)
U2 (9)
U3 (9)
U4 (9)
U12 (7)
U13 (7)
U10 (7)
Ull (7)

U14 (7)
U2 (11)
U3 (11)
U4 (11)
none
none
none
none

LTRGl: = or <
LTRG2: ? only

I0M
INTROL
CROPROCESSOR

Figure 3.

16 Bit RAM Comparator (»)

RAM comparator has one output, A7U11 pin 11
D), that is not data dependent. HAND deterwhether the two triggers LTRGl, and LTRG2
'mbined in a logical AND or a logical OR at
to produce HTRG. HAND is true only when the
ss Bus < specification is greater than the Address
specification.

assembly. Each time a 32-bit word is captured by the
A9 assembly, it may produce a compare command
(NCP). NCP is delayed 270 ns by A7U1A. It then
clocks A7U1B which produces a low pulse (LCPCK)
for 75 ns. The 270 ns delay allows time for the data
from A9 to propagate through the data selectors and
to access the RAMs. The negative edge of LCPCK
clocks enable-disable latches U20A and U20B. If
HENB or HDSB are true on this edge, they are latched
by U20 (HENBL and HDSBL). On the positive edge of
LCPCK, A7U6B is clocked. If the disable trigger HDSB
was true on the negative edge of LCPCK, A7U6 pin 8
(B) (LDLYDS) will go low. In some measurement
modes LDLYDS allows processing of an HTRG from
A7U8 when HDSB occurs at the same time. During the
time that LCPCK is low, A7U8 is enabled. If a trigger
is produced by LTRGl or LTRG2 during this time,
A7U8 pin 8 (HTRG) goes high. If HAND is true, both
LTRGl and LTRG2 must be true before HTRG can go
high. If HAND is low only one of the triggers is need¬
ed.

Trigger Gating circuit detects the presence of
>ur triggers and generates signals for the A8

The remaining signals on A7 are discussed in the
measurement mode description on Service Sheet 8.

. LTRG1 and LTRG2 use address, data, and ex¬
information to detect a trigger. When the
IS BUS > and ADDRS BUS < are used with Data
xtemal specifications, the > or < applies only to
dress bus. Data and External trigger conditions
3 same for LTRG1 and LTRG2. Table 3 shows the
outputs associated with each of the four outputs,
tputs in the HENB or HDSB columns must be
tefore HENB or HDSB goes high. LTRGl or
2 goes low when outputs of the RAM comparing
ta and external inputs go high and a combination
puts for the addresses go high that satisfy the
1 ( = or <) or LTRG2 (>) conditions.

F

B

E

1611A-007B-01-06-80

ICs ON THIS SCHEMATIC
1C REF DES
U1
U2-4, 10-17
U5, 7
U6
U8, 32
U9, 31
U18
U19
U20, 34
U21
U22-29
U30
U33
U35, 36

HP PART NO.
1820-1782
1816-0913
1820-1285
1820-1112
1820-0691
1820-1202
1820-1195
1820-1203
1820-1212
1820-0681
1820-1470
1820-1418
1820-0686
1810-0041

MFR PART NO.
AM26S02PC
AM31L01PC
SN74LS54N
SN74LS74N
SN74S64N
SN74LS10N
SN74LS175N
SN74LS11N
SN74LS112N
SN74S00N
SN74LS157N
SN74LS42N
SN74SUN
1810-0041

REF
OESIG

GRID
LOC

Cl

C-2
F-4
F-4
E-4
G-1
A-4
E-4
B-4
G-3
D-3
A-3
D-2
B-2
B-2
E-2
D-2
G-2

C2
C3
C4
C5
C6
C7

CS
C9
CIO
C11
Cl 2
Cl 3
C14
Cl 5
Cl 6
Cl 7

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

R1
R2

B-2
B-2

R3
R4
R5
R6
R7
R8
R9
RIO
R11

B-4
A-3
B-2
F-4
E-4
A-4
B-2
F-4
B-2

R12
TP1
TP2
TP3
TP4
TP5

E-4
F-4
F-4
C-4
B-4
A-4

U1
U2
U3
U4
U5
U6
U7
U8
U9
UIO
U11
U12
U13
U14
U15
U16
U17
U18

F-4
E-4
D-4
D-4
B-4
B-4
B-3
B-3
A-3
G-3
F-3
F-3
F-3
E-3
E-3
D-3
D-3
C-4

U19
U20
U21
U22
U23
U24
U25
U26
U27
U28
U29
U30
U31
U32
U33
U34
U35
U36

B-2
B-2
A-3
G-2
F-2
F-2
F-2
E-2
E-2
D-2
D-2
C-2
B-2
B-2
A-2
C-4
C-3
C-4

REF
DESIG

Comparator Board A7 Component Locator
(01611-66577)

Figure 8-13. Service Sheet 7, RAM Comparator Assembly A7 (Sheet 1 of 4)
8-30

Model 1611A

## Page 96


S2 0
INPUT ADDRESS BUS

mi
23

5

24

25

26

Service

## Page 97


S2 ®

S2 ©
INPUT DATA BUS

S4

©

EXTERNAL BUS

INPA4

INPUT ADDRESS BUS

NOT USED WITH
ALL 1611A OPTIONS

Figure 8-13. Service Sheet 7,
RAM Comparator Assembly A7 (Sheet 2 of 4)
8-31

Service

## Page 98


TROUBLESHOOTING
Problems on the A7 assembly can be isolated by ex¬
ercising the 1611A with the front-panel PROBE TEST
socket outputs. If the 1611A is not operating properly
in a measurement mode (or modes), it can be checked
by comparing 1611A operation to measurement mode
theory and flowcharts on Service Sheet 8. The simpler
Time Interval and Count Trigs modes should be veri¬
fied for proper operation before troubleshooting Trace
Trigs or Trace mode problems.
An improperly operating mode should be checked
for proper initialization. This can be done by discon¬
necting the pP probe from the PROBE TEST socket
and checking for an HRMC pulse and either HTRC,
HTI, or HCT going high when an Execute key is pres¬
sed. "WAITING FOR ENABLE" should be displayed
after the key is pressed, except in the Trace Single Step
mode. Next, connect the p.P probe to the PROBE
TEST socket and check for proper execution. The
status messages are useful in analyzing defective mea¬
surement modes (see Status Byte Table on Service
Sheet 8). When triggering problems are apparent, set
the FORMAT switch to HEXADECIMAL so that each
digit in a trigger field corresponds to the four input bits
of a specific RAM in the RAM Comparator. Before at¬
tempting to check the RAM outputs for problems,
check the Address Decoder and Data Selector for
proper operation when the pP is loading the compar¬
ator. This may be done using the signature analyzer
test procedure on this service sheet. The timing of
A7U1 should also be checked. Next, the outputs of
the RAM Comparator (LTRG1, LTRG2, HENB, and
HDSB) should be checked with DON’T CARE entered
in the Trace specification. These signals should be
checked only when A7U1 pin 10 is high. If the trigger
output in question does not go to its true state with
DON'T CARE entered, use a current tracer to isolate
the bad RAM output. Refer to the RAM Output Table
on this service sheet for the RAM outputs used to
generate each trigger.

Trigger problems that are dependent on the entered
trigger specification can be isolated to four bits by
entering DON’T CARE for all but one digit and check¬
ing for a trigger. Once a defective trigger is found,
check for presence of that trigger at the inputs of the
data selectors. Inputs of the data selectors are con¬
nected directly to the High Speed Memory on the A8
assembly. Therefore, if the trigger is displayed in the
list resulting from a Trace measurement, it is present
at the Data Selector inputs. If the trigger is not dis¬
played, the A9 assembly should be checked. If data at
the inputs of the Data Selector is correct, check the
outputs for the presence of the trigger with a logic
state analyzer using the positive edge of A7U1 pin 10
as a clock. If the trigger is present, then the RAM for
those bits is bad.

If no NCNT clocks are occurring, check A7U32, U9,
U21, and U8. Also verify the outputs of enable/
disable latches U6 and U20. The status message dis¬
played can be used to determine why a measurement is
not being completed. For incorrect counting and list¬
ing, see Service Sheet 8.

U22-29 TRUTH TABLE

STROBE

SELECT

A

B

H
L
L
L
L

X
L
L
H
H

X
L
H
X
X

X
X
X
L
H

b. Remove A6, A7, A8, A9 and A10 assemblies
from 1611 A.
Reinstall A7 on extender board A14.

d.

Ground A5U3, pin 6.

FUNCTION

ADDRESS
OUTPUT Y

Set 1611A LINE switch to off position.

c.

pP HARDWARE ADDRESSES

INPUTS

A7 SIGNATURE ANALYSIS PROCEDURE
a.

Model 1611A

L
L
H
L
H

361408

Controls A7 measurement mode

370008
through
371378

Loads RAM Comparator

U1 TIMING EQUATION
T = 0.33 RC (1 + 3.0)
R
Where

e.
lows:

Set Signature Analyzer (SA) controls as fol¬

.... -|_
.... j

START
STOP..
CLOCK
HOLD .

U30 TRUTH TABLE
DECIMAL OUTPUT

BCD INPUT
Released

NO.
D C

B

A

0

1

2

3

4

5

6

7

8

9

L L
L L
L L
L L
L H
L H
L H
L H
H L
H L
H L
H L
H H
H H
H H
H H

L
L
H
H
L
L
H
H
L
L
H
H
L
L
H
H

L
H
L
H
L
H
L
H
L
H
L
H
L
H
L
H

L
H
H
H
H
H
H
H
H
H
H
H
H
H
H
H

H
L
H
H
H
H
H
H
H
H
H
H
H
H
H
H

H
H
L
H
H
H
H
H
H
H
H
H
H
H
H
H

H
H
H
L
H
H
H
H
H
H
H
H
H
H
H
H

H
H
H
H
L
H
H
H
H
H
H
H
H
H
H
H

H
H
H
H
H
L
H
H
H
H
H
H
H
H
H
H

H
H
H
H
H
H
L
H
H
H
H
H
H
H
H
H

H
H
H
H
H
H
H
L
H
H
H
H
H
H
H
H

H
H
H
H
H
H
H
H
L
H
H
H
H
H
H
H

H
H
H
H
H
H
H
H
H
L
H
H
H
H
H
H

f. Connect SA probe to following circuit points.
0

START.
STOP.
CLOCK.
GND .
g.

A5U11, pin 36
A5U11, pin 36
A5U11, pin 18
A5TP9 (GND)

1
2

3
4
5

Set 1611A LINE switch to on position.

6

h. Monitor test points listed in the following table
and verify signatures.

8

7

TEST POINT

SIGNATURE

vh
A7U30, Pin 1
A7U30, Pin 2
A7U30, Pin 3
A7U30, Pin 4
A7U30, Pin 5
A7U30, Pin 6
A7U30, Pin 7

755U
AFA4
382F
C17A
AA76
9UF8
5365
5988

A7U31, Pin 12
A7U31, Pin 10
A7U31, Pin 8

C9C6
4U68
3PHP

A7U22-29, Pin 1
A7U22-29, Pin 4
A7U22-29, Pin 7
A7U22-29, Pin 9
A7U22-29, Pin 12

FFP9
3107
4968
H3UC
P600

R = kfi
C = PF
T = ns

9
Q
□
<
>
Z

U1, PIN 10
1
1

U1, PIN 9
(TP2)

95ns ±5ns
(ADJ A7R12)

-1
1
1
1
1
1

-4— 200ns ±10ns
(ADJ A7R10)

!
NOTE
Some 1611A Options may require different adjust¬
ment of ROM Comparator Board A7. Refer to the
Operating and Service Manual Supplement to deter¬
mine if different timing adjustments are used.

A7 Timing Diagram

Figure 8-13. Service Sheet 7, RAM Comparator Assembly A7 (Sheet 3 of 4)
8-32

Service

## Page 99


P/0 A7 COMPARATOR BD (01611-66577)

Figure 8-13. Service Sheet 7,
RAM Comparator Assembly A7 (Sheet 4 of 4)

Service

## Page 100


SERVICE SHEET 8
PRINCIPLES OF OPERATION
Assembly A8 contains the High-speed Memory
that stores data acquired from the system under test
and the Delay and Pass Counters that count time,
triggers, and delay, A8 also contains the interface
between the memory and counter circuits and the
internal microprocessor (pP) DATA and MEMORY
buses.
HIGH-SPEED MEMORY. 9-by-64 RAMS A8U25-28
make up the High-speed Memory. The memory stores
64 36-bit words. Each word consists of 16 bits of
pP address, eight bits of pP data, eight bits of
external information, and four flag bits. Each word
corresponds to one memory transaction of the pP
under test. The information stored in memory comes
from Personality Board A9 and the External Latch on
A10. The memory outputs to the pP on A5 through
data selectors Cl 7 and U20.
The High-speed Memory is controlled by Memorystate Counter U1 and LDSTOR. The counter addresses
the location in memory that is being written to or
read from. LDSTOR controls the write lines (W) of
the memory. When LDSTOR goes low, data at the
RAM inputs is stored at the location in memory
addressed by the Memory-state Counter. When
LDSTOR returns high, the memory counter is
incremented through NAND gate U2C to the next
address to be written to.
LDSTOR is derived through AOI U8B from NSTOR
or HTRG, depending upon the measurement mode.
Trigger store flip-flop U15B determines how LDSTOR
is generated. In Trace Trigs mode, HTRG generates
LDSTOR when HARM is true and the Memory-state
Counter is not in an overflow condition. In Trace
mode, LDSTOR is generated by NSTOR when binary
counter Ull in the Delay Counter is not in an overflow
condition. In Count Trigs and Time Interval measure¬
ment modes, the High-speed Memory and Memorystate Counter are not used.
During a Trace Trigs measurement, pP A5U11
monitors the Memory-state Counter through data
selectors U19 and U21. This is accomplished when
the pP reads from address 260038. AO is inverted
by U7F and applied to the S inputs of the data
selectors. This low level selects the A inputs of the
data selectors. The remaining address lines (shown
in red) are decoded in the Address Decoder circuit to
produce a low level at pin 2 of BCD-to-decimal
decoder U24. This low enables U19 and U21. U19
and U21 drive the MEMORY bus with the complement
of the memory state count. The MEMORY bus is
complemented again on A5 so that the pP reads the
true value of the memory state count.

After a Trace or Trace Trigs measurement is
completed, pP A5U11 reads the data stored in the
High Speed Memory. The pP reads the data by
reading from address 274048, 274068, 274108,
274128,
and 260078- Each of the first four
addresses enables one of the four RAMS in High¬
speed Memory to be read through the B inputs of
data selectors U17 and U20. When the pP reads from
address 260078, all four RAMs are enabled (pin
15 of each RAM is pulled low). The pP then reads the
four flag bits through the A inputs of data selector
U17. The pP controls the address in High-speed
Memory that it is reading from through the Memorystate Counter. The counter is clocked by NMCCK
when the pP writes to address 260038- Pin 3 of
BCD-to-decimal decoder U16 goes low when it
detects a write operation to address 260038- U16,
pin 3 returns to a high level when HWRT goes false.
This clocks the Memory-state Counter through U2C.
DELAY AND PASS COUNTERS. The Pass and
Delay Counters count time or triggers in TIME
INTRVL and COUNT TRIGS measurements. They
also provide digital delay when TRIGGER OCCUR¬
RENCES and BEFORE TRIG or AFTER TRIG speci¬
fications are selected.

number of trigger occurrences specified must be met
before the memory transaction delay starts. If no
Trigger Occurrence specification ic selected, the
1611A defaults to 1. The default condition for
memory transaction delay is 0.
The Pass Counter counts trigger occurrences in the
Trace mode. The counter is preset by the pP such that
when the specified number of trigger occurrences is
reached, the RC output of U9 goes high. The pP
presets the counter by subtracting 1 from the specified
trigger occurrences and complementing the results.
This value is written to address 260008 on the
DATA bus. When the Address Decoder detects this
address, it forces the parallel enable inputs (pin 7)
of U9 and U14 low. This enables the two binary
counters to be preset to the value on the DATA bus
when a clock in received at pin 2 of both counters.
The clock is produced by U4B when the Address
Decoder detects HWRT and address 260008- U4B
clocks U9 and U14 through U2D. R3 and C3 delay
the clock so that the parallel enable inputs will go
low before the clock arrives at the counters. U4B

also provides the clock for the Delay Counter when it
is preset.
The Delay Counter is preset in the same manner
as the Pass Counter, except that 63 is added to the
specified delay. This number is complemented by the
pP and is loaded into the Delay Counter. This offsets
the Delay Counter so that it overflows 64 counts
after the point where the measurement starts. The
overflow condition indicates to the pP that the
measurement is complete. The Delay Counter must be
loaded in two steps since it is a 16-bit counter and the
pP DATA bus is only 8-bits wide. The 8 LSB's are
preset when the pP writes to address 260018The 8 MSB's are preset when it writes to address
260028.
A partial list may be displayed when using negative
delay (BEFORE TRIG) due to the way the Delay
Counter is loaded. A partial list is displayed when the
1611A does not acquire a sufficient number of
memory transactions before the specified trigger.
This causes the RC output of A8U11 to go high
before the High-speed Memory has been written to
64 times.

When a counting measurement is selected, the six
binary counters are cascaded to make a 24-bit binary
counter. The counter counts the number of NCNT clocks
generated by Assembly A7. During Count Trigs or
Time Interval measurements, pP A5U11 reads the
value of the counter outputs and converts the binary
number to BCD. This number is written to the display
memory for display on the CRT screen. The pP reads
the count from addresses 260008, 260018, and
260028- These addresses are detected by the Ad¬
dress Decoder which enables one pair of data
selectors (U19/U21 or U18/U22) by pulling pin 15 of
the appropriate data selectors low. The Address
Decoder also selects the correct input of the data
selector (A or B). Data on the inputs is routed to the
pP over the MEMORY bus.
The ripple carry (RC) output of Ull is routed to JK
flop-flop U15A. U15A detects a counter overflow
condition. When an overflow occurs, (Ull RC output
goes high), the Q output of U15A goes high (HCTOF).
This status condition is read through data selector
U20 when the microprocessor reads from address
260078- In the Trace mode, HCTOF indicates that
the measurement is complete. In Count Trigs or Time
Interval modes, HCTOF indicates that the maximum
count capability has been exceeded.
A measurement can be delayed in the Trace mode,
until up to 256 triggers have occurred (TRIGGER
OCCURRENCE) and/or until up to 65 472 memory
transactions have occurred (AFTER TRIG). The

REF
DE SIG

GRID
LOC

Cl
C2
C3
C4
C5
C6
C7
C8
C9
CIO
C11
Cl 2

C-4
D-4
D-4
B-1
B-4
B-3
D-3
G-3
C-2
B-1
E-2
E-2

Cl 3
Cl 4
Cl 5
Cl 6
CR 1
LI
R1
R2
R3
R4

B-2
E-4
B-4
E-4
F-3
F-3
C-4
D-4
D-4
D-4

Fig,

8-34

Model 1611A

## Page 101


Service
number of trigger occurrences specified must be met
before the memory transaction delay starts. If no
Trigger Occurrence specification ic selected, the
1611A defaults to 1. The default condition for
memory transaction delay is 0.
The Pass Counter counts trigger occurrences in the
Trace mode. The counter is preset by the pP such that
when the specified number of trigger occurrences is
reached, the RC output of U9 goes high. The /uP
presets the counter by subtracting 1 from the specified
trigger occurrences and complementing the results.
This value is written to address 260008 on the
DATA bus. When the Address Decoder detects this
address, it forces the parallel enable inputs (pin 7)
of U9 and U14 low. This enables the two binary
counters to be preset to the value on the DATA bus
when a clock in received at pin 2 of both counters.
The clock is produced by U4B when the Address
Decoder detects HWRT and address 260008- U4B
clocks U9 and U14 through U2D. R3 and C3 delay
the clock so that the parallel enable inputs will go
low before the clock arrives at the counters. U4B

also provides the clock for the Delay Counter when it
is preset.
The Delay Counter is preset in the same manner
as the Pass Counter, except that 63 is added to the
specified delay. This number is complemented by the
pP and is loaded into the Delay Counter. This offsets
the Delay Counter so that it overflows 64 counts
after the point where the measurement starts. The
overflow condition indicates to the pP that the
measurement is complete. The Delay Counter must be
loaded in two steps since it is a 16-bit counter and the
pP DATA bus is only 8-bits wide. The 8 LSB's are
preset when the pP writes to address 260018The 8 MSB's are preset when it writes to address
260028-

A partial list may be displayed when using negative
delay (BEFORE TRIG) due to the way the Delay
Counter is loaded. A partial list is displayed when the
1611A does not acquire a sufficient number of
memory transactions before the specified trigger.
This causes the RC output of A8U11 to go high
before the High-speed Memory has been written to
64 times.

A

B

C

D

E

F

G
1611A-008B-01 -06-80

Data Store and Counters Board A8 Component Locator
(01611-66535)

ICs ON THIS SCHEMATIC
REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

REF
DESIG

GRID
LOC

Cl
C2
C3
C4
C5
C6
C7
C8
C9
CIO
Cl 1
Cl 2

C-4
04
D-4
B-1
B-4
B-3
D-3
G-3
C-2
B-1
E-2
E-2

G 2
F-2
A-4
B-4

Cl 3
Cl 4
Cl 5
Cl 6
CR1
LI
R1
R2
R3
R4

B-2
E-4
B-4
E-4
F-3
F-3
C-4
D-4
D-4
D-4

R5
R6
TP1
TP2
TP3
TP4
TP5
TP6
TP7
TP8
U1
U2
U3
U4
U5
U6
U7
U8
U9
U10
U1 1
U12

U13
U14
U15
U16
U17
U18
U19
U20
U21
U22
U23
U24
U25
U26
U27
U28
U29
U30
U31
U32
U33

D-3
E-3
F-3
G-3
A-2
B-2
C-2
D-2
D-2
E-2
F-2
G-2
A-2
B-2
D-2
E-2
G-2
A-3
B-3
A-2
A-2

B-4
B-4
C-4
C-4
G-4
A-3
A-4
B-4
C-4
D-4
D-4
E-4
F-4
G-4
A-3
B-3
C-3
D-3

IC REF DES
U1
U2
U3
U4
U5
U6, 9-11,
13, 14
U7
U8
U12
U15
U16, 24
U17-22
U23
U25-28
U29
U30
U31
U32, 33

HP PART NO. MFR PART NO.
1820-1464
1820-1425
1820-1144
1820-1423
1820-1212
1820-1430

SN74393N
SN74LS132N
SN74LS02N
SN74LS123N
SN74LS112N
SN74LS161N

1820-1199
1820-1210
1820-1130
1820-1116
1820-1418
1820-1439
1820-1201
1816-0728
1820-1205
1820-1112
1820-1439
1810-0055

SN74LS04N
SN74LS51N
SN74LS133N
SN74109N
SN74LS42N
SN74LS258N
SN74LS08N
82S09I
SN74LS21N
SN74LS74N
SN74LS258N
1810-0055

Figure 8-14. Service Sheet 8, Data Storage and Counter Assembly A8 (Sheet 1 of 6)

Model 1611A

## Page 102


Service

S2®

Figure 8-14. Service Sheet 8,
Data Storage and Counter Assembly A8 (Sheet 2 of 6)
8-35

Model 1611A

## Page 103


Service

## Page 104


%

Figure 8-14. Service Sheet 8,
Data Storage and Counter Assembly A8 (Sheet 4 of 6)
8-37

Model 1611A

## Page 105


Service

TROUBLESHOOTING
The PROBE TEST socket output should be used
as a test signal for isolating problems on A8. The
simpler Time Interval and Count Trigs measurements
should be verified before Trace and Trace Trigs.
When a measurement mode is operating incorrectly,
remove the test signal and restart the measurement.
Initial conditions described in the Measurement
Mode theory on this service sheet should be checked.
The Memory State Counter, Pass Counter, and
Delay Counter outputs can be checked for a reset
condition or the correct preset value. If initial con¬
ditions are not correct, the output of the Address
Decoder controlling the device should be checked.
To continuously generate initialization signals, it is
necessary to repeatedly press the STOP key and then
the EXECUTE key being checked. If desired, the
Address Decoder can be checked with a signature
analyzer (see procedure on this service sheet).
After initialization is checked, connect the Probe
Test Generator and check status bits and counters.
Data being written on the MEMORY bus by a data
selector can be checked when pin 15 of the data
selector is low. Note that the data selector output is
the complement of the input. The Delay and Pass
Counter chain can be checked four bits at a time by
monitoring the QA, QB, QC, and QD outputs with a
logic state analyzer and clocking on pin 10 of the
counter (use pin 2 for U14). The Time Interval mea¬
surement with no trigger specification provides a good
clock for this check. The outputs should count from
0 to 15 on each counter. The Memory State Counter
sequence can be checked in the Trace mode by viewing
the entire 64-line display in absolute mode and
verifying that the list progresses from 0000 through
FFFF in sequence. Lines in the listing that are part¬
ially correct usually indicate a bad RAM in High¬
speed Memory or a bad data selector.
Inputs to the RAMs can be checked with a logic
state analyzer using the negative edge of LDSTOR as
a clock. Another easy check is to key in a trigger
value equal to the data input being checked and verify
that the 1611A triggers. This indicates presence of the
data, since the inputs to the RAM Comparator are
the same lines that are connected to the High-speed
Memory.

e.

'42A, L42, LS42

Released

Set 1611A LINE Switch to off position.

b. Remove A8 assembly and reinstall it on ex¬
tender board A14.
c.

Ground A5U3, pin 6.

d.

Set Signature Analyzer (SA) controls as follows:

D

C

B

A

0

1

2

3

4

5

6

7

8

9

L
L
L
L
L
L
L
L
H
H
H
H
H
H
H
H

L
L
L
L
H
H
H
H
L
L
L
L
H
H
H
H

L
L
H
H
L
L
H
H
L
L
H
H
L
L
H
H

L
H
L
H
L
H
L
H
L
H
L
H
L
H
L
H

L
H
H
H
H
H
H
H
H
H
H
H
H
H
H
H

H
L
H
H
H
H
H
H
H
H
H
H
H
H
H
H

H
H
L
H
H
H
H
H
H
H
H
H
H
H
H
H

H
H
H
L
H
H
H
H
H
H
H
H
H
H
H
H

H
H
H
H
L
H
H
H
H
H
H
H
H
H
H
H

H
H
H
H
H
L
H
H
H
H
H
H
H
H
H
H

H
H
H
H
H
H
L
H
H
H
H
H
H
H
H
H

H
H
H
H
H
H
H
L
H
H
H
H
H
H
H
H

H
H
H
H
H
H
H
H
L
H
H
H
H
H
H
H

H
H
H
H
H

Connect SA Probe to following circuit points:
0
1
2
3
4
5
6
7
8
9

A5U11, Pin 36
A5U11, Pin 36
A5U11, Pin 18
A5TP9 (GND)

Set 1611A LINE switch to on position.

g. Monitor test points listed in the following table
and verify signatures.
SIGNATURE*

TEST POINT

O
-J

A8U2, Pin 1
A8U2, Pin 2
A8U2, Pin 3
A8U2, Pin 4
A8U2, Pin 5
A8U2, Pin 6

VHP
A41U
H140
A41U
VLP

A8U29, Pin 6

vl

A8U7, Pin 3
A8U7, Pin 4
A8U7, Pin 10
A8U7, Pin 12

VHP
VLP
AC99
H335

A8U16, Pin 1
A8U16, Pin 2
A8U16, Pin 3
A8U16, Pin 4
A8U16, Pin 5
A8U16, Pin 6

897C
8C4H
85FP
8H17
C719
947F

<
>
z

H
H
H
L
H
H
H
H
H
H

pP HARDWARE ADDRESSES

Vh
ADDRESS

FUNCTION

U4 TIMING EQUATION

260008

Reads or loads Pass Counter.

T = 0.4 RC

260018

Reads or loads 8 LSB of Delay
Counter.

WHERE R = kO
C = pF
T = ns

260028

Reads or loads 8 MSB of Delay
Counter.

260038

Clocks Memory State Counter or
reads its output.

260048

Resets Delay and Pass Counters to
zero.

U6/9/10/11/13/14 COUNT EQUATIONS
COUNT ENABLE = EP • ET • PE
RC = CET «_QA • QB • QC • QD
PRESET =_P_E • CP+
RESET = MR

*VH = 755U, VHP = 755U, Vl = 0000, VLP = 0000

260058

Sets or clears trigger store mode.
DO = 0 — Clear, DO = 1 — Set.

U17-22 TRUTH TABLE

260078

Reads status of measurement and
flags from High Speed Memory.

274048

Reads 8 bits of external data from
High Speed Memory.

274068

Reads 8 bits of pP data from High
Speed Memory.

U4, PIN 1
(TP6)

274108

Reads 8 LSB of pP address from
High Speed Memory.

U4, PIN 13

274128

Reads 8 MSB of q,P address from
High Speed Memory.

INPUTS
OUTPUT
CONTROL

OUTPUT Y
SELECT

A

B

A8 SIGNATURE ANALYSIS PROCEDURE.
a.

DECIMAL OUTPUT

BCD INPUT

NO.

START.
STOP.
CLOCK.
GND .
f.

U16/24 TRUTH TABLE

.... ]_
.... j

START
STOP..
CLOCK
HOLD .

H
L
L
L
L

X
L
L
H
H

X
L
H
X
X

X
X
X
L
H

Z
H
L
H
L

130 ns
TYPICAL

A8 Timing Diagram
Z = high impedance (off)

Figure 8-14. Service Sheet 8, Data Storage and Counter Assembly A8 (Sheet 3 of 6)
8-36

MEASUREMENT MODES

## Page 106

The following paragraphs describe how the internal
microprocessor (pP) initiates, monitors and terminates
each measurement made by the 1611 A. The descrip¬
tions follow the measurement flow charts on this
service sheet.
TIME INTERVAL. The Time Interval measurement
counts 1-ps clocks between the Enable and Disable
trace specifications. When TIME INTVL is pressed,
internal pP A5U11 writes 148 to address 361408This puts HTRC, HCT, and HTI in a low state, so
that no NCNT clocks are generated by A7U32. LRST
goes low and clears enable/disable latches A7U20A/B
and U6B. LRST also inhibits the Pass and Delay Coun¬
ters by applying a low through A8U5A to pin 7 on all the
counters. HRMC goes high, resetting the Memory
State Counter to 0, and resetting memory state count
overflow flip-flop A8U3C/D. Next, a 0 is written to
address 260048- This resets the Pass and Delay
Counters to zero. Information on the data bus has no
effect when the pP is writing to address 260048This address is detected, and the master reset on all
counters is pulled low by A8U16 pin 6. Next, a 0 is
written to address 260058- This clears trigger store
flip-flop A8U15B. A8U15B is not used in the Time
Interval mode.
All counters and flip-flops are now initialized and
the 1611A is ready to start a measurement. The
internal pP starts a measurement by writing 3708
to address 361408- HRMC then goes low, and LRST
and HTI go high. HTI enables part of A7U32 to pass
1-ps clocks as long as HENBL is true and LDSBL is
false (see figure 1). Before the Enable trigger specifi¬
cation is detected by the 1611 A, HENBL is low and
LDSBL is high. As soon as the Enable trace specifica¬
tion is detected by the RAM Comparator, HENBL goes
high and the 1-ps clock is passed through A7U32. The
count continues until the Disable trace specification
is met. LDSBL then goes low and inhibits generation

During the measurement pP A5U11 monitors and
displays the status of the measurement. The pP
reads from address 260078 and checks the four
least significant bits. The status signals are monitored
through the A input of A8U20. In the Time Interval
mode, pP A5U11 detects four conditions. Before the
Enable trace specification is met, all status bits are
low except LDLYL; thus, the status byte is 2. A

terminal count, an NCNT clock is generated only
when a memory transaction meets trigger specifi¬
cations and is between the Enable and Disable trace
specifications. A7U9A controls this by gating HTRG
through U9 when HENBL is true and LDLYDS is
false. Since NCNT is equivalent to a trigger occur¬
rence, it serves as a clock for the Pass Counter which
counts the number of trigger occurrences. When the
specified number of trigger occurrences has been
reached, A8U9 pin 15 (HPCTC) and A7U21 pin 6
(HDLEN) go true.

WAITING FOR ENABLE message is displayed when
the status byte equals 2. After the enable condition is
met, the output of A7U33A (HARM) goes true,
causing a COUNTING message to be displayed. If
counter capacity is exceeded during the measurement,
A8U15 pin 6 (HCTOF) goes high. This causes a
COUNTER OVERFLOW message to be displayed (see
status byte table on this service sheet).
Until the measurement is completed, pP A5U11
continues to check the status byte, update the count
in the display, and monitor the keyboard for depressed
keys. The count is updated by reading the binary
count from the Pass and Delay Counters, converting
it to BCD, and displaying the results. The keyboard
monitoring function permits the operator to abort
a measurement that is not complete. When the
measurement is complete. A7U20 pin 5 (HDSBL) goes
true. When this is detected, the pP reads the final
count and displays it.
COUNTS TRIGS. The Count Trigs measurement
counts the number of triggers between the Enable
and Disable trace specifications. Initialization of
circuits on A7 and A8 is accomplished in the same
manner as in the Time Interval mode, except for
generation of NCNT. To start the measurement,
3718 is written to address 361408, This enables
A7U32 to generate NCNT when a trigger is recognized
between the Enable and Disable trace specifications
(see figure 2). The status byte has the same meaning
as in the Time Interval mode. Except for the gen¬
eration of NCNT, pP A11U5 treats Count Trigs
measurements the same as Time Interval measure¬
ments.

TRACE TRIGS. The Trace Trigs measurement stores
and displays 64 consecutive memory transactions
that meet trigger specifications. No trigger occurrence
or memory transaction delay is available in this mode.
Before this measurement is started, the enable/disable
latches and the Pass and Delay Counters are reset as
in the Time Interval measurement. Next, a 1 is written
to address 260058- The address is detected by the
decoder on A8 and produces a clock for A8U15B. This
allows the DO line of the Data bus (high) to be latched.
In Trace Trigs mode, A8U15 pin 10 (HTSTOR) is high
and A815 pin 9 (LSTOR) is low. HSTOR AND
LTSTOR cause LDSTOR to be generated by HTRG
(see figure 3).

The measurement begins when 2 is written to
361408 enabling A7U20A/B and A7U6 to latch the
detected enable and disable triggers. Each time a
trigger is recognized between the Enable and Disable
trace specifications, LDSTOR causes the trigger to be
stored and the Memory-state Counter to be clocked.
In TRACE TRIGS mode, only two status messages
are displayed. When HARM is false, a WAITING FOR
ENABLE message is displayed; when HARM is true,
a WAITING FOR TRIGGER message is displayed.
During the Trace Trigs measurement, data is read
from address 260038- This data is the value of the
memory state count. If the Memory-state Counter is not
in an overflow condition, the number of memory trans¬
actions stored is displayed. When 64 words are stored,
the memory counter will overflow. This inhibits
A8U8 from generating more LDSTOR clocks (see
figure 3). The overflow condition is detected by the
internal pP, which then reads data from the High¬
speed Memory and displays it in absolute format.
TRACE (NORMAL). In the normal test mode, the
Trace measurement allows 64 consecutive memory
transactions to be stored and displayed. The starting
point of the acquisition can be delayed up to 256
trigger occurrences and/or 64,742 memory trans¬
actions relative to the first recognized trigger. TRACE
is initiated by writing to addresses 361408 and
260048 as in the Time Interval mode. Next, a
0 is written to 260058 to disable the trigger store
mode. (HTSTOR and LTSTOR). This allows the
NSTOR clock from A9 to generate LDSTOR through
A8U4A and A8U8B. The Delay and Pass counters are
now preset as explained in the A8 theory. Thus A8U15A,
pin 6 goes high when the measurement is complete.
To start the measurement, a 2 is written to address
361408- This forces A7U32 pin 6 (HTRC) high,
enabling part of U32. Until the pass counter reaches

HDLEN enables the delay counter to count delay
and forces A7U21 pin 11 high. This allows NCNT to
be generated each time a pulse from A7U1 pin 10
occurs. Since the pulse is a delayed NCP generated
by the A9 assembly, it occurs on every memory
transaction. NCNT now clocks the Delay Counter on
every memory transaction. At this time, the HTRG,
HENBL, HDSBL, and LDLYDS signals generated by
A7 no longer affect NCNT generation. The measure¬
ment stops after A8U11 pin 15 goes high. This forces
A8U15 pin 7 low on the next NCNT clock and pre¬
vents A8U8B from generating more LDSTOR clocks.
Up to this point, LDSTOR has been generated for
each NSTOR from A9. Thus, the memory counter may
have overflowed many times and the first memory
transaction to be displayed may not be at location 0
in the High-speed Memory. The pP determines the
first line to be displayed by first reading from address
260038, checking the Memory-state Counter for
overflow, and determining the present value of the
memory state count. If the counter has overflowed,
the information to be displayed in the first line of the
list is at the address equal to the present memory
state count. If there is no overflow, the information
for the first displayed line is at address 0 in the High¬
speed Memory.

During a measurement interval, the 1611A monitors
and displays the status of the measurement. Until the
first trigger is recognized, a WAITING FOR TRIG¬
GER or WAITING FOR ENABLE message is displayed.
If HARM is true when the status is read, the message
is WAITING FOR TRIGGER. Otherwise WAITING
FOR ENABLE is displayed. When a status byte equal
to 2 or 3 is read, the pass counter value is also read
(address 260008). If the value is not equal to the
preset value, one or more triggers have occurred.
When this condition is detected, the number of trigger
occurrences is computed and displayed, rather than
WAITING FOR ENABLE or WAITING FOR TRIG¬
GER. When the pass counter reaches terminal count
and LDLYL becomes true, the status byte is equal to
0 or 1, and a DELAYING message is displayed. When
the measurement is complete, A8U15 pin 6 (HCTOF)
goes true. This causes the status byte value to be
greater than 3. A value greater than 3 indicates to the
internal pP that the measurement is complete.

Model 1611A

## Page 107


Service
terminal count, an NCNT clock is generated only
when a memory transaction meets trigger specifi¬
cations and is between the Enable and Disable trace
specifications. A7U9A controls this by gating HTRG
through U9 when HENBL is true and LDLYDS is
false. Since NCNT is equivalent to a trigger occur¬
rence, it serves as a clock for the Pass Counter which
counts the number of trigger occurrences. When the
specified number of trigger occurrences has been
reached, A8U9 pin 15 (HPCTC) and A7U21 pin 6
(HDLEN) go true.

The measurement begins when 2 is written to
361408 enabling A7U20A/B and A7U6 to latch the
detected enable and disable triggers. Each time a
trigger is recognized between the Enable and Disable
trace specifications, LDSTOR causes the trigger to be
stored and the Memory-state Counter to be clocked.
In TRACE TRIGS mode, only two status messages
are displayed. When HARM is false, a WAITING FOR
ENABLE message is displayed; when HARM is true,
a WAITING FOR TRIGGER message is displayed.
During the Trace Trigs measurement, data is read
from address 260038- This data is the value of the
memory state count. If the Memory-state Counter is not
in an overflow condition, the number of memory trans¬
actions stored is displayed. When 64 words are stored,
the memory counter will overflow. This inhibits
A8U8 from generating more LDSTOR clocks (see
figure 3). The overflow condition is detected by the
internal pP, which then reads data from the High¬
speed Memory and displays it in absolute format.
TRACE (NORMAL). In the normal test mode, the
Trace measurement allows 64 consecutive memory
transactions to be stored and displayed. The starting
point of the acquisition can be delayed up to 256
trigger occurrences and/or 64,742 memory trans¬
actions relative to the first recognized trigger. TRACE
is initiated by writing to addresses 361408 and
260048 as in the Time Interval mode. Next, a
0 is written to 260058 to disable the trigger store
mode. (HTSTOR and LTSTOR). This allows the
NSTOR clock from A9 to generate LDSTOR through
A8U4A and A8U8B. The Delay and Pass counters are
now preset as explained in the A8 theory. Thus A8U15A,
pin 6 goes high when the measurement is complete.
To start the measurement, a 2 is written to address
361408. This forces A7U32 pin 6 (HTRC) high,
enabling part of U32. Until the pass counter reaches

TRACE SINGLE STEP. In Single Step test mode,
the TRACE key allows the 1611A to single step the
pP under test and to display the memory transaction
executed. To excute single step trace, no trigger
specifications are required. The Trace Single Step
mode is initiated like TRACE in the Norm Test mode
except that the Pass and Delay counters are not
preset. The only signal used from A7 in this mode is
HRMC. HRMC goes high to reset the Memory-state

Counter, and returns low when the measurement
starts. When A9 generates an NSTOR, LDSTOR is
produced by A8U8B and the memory state counter is
clocked. The internal gP monitors the memory state
count to determine when its value is not equal to zero.
When a non-zero condition is detected, the g.P starts
reading from High-speed Memory and displays the
result. No status messages are displayed in the Trace
Single Step mode.

STATUS BYTE TABLE
STATUS BYTE VALUE*

HDLEN enables the delay counter to count delay
and forces A7U21 pin 11 high. This allows NCNT to
be generated each time a pulse from A7U1 pin 10
occurs. Since the pulse is a delayed NCP generated
by the A9 assembly, it occurs on every memory
transaction. NCNT now clocks the Delay Counter on
every memory transaction. At this time, the HTRG,
HENBL, HDSBL, and LDLYDS signals generated by
A7 no longer affect NCNT generation. The measure¬
ment stops after A8U11 pin 15 goes high. This forces
A8U15 pin 7 low on the next NCNT clock and pre¬
vents A8U8B from generating more LDSTOR clocks.

MEASUREMENT STATUS

TRACE MODE
2 (Trigger Occurrences = 0)

"WAITING FOR ENABLE" message is displayed
if Enable specification has been entered. If no
Enable specification is entered,
"WAITING
FOR TRIGGER" message is displayed.

3 (Trigger Occurrences = 0)
2 or 3 (Trigger Occurrences / 0)
0 or 1
>3

"WAITING FOR TRIGGER" Displayed
"TRIGGER OCCURRENCE =" Displayed
"DELAYING" Displayed
End of Run

TRACE TRIGS MODE
Up to this point, LDSTOR has been generated for
each NSTOR from A9. Thus, the memory counter may
have overflowed many times and the first memory
transaction to be displayed may not be at location 0
in the High-speed Memory. The pP determines the
first line to be displayed by first reading from address
260038, checking the Memory-state Counter for
overflow, and determining the present value of the
memory state count. If the counter has overflowed,
the information to be displayed in the first line of the
list is at the address equal to the present memory
state count. If there is no overflow, the information
for the first displayed line is at address 0 in the High¬
speed Memory.

2 (Memory State Count = 0)
/ 2 (Memory State Count = 0)
/ 2 (Memory State Count t 0)
Don't Care (HMCOF = 1)
COUNT TIME/COUNT TRIGS MODES
2
<7 and f 2
7
>7

"WAITING FOR ENABLE" Displayed
"WAITING FOR TRIGGER" Displayed
"TRIGGER OCCURRENCES =" Displayed
End of Run
"WAITING FOR ENABLE" Displayed
"COUNTING" Displayed
"COUNTER OVERFLOW" Displayed
End of Run

* STATUS BYTE ADDRESS = 26007s
Bit 0 = HARM (A8U20, Pin 2)
Bit 1 = LDLYL (A8U20, Pin 5)
Bit 2 = HCTOF (A8U20, Pin 11)
Bit 3 = HDSL (A8U20, Pin 14)

During a measurement interval, the 1611A monitors
and displays the status of the measurement. Until the
first trigger is recognized, a WAITING FOR TRIG¬
GER or WAITING FOR ENABLE message is displayed.
If HARM is true when the status is read, the message
is WAITING FOR TRIGGER. Otherwise WAITING
FOR ENABLE is displayed. When a status byte equal
to 2 or 3 is read, the pass counter value is also read
(address 260008). If the value is not equal to the
preset value, one or more triggers have occurred.
When this condition is detected, the number of trigger
occurrences is computed and displayed, rather than
WAITING FOR ENABLE or WAITING FOR TRIG¬
GER. When the pass counter reaches terminal count
and LDLYL becomes true, the status byte is equal to
0 or 1, and a DELAYING message is displayed. When
the measurement is complete, A8U15 pin 6 (HCTOF)
goes true. This causes the status byte value to be
greater than 3. A value greater than 3 indicates to the
internal pP that the measurement is complete.

Figure 8-14. Service Sheet 8, Data Storage and Counter Assembly A8 (Sheet 5 of 6)
8-38

Service

## Page 108


Model 1611A
A. COUNT TIME/COUNT TRIGS MEASUREMENTS

B. TRACE TRIGS MEASUREMENTS

C. TRACE SINGLE STEP MEASUREMENT

D. TRACE MEASUREMENTS

E. KEY CHECK ROUTINE

COUNT
TRIGS

_
WR TE
148~* 361408
\f
WRITE
0-*26004g
V /

WRITE
0-♦260058
\'
WRITE
371g—*36140g
N/
DISPLAY'"COUNT
= EVE NTS"

i_
CONVE RT AND
DISPLA'< COUNT

READ STATUS
OF MEASUREMENT

READ
2600,1,28

READ
26000,1,2 0
o
\f
CONVERT AND
DISPLAY COUNT

_]
^

f

END

^

Figure 8-14. Service Sheet 8,
Data Storage and Counter Assembly A8 (Sheet 6 of 6)

8-39

Model 1611A

## Page 109


Service

SERVICE SHEET 9
ICs ON THIS SCHEMATIC

PRINCIPLES OF OPERATION
The External Probe allows the 1611A to monitor up
to eight circuit nodes in the system under test. Bus
drivers U1 and U2 buffer the monitored signals to
reduce loading on the circuit being monitored. RC
networks U3 and U4 adjust timing of signals so they
arrive at the External Latch on A10 at the proper time.
The External Latch is clocked by PEXCK from A9.

IC REF DES

HP PART NO.

MFR PART NO.

Ul, 2
U3, 4

1820-1829
1810-0293

1820-1829
1810-0293

FROM
CIRCUIT
UNDER
TEST

A12 Parts Identification
(01611-62101)

A12A1
1611A-009-01-01-77

Figure 8-15. Service Sheet 9, External Probe Assembly A12
8-40

1611A-3

## Page 110


SERVICE

NOTE
Supersedes:

None
HP MODEL 1611A LOGIC STATE ANALYZER
Serial Prefix 1635A and Below
+5 VOLT SUPPLY FUSE FAILURE

The +5 Volt fuse A2F3 (HP Part Number 2110-0029) may
fail when the above instruments are operated in a high
ambient temperature. The problem can be eliminated by
changing the fuse to a 4 amp SL0-BL0 (HP Part Number
2110-0014).

DH/rw/WO

7-77/08
Part Number
5955-2771

What
HEWLETT
WlfiM PACKARD
For more information, call your local HP Sales Office or nearest Regional Office: Eastern (301) 258-2000; Midwestern (312) 255-9800;
Southern (404) 955-1500; Western (213) 877-1282; Canadian (416) 678-9430. Ask the operator for Instrument Sales. Or, Write:
Hewlett-Packard, 1501 Page Mill Road, Palo Alto, CA 94304. In Europe: Hewlett-Packard S.A., 7, ruedu Bois-du-Lan. P.O. Box CH-1217
Meyrin 2, Geneva, Switzerland. In Japan: Yokogawa-Hewlett-Packard Ltd., 29-21, Takaido-Higashi 3-chome, Suginami-ku, Tokyo, 138.

PRINTED IN U S A.

1611A-4

## Page 111


SERVICE

NO
Supersedes:

None
HP MODEL 1611A LOGIC STATE ANALYZER
Serial Numbers 1723A00590 and Below
POWER SUPPLY CURRENT LIMIT MODIFICATION

The current limiting circuit in the above instruments
may not operate properly when used with any option
other than 080 or 068. An annoying audible sound may
result. The problem can be eliminated by changing
A2R15 (HP Part Number 0811-1758) .24ft to .18ft (HP
Part Number 0811-2771).
Materials required for this modification:
1

DH/rw/WO

0811-2771 .18ft 3 watt resistor

7-77/08
Part Number
5955-2772

HEWLETT
PACKARD
For more information, call your local HP Sales Office or nearest Regional Office: Eastern (301) 258-2000; Midwestern (312) 255-9800;
Southern (404) 955-1500; Western (213) 877-1282; Canadian (416) 678-9430. Ask the operator for Instrument Sales. Or, Write:
Hewlett-Packard, 1501 Page Mill Road, Palo Alto, CA 94304. In Europe: Hewlett-Packard S.A., 7, ruedu Bois-du-Lan, P.O. BoxCH-1217
Meyrin2. Geneva, Switzerland. In Japan: Yokogawa-Hewlett-Packard Ltd., 29-21, Takaido-Higashi3-chome,Suginami-ku, Tokyo, 168.

PRINTED IN U.S.A.

1611A-5

## Page 112


SERVICE

NOTE

HP MODEL 1611A LOGIC STATE ANALYZER
Serial Numbers 1723A00696 and below
\

t

\

TRACE POINT OUTPUT CORRECTION

i

|
The trace point output on the rear panel of the 1611A has incorrect
pulse width when some values of after-trigger delay are specified.
This problem can be corrected by adding the signal NCNT (from A8U32)
to the input of NAND gate A8U12.

j

Material required:
1 - 74S133 IC, HP Part No. 1820-1130
1 - 16 pin IC socket, HP Part No. 1200-0507
1 - Insulated jumper wire, approx 7cm (2 3/4 in.) long
INSTALLATION PROCEDURE
1.

Remove the A8 assembly (01611-66508/66535) and locate A8U12.

2.

Cut the trace between +5 volts and A8U12 pin 3 (See figure 1).

3.

Remove A8U12 and install the IC socket.

4.

Install the jumper wire as shown in figure 1.

5.

Install the new A8U12 (1820-1130) in the socket.

Recalibration is not required.
as shown in figure 2.

DH/mc/WO

Update schematics in the 1611A manual

12/77-08

5955-4123

— HEWLETT
"FM PACKARD
For more information, call your local HP Sales Office or nearest Regional Office: Eastern (301) 258-2000; Midwestern (312) 255-9800;
Southern (404) 955-1500; Western (213) 877-1282; Canadian (416) 678-9430. Ask the operator for Instrument Sales. Or, Write:
Hewlett-Packard, 1501 Page Mill Road, Palo Alto, CA 94304. In Europe: Hewlett-Packard S.A., 7. ruedu Bois-du-Lan, P.O. BoxCH-1217
Meyrin 2, Geneva, Switzerland. In Japan: Yokogawa-Hewlett-Packard Ltd., 29-21, Takaido-Higashi 3-chome, Suginami-ku, Tokyo, 168.

PRINTED IN U.S.A.

TRACE SIDE OF A8

## Page 113

TRACE SIDE OF A8

## Page 114


(01611-66508)
OR

(01611-66535)

I
U11

m

## Page 115

01611-90909

HEWLETT
PACKARD

PRINTED IN U.S.A.


## Page 116


## Companion Cross-Check Summary

- Use `docs-classified/operating-and-service-manual/01611-90905.md` when:
  - the unit appears to align better with early `1723A`-era behavior
  - a later service-sheet page is hard to read
  - a section-specific fusion note above explicitly calls out a serial-sensitive delta
- Use `docs-classified/operators-guide/10266-90902.md` for A09 personality-module operation, trace setup, probe tests, and 6809-specific measurement behavior.
- Use `docs-classified/field-training-manual/5922-2029.md` and its rendered figures for extra training context when the formal service text is too terse.
