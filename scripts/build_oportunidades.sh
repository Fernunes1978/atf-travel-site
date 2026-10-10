#!/usr/bin/env bash
# Gera a página de Oportunidades (campanhas de vendas). Por enquanto só em PT.
set -e
cd "C:\Users\fernu\Desktop\site-institucional"

bash scripts/make_page.sh "oportunidades/index.html" \
  "Oportunidades | ATF Travel" \
  "Campanhas e condições especiais da ATF Travel: temporadas selecionadas pela nossa curadoria, por tempo limitado." \
  "/oportunidades/" "scripts/pages/oportunidades.body.html"
