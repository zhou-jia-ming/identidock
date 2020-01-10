#!/bin/bash

# start docker machine
docker-machine start etcd-1 etcd2
# get vm ip address
HOSTA=$(docker-machine ip etcd-1)
HOSTB=$(docker-machine ip etcd-2)

# config IP
sed -i .bak -e "s/placeholderA/$HOSTA/g" -e "s/placeholderB/$HOSTB/g" etcd-2.yml
sed -i .bak -e "s/placeholderA/$HOSTA/g" -e "s/placeholderB/$HOSTB/g" etcd-1.yml

# start etcd cluster
eval $(docker-machine env etcd-1)
docker-compose -f etcd-1.yml up -d
eval $(docker-machine env etcd-2)
docker-compose -f etcd-2.yml up -d

#  test if etcd is started
HOSTA=$(docker-machine ip etcd-1)
curl -s http://$HOSTA:2379/v2/members | jq

# run the sky-dns container on etcd-1
eval $(docker-machine env etcd-1)
docker stop $(docker ps -q -f name=dns)
docker rm $(docker ps -aq -f name=dns)
docker run --rm -d -e ETCD_MACHINES="http://${HOSTA}:2379,http://${HOSTB}:2379" --name dns skynetservices/skydns:2.5.3a

# test if dns is good
sh test_dns.sh