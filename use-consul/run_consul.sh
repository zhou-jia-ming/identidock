#!/usr/bin/env bash

HOSTA=$(docker-machine ip consul-1)
HOSTB=$(docker-machine ip consul-2)

sed -i .bak -e "s/placeholderA/$HOSTA/g" -e "s/placeholderB/$HOSTB/g" consul-1.yml
sed -i .bak -e "s/placeholderA/$HOSTA/g" -e "s/placeholderB/$HOSTB/g" consul-2.yml

eval $(docker-machine env consul-1)
docker-compose -f consul-1.yml up -d

eval $(docker-machine env consul-2)
docker-compose -f consul-2.yml up -d

