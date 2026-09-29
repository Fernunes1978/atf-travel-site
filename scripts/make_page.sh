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
  ALT_LABEL='<svg viewBox="0 0 60 42" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" preserveAspectRatio="xMidYMid slice"><rect width="60" height="42" fill="#009c3b"/><polygon points="30,4 56,21 30,38 4,21" fill="#ffdf00"/><circle cx="30" cy="21" r="10" fill="#002776"/></svg>'
  ALT_HREFLANG="pt-BR"
  THIS_HREFLANG="en"
else
  HTML_LANG="pt-BR"
  HEADER_FILE="$ROOT/scripts/_header.html"
  FOOTER_FILE="$ROOT/scripts/_footer.html"
  ALT_LABEL='<svg viewBox="0 0 60 30" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" preserveAspectRatio="xMidYMid slice"><rect width="60" height="30" fill="#00247d"/><path d="M0,0 L60,30 M60,0 L0,30" stroke="#fff" stroke-width="6"/><path d="M0,0 L60,30 M60,0 L0,30" stroke="#cf142b" stroke-width="2"/><path d="M30,0 V30 M0,15 H60" stroke="#fff" stroke-width="10"/><path d="M30,0 V30 M0,15 H60" stroke="#cf142b" stroke-width="6"/></svg>'
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
  ALT_URL="$ALT_URL" ALT_LABEL="$ALT_LABEL" perl -i -pe '
    s/__ALT_LANG_URL__/$ENV{ALT_URL}/g;
    s/__ALT_LANG_LABEL__/$ENV{ALT_LABEL}/g;
  ' "$OUT"
else
  # No alt page yet: hide the switcher entirely rather than leave a dead link
  sed -i '/lang-switch/d' "$OUT"
fi

echo "Gerado: $OUT"
