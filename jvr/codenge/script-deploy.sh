#!/bin/bash

# Caminho para a chave privada
KEY_PATH="oracle-jvr-private.key"

# SSH para o servidor remoto
ssh -i "$KEY_PATH" ubuntu@129.148.57.192 << 'EOF'
    # Comandos a serem executados remotamente via SSH

    # Acessar a pasta jvr/codenge
    cd jvr/codenge

    # Executar git pull
    git pull

    # Obter o primeiro CONTAINER ID do resultado do docker ps
    CONTAINER_ID=$(sudo docker ps -q | head -n1)

    if [ -n "$CONTAINER_ID" ]; then
        # Se houver um CONTAINER ID, pausar e remover o container
        sudo docker stop "$CONTAINER_ID"
        sudo docker remove "$CONTAINER_ID"
    fi

    # Executar build da imagem Docker
    sudo docker build . -t jvr

    # Executar container Docker expondo a porta 80
    sudo docker run -d -p 80:80 jvr
EOF
