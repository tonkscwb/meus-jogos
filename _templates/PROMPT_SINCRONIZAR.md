# Prompt para sincronizar um chat de jogo com a pasta Jogos

Cole a mensagem abaixo em qualquer chat/IDE onde um dos jogos está sendo desenvolvido
(troque `{{JOGO}}` pelo nome do jogo).

---

Estou centralizando o controle dos meus jogos em um repositório "Jogos" (roadmap + histórico de chats, usado por várias IDEs/IAs). Este chat é do jogo **{{JOGO}}**. Preciso que você ajuste a documentação deste projeto seguindo o padrão abaixo:

1. Na raiz do projeto deste jogo, crie/atualize:
   - `ROADMAP.md` — seções: Visão (1–2 frases) · Agora (em andamento) · Próximo · Depois/Ideias · Marcos (tabela Marco | Objetivo | Status | Data alvo) · Concluído (com datas AAAA-MM-DD). Status: 💡 Ideia · 🧭 Planejando · 🚧 Em andamento · ✅ Concluído · ⏸️ Pausado · ❌ Descartado.
   - `DECISIONS.md` — decisões importantes já tomadas (stack, engine, mecânicas, escopo, monetização), mais recente no topo, cada uma com Contexto / Decisão / Alternativas.
   - `chats/AAAA-MM-DD_<ferramenta>_resumo-ate-agora.md` — resumo de tudo que foi feito neste chat até hoje: objetivo, o que foi feito, decisões, arquivos principais, pendências.
   - `AGENTS.md` (se não existir) — regras: no início de cada sessão ler ROADMAP.md, DECISIONS.md e os últimos chats; no fim, gravar um resumo em `chats/`, atualizar ROADMAP.md e DECISIONS.md.
2. Faça commit e push dessas mudanças, se este projeto tiver repositório.
3. Termine respondendo com um bloco de texto curto que eu possa copiar para o roadmap geral:
   `Jogo | Status | Foco atual | Próximo marco | Plataforma | Stack | Repositório/URL`
