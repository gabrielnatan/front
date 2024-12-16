#!/bin/bash
echo "Iniciando a configuração"
    
apt-get update
apt-get install -y curl

sudo apt install docker.io  -y
sudo apt install podman-docker  -y

echo "${var.pat_token}" | docker login ghcr.io -u gabrielnatan --password-stdin
docker pull ghcr.io/gabrielnatan/front:main
docker run -d ghcr.io/gabrielnatan/front:main