# Instruções para agentes de IA — pasta Jogos

Este arquivo é a **fonte única** de regras para qualquer IA/IDE (Claude Code, Cursor, Copilot, Codex, Gemini, Windsurf).
`CLAUDE.md`, `GEMINI.md`, `.cursor/rules/` e `.github/copilot-instructions.md` só apontam para cá — edite apenas este arquivo.

Idioma: português do Brasil nos documentos e conversas.

## Estrutura
- Esta pasta é o **painel central**: `ROADMAP.md` (status geral), regras para IAs, `_templates/` e `novo-jogo.sh`.
- Cada jogo fica numa pasta em kebab-case (ex.: `cola-na-prova/`) que é um **clone do próprio repositório** no GitHub (`tonkscwb` ou `Room-do-desafio`). Essas pastas estão no `.gitignore` do painel: commits e pushes do jogo vão para o repositório dele.
- Cada jogo tem `README.md`, `ROADMAP.md`, `DECISIONS.md`, `AGENTS.md` e `chats/`. O `AGENTS.md` do jogo tem as regras específicas dele e vale junto com este.
- **Exceção:** o `rpg-sem-nome/` segue o próprio `CLAUDE.md` (decisões D-xxx em `docs/DECISOES.md`, sem `ROADMAP.md`). Neste painel só se atualiza a linha dele.
- Para criar um jogo novo: `./novo-jogo.sh "Nome"` (depois crie o repositório no GitHub e ligue como `origin`).
- Jogos da Room do Desafio (como o Cola na Prova) também entram no painel `Room-do-desafio/jogos`, do Gustavo. Mantenha as duas linhas iguais.

## Ao começar uma sessão
1. Descubra em qual jogo se está trabalhando (pela pasta aberta ou pergunte).
2. Leia o `ROADMAP.md` do jogo, o `DECISIONS.md` e os 2–3 chats mais recentes em `chats/` (veja o índice em `chats/README.md`).
3. Respeite as decisões registradas; se for contrariar alguma, avise antes.

## Ao terminar uma sessão (ou quando o usuário pedir "salva o chat")
1. Crie `<jogo>/chats/AAAA-MM-DD_ferramenta_tema-curto.md` usando `_templates/CHAT_LOG.md`.
   - `ferramenta`: claude, cursor, copilot, codex, gemini, windsurf...
   - Se já existir um arquivo com o mesmo nome, acrescente `-2`, `-3`.
   - É um **resumo**, não a transcrição inteira.
2. Se existir `<jogo>/chats/README.md`, adicione uma linha no topo da tabela.
3. Atualize `<jogo>/ROADMAP.md`: marque itens concluídos, mova itens entre Agora/Próximo/Depois, ajuste a data "Atualizado em".
4. Decisões relevantes → `<jogo>/DECISIONS.md` (mais recente no topo).
5. Faça commit no repositório do jogo (seguindo as regras de branch/PR do `AGENTS.md` dele).
6. Atualize a linha do jogo no `ROADMAP.md` da raiz (status, foco atual, próximo marco) e faça commit no painel.

## Convenções
- Datas no formato AAAA-MM-DD.
- Status: 💡 Ideia · 🧭 Planejando · 🚧 Em andamento · ✅ Concluído · ⏸️ Pausado · ❌ Descartado.
- Commits com o e-mail pessoal (`git config user.email "vinny.tonks@gmail.com"`), configurado só no repositório.
- O código de cada jogo fica dentro da pasta do jogo; regras específicas de um jogo podem ir num `AGENTS.md` dentro da pasta dele.
