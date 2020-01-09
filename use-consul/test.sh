#!/usr/bin/env bash

# check machine status in cluster
eval $(docker-machine env consul-1)
docker exec consul consul members

# test if k-v storage is available
HOSTA=$(docker-machine ip consul-1)
curl -XPUT http://$HOSTA:8500/v1/kv/foo -d bar

# curl http://$HOSTA:8500/v1/kv/foo | jq .
# command above would return value in base63 encoded. So we should decode it.
curl http://$HOSTA:8500/v1/kv/foo | jq -r '.[].Value' | base64 -d