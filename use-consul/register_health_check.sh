#!/usr/bin/env bash


# run this script on consul-1

# register health check service

curl -XPUT http://$HOSTA:8500/v1/agent/service/register \
-d '{"name": "dnmonster", "address":"'$DNM_IP'","port": 8080,
"check": {"http": "http://'$DNM_IP':8080/monster/foo", "interval": "10s"}
}'

# check if dnmonster is work well
curl -s $HOSTA:8500/v1/health/checks/dnmonster | jq '.[].Status'