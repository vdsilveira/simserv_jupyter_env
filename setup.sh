#!/usr/bin/env bash
set -euo pipefail

echo "=== SimServ Jupyter Environment - Setup ==="

command -v python3 >/dev/null 2>&1 || { echo "Erro: python3 nao encontrado. Instale Python 3.10+."; exit 1; }
echo "Python: $(python3 --version)"

if [ ! -d .venv ]; then
    python3 -m venv .venv
    echo "Virtualenv criada em .venv/"
else
    echo "Virtualenv .venv/ ja existe"
fi

source .venv/bin/activate
pip install --upgrade pip -q
pip install -r requirements.txt -q
echo "Dependencias instaladas"

.venv/bin/python -m ipykernel install --user --name simserv-jupyter --display-name "Python (simserv-jupyter)"
echo "Kernel Jupyter 'simserv-jupyter' registrado"

if [ ! -f .env ]; then
    cat > .env << 'EOF'
OLLAMA_API_KEY=coloque_sua_chave_aqui
OLLAMA_BASE_URL=https://api.ollama.com
OLLAMA_MODEL=ministral-3:3b
EOF
    echo ".env criado com placeholders. Edite com sua chave Ollama Cloud."
fi

./proteger.sh

echo ""
echo "=== Setup concluido ==="
echo "Para iniciar: jupyter lab"
echo ""
echo "Use ambiente_laboratorio/ para editar copias dos notebooks."
echo "Para desproteger recursos_e_exercicios/ (antes de git pull): ./desproteger.sh"
