#!/usr/bin/env bash
set -e
ROOT="C:\Users\fernu\Desktop\site-institucional"
cd "$ROOT"

dest_body() {
  local slug="$1" nome="$2" hub_path="$3" hub_label="$4" tagline="$5" p1="$6" p2="$7" d1="$8" d2="$9" d3="${10}"
  local out="scripts/pages/destino-${slug}.body.html"
  cat > "$out" << EOF
<nav class="breadcrumbs container" aria-label="Breadcrumb">
  <a href="/">Início</a><span class="sep">/</span><a href="/destinos/">Destinos</a><span class="sep">/</span><a href="${hub_path}">${hub_label}</a><span class="sep">/</span><span class="atual">${nome}</span>
</nav>

<section class="page-header">
  <div class="container">
    <span class="eyebrow">Destino · ${hub_label}</span>
    <h1>${nome}</h1>
    <p class="lead">${tagline}</p>
  </div>
</section>

<section class="section">
  <div class="container duas-colunas">
    <div>
      <h2>Por que visitar ${nome}</h2>
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
    <span class="eyebrow">Veja também</span>
    <h2>Outros destinos em ${hub_label}</h2>
    <div class="relacionados-grid">
      <div class="relacionado-item"><span class="tag">Guia</span><a href="${hub_path}">Ver todos em ${hub_label}</a></div>
      <div class="relacionado-item"><span class="tag">Serviço</span><a href="/servicos/roteiros-personalizados/">Roteiros personalizados</a></div>
      <div class="relacionado-item"><span class="tag">Serviço</span><a href="/servicos/viagens-de-luxo/">Viagens de luxo</a></div>
      <div class="relacionado-item"><span class="tag">Todos</span><a href="/destinos/">Todos os destinos</a></div>
    </div>
  </div>
</section>

<section class="cta-final">
  <div class="container">
    <h2>Vamos planejar sua viagem para ${nome}?</h2>
    <div class="hero-actions" style="justify-content:center;">
      <a href="/contato/" class="btn btn-light">Solicitar Orçamento</a>
      <a href="https://wa.me/5519998117815" target="_blank" rel="noopener" class="btn btn-whatsapp">Falar no WhatsApp</a>
    </div>
  </div>
</section>
EOF
  echo "body: $out"
}

# slug | nome | hub_path | hub_label | tagline | p1 | p2 | d1 | d2 | d3

dest_body "maldivas" "Maldivas" "/destinos/" "Índico" \
  "Bangalôs sobre a água, recifes de coral e o azul mais icônico do Oceano Índico." \
  "Maldivas é sinônimo de hospedagem overwater: bangalôs privativos construídos sobre a água, com acesso direto ao mar e vista para o horizonte em 360°. É um dos destinos mais pedidos da nossa vertical Luxury & Gastronomy, com resorts que combinam privacidade extrema, gastronomia assinada e mergulho entre recifes de coral preservados." \
  "A ATF Travel seleciona resorts e bangalôs em Maldivas de acordo com o perfil de cada casal ou família, cuidando de transfers de hidroavião, jantares privativos e experiências como mergulho e observação de vida marinha." \
  "Bangalôs sobre a água com acesso direto ao mar" \
  "Mergulho e snorkeling em recifes preservados" \
  "Resorts all-inclusive de altíssimo padrão"

dest_body "alentejo-portugal" "Alentejo, Portugal" "/destinos/europa/" "Europa" \
  "Vinícolas premiadas, gastronomia autêntica e paisagens do interior português." \
  "O Alentejo é uma das regiões vinícolas mais respeitadas de Portugal, com propriedades históricas, vinhas a perder de vista e uma gastronomia enraizada na tradição local. É um roteiro ideal para quem busca enoturismo sem abrir mão do conforto." \
  "Com a formação em Gastronomia e Sommelier da Anne Ferri, a ATF Travel monta roteiros de enoturismo no Alentejo com visitas a vinícolas selecionadas, harmonizações e hospedagens boutique em meio às vinhas." \
  "Visitas a vinícolas históricas com degustação guiada" \
  "Hospedagens boutique em meio às vinhas" \
  "Gastronomia alentejana autêntica e harmonizações"

dest_body "los-cabos" "Los Cabos" "/destinos/caribe/" "Caribe" \
  "Onde o deserto encontra o mar, na ponta da península da Baja California." \
  "Los Cabos combina paisagens desérticas dramáticas com praias de águas turquesa, resorts de altíssimo padrão e uma cena gastronômica cada vez mais reconhecida internacionalmente. É um destino versátil, tanto para viagens a dois quanto em família." \
  "Selecionamos resorts em Los Cabos com base no que cada cliente mais valoriza — praia, golfe, spa ou gastronomia — e cuidamos de toda a logística, do transfer à curadoria de passeios." \
  "Resorts de luxo com vista para o Mar de Cortez" \
  "Gastronomia reconhecida internacionalmente" \
  "Passeios de barco e observação de baleias (sazonal)"

