# Basket And Inventory vs Repurpose Needs

This note checks the updated basket workbook together with the bench inventory list against the current repurpose-part needs in:

- `repurpose/screen/display-shopping-list.csv`
- `repurpose/screen/display-bom.csv`
- `repurpose/keyboard/hp-native/xa5-keyboard-replacement-wirewrap-bom.csv`
- `repurpose/keyboard/external-ps2/ps2-keyboard-bom.csv`

The source files used here are:

- [basket-items.csv](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/basket/basket-items.csv)
- [list.csv](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp1611a/repurpose/inventory/list.csv)

The current basket workbook timestamp is `25-Aug-26 05:48:47`.

## Summary

The updated basket and the new inventory list materially improve coverage.

Broadly:

- the screen repurpose path is now very well supported
- the keyboard repurpose path is still not complete, but several previous electronics gaps are now closed by inventory
- the largest remaining gaps are mechanical and integration items, not core logic parts

## Newly Improved Since The Prior Check

Compared with the earlier basket-only snapshot:

- the basket now includes `1x 204G BC BW` for the left main display
- the basket now includes `10x SN74LS14N`
- the basket now includes `10x SN74HCT125N`
- the basket now includes `2 kohm` through-hole resistors to pair with the existing `1 kohm` stock for a simple serial-input divider
- the oversized `NHD-0440AZ-FL-YBW` has been removed from the first-build basket
- the inventory confirms `Arduino Nano 33 IoT` boards on hand
- the inventory confirms `10 kohm` and `4.7 kohm` resistor stock on hand
- the inventory confirms a deeper wire-wrap socket mix on hand
- the inventory confirms LED stock and wire-wrap wire on hand
- the inventory confirms one `J1-00105` precision switch stick on hand
- the inventory now explicitly includes a wire-wrap tool
- the inventory now explicitly includes `2N2222A` transistor stock for optional row-driver or interface work

## Clearly Covered For Screen Work

The screen repurpose direction is now in good shape for first-build electronics:

- `204G BC BW` left-side main LCD is in the basket with quantity `1`
- `NHD-0116GZ-FSW-GBW` right-side strip LCD is in the basket with quantity `1`
- `Arduino Nano 33 IoT` is in inventory with quantity `4`
- `ATMEGA328P-PU` fallback controller path is in the basket with quantity `10`
- `PTNS2-4515M-B10` slider bank is in the basket with quantity `10`
- `PB5-M-R-R-67`, `PB5-M-BK-R-67`, and `PB4L-M-RR-D-67` pushbuttons are in the basket
- both `8-position` DIP switch styles are in the basket
- `J1-00105` precision switch stick is in inventory for directional environmental feedback
- `CD74HC4051E` analog mux is in the basket
- `SN74LS245N` buffered digital interface part is in the basket
- `LM339AN` comparator/open-collector building block is in the basket
- `SN74HCT125N` now covers the optional through-hole `3.3 V` to `5 V TTL` serial up-shift path
- `USBLC6-2SC6` ESD protection is in the basket
- `MF-R050-AP`, `MF-R075-AP`, and `MF-R110-AP` polyfuses are in the basket
- `3386P-1-103LF` contrast trimmers are in the basket
- `M20-9994045` header stock is in the basket
- `28 AWG` `20-pin` flat ribbon is on hand and is now the preferred first-pass LCD harness stock
- LED stock is present in inventory
- capacitor stock for decoupling and bulk filtering is present in the basket
- the right-side strip is now part of the first build rather than an optional later add-on
- the left-side display choice is now aligned with the mechanically safer `204G BC BW` module

## Clearly Covered For Keyboard Work

The keyboard repurpose path now has stronger electronics support than before:

- `ATMEGA328P-PU`
- `SN74LS138N`
- `LM339AN`
- `SN74LS14N` in the basket and inventory
- `SN74LS245N` for the optional buffered-output path
- `SN74LS373N` in inventory as a practical match for the optional `74LS373 or 74LS574` latch slot
- `ATS16B-E` `16 MHz` crystal
- `1N5819`
- `1N4148`
- `M20-9994045` header stock
- `5749180-1` right-angle `Mini-DIN-6` connector for the external `PS/2` option
- `0.1 uF`, `10 uF`, `47 uF`, and `1 uF` capacitor stock
- timing-capacitor values around `22 pF`, `100 pF`, `470 pF`, `1 nF`, `4.7 nF`, and `10 nF`
- `10 kohm` resistor stock from inventory
- `4.7 kohm` resistor stock from inventory
- `330 ohm` resistor stock from basket and inventory
- `1 kohm` and `2 kohm` through-hole resistor stock for a simple serial-input divider
- wire-wrap sockets in several package sizes from inventory
- a wire-wrap tool from inventory
- `28 AWG` Kynar wire-wrap wire from inventory
- `2N2222A` transistor stock for optional row-driver or buffer work

## Partial Coverage

These needs are at least partly addressed, but still deserve an explicit bench or design decision.

- The keyboard wire-wrap socket story is much better, but it would still help to map exact on-hand quantities to the specific `14-pin`, `16-pin`, `20-pin`, and `28-pin` BOM callouts.
- The keyboard pull-up and bias resistor values now exist in inventory, but they are still inventory-backed rather than basket-backed.
- The display-side bezel and bracket are now best treated as fabrication tasks, so the remaining work is mostly CAD and fit verification rather than procurement.
- The display harness is no longer a special-parts concern if the on-hand `20-pin` flat ribbon is used for the LCD and strip runs.

## Still Missing For Screen Work

There are no obvious remaining special-part blockers for the first screen-oriented build.

The remaining screen work is now mostly:

- finalizing the DIP-switch bit allocation for `MODE_SEL`
- mapping the joystick behavior for environmental feedback
- printing the bezel, LCD bracket, and right-side strip bracket
- selecting the exact bench screws spacers and nuts for panel assembly
- confirming the clean `5 V` power path during bench integration

## Still Missing For Keyboard Work

The first-build native keyboard path still lacks several important nontrivial items:

- the `100-pin` card-edge carrier and matching edge-finger geometry
- reset switch hardware
- test posts or loops
- a clearer statement of whether the existing vector hardware fully supports the chosen card format

Optional or later-stage keyboard items can still vary by build approach, including:

- the external active `USB-to-PS/2` converter

## Bottom Line

If the goal is the screen repurpose build, the updated basket plus the new inventory list now support the mechanically safer two-display plan: `204G BC BW` on the left and `NHD-0116GZ-FSW-GBW` on the right.

If the goal is the native keyboard replacement build, the combined picture is better than before because the logic, resistor, LED, Nano, wire-wrap-stock, and now `74LS14` coverage are much stronger. The remaining risk is now concentrated in mechanics, packaging, and a few bench-setup details rather than in basic parts availability.
