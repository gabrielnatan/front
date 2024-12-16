#!/bin/bash
echo "Iniciando a configuração"
    
apt-get update
apt-get install -y curl

curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh --dry-run

echo "${var.pat_token}" | docker login ghcr.io -u gabrielnatan --password-stdin
docker pull ghcr.io/gabrielnatan/front:main
docker run -d ghcr.io/gabrielnatan/front:main