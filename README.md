# SimServ Jupyter Environment

Ambiente local dos notebooks de familiarização com JupyterLab do SimServ,
adaptados para usar **Ollama Cloud** em vez do servidor local de IA.

## Pré-requisitos

> O `setup.sh` tenta instalar automaticamente Python 3.10+ e Git via `apt`.
> Caso não tenha sudo configurado, instale-os manualmente antes de rodar o script.

## Passo a passo

### 1. Clonar o repositório

```bash
git clone <url-do-repositorio> simserv_jupyter_env
cd simserv_jupyter_env
```

### 2. Rodar o setup

```bash
./setup.sh
```

O script cria um virtualenv, instala as dependências, registra o kernel Jupyter
`simserv-jupyter` e **protege** a pasta `recursos_e_exercicios/` contra edições
acidentais.

### 3. Obter chave da Ollama Cloud

1. Acesse https://cloud.ollama.com
2. Crie uma conta ou faça login
3. Vá em **Settings > API Keys** e gere uma nova chave
4. Copie a chave (formato: `sk-...`)

### 4. Configurar o .env

```bash
# Edite o arquivo .env com sua chave:
OLLAMA_API_KEY=sk-sua_chave_aqui
OLLAMA_BASE_URL=https://api.ollama.com
OLLAMA_MODEL=ministral-3:3b
```

> O modelo `ministral-3:3b` é gratuito. Para modelos maiores (pagos), consulte
> https://cloud.ollama.com/plans

### 5. Copiar um notebook para editar

A pasta `recursos_e_exercicios/` é **somente-leitura** para preservar os originais.
Copie o notebook desejado para `ambiente_laboratorio/` antes de editar:

```bash
# Exemplo: copiar o notebook de avaliacao de exequibilidade
cp recursos_e_exercicios/01_sobre_o_jupyterlab/01_18_*.ipynb \
   ambiente_laboratorio/01_sobre_o_jupyterlab/
```

### 6. Iniciar o Jupyter Lab

```bash
jupyter lab
```

Na interface, navegue até `ambiente_laboratorio/01_sobre_o_jupyterlab/` e abra o
notebook copiado. Selecione o kernel **Python (simserv-jupyter)**.

## Notebooks

| Notebook | Descrição |
|---|---|
| `01_13_*.ipynb` | Testa conexão com a Ollama Cloud |
| `01_14_*.ipynb` | Exemplo de código com apoio de LLM |
| `01_17_*.ipynb` | Gera diagnóstico do ambiente |
| `01_18_*.ipynb` | Avalia exequibilidade de projeto ABM |

## Proteção dos originais

A pasta `recursos_e_exercicios/` é protegida automaticamente pelo `setup.sh` e
reprotegida após todo `git pull` (via hook git). Para desproteger manualmente:

```bash
./desproteger.sh      # permite editar recursos_e_exercicios/
# ... edicao ou git pull ...
./proteger.sh         # protege novamente
```

## Estrutura do repositório

```
simserv_jupyter_env/
├── setup.sh                  # Script de configuracao
├── proteger.sh               # Torna recursos_e_exercicios/ somente-leitura
├── desproteger.sh            # Reverte a protecao
├── .env.example              # Template do arquivo .env
├── requirements.txt          # Dependencias Python
├── recursos_e_exercicios/    # Originais (somente-leitura)
│   └── 01_sobre_o_jupyterlab/
├── ambiente_laboratorio/     # Copia editavel para o usuario
│   └── 01_sobre_o_jupyterlab/
└── work/                     # Saida dos notebooks
```
