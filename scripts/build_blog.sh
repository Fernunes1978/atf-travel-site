#!/usr/bin/env bash
# Gera as páginas do blog (PT + EN) com hreflang e botão de idioma.
set -e
cd "C:\Users\fernu\Desktop\site-institucional"

bash scripts/make_page.sh "blog/index.html" \
  "Blog | ATF Travel" \
  "Blog da ATF Travel sobre viagens de luxo, hotéis 5 estrelas e experiências exclusivas em destinos ao redor do mundo." \
  "/blog/" "scripts/pages/blog-index.body.html" pt "/en/blog/"

bash scripts/make_page.sh "en/blog/index.html" \
  "Blog | ATF Travel" \
  "ATF Travel's blog on luxury travel, 5-star hotels and exclusive experiences in destinations around the world." \
  "/en/blog/" "scripts/pages/en-blog-index.body.html" en "/blog/"

bash scripts/make_page.sh "blog/maldivas-resorts/index.html" \
  "Maldivas: 5 resorts all-inclusive que recomendamos | Blog ATF Travel" \
  "Heritance Aarah, OBLU XPERIENCE Ailafushi, OBLU SELECT Sangeli, VARU e OZEN LIFE MAADHOO: para quem é cada resort nas Maldivas, melhor época e como chegar a partir do Brasil." \
  "/blog/maldivas-resorts/" "scripts/pages/blog-maldivas-resorts.body.html" pt "/en/blog/maldives-resorts/"

bash scripts/make_page.sh "en/blog/maldives-resorts/index.html" \
  "Maldives: 5 all-inclusive resorts we recommend | ATF Travel Blog" \
  "Heritance Aarah, OBLU XPERIENCE Ailafushi, OBLU SELECT Sangeli, VARU and OZEN LIFE MAADHOO: who each Maldives resort is for, best time to go and how to get there." \
  "/en/blog/maldives-resorts/" "scripts/pages/en-blog-maldives-resorts.body.html" en "/blog/maldivas-resorts/"
