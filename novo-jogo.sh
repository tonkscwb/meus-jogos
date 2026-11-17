#!/bin/sh
# Uso: ./novo-jogo.sh "Nome do Jogo"
# Cria a pasta em kebab-case (ex.: "Nome do Jogo" -> nome-do-jogo); o nome original vai nos documentos.
set -e
[ -z "$1" ] && { echo 'Uso: ./novo-jogo.sh "Nome do Jogo"'; exit 1; }
cd "$(dirname "$0")"
nome="$1"
g=$(printf '%s' "$nome" | perl -CSA -MUnicode::Normalize -pe '$_=NFD($_); s/\p{M}//g; $_=lc; s/[^a-z0-9]+/-/g; s/^-|-$//g')
[ -z "$g" ] && { echo "Nome inválido: $nome"; exit 1; }
[ -e "$g/ROADMAP.md" ] && { echo "Já existe: $g"; exit 1; }
mkdir -p "$g/chats"
for f in ROADMAP DECISIONS; do sed "s/{{NOME_DO_JOGO}}/$nome/g" "_templates/$f.md" > "$g/$f.md"; done
sed "s/{{NOME_DO_JOGO}}/$nome/g" _templates/GAME_README.md > "$g/README.md"
cat > "$g/chats/README.md" <<EOT
# Histórico de chats — $nome

Um arquivo por sessão: \`AAAA-MM-DD_ferramenta_tema.md\` (modelo em [../../_templates/CHAT_LOG.md](../../_templates/CHAT_LOG.md)).
A mais recente fica no topo.

| Data | Ferramenta | Tema | Arquivo |
|---|---|---|---|
EOT
row="| [$nome]($g/ROADMAP.md) | 💡 | a definir | a definir | — | M0 — Protótipo | — |"
# insere a linha no fim da tabela do ROADMAP geral
awk -v row="$row" '
  /^\| \[/ {last=NR} {lines[NR]=$0}
  END {for(i=1;i<=NR;i++){print lines[i]; if(i==last) print row}}' ROADMAP.md > ROADMAP.md.new
mv ROADMAP.md.new ROADMAP.md
# o jogo terá repositório próprio: ignora a pasta no painel e inicia o Git dela
grep -qx "/$g/" .gitignore 2>/dev/null || echo "/$g/" >> .gitignore
git -C "$g" init -q -b main
echo "Criado: $g/ ($nome)"
echo "Próximo passo: crie o repositório no GitHub (tonkscwb ou Room-do-desafio) e ligue como origin: git -C $g remote add origin <url>"
