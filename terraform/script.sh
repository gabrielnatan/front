#!/bin/bash
echo "Iniciando a configuração"

# Atualiza o sistema e instala pacotes necessários
apt-get update
apt-get install -y curl
sudo apt install docker.io -y

# Faz login no Docker usando o token interpolado
echo "${PAT_TOKEN}" | docker login ghcr.io -u user --password-stdin

# Baixa a imagem do contêiner e executa
docker pull ghcr.io/user/front:main
docker run -d -p 80:80 ghcr.io/user/front:main
