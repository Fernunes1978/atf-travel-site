#!/usr/bin/env bash
set -e
cd "C:\Users\fernu\Desktop\site-institucional"

bash scripts/make_page.sh "sobre/index.html" \
  "Sobre a ATF Travel | Agência de Viagens de Luxo" \
  "Conheça a ATF Travel: agência de viagens de luxo conduzida por Anne Ferri e Fernando Nunes, com curadoria em hospedagens, gastronomia e destinos de neve." \
  "/sobre/" "scripts/pages/sobre.body.html"

bash scripts/make_page.sh "servicos/index.html" \
  "Serviços | ATF Travel" \
  "Conheça os serviços da ATF Travel: viagens de luxo, concierge de viagem e roteiros personalizados, com atendimento 100% online." \
  "/servicos/" "scripts/pages/servicos-index.body.html"

bash scripts/make_page.sh "servicos/viagens-de-luxo/index.html" \
  "Viagens de Luxo | ATF Travel" \
  "Hospedagens 5 estrelas e boutique, curadoria gastronômica e experiências exclusivas em destinos de referência mundial." \
  "/servicos/viagens-de-luxo/" "scripts/pages/servicos-viagens-de-luxo.body.html"

bash scripts/make_page.sh "servicos/concierge-de-viagem/index.html" \
  "Concierge de Viagem | ATF Travel" \
  "Um único ponto de contato para reservas, alterações e emergências, do primeiro contato ao retorno da viagem." \
  "/servicos/concierge-de-viagem/" "scripts/pages/servicos-concierge-de-viagem.body.html"

bash scripts/make_page.sh "servicos/roteiros-personalizados/index.html" \
  "Roteiros Personalizados | ATF Travel" \
  "Viagens desenhadas sob medida a partir do seu perfil, orçamento e do que você mais valoriza numa viagem." \
  "/servicos/roteiros-personalizados/" "scripts/pages/servicos-roteiros-personalizados.body.html"

bash scripts/build_destinos.sh

bash scripts/make_page.sh "blog/index.html" \
  "Blog | ATF Travel" \
  "Blog da ATF Travel sobre viagens de luxo, hotéis 5 estrelas e experiências exclusivas em destinos ao redor do mundo." \
  "/blog/" "scripts/pages/blog-index.body.html"

bash scripts/make_page.sh "blog/viagem-de-luxo/index.html" \
  "O que define uma viagem de luxo | Blog ATF Travel" \
  "Entenda o que realmente diferencia uma viagem de luxo de uma viagem cara: curadoria, exclusividade e suporte de ponta a ponta." \
  "/blog/viagem-de-luxo/" "scripts/pages/blog-viagem-de-luxo.body.html"

bash scripts/make_page.sh "blog/hoteis-5-estrelas/index.html" \
  "Como escolher um hotel 5 estrelas | Blog ATF Travel" \
  "O que olhar além da categoria e das fotos na hora de escolher uma hospedagem 5 estrelas para sua próxima viagem." \
  "/blog/hoteis-5-estrelas/" "scripts/pages/blog-hoteis-5-estrelas.body.html"

bash scripts/make_page.sh "blog/experiencias-exclusivas/index.html" \
  "Experiências exclusivas em viagens de luxo | Blog ATF Travel" \
  "Exemplos de experiências exclusivas que só uma curadoria de viagens consegue proporcionar, de vinícolas a jantares privativos." \
  "/blog/experiencias-exclusivas/" "scripts/pages/blog-experiencias-exclusivas.body.html"

bash scripts/make_page.sh "contato/index.html" \
  "Contato | ATF Travel" \
  "Fale com a ATF Travel e receba uma proposta de viagem sob medida. Atendimento 100% online e personalizado." \
  "/contato/" "scripts/pages/contato.body.html"

bash scripts/make_page.sh "areas/index.html" \
  "Áreas | ATF Travel" \
  "Conheça as quatro áreas do grupo ATF Travel: Luxury & Gastronomy, Snow Trip, Sports e Corporate." \
  "/areas/" "scripts/pages/areas-index.body.html"

bash scripts/make_page.sh "areas/luxury-gastronomy/index.html" \
  "Luxury & Gastronomy | ATF Travel" \
  "Hospitalidade de altíssimo padrão e roteiros gastronômicos assinados pelas melhores casas do mundo, pela ATF Travel." \
  "/areas/luxury-gastronomy/" "scripts/pages/areas-luxury-gastronomy.body.html"

bash scripts/make_page.sh "areas/snow-trip/index.html" \
  "Snow Trip | ATF Travel" \
  "Especialistas em destinos de neve: resorts, aulas de esqui e logística completa de inverno, pela ATF Travel." \
  "/areas/snow-trip/" "scripts/pages/areas-snow-trip.body.html"

bash scripts/make_page.sh "areas/sports/index.html" \
  "Sports | ATF Travel" \
  "Viagens para os maiores eventos esportivos do mundo, com ingressos e hospitalidade de ponta a ponta." \
  "/areas/sports/" "scripts/pages/areas-sports.body.html"

bash scripts/make_page.sh "areas/corporate/index.html" \
  "Corporate | ATF Travel" \
  "Gestão de viagens corporativas, incentivos e eventos, com processos e relatórios sob medida pela ATF Travel." \
  "/areas/corporate/" "scripts/pages/areas-corporate.body.html"

echo "Build completo: todas as páginas regeneradas."
