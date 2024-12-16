#!/bin/bash
echo "Iniciando a configuração"
    
apt-get update
apt-get install -y curl

sudo apt install docker.io  -y

echo "${var.github_secret}" | docker login ghcr.io -u gabrielnatan --password-stdin
docker pull ghcr.io/gabrielnatan/front:main
docker run -d -p 80:80 ghcr.io/gabrielnatan/front:main