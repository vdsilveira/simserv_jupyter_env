# Ambiente Jupyter Lab do SimServ (copiado localmente)

Este diretório reúne uma cópia local do notebook usado para avaliar a exequibilidade mínima de um projeto ABM/MBA com apoio de LLM.

## Conteúdo
- notebook: `01_18_avaliar_exequibilidade_minima_projeto_abm_com_llm.ipynb`
- dependências: `requirements.txt`

## Como usar

```bash
cd /l/disk0/viniciusd/Projetos/simserv_jupyter_env
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python -m ipykernel install --user --name simserv-jupyter --display-name "Python (simserv-jupyter)"
jupyter lab
```

## Observações
- O notebook tenta consultar o Ollama em `http://ollama:11434`.
- Se o servidor não estiver disponível, ele salva o prompt e gera um relatório parcial.
