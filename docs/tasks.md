# Checklist do Projeto `statcalc`

## 🌱 Etapa 1 — Bootstrap
- [x] Criar repositório `statcalc` no GitHub
- [x] Estrutura de pastas (script)
- [x] `README.md` inicial
- [x] `docs/design.md` (rascunho)
- [x] `CMakeLists.txt` mínimo
- [x] `src/main.cpp` placeholder
- [x] Teste placeholder (`tests/unit/test_placeholder.cpp`)
- [x] Primeiro commit: `docs: add design and bootstrap`
- [x] Push para `main`

## 🧠 Etapa 2 — Core estatístico
- [ ] Definir API de `OnlineStats` (Welford: mean/var/min/max/count)
- [ ] Implementar `src/core/stats.hpp/.cpp`
- [ ] Testes unitários para casos básicos e borda (n=0,1; valores grandes)
- [ ] Adicionar a lib ao CMake (ligar arquivos reais)
- [ ] Commit: `feat(core): add OnlineStats with Welford`

## 🧭 Etapa 3 — CLI (parsing de opções)
- [ ] Definir struct `Config` (input, delimiter, col, stats, format, na-policy, output)
- [ ] Implementar parsing (manual ou lib)
- [ ] Testes de parsing (mapeamento argv → Config)
- [ ] Commit: `feat(cli): parse command-line options into Config`

## 📥 Etapa 4 — IO (source/parser)
- [ ] `FileSource` / `StdinSource` → `std::istream&`
- [ ] `CSVParser` / `PlainListParser`
- [ ] Política de NA (drop/fail/keep)
- [ ] Testes de parser (delimitadores, header, coluna inválida)
- [ ] Commit: `feat(io): add sources and parsers`

## 📤 Etapa 5 — Saída (format/sink)
- [ ] `TextFormatter` e `JsonFormatter`
- [ ] `ConsoleSink` e `FileSink`
- [ ] Testes de formatação (snapshot)
- [ ] Commit: `feat(output): formatters and sinks`

## 🔗 Etapa 6 — Integração (main)
- [ ] Orquestrar: CLI → Source/Parser → Core → Result → Formatter → Sink
- [ ] Teste de integração com `data/sample.csv`
- [ ] Commit: `feat(app): wire end-to-end pipeline`

## 🧪 Etapa 7 — Testes e Qualidade
- [ ] Adotar framework (Catch2/GoogleTest)
- [ ] Cobrir median/quantile (OrderStats)
- [ ] Casos com quantile p múltiplos
- [ ] Commit: `test: add coverage for order statistics`

## ⚙️ Etapa 8 — CI/CD
- [ ] Workflow GitHub Actions (build + tests)
- [ ] Badge no README
- [ ] Commit: `ci: add workflow`

## 🧰 Git “Laboratório”
- [ ] Criar branch `feature/median-json` + PR
- [ ] Fazer rebase interativo (squash/fixup)
- [ ] Simular conflito e resolver
- [ ] Cherry-pick de commit de fix
- [ ] Bisect para encontrar bug
- [ ] Commit(s): conforme prática

## 📚 Extras (futuro)
- [ ] `--stats` granular (seleção)
- [ ] `--format csv` de saída
- [ ] Streaming quantiles (t-digest/heaps)
- [ ] Benchmarks
- [ ] Localização (ponto/vírgula)