dest_body "tulum" "Tulum" "/destinos/caribe/" "Caribe" \
  "Praias caribenhas, ruínas maias à beira-mar e um estilo de vida boho-chic." \
  "Tulum une história e natureza: suas ruínas maias erguidas sobre falésias com vista para o Caribe são um dos cartões-postais do México, e a cidade se tornou referência em hospedagens boutique com estética natural e gastronomia autoral." \
  "A ATF Travel seleciona hospedagens boutique em Tulum alinhadas a esse estilo mais intimista, além de excursões a cenotes, ruínas maias e à Riviera Maya." \
  "Ruínas maias à beira-mar" \
  "Hospedagens boutique com estética natural" \
  "Excursões a cenotes e à Riviera Maya"

dest_body "turquia" "Turquia" "/destinos/europa/" "Europa" \
  "Entre a Europa e a Ásia, história milenar, paisagens únicas e gastronomia marcante." \
  "A Turquia reúne, num só roteiro, a arquitetura histórica de Istambul, as paisagens surreais da Capadócia e uma gastronomia com influências de várias culturas. É um destino rico para quem busca cultura, história e experiências gastronômicas fora do óbvio." \
  "Montamos roteiros pela Turquia combinando os principais pontos históricos com experiências gastronômicas selecionadas, hospedagens de charme e, na Capadócia, passeios de balão ao amanhecer." \
  "Istambul, Capadócia e a costa do Egeu num só roteiro" \
  "Gastronomia com influências únicas" \
  "Passeios de balão na Capadócia"

dest_body "aspen-snowmass" "Aspen e Snowmass" "/destinos/" "Neve" \
  "Glamour, gastronomia de altíssimo nível e pistas de classe mundial no Colorado." \
  "Aspen e Snowmass formam um dos destinos de esqui mais icônicos dos Estados Unidos, com quatro montanhas interligadas, uma cena gastronômica premiada e hospedagens que vão do rústico-chique ao ultra luxo." \
  "Como especialista em destinos de neve, a ATF Travel cuida de toda a logística de inverno em Aspen — hospedagem, aluguel de equipamentos, aulas de esqui e reservas em restaurantes concorridos." \
  "Quatro montanhas interligadas para todos os níveis" \
  "Gastronomia premiada e vida noturna sofisticada" \
  "Logística completa de inverno, do início ao fim"

dest_body "vail" "Vail" "/destinos/" "Neve" \
  "Um dos resorts de esqui mais renomados dos Estados Unidos, no coração do Colorado." \
  "Vail é sinônimo de pistas amplas e bem cuidadas, uma vila alpina charmosa aos pés da montanha e uma infraestrutura de altíssimo nível para esquiadores de todos os níveis, do iniciante ao avançado." \
  "A ATF Travel organiza a logística completa de inverno em Vail — hospedagem próxima às pistas, aulas de esqui particulares e passeios pela vila, adaptando o roteiro ao nível de cada esquiador do grupo." \
  "Uma das maiores áreas esquiáveis dos EUA" \
  "Vila alpina charmosa aos pés da montanha" \
  "Estrutura para todos os níveis, do iniciante ao avançado"

dest_body "termas-de-chillan" "Termas de Chillán" "/destinos/" "Neve" \
  "Neve e águas termais nos Andes chilenos, uma combinação rara na América do Sul." \
  "Termas de Chillán é um dos poucos destinos do mundo que combina esqui e águas termais naturais na mesma montanha — depois de um dia nas pistas dos Andes chilenos, é possível relaxar em piscinas termais ao ar livre." \
  "A ATF Travel monta roteiros de neve na América do Sul com curadoria de hospedagem, aulas de esqui e acesso às termas, uma opção mais acessível para quem quer viver a experiência da neve sem cruzar o hemisfério." \
  "Esqui e águas termais na mesma montanha" \
  "Opção de neve mais próxima do Brasil" \
  "Paisagem única dos Andes chilenos"

dest_body "xcaret" "Xcaret" "/destinos/caribe/" "Caribe" \
  "Parque natural e resorts de referência na Riviera Maya mexicana." \
  "A região de Xcaret combina parques naturais e temáticos premiados com resorts all-inclusive de altíssimo padrão na Riviera Maya, sendo uma ótima opção para famílias e grupos que buscam praia, natureza e conforto num só roteiro." \
  "Selecionamos hospedagens na região de Xcaret e organizamos ingressos e transfers para os parques, além de passeios complementares pela Riviera Maya." \
  "Parques naturais e temáticos premiados" \
  "Resorts all-inclusive ideais para famílias" \
  "Fácil combinação com Tulum e Cancún"

