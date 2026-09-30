# ATF Travel — Site Institucional

Contexto de projeto para o Claude Code. Leia isto antes de mexer no site — ele resume decisões,
convenções e armadilhas conhecidas acumuladas ao longo do desenvolvimento, para que qualquer sessão
nova (em qualquer conta Claude) continue de onde a anterior parou, sem perder contexto.

## O que é

Site institucional da **ATF Travel**, agência de viagens de luxo (evoluída da antiga "Annestour"),
liderada por **Anne Ferri Bernardino** (CEO, sócia-fundadora) e **Fernando Nunes** (sócio-fundador).

- **Domínio de produção**: https://www.atft.com.br
- **Repositório**: github.com/Fernunes1978/atf-travel-site
- **Hospedagem**: Vercel, projeto `atf-travel-site` (existe um projeto duplicado órfão
  `atf-travel-site-ocvs` ligado ao mesmo repo — ignorar, não usar)
- **DNS**: Registro.br (CNAME `www` + A record para o apex, "Modo Avançado")
- **Formulário de contato**: Formspree (`https://formspree.io/f/xrpgawrj`) — tem filtro anti-spam
  (Formshield) que pode jogar submissões de teste "sintéticas" na pasta Spam do Formspree em vez do
  Inbox; isso é normal para dados de teste óbvios, não é bug.
- **Contato oficial do negócio**: WhatsApp (19) 99811-7815 · contato@annestour.com.br ·
  Instagram @atf.annestour · atendimento 100% online, região de Campinas/SP.

ATF Travel é o **grupo/marca**, não uma 5ª divisão. As **4 divisões** são: Luxury & Gastronomy,
Snow Trip, Sports, Corporate. Nunca reintroduzir "ATF Travel" como uma divisão paralela às 4.

## Arquitetura

Site híbrido, **não é um framework** — HTML estático puro, sem build step, servido direto pelo Vercel.

1. **`index.html` (raiz) e `en/index.html`** — duas SPAs de página única (roteamento client-side via
   `data-page-section`), cada uma com **CSS embutido em `<style>` própria** (não usam
   `assets/site.css`!). São a página inicial em PT e EN respectivamente. Qualquer mudança visual que
   precise valer na home tem que ser aplicada **nos dois `<style>` inline**, além de (se for o caso)
   em `assets/site.css` para as páginas estáticas. Já foi motivo de bug real (ver Armadilhas).

2. **Páginas estáticas geradas** — todas as outras URLs (`/sobre/`, `/areas/*`, `/servicos/*`,
   `/destinos/*`, `/blog/*`, `/contato/`, e todo o espelho em `/en/*`) são arquivos `index.html`
   individuais, gerados por `scripts/make_page.sh` a partir de fragmentos em `scripts/pages/*.body.html`
   + `scripts/_header(_en).html` + `scripts/_footer(_en).html`. Essas sim usam
   `<link rel="stylesheet" href="/assets/site.css">` compartilhado.

   Para gerar/regenerar uma página:
   ```
   scripts/make_page.sh <output> <title> <description> <canonical> <body_fragment> [lang] [alt_url]
   ```
   `lang` = `pt` (default) ou `en`. `alt_url` = caminho absoluto da página equivalente no outro idioma
   (ativa hreflang + o botão de troca de idioma). Sem `alt_url`, o botão de idioma some da página.

3. **Bilíngue PT/EN com URLs localizadas** — as versões em inglês **não** são um prefixo `/en/` ingênuo
   dos mesmos slugs; os slugs também são traduzidos:
   `/servicos/` → `/en/services/`, `/servicos/viagens-de-luxo/` → `/en/services/luxury-travel/`,
   `/areas/` → `/en/divisions/`, `/destinos/turquia/` → `/en/destinations/turkey/`,
   `/destinos/franca/` → `/en/destinations/france/`, `/blog/viagem-de-luxo/` →
   `/en/blog/what-defines-luxury-travel/`, `/contato/` → `/en/contact/`. Ver mapeamento completo em
   `scripts/build_destinations_en.sh` e `scripts/gen_destinations_en_simple.sh`.

4. **Seletor de idioma** — ícone de bandeira (SVG inline, não emoji — ver Armadilhas) no menu,
   `<li class="lang-switch"><a class="nav-link" aria-label="...">​<svg>...</svg></a></li>`. Nas páginas
   geradas o SVG vem via placeholder `__ALT_LANG_LABEL__` substituído por `make_page.sh`; nas duas SPAs
   está hardcoded no HTML.

5. **Formulário de contato**: campo de divisão de interesse chama-se `vertical` no PT/SPA e `division`
   nas páginas estáticas em inglês (`/en/contact/`) — os CTAs de cada divisão em inglês linkam com
   `?division=Snow%20Trip` etc. Se adicionar um novo formulário, manter esse nome de campo consistente
   com a página em que ele vive.

## Fluxo de trabalho estabelecido

- Todo trabalho maior é feito em **branch própria** → **PR draft** no GitHub → revisão/preview no
  Vercel → só depois **merge para `main`**, o que dispara deploy automático de produção.
- `gh` (GitHub CLI) geralmente **não está autenticado** neste ambiente. Quando precisar checar/criar
  PRs, primeiro tente `gh auth status`; se falhar, use a API pública do GitHub sem autenticação
  (`curl https://api.github.com/repos/Fernunes1978/atf-travel-site/...`) para leitura, e `git` puro
  (que já tem credenciais configuradas) para push/merge direto quando o usuário autorizar.
