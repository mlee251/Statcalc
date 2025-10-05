# Projeto `statcalc`
> Calculadora estatística modular de linha de comando em C++

---

## 1. Introdução

O projeto **statcalc** tem como objetivo desenvolver uma calculadora estatística **profissional e extensível**, baseada em linha de comando, implementada em **C++17+**, com uma arquitetura modular e testável.

O propósito é duplo:
1. Construir uma ferramenta real e útil para análise estatística básica (média, mediana, moda, variância, etc.);
2. Servir como **projeto-laboratório** para boas práticas de engenharia de software:
   - Design modular
   - Controle de versão (Git e GitHub)
   - Testes automatizados
   - Documentação e relatórios técnicos
   - Processos de contribuição (issues, PRs, CI/CD)

---

## 2. Escopo e objetivos

### Funcionalidades principais (versão inicial)
- Leitura de dados numéricos a partir de **arquivo de texto** ou **entrada padrão**.
- Cálculo de:
  - Contagem, soma, média, variância, desvio padrão (pop e amostral)
  - Mínimo e máximo
  - Mediana, quantis e moda
- Impressão dos resultados:
  - No console (texto)
  - Em arquivo (texto ou JSON)
- Configuração via linha de comando:
  - `--input`, `--col`, `--delimiter`, `--format`, `--stats`, `--output`, `--na-policy`, etc.

---

## 3. Estrutura modular

O sistema será dividido em **quatro módulos principais**, cada um com responsabilidades bem definidas:

### 3.1. `cli/` — Parsing de opções
- Responsável por interpretar os argumentos da linha de comando e gerar uma estrutura `Config`.
- **Entrada:** `argc, argv`
- **Saída:** `Config`
- **Não realiza:** leitura de arquivos, cálculos ou formatação de saída.

**Motivação:**  
Separar o parsing garante clareza, testabilidade e permite reuso do núcleo por outros front-ends (GUI, API, etc.).

---

### 3.2. `io/` — Entrada e Saída de dados

Subdividido em quatro subcomponentes:
- `source/` → fontes de dados (`StdinSource`, `FileSource`);
- `parser/` → interpretadores (`CSVParser`, `PlainListParser`);
- `sink/` → destinos de saída (`ConsoleSink`, `FileSink`);
- `format/` → formatação (`TextFormatter`, `JsonFormatter`).

**Responsabilidade:**  
Fazer a ponte entre o mundo externo (arquivos, teclado, tela) e o **núcleo de cálculo**.

**Design:**  
Cada submódulo expõe uma interface simples:
```cpp
double next();             // leitura sequencial
void write(string output); // escrita formatada