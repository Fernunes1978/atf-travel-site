#!/usr/bin/env bash
set -e
ROOT="C:\Users\fernu\Desktop\site-institucional"
cd "$ROOT"

dest_body_en() {
  local slug="$1" nome="$2" hub_path="$3" hub_label="$4" tagline="$5" p1="$6" p2="$7" d1="$8" d2="$9" d3="${10}"
  local out="scripts/pages/en-destination-${slug}.body.html"
  cat > "$out" << EOF
<nav class="breadcrumbs container" aria-label="Breadcrumb">
  <a href="/en/">Home</a><span class="sep">/</span><a href="/en/destinations/">Destinations</a><span class="sep">/</span><a href="${hub_path}">${hub_label}</a><span class="sep">/</span><span class="atual">${nome}</span>
</nav>

<section class="page-header">
  <div class="container">
    <span class="eyebrow">Destination · ${hub_label}</span>
    <h1>${nome}</h1>
    <p class="lead">${tagline}</p>
  </div>
</section>

<section class="section">
  <div class="container duas-colunas">
    <div>
      <h2>Why visit ${nome}</h2>
      <p>${p1}</p>
      <p>${p2}</p>
    </div>
    <div class="diferenciais-grid" style="margin-top:0;">
      <div class="diferencial"><span class="num">•</span><p>${d1}</p></div>
      <div class="diferencial"><span class="num">•</span><p>${d2}</p></div>
      <div class="diferencial"><span class="num">•</span><p>${d3}</p></div>
    </div>
  </div>
</section>

<section class="section section-alt">
  <div class="container">
    <span class="eyebrow">See also</span>
    <h2>Other destinations in ${hub_label}</h2>
    <div class="relacionados-grid">
      <div class="relacionado-item"><span class="tag">Guide</span><a href="${hub_path}">See all in ${hub_label}</a></div>
      <div class="relacionado-item"><span class="tag">Service</span><a href="/en/services/custom-itineraries/">Custom itineraries</a></div>
      <div class="relacionado-item"><span class="tag">Service</span><a href="/en/services/luxury-travel/">Luxury travel</a></div>
      <div class="relacionado-item"><span class="tag">All</span><a href="/en/destinations/">All destinations</a></div>
    </div>
  </div>
</section>

<section class="cta-final">
  <div class="container">
    <h2>Ready to plan your trip to ${nome}?</h2>
    <div class="hero-actions" style="justify-content:center;">
      <a href="/en/contact/" class="btn btn-light">Request a Quote</a>
      <a href="https://wa.me/5519998117815" target="_blank" rel="noopener" class="btn btn-whatsapp">Chat on WhatsApp</a>
    </div>
  </div>
</section>
EOF
  echo "body: $out"
}

dest_body_en "andorra" "Andorra" "/en/destinations/europe/" "Europe" \
  "Extensive slopes, tax-free shopping and charming villages between France and Spain." \
  "Andorra offers one of the largest skiable areas in the Pyrenees, with well-connected slopes, a lively après-ski scene and the advantage of tax-free shopping — all just a few hours from Barcelona or Toulouse." \
  "ATF Travel organizes snow itineraries in Andorra combining lodging, ski lessons and, if desired, extra days in Spain or France, since the country sits strategically between the two." \
  "One of the largest skiable areas in the Pyrenees" \
  "Tax-free shopping" \
  "Easy to combine with Spain and France"

dest_body_en "aspen-snowmass" "Aspen and Snowmass" "/en/destinations/" "Snow" \
  "Glamour, top-tier gastronomy and world-class slopes in Colorado." \
  "Aspen and Snowmass form one of the most iconic ski destinations in the United States, with four interconnected mountains, an award-winning food scene and stays ranging from rustic-chic to ultra luxury." \
  "As a snow destination specialist, ATF Travel handles all the winter logistics in Aspen — lodging, equipment rental, ski lessons and reservations at in-demand restaurants." \
  "Four interconnected mountains for every level" \
  "Award-winning gastronomy and sophisticated nightlife" \
  "Complete winter logistics, start to finish"

dest_body_en "baqueira-beret" "Baqueira Beret" "/en/destinations/europe/" "Europe" \
  "The leading ski resort in the Spanish Pyrenees, with slopes for every level." \
  "Baqueira Beret is Spain's most traditional ski resort, with good snow, slopes for every level, and a village with complete lodging and dining infrastructure at the foot of the mountain." \
  "We organize the full stay in Baqueira Beret, with lodging close to the slopes and the option to combine the itinerary with cities like Barcelona before or after the snow season." \
  "Spain's most traditional ski resort" \
  "Slopes for every level" \
  "Easy to combine with Barcelona"

