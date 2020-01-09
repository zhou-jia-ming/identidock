#!/usr/bin/env bash
docker-machine create  -d   virtualbox --engine-registry-mirror $(docker info |grep ali) consul-1
docker-machine create  -d   virtualbox --engine-registry-mirror $(docker info |grep ali) consul-2


