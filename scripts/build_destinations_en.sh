#!/usr/bin/env bash
set -e
cd "C:\Users\fernu\Desktop\site-institucional"

bash scripts/make_page.sh "en/destinations/index.html" \
  "Destinations | ATF Travel" \
  "Discover ATF Travel's curated destinations: snow, beach & islands, and Europe. Luxury itineraries in the Maldives, Vail, Courchevel, Tulum and more." \
  "/en/destinations/" "scripts/pages/en-destinations-index.body.html" "en" "/destinos/"

bash scripts/make_page.sh "en/destinations/europe/index.html" \
  "Trips to Europe | ATF Travel" \
  "Luxury itineraries across Europe: wine tourism in Portugal and France, culture in Turkey, and snow in Andorra, Baqueira Beret and Courchevel." \
  "/en/destinations/europe/" "scripts/pages/en-destinations-europe.body.html" "en" "/destinos/europa/"

bash scripts/make_page.sh "en/destinations/caribbean/index.html" \
  "Trips to the Caribbean | ATF Travel" \
  "Luxury resorts in the Caribbean and Mexico: Los Cabos, Tulum, Xcaret, Jamaica (Sandals) and Curaçao, curated by ATF Travel." \
  "/en/destinations/caribbean/" "scripts/pages/en-destinations-caribbean.body.html" "en" "/destinos/caribe/"

declare -A TITLES=(
  [andorra]="Andorra | Snow Destination | ATF Travel"
  [aspen-snowmass]="Aspen and Snowmass | Snow Destination | ATF Travel"
  [baqueira-beret]="Baqueira Beret | Snow Destination | ATF Travel"
  [maldives]="Maldives | Luxury Travel | ATF Travel"
  [tulum]="Tulum | Luxury Travel | ATF Travel"
  [turkey]="Turkey | Luxury Travel | ATF Travel"
  [vail]="Vail | Snow Destination | ATF Travel"
  [xcaret]="Xcaret | Luxury Travel | ATF Travel"
  [france]="France | Wine Tourism & Gastronomy | ATF Travel"
  [los-cabos]="Los Cabos | Luxury Travel | ATF Travel"
  [jamaica-sandals]="Jamaica (Sandals) | Luxury Travel | ATF Travel"
  [alentejo-portugal]="Alentejo, Portugal | Wine Tourism | ATF Travel"
  [courchevel]="Courchevel | Snow Destination | ATF Travel"
  [curacao]="Curaçao | Luxury Travel | ATF Travel"
  [termas-de-chillan]="Termas de Chillán | Snow Destination | ATF Travel"
)

declare -A DESCS=(
  [andorra]="Snow trips to Andorra, with complete lodging and logistics curation by ATF Travel."
  [aspen-snowmass]="Snow trips to Aspen and Snowmass, Colorado, with complete winter logistics by ATF Travel."
  [baqueira-beret]="Snow trips to Baqueira Beret, in the Spanish Pyrenees, curated by ATF Travel."
  [maldives]="Luxury itineraries in the Maldives with overwater bungalows, curated by ATF Travel."
  [tulum]="Luxury itineraries in Tulum, Mexico, with boutique stays curated by ATF Travel."
  [turkey]="Luxury trips across Turkey: Istanbul, Cappadocia and the Aegean coast, curated by ATF Travel."
  [vail]="Snow trips to Vail, Colorado, with curated lodging and ski lessons by ATF Travel."
  [xcaret]="Luxury trips to the Xcaret region, Riviera Maya, with resorts selected by ATF Travel."
  [france]="Wine tourism and fine dining itineraries across France, curated by ATF Travel."
  [los-cabos]="Luxury trips to Los Cabos, Mexico, with resorts selected by ATF Travel."
  [jamaica-sandals]="Luxury trips to Sandals resorts in Jamaica, exclusively for couples, curated by ATF Travel."
  [alentejo-portugal]="Wine tourism itineraries in Alentejo, Portugal, with curated wineries and gastronomy by ATF Travel."
  [courchevel]="Luxury snow trips to Courchevel, in the French Alps, curated by ATF Travel."
  [curacao]="Luxury trips to Curaçao, in the Caribbean, with curated lodging by ATF Travel."
  [termas-de-chillan]="Snow trips to Termas de Chillán, Chile, with skiing and hot springs, curated by ATF Travel."
)

declare -A PT_SLUG=(
  [andorra]="andorra"
  [aspen-snowmass]="aspen-snowmass"
  [baqueira-beret]="baqueira-beret"
  [maldives]="maldivas"
  [tulum]="tulum"
  [turkey]="turquia"
  [vail]="vail"
  [xcaret]="xcaret"
  [france]="franca"
  [los-cabos]="los-cabos"
  [jamaica-sandals]="jamaica-sandals"
  [alentejo-portugal]="alentejo-portugal"
  [courchevel]="courchevel"
  [curacao]="curacao"
  [termas-de-chillan]="termas-de-chillan"
)

for slug in "${!TITLES[@]}"; do
  bash scripts/make_page.sh "en/destinations/${slug}/index.html" \
    "${TITLES[$slug]}" \
    "${DESCS[$slug]}" \
    "/en/destinations/${slug}/" \
    "scripts/pages/en-destination-${slug}.body.html" \
    "en" "/destinos/${PT_SLUG[$slug]}/"
done

echo "EN destinations: build complete."
