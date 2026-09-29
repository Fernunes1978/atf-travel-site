#!/usr/bin/env bash
# Usage: make_page.sh <output_path> <title> <description> <canonical_path> <body_fragment_file> [lang] [alt_url]
# lang: "pt" (default) or "en". alt_url: absolute path to the equivalent page in the other language.
set -e
OUT="$1"
TITLE="$2"
DESC="$3"
CANONICAL="$4"
BODY_FILE="$5"
LANG="${6:-pt}"
ALT_URL="${7:-}"

ROOT="C:\Users\fernu\Desktop\site-institucional"
mkdir -p "$(dirname "$OUT")"

if [ "$LANG" = "en" ]; then
  HTML_LANG="en"
  HEADER_FILE="$ROOT/scripts/_header_en.html"
  FOOTER_FILE="$ROOT/scripts/_footer_en.html"
  ALT_LABEL="🇧🇷 Português"
  ALT_HREFLANG="pt-BR"
  THIS_HREFLANG="en"
else
  HTML_LANG="pt-BR"
  HEADER_FILE="$ROOT/scripts/_header.html"
  FOOTER_FILE="$ROOT/scripts/_footer.html"
  ALT_LABEL="🇬🇧 English"
  ALT_HREFLANG="en"
  THIS_HREFLANG="pt-BR"
fi

{
  echo "<!doctype html><html lang=\"${HTML_LANG}\"><head>"
  echo '<meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width,initial-scale=1">'
  echo "<title>${TITLE}</title>"
  echo "<meta name=\"description\" content=\"${DESC}\">"
  echo "<link rel=\"canonical\" href=\"https://www.atft.com.br${CANONICAL}\">"
  if [ -n "$ALT_URL" ]; then
    echo "<link rel=\"alternate\" hreflang=\"${THIS_HREFLANG}\" href=\"https://www.atft.com.br${CANONICAL}\">"
    echo "<link rel=\"alternate\" hreflang=\"${ALT_HREFLANG}\" href=\"https://www.atft.com.br${ALT_URL}\">"
  fi
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
  cat "$HEADER_FILE"
  cat "$BODY_FILE"
  cat "$FOOTER_FILE"
  echo '</body></html>'
} > "$OUT"

if [ -n "$ALT_URL" ]; then
  sed -i "s#__ALT_LANG_URL__#${ALT_URL}#g; s#__ALT_LANG_LABEL__#${ALT_LABEL}#g" "$OUT"
else
  # No alt page yet: hide the switcher entirely rather than leave a dead link
  sed -i '/lang-switch/d' "$OUT"
fi

echo "Gerado: $OUT"
