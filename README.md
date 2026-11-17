# Jogos

Painel central dos meus jogos (Vinicius), no mesmo formato do painel da Room do Desafio, para funcionar com qualquer IDE/IA (Claude Code, Cursor, Copilot, Codex, Gemini, Windsurf...).

## Estrutura
```
Jogos/
├── AGENTS.md            ← regras para qualquer IA (fonte única)
├── CLAUDE.md, GEMINI.md, .cursor/, .github/  ← apontam para AGENTS.md
├── ROADMAP.md           ← visão geral de todos os jogos
├── _templates/          ← modelos de roadmap, decisões, log de chat, README
└── <jogo>/              ← clone do repositório do jogo (ignorado pelo painel)
    ├── AGENTS.md        ← regras específicas do jogo
    ├── README.md        ← o que é, como rodar
    ├── ROADMAP.md       ← agora / próximo / depois / marcos
    ├── DECISIONS.md     ← decisões importantes
    ├── chats/           ← um resumo por sessão de chat + índice
    └── (código do jogo)
```

O **RPG SEM NOME** é a exceção: nasceu antes deste painel e segue o próprio `CLAUDE.md`, com as decisões numeradas (D-xxx) em `docs/DECISOES.md`.

## Primeira vez numa máquina nova
```bash
mkdir -p MeusJogos && cd MeusJogos
gh repo clone tonkscwb/jogos Jogos && cd Jogos
gh repo clone tonkscwb/RPG-SEM-NOME rpg-sem-nome
gh repo clone Room-do-desafio/Cola-na-prova cola-na-prova
gh repo clone Room-do-desafio/Pilha-do-rodizio pilha-do-rodizio
gh repo clone Room-do-desafio/Degrade degrade
```

## Novo jogo
```bash
./novo-jogo.sh "Nome do Jogo"
```

## Fluxo de trabalho
1. Abra a pasta do jogo na IDE.
2. A IA lê `AGENTS.md`, o `ROADMAP.md` e os últimos chats do jogo antes de começar.
3. No fim da sessão, a IA grava o resumo em `chats/`, atualiza o roadmap e as decisões, e atualiza a linha do jogo no `ROADMAP.md` deste painel.
