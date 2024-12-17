#!/bin/bash
echo "Iniciando a configuração"

# Atualiza o sistema e instala pacotes necessários
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install curl -y
sudo apt install docker.io -y

sudo mkdir maneiro

# Adiciona o usuário ao grupo docker (opcional, mas recomendado)
sudo usermod -aG docker $USER

# Reinicia o serviço Docker
sudo systemctl restart docker

# Faz login no Docker usando o token interpolado
echo "${PAT_TOKEN}" | sudo docker login ghcr.io -u gabrielnatan --password-stdin

# Baixa a imagem do contêiner e executa
sudo docker pull ghcr.io/gabrielnatan/front:main
sudo docker run -d -p 80:80 ghcr.io/gabrielnatan/front:main

sudo mkdir maneiro2
sudo touch maneiro2/aqui.txt