- Depois de um push, o deploy Vercel normalmente fica pronto em ~15-30s. Confirme via:
  ```
  curl -s "https://api.github.com/repos/Fernunes1978/atf-travel-site/commits/<sha>/status"
  ```
  Procure `"state": "success"` nos contexts `Vercel – atf-travel-site`.
- **Sempre teste com fetch direto (`cache: 'no-store'`) contra o site ao vivo antes de confirmar que
  uma mudança está no ar** — o navegador embutido do Claude Code pode cachear agressivamente páginas
  já visitadas nesta mesma sessão, mesmo com aba nova ou query string diferente. Um `fetch()` de dentro
  do `javascript_tool` bypassa esse cache e reflete o servidor real.

## Preferências de conteúdo estabelecidas (seguir sem perguntar de novo)

- **Fotos de destino**: sempre priorizar paisagens / fotos sem pessoas como destaque principal de cada
  destino. Nunca subir informação de destino sem fotos reais e correspondentes — não usar fotos
  genéricas/stock só para preencher.
- **Mínimo de 6 fotos** por destino que já tem galeria.
- Ao falar de "Sobre" no texto institucional, referenciar **continentes** (América do Norte, América
  do Sul, Europa), não destinos específicos nominais.
- HEIC não decodifica neste ambiente Windows (falha `HRESULT 0xC00D5212` no `System.Drawing`/WPF) —
  sempre pedir para o usuário reexportar fotos como JPG antes de processar.

## Armadilhas técnicas já descobertas (não repetir)

- **Emoji de bandeira não renderiza no Windows** — aparece como texto "GB"/"BR" em vez do desenho da
  bandeira (falta de fonte de emoji de bandeira no Windows). Por isso o seletor de idioma usa SVG
  inline hand-drawn, não emoji Unicode.
- **`index.html` e `en/index.html` têm CSS próprio embutido**, independente de `assets/site.css`.
  Uma regra adicionada só em `assets/site.css` não afeta a home. Replicar em ambos os `<style>` inline
  quando a mudança precisa valer ali também.
- **Especificidade CSS**: `.main-nav a.nav-link` (2 classes + tag) tem mais especificidade que um
  seletor simples tipo `.lang-switch a` (1 classe + tag) — para garantir que um estilo vença, use
  `li.lang-switch a.nav-link { ... }`.
- **`sed` com `&` literal no texto de substituição** (ex: "Luxury & Gastronomy") quebra porque `&` em
  `s///` significa "todo o match". Escapar como `\&`, ou preferir `perl -pe 's/.../.../'` com valores
  vindos de `$ENV{}` quando o conteúdo tiver `#`, `&`, `/` ou outros metacaracteres.
- **Paths relativos de imagem quebram em profundidade** — `src="assets/logo-x.jpg"` funciona em `/`
  mas quebra em `/areas/corporate/` ou `/en/...`. Sempre usar `src="/assets/..."` absoluto.
- **Vercel Preview Protection**: URLs de preview de branch (`*-git-<branch>-atf-travel.vercel.app`)
  pedem login Vercel quando abertas no navegador embutido do Claude Code — normal, não é erro. Para
  visualizar sem login, ou usar `fetch()`/checar HTML cru, ou pedir para o usuário abrir no navegador
  dele já logado.

## Estrutura de arquivos

```
index.html, en/index.html        SPA da home (PT/EN), CSS embutido
assets/site.css                  CSS compartilhado das páginas estáticas geradas
assets/destinos/<slug>/*.jpg     Fotos de cada destino (mesmos arquivos servem PT e EN)
scripts/make_page.sh             Gerador de página estática (head + header + body + footer)
scripts/_header.html /_header_en.html    Partials de cabeçalho PT/EN
scripts/_footer.html /_footer_en.html    Partials de rodapé PT/EN
scripts/pages/*.body.html        Fragmentos de corpo de cada página estática (fonte de verdade)
scripts/build_*.sh               Scripts batch que chamam make_page.sh em lote
sobre/, areas/, servicos/,
destinos/, blog/, contato/       Páginas estáticas PT geradas (não editar o index.html direto —
                                  editar o .body.html em scripts/pages/ e regenerar)
en/about/, en/divisions/,
en/services/, en/destinations/,
en/blog/, en/contact/            Espelho em inglês das páginas acima
.gitignore                       Exclui pastas de fotos brutas (assets/<Nome> 2025/ etc.) após
                                  processadas para assets/destinos/<slug>/
.vercelignore                    Exclui scripts/ do deploy (só serve local/dev)
```

**Importante**: as páginas estáticas geradas (`sobre/index.html`, `destinos/turquia/index.html` etc.)
são **output**, não fonte. Para editar o conteúdo delas, edite o `.body.html` correspondente em
`scripts/pages/` e rode `make_page.sh` de novo (ou edite os dois em paralelo se for um ajuste pequeno
e pontual — mas prefira sempre manter o `.body.html` como fonte de verdade).

## Pendências conhecidas (não assumir que foram abandonadas)

- **Destino Mendoza e Las Leñas**: ainda não tem página PT nem EN — bloqueado historicamente por fotos
  em HEIC não conversíveis neste ambiente. Confirmar com o usuário se já tem JPGs antes de retomar.
- **Alentejo, Portugal**: já teve menos de 6 fotos sem pessoas disponíveis em algum momento — verificar
  contagem atual em `assets/destinos/alentejo-portugal/` antes de assumir que está completo.
