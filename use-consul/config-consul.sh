#!/usr/bin/env bash

eval $(docker-machine env --unset)

HOSTA=$(docker-machine ip consul-1)
HOSTB=$(docker-machine ip consul-2)
# step 1: config redis dnmonster
curl -XPUT http://$HOSTA:8500/v1/agent/service/register -d '{"name": "redis", "address":"'$HOSTB'","port": 6379}' | jq .
eval $(docker-machine env consul-1)
HOSTA=$(docker-machine ip consul-1)
DNM_IP=$(docker inspect -f {{.NetworkSettings.IPAddress}} dnmonster)
curl -XPUT http://$HOSTA:8500/v1/agent/service/register -d '{"name": "dnmonster", "address":"'$DNM_IP'","port": 8080}' | jq .

# step 2: test dns
docker run amouat/network-utils dig @172.17.0.1 +short redis.service.consul
docker run amouat/network-utils dig @172.17.0.1 +short dnmonster.service.consul

# use ssh connect to consul-1, edit configuration let consul reslove DNS
# vi /var/lib/boot2docker/profile
# add the args to EXTRA_ARGS option
#--dns 172.17.0.1
#--dns-search service.consul

docker run redis:3.0 redis-cli -h redis ping