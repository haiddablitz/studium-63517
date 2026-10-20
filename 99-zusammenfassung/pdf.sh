#!/bin/sh
# Erzeugt aus einer .adoc-Datei ein PDF mit gesetzten Formeln.
# asciidoctor-pdf kann LaTeX-Formeln nicht setzen, daher: HTML (MathJax) -> Chrome headless -> PDF.
# Aufruf: ./pdf.sh wise-26/L1-vollstaendig.adoc   (PDF landet neben der .adoc-Datei)
# Benötigt Internetzugang, da MathJax von einem CDN geladen wird.
set -eu

CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"

[ $# -eq 1 ] || { echo "Aufruf: $0 <datei.adoc>" >&2; exit 1; }
src=$1
[ -f "$src" ] || { echo "Datei nicht gefunden: $src" >&2; exit 1; }
[ -x "$CHROME" ] || { echo "Chrome nicht gefunden: $CHROME" >&2; exit 1; }

out="$(cd "$(dirname "$src")" && pwd)/$(basename "${src%.adoc}").pdf"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

cat > "$tmp/docinfo.html" <<'EOF'
<style>
@page { size: A4; margin: 18mm 16mm; }
@media print {
  body { font-size: 10.5pt; }
  #header, #content, #footer { max-width: none; padding: 0; }
  .imageblock, .stemblock, .exampleblock, .admonitionblock, table { break-inside: avoid; }
  h2, h3, h4, h5, .title { break-after: avoid; }
  #footer { display: none; }
}
</style>
EOF

asciidoctor -a toc=auto -a data-uri -a docinfo=shared -a docinfodir="$tmp" -o "$tmp/doc.html" "$src"

"$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=20000 --print-to-pdf="$out" "file://$tmp/doc.html" 2>/dev/null

echo "$out"
