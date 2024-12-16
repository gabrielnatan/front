#!/bin/bash
echo "Iniciando a configuração"

# Atualiza o sistema e instala pacotes necessários
sudo apt-get upgrade -y
sudo apt-get update -y
sudo apt-get install curl -Y
sudo apt install docker.io -y

# Faz login no Docker usando o token interpolado
sudo echo "${PAT_TOKEN}" | docker login ghcr.io -u user --password-stdin

# Baixa a imagem do contêiner e executa
sudo docker pull ghcr.io/user/front:main
sudo docker run -d -p 80:80 ghcr.io/user/front:main
