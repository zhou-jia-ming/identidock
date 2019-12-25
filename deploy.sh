#!/bin/bash
set -e

echo "Starting identidock system"

docker run -d --restart=always --name redis redis:3.0
docker run -d --restart=always --name dnmonster jiaming0docker/dnmonster:1.0
docker run -d --restart=always \
    --link dnmonster:dnmonster \
    --link redis:redis \
    -e ENV=PROD --name identidock jiaming0docker/identidock:1.0
docker run -d --restart=always \
    --name proxy \
    --link identidock:identidock \
    -p 80:80 \
    -e NGINX_HOST=zhoujiaming \
    -e NGINX_PROXY=http://identidock:9090 jiaming0docker/proxy:1.0
echo "Started"