dest_body "andorra" "Andorra" "/destinos/europa/" "Europa" \
  "Pistas extensas, compras livres de imposto e vilarejos charmosos entre França e Espanha." \
  "Andorra oferece uma das maiores áreas esquiáveis dos Pirineus, com pistas bem conectadas, uma cena de après-ski animada e a vantagem de compras livres de impostos — tudo isso a poucas horas de Barcelona ou Toulouse." \
  "A ATF Travel organiza roteiros de neve em Andorra combinando hospedagem, aulas de esqui e, se desejado, dias complementares na Espanha ou na França, já que o país fica estrategicamente entre os dois." \
  "Uma das maiores áreas esquiáveis dos Pirineus" \
  "Compras livres de impostos" \
  "Fácil combinação com Espanha e França"

dest_body "baqueira-beret" "Baqueira Beret" "/destinos/europa/" "Europa" \
  "O principal resort de esqui dos Pirineus espanhóis, com pistas para todos os níveis." \
  "Baqueira Beret é o resort de esqui mais tradicional da Espanha, com boa neve, pistas para todos os níveis e uma vila com infraestrutura completa de hospedagem e gastronomia aos pés da montanha." \
  "Organizamos a estadia completa em Baqueira Beret, com hospedagem próxima às pistas e a opção de combinar o roteiro com cidades como Barcelona antes ou depois da temporada de neve." \
  "Resort de esqui mais tradicional da Espanha" \
  "Pistas para todos os níveis" \
  "Fácil combinação com Barcelona"

dest_body "courchevel" "Courchevel" "/destinos/europa/" "Europa" \
  "Luxo e alta gastronomia nos Alpes franceses, num dos resorts mais exclusivos do mundo." \
  "Courchevel é referência mundial em esqui de luxo: parte do maior domínio esquiável interligado do planeta (Les Trois Vallées), com hospedagens cinco estrelas, restaurantes estrelados Michelin e um padrão de exclusividade que atrai viajantes do mundo todo." \
  "Para clientes que buscam o topo do luxo na neve, a ATF Travel cuida de toda a curadoria em Courchevel — hospedagem, reservas gastronômicas concorridas e logística de inverno de ponta a ponta." \
  "Parte de Les Trois Vallées, o maior domínio esquiável do mundo" \
  "Restaurantes estrelados Michelin" \
  "Hospedagens cinco estrelas de altíssimo padrão"

dest_body "jamaica-sandals" "Jamaica (hotéis Sandals)" "/destinos/caribe/" "Caribe" \
  "Resorts all-inclusive de luxo, exclusivos para casais, nas praias da Jamaica." \
  "A rede Sandals é referência em resorts all-inclusive de luxo voltados exclusivamente para casais, e a Jamaica reúne algumas de suas propriedades mais completas — praias de areia branca, gastronomia incluída em restaurantes de especialidade e estrutura pensada para lua de mel e aniversários." \
  "A ATF Travel tem experiência na curadoria de resorts Sandals, ajudando a escolher a propriedade e a categoria de suíte ideais para cada casal, com toda a logística de voos e transfers." \
  "Resorts all-inclusive exclusivos para casais" \
  "Restaurantes de especialidade incluídos na diária" \
  "Ideal para lua de mel e datas comemorativas"

dest_body "curacao" "Curaçao" "/destinos/caribe/" "Caribe" \
  "Águas cristalinas, arquitetura colorida e cultura caribenha fora da rota de furacões." \
  "Curaçao se destaca por ficar fora da rota tradicional de furacões do Caribe, com águas cristalinas ideais para mergulho, uma capital de arquitetura colonial colorida e uma mistura cultural única entre influências holandesas e caribenhas." \
  "Organizamos roteiros em Curaçao com hospedagens à beira-mar e passeios de mergulho e snorkeling, uma boa opção de Caribe em qualquer época do ano." \
  "Fora da rota de furacões do Caribe" \
  "Águas cristalinas ideais para mergulho" \
  "Arquitetura colonial colorida em Willemstad"

dest_body "franca" "França" "/destinos/europa/" "Europa" \
  "Da alta gastronomia parisiense às vinícolas do interior, um clássico que nunca sai de moda." \
  "A França reúne, num só país, alguns dos maiores nomes da alta gastronomia mundial, museus icônicos em Paris e regiões vinícolas de referência global, além dos Alpes franceses para quem busca neve de altíssimo padrão." \
  "Com a curadoria em Gastronomia e Sommelier da Anne Ferri, a ATF Travel monta roteiros pela França com foco em enoturismo e experiências gastronômicas, combinando Paris com regiões vinícolas ou com destinos de neve como Courchevel." \
  "Alta gastronomia com estrelas Michelin" \
  "Regiões vinícolas de referência mundial" \
  "Fácil combinação com destinos de neve nos Alpes"

echo "Todas as páginas de destino geradas."
