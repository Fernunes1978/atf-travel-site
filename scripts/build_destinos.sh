#!/usr/bin/env bash
set -e
cd "C:\Users\fernu\Desktop\site-institucional"

bash scripts/make_page.sh "destinos/index.html" \
  "Destinos | ATF Travel" \
  "Conheça os destinos com curadoria ATF Travel: neve, praia e ilhas, e Europa. Roteiros de luxo em Maldivas, Vail, Courchevel, Tulum e muito mais." \
  "/destinos/" "scripts/pages/destinos-index.body.html"

bash scripts/make_page.sh "destinos/europa/index.html" \
  "Viagens para a Europa | ATF Travel" \
  "Roteiros de luxo pela Europa: enoturismo em Portugal e França, cultura na Turquia e neve em Andorra, Baqueira Beret e Courchevel." \
  "/destinos/europa/" "scripts/pages/destinos-europa.body.html"

bash scripts/make_page.sh "destinos/caribe/index.html" \
  "Viagens para o Caribe | ATF Travel" \
  "Resorts de luxo no Caribe e no México: Los Cabos, Tulum, Xcaret, Jamaica (Sandals) e Curaçao, com curadoria ATF Travel." \
  "/destinos/caribe/" "scripts/pages/destinos-caribe.body.html"

declare -A TITULOS=(
  [maldivas]="Maldivas | Viagem de Luxo | ATF Travel"
  [alentejo-portugal]="Alentejo, Portugal | Enoturismo | ATF Travel"
  [los-cabos]="Los Cabos | Viagem de Luxo | ATF Travel"
  [tulum]="Tulum | Viagem de Luxo | ATF Travel"
  [turquia]="Turquia | Viagem de Luxo | ATF Travel"
  [aspen-snowmass]="Aspen e Snowmass | Destino de Neve | ATF Travel"
  [vail]="Vail | Destino de Neve | ATF Travel"
  [termas-de-chillan]="Termas de Chillán | Destino de Neve | ATF Travel"
  [xcaret]="Xcaret | Viagem de Luxo | ATF Travel"
  [andorra]="Andorra | Destino de Neve | ATF Travel"
  [baqueira-beret]="Baqueira Beret | Destino de Neve | ATF Travel"
  [courchevel]="Courchevel | Destino de Neve | ATF Travel"
  [jamaica-sandals]="Jamaica (Sandals) | Viagem de Luxo | ATF Travel"
  [curacao]="Curaçao | Viagem de Luxo | ATF Travel"
  [franca]="França | Enoturismo e Gastronomia | ATF Travel"
)

declare -A DESCS=(
  [maldivas]="Roteiros de luxo em Maldivas com bangalôs sobre a água, curados pela ATF Travel. Hospedagem, transfers e experiências sob medida."
  [alentejo-portugal]="Roteiros de enoturismo no Alentejo, Portugal, com curadoria em vinícolas e gastronomia da ATF Travel."
  [los-cabos]="Viagens de luxo para Los Cabos, México, com resorts selecionados pela ATF Travel."
  [tulum]="Roteiros de luxo em Tulum, México, com hospedagens boutique curadas pela ATF Travel."
  [turquia]="Viagens de luxo pela Turquia: Istambul, Capadócia e a costa do Egeu, com curadoria ATF Travel."
  [aspen-snowmass]="Viagens de neve para Aspen e Snowmass, Colorado, com logística completa de inverno pela ATF Travel."
  [vail]="Viagens de neve para Vail, Colorado, com curadoria de hospedagem e aulas de esqui pela ATF Travel."
  [termas-de-chillan]="Viagens de neve para Termas de Chillán, Chile, com esqui e águas termais, curadas pela ATF Travel."
  [xcaret]="Viagens de luxo para a região de Xcaret, Riviera Maya, com resorts selecionados pela ATF Travel."
  [andorra]="Viagens de neve para Andorra, com curadoria completa de hospedagem e logística pela ATF Travel."
  [baqueira-beret]="Viagens de neve para Baqueira Beret, nos Pirineus espanhóis, com curadoria ATF Travel."
  [courchevel]="Viagens de neve de luxo para Courchevel, nos Alpes franceses, com curadoria ATF Travel."
  [jamaica-sandals]="Viagens de luxo para resorts Sandals na Jamaica, exclusivos para casais, com curadoria ATF Travel."
  [curacao]="Viagens de luxo para Curaçao, no Caribe, com curadoria de hospedagem pela ATF Travel."
  [franca]="Roteiros de enoturismo e alta gastronomia pela França, com curadoria da ATF Travel."
)

for slug in "${!TITULOS[@]}"; do
  bash scripts/make_page.sh "destinos/${slug}/index.html" \
    "${TITULOS[$slug]}" \
    "${DESCS[$slug]}" \
    "/destinos/${slug}/" \
    "scripts/pages/destino-${slug}.body.html"
done

echo "Destinos: build completo."
