#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PRIMARY_MD="$ROOT_DIR/docs-classified/service-manual/01611-90909.md"
OUT_MD="$ROOT_DIR/docs-classified/mainframe/1611a-mainframe-composed-repair-reference.md"

extract_section() {
  local src="$1"
  local start="$2"
  local end="${3:-}"

  awk -v start="$start" -v end="$end" '
    /^## Page / { page = $0 }
    !started && $0 == start {
      started = 1
      if (page != "") {
        print page
        print ""
      }
      print $0
      next
    }
    started && end != "" && $0 == end { exit }
    started { print }
  ' "$src"
}

cat > "$OUT_MD" <<'EOF'
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

EOF

extract_section "$PRIMARY_MD" "SECTION I" "SECTION II" >> "$OUT_MD"

cat >> "$OUT_MD" <<'EOF'

## Section II Fusion Notes

- Canonical text below is from the `1980` service manual.
- The `1978` companion section is materially similar. Keep it only as a figure/layout cross-check for early units.

## Section II Canonical Text

EOF

extract_section "$PRIMARY_MD" "SECTION II" "SECTION III" >> "$OUT_MD"

cat >> "$OUT_MD" <<'EOF'

## Section III Fusion Notes

- Both manuals intentionally defer detailed operation to the installed personality-module supplement.
- For 6809 repair sessions, the relevant operator text lives in `docs-classified/operators-guide/10266-90902.md`.

## Section III Canonical Text

EOF

extract_section "$PRIMARY_MD" "SECTION III" "SECTION IV" >> "$OUT_MD"

cat >> "$OUT_MD" <<'EOF'

## Section IV Fusion Notes

- Both manuals intentionally defer complete performance tests to the installed personality-module supplement.
- Use the module-specific guide rather than trying to infer full measurement behavior from the bare mainframe manual.

## Section IV Canonical Text

EOF

extract_section "$PRIMARY_MD" "SECTION IV" "SECTION V" >> "$OUT_MD"

cat >> "$OUT_MD" <<'EOF'

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

EOF

extract_section "$PRIMARY_MD" "SECTION V" "SECTION VI" >> "$OUT_MD"

cat >> "$OUT_MD" <<'EOF'

## Section VI Fusion Notes

- Use the `1980` replaceable-parts content as the primary source.
- For early-unit cross-checks, the `1978` companion parts list may still help identify earlier assemblies or component-locator relationships, but the later manual and its change set take precedence.

## Section VI Canonical Text

EOF

extract_section "$PRIMARY_MD" "SECTION VI" "SECTION VII" >> "$OUT_MD"

cat >> "$OUT_MD" <<'EOF'

## Section VII Fusion Notes

- This is one of the most important sections in the fusion.
- The `1980` manual-change table is broader and more authoritative than the `1978` one.
- The `1978` manual-change table only covers `1635A` and installed options `068/080`.
- The `1980` table expands that into explicit change sets for `1635A`, `1723A`, `2007A`, and `2017A`.
- For repair work, use the `1980` change logic as canonical and only refer back to the `1978` table if you are deliberately reconstructing earlier documentation context.

## Section VII Canonical Text

EOF

extract_section "$PRIMARY_MD" "SECTION VII" "SECTION VIII" >> "$OUT_MD"

cat >> "$OUT_MD" <<'EOF'

## Section VIII Fusion Notes

- Canonical text below is from the `1980` service manual.
- The `1978` companion section is broadly similar in structure and still useful, but the later service manual should drive troubleshooting flow, repair work, and service-sheet interpretation.
- If a service-sheet page or locator is hard to read in the canonical section, cross-check the rendered pages in `docs-classified/mainframe/figures/operating-and-service-manual-1978/`.
- Signature-analysis guidance exists in both manuals; the fused rule is to use the `1980` text first and consult the `1978` companion only when you need alternate wording or a cleaner earlier sheet.

## Section VIII Canonical Text

EOF

extract_section "$PRIMARY_MD" "SECTION VIII" >> "$OUT_MD"

cat >> "$OUT_MD" <<'EOF'

## Companion Cross-Check Summary

- Use `docs-classified/operating-and-service-manual/01611-90905.md` when:
  - the unit appears to align better with early `1723A`-era behavior
  - a later service-sheet page is hard to read
  - a section-specific fusion note above explicitly calls out a serial-sensitive delta
- Use `docs-classified/operators-guide/10266-90902.md` for A09 personality-module operation, trace setup, probe tests, and 6809-specific measurement behavior.
- Use `docs-classified/field-training-manual/5922-2029.md` and its rendered figures for extra training context when the formal service text is too terse.
EOF
