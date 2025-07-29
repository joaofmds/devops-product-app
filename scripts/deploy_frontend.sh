#!/bin/bash
set -euo pipefail

DOCKER_USER="${DOCKER_USER:-joaofmds}"
IMAGE_NAME="vue-frontend"
DEPLOYMENT="frontend"
NAMESPACE="devops"
DOCKERFILE="frontend/Dockerfile"
CONTEXT="frontend"
VITE_API_URL="http://local.devops/api/"

TAG=$(date +%Y%m%d-%H%M%S)

echo "==> Build da imagem: $DOCKER_USER/$IMAGE_NAME:$TAG"
docker build --build-arg VITE_API_URL="$VITE_API_URL" -t $DOCKER_USER/$IMAGE_NAME:$TAG -f $DOCKERFILE $CONTEXT

echo "==> Adiciona tag latest"
docker tag $DOCKER_USER/$IMAGE_NAME:$TAG $DOCKER_USER/$IMAGE_NAME:latest

echo "==> Push imagem: $DOCKER_USER/$IMAGE_NAME:$TAG"
docker push $DOCKER_USER/$IMAGE_NAME:$TAG

echo "==> Push latest"
docker push $DOCKER_USER/$IMAGE_NAME:latest

echo "==> Atualiza deployment no Kubernetes"
kubectl set image deployment/$DEPLOYMENT $DEPLOYMENT=$DOCKER_USER/$IMAGE_NAME:$TAG -n $NAMESPACE

echo "==> Pronto!"
