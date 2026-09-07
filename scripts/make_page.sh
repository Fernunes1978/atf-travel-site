#!/usr/bin/env bash
# Usage: make_page.sh <output_path> <title> <description> <canonical_path> <body_fragment_file>
set -e
OUT="$1"
TITLE="$2"
DESC="$3"
CANONICAL="$4"
BODY_FILE="$5"

ROOT="C:\Users\fernu\Desktop\site-institucional"
mkdir -p "$(dirname "$OUT")"

{
  echo '<!doctype html><html lang="pt-BR"><head>'
  echo '<meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width,initial-scale=1">'
  echo "<title>${TITLE}</title>"
  echo "<meta name=\"description\" content=\"${DESC}\">"
  echo "<link rel=\"canonical\" href=\"https://www.atft.com.br${CANONICAL}\">"
  echo "<meta property=\"og:title\" content=\"${TITLE}\">"
  echo "<meta property=\"og:description\" content=\"${DESC}\">"
  echo '<meta property="og:type" content="website">'
  echo "<meta property=\"og:url\" content=\"https://www.atft.com.br${CANONICAL}\">"
  echo '<meta property="og:site_name" content="ATF Travel">'
  echo '<link rel="preconnect" href="https://fonts.googleapis.com">'
  echo '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>'
  echo '<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500;600;700&family=Jost:wght@400;500;600&display=swap" rel="stylesheet">'
  echo '<link rel="stylesheet" href="/assets/site.css">'
  echo '</head><body>'
  cat "$ROOT/scripts/_header.html"
  cat "$BODY_FILE"
  cat "$ROOT/scripts/_footer.html"
  echo '</body></html>'
} > "$OUT"

echo "Gerado: $OUT"
