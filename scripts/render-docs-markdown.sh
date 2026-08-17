#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOCS_DIR="$ROOT_DIR/docs"
OUT_DIR="$ROOT_DIR/docs-classified"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

render_text_pdf() {
  local src="$1"
  local out="$2"
  local title="$3"
  local category="$4"
  local printed="$5"
  local notes="$6"
  local pages

  pages="$(pdfinfo "$src" | awk -F': *' '/^Pages:/ {print $2}')"

  {
    printf '# %s\n\n' "$title"
    printf -- '- Source PDF: `%s`\n' "${src#$ROOT_DIR/}"
    printf -- '- Category: `%s`\n' "$category"
    printf -- '- Printed: `%s`\n' "$printed"
    printf -- '- Pages: `%s`\n' "$pages"
    printf -- '- Conversion: `pdftotext` with page markers preserved\n'
    printf -- '- Notes: %s\n\n' "$notes"
    printf '## Agent Notes\n\n'
    printf 'Use this Markdown for search, quoting, and service reasoning. Page markers are preserved as `## Page N` headings so an agent can cite the original page region when answering repair questions.\n\n'
    printf '## Extracted Text\n\n'
  } > "$out"

  pdftotext "$src" - \
    | awk '
      BEGIN {
        page = 1
        print "## Page 1"
        print ""
      }
      {
        gsub(/\r/, "")
        while (index($0, "\f")) {
          sub(/\f/, "")
          if (length($0) > 0) {
            print $0
          }
          print ""
          page++
          print "## Page " page
          print ""
          next_line = 1
        }
        if (!next_line) {
          print $0
        }
        next_line = 0
      }
    ' >> "$out"
}

render_ocr_pdf() {
  local src="$1"
  local out="$2"
  local title="$3"
  local category="$4"
  local printed="$5"
  local notes="$6"
  local pages
  local image_dir="$TMP_DIR/ocr-pages"
  local image
  local page

  pages="$(pdfinfo "$src" | awk -F': *' '/^Pages:/ {print $2}')"
  mkdir -p "$image_dir"

  {
    printf '# %s\n\n' "$title"
    printf -- '- Source PDF: `%s`\n' "${src#$ROOT_DIR/}"
    printf -- '- Category: `%s`\n' "$category"
    printf -- '- Printed: `%s`\n' "$printed"
    printf -- '- Pages: `%s`\n' "$pages"
    printf -- '- Conversion: `pdftoppm` + `tesseract` OCR with per-page markers\n'
    printf -- '- Notes: %s\n\n' "$notes"
    printf '## Agent Notes\n\n'
    printf 'This document was OCRed from page images, so spelling noise is expected. For machine repair questions, prefer corroborating critical values against the source PDF if a line looks suspicious.\n\n'
    printf '## Extracted Text\n\n'
  } > "$out"

  pdftoppm -r 200 -png "$src" "$image_dir/page" >/dev/null 2>&1

  for image in "$image_dir"/page-*.png; do
    page="$(basename "$image" .png | sed 's/^page-0*//')"
    printf '## Page %s\n\n' "$page" >> "$out"
    tesseract "$image" stdout 2>/dev/null >> "$out"
    printf '\n\n' >> "$out"
  done
}

rm -rf "$OUT_DIR"
mkdir -p \
  "$OUT_DIR/operating-and-service-manual" \
  "$OUT_DIR/service-manual" \
  "$OUT_DIR/field-training-manual"

render_text_pdf \
  "$DOCS_DIR/01611-90905.pdf" \
  "$OUT_DIR/operating-and-service-manual/01611-90905.md" \
  "HP 1611A Operating And Service Manual" \
  "operating-and-service-manual" \
  "April 1978" \
  "Good OCR/text extraction. Includes operating information, adjustments, replaceable parts, and troubleshooting sections."

render_text_pdf \
  "$DOCS_DIR/01611-90909.pdf" \
  "$OUT_DIR/service-manual/01611-90909.md" \
  "HP 1611A Service Manual" \
  "service-manual" \
  "July 1980" \
  "Good OCR/text extraction. Includes adjustments, replaceable parts, signature analysis notes, and troubleshooting sections."

render_ocr_pdf \
  "$DOCS_DIR/5922-2029.pdf" \
  "$OUT_DIR/field-training-manual/5922-2029.md" \
  "HP 1611A Field Training Manual" \
  "field-training-manual" \
  "Unknown" \
  "Image-based PDF. OCR generated from rendered pages."
