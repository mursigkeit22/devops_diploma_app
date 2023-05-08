#! /bin/bash
set -xe
sudo usermod -aG docker $USER
sudo setcap cap_net_bind_service=+ep /usr/bin/node
docker network create -d bridge momo_network || true
docker login -u ${CI_REGISTRY_USER} -p ${CI_REGISTRY_PASSWORD} ${CI_REGISTRY}
docker pull ${CI_REGISTRY_IMAGE}/sausage-frontend:latest
docker stop momofront || true
docker rm momofront || true
docker run -d --name momofront \
    --network=momo_network \
    --restart always \
    --pull always \
    -p 80:80 \
    ${CI_REGISTRY_IMAGE}/momo-frontend:latest 
