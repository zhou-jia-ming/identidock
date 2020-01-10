#!/usr/bin/env bash

eval $(docker-machine env --unset)

HOSTA=$(docker-machine ip consul-1)
HOSTB=$(docker-machine ip consul-2)
curl -XPUT http://$HOSTA:8500/v1/agent/service/register -d '{"name": "redis", "address":"'$HOSTB'","port": 6379}' | jq .

eval $(docker-machine env consul-1)

docker run amouat/network-utils dig @172.17.0.1 +short redis.service.consul