dest_body_en "maldives" "Maldives" "/en/destinations/" "Indian Ocean" \
  "Overwater bungalows, coral reefs and the most iconic blue of the Indian Ocean." \
  "The Maldives is synonymous with overwater stays: private bungalows built above the water, with direct sea access and 360° horizon views. It's one of the most requested destinations in our Luxury & Gastronomy division, with resorts combining extreme privacy, signature gastronomy and diving among preserved coral reefs." \
  "ATF Travel selects resorts and bungalows in the Maldives according to each couple's or family's profile, handling seaplane transfers, private dinners, and experiences like diving and marine wildlife watching." \
  "Overwater bungalows with direct sea access" \
  "Diving and snorkeling in preserved reefs" \
  "Top-tier all-inclusive resorts"

dest_body_en "tulum" "Tulum" "/en/destinations/caribbean/" "Caribbean" \
  "Caribbean beaches, seaside Mayan ruins and a boho-chic lifestyle." \
  "Tulum combines history and nature: its Mayan ruins perched on cliffs overlooking the Caribbean are one of Mexico's postcard sights, and the town has become a benchmark for boutique stays with a natural aesthetic and author-driven gastronomy." \
  "ATF Travel selects boutique stays in Tulum aligned with that more intimate style, plus excursions to cenotes, Mayan ruins and the Riviera Maya." \
  "Seaside Mayan ruins" \
  "Boutique stays with a natural aesthetic" \
  "Excursions to cenotes and the Riviera Maya"

dest_body_en "turkey" "Turkey" "/en/destinations/europe/" "Europe" \
  "Between Europe and Asia, millennia of history, unique landscapes and striking gastronomy." \
  "Turkey brings together, in a single itinerary, the historic architecture of Istanbul, the surreal landscapes of Cappadocia, and a cuisine shaped by many cultures. It's a rich destination for those seeking culture, history and gastronomic experiences off the beaten path." \
  "We build itineraries across Turkey combining the main historic sites with curated gastronomic experiences, charming stays, and, in Cappadocia, sunrise hot-air balloon rides." \
  "Istanbul, Cappadocia and the Aegean coast in one itinerary" \
  "Cuisine with a unique blend of influences" \
  "Hot-air balloon rides in Cappadocia"

dest_body_en "vail" "Vail" "/en/destinations/" "Snow" \
  "One of the most renowned ski resorts in the United States, at the heart of Colorado." \
  "Vail is synonymous with wide, immaculately groomed slopes, a charming alpine village at the base of the mountain, and top-tier infrastructure for skiers of every level, from beginner to advanced." \
  "ATF Travel organizes the complete winter logistics in Vail — lodging close to the slopes, private ski lessons and village outings, tailoring the itinerary to each skier's level in the group." \
  "One of the largest skiable areas in the US" \
  "Charming alpine village at the base of the mountain" \
  "Facilities for every level, from beginner to advanced"

dest_body_en "xcaret" "Xcaret" "/en/destinations/caribbean/" "Caribbean" \
  "Nature park and reference resorts on Mexico's Riviera Maya." \
  "The Xcaret region combines award-winning nature and theme parks with top-tier all-inclusive resorts on the Riviera Maya, making it a great option for families and groups looking for beach, nature and comfort in one itinerary." \
  "We select stays in the Xcaret region and arrange tickets and transfers for the parks, plus complementary tours around the Riviera Maya." \
  "Award-winning nature and theme parks" \
  "All-inclusive resorts ideal for families" \
  "Easy to combine with Tulum and Cancún"

dest_body_en "france" "France" "/en/destinations/europe/" "Europe" \
  "From fine dining in Paris to countryside wineries, a classic that never goes out of style." \
  "France brings together, in a single country, some of the biggest names in world fine dining, iconic museums in Paris, and globally renowned wine regions, plus the French Alps for those seeking top-tier snow." \
  "With Anne Ferri's curated background in Gastronomy and Sommellerie, ATF Travel builds itineraries across France focused on wine tourism and gastronomic experiences, combining Paris with wine regions or with snow destinations like Courchevel." \
  "Fine dining with Michelin stars" \
  "World-renowned wine regions" \
  "Easy to combine with snow destinations in the Alps"

echo "Done."
