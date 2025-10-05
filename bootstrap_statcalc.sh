#!/usr/bin/env bash
set -euo pipefail

echo "==> Bootstrapping statcalc structure..."

# Pastas principais
mkdir -p \
  src/core \
  src/cli \
  src/io/source \
  src/io/parser \
  src/io/format \
  src/io/sink \
  src/output \
  tests/unit \
  tests/integration \
  docs \
  data \
  .github/workflows

# .gitkeep para pastas vazias
for d in src/core src/cli src/io/source src/io/parser src/io/format src/io/sink src/output tests/unit tests/integration docs data .github/workflows; do
  [[ -f "$d/.gitkeep" ]] || echo "" > "$d/.gitkeep"
done

# README
if [[ ! -f README.md ]]; then
  cat > README.md <<'EOF'
# statcalc
Calculadora estatística modular de linha de comando em C++.

## Build rápido
```bash
cmake -S . -B build
cmake --build build -j
ctest --test-dir build --output-on-failure