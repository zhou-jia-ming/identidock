HOSTA=$(docker-machine ip etcd-1)
HOSTB=$(docker-machine ip etcd-2)

# Tell the etcd listen 0.0.0.0:53 and be authority dns server of domain which named "identidock.local"
curl -XPUT http://${HOSTA}:2379/v2/keys/skydns/config -d value='{"dns_addr":"0.0.0.0:53", "domain":"identidock.local."}' | jq .

# register redis service


curl -XPUT http://${HOSTA}:2379/v2/keys/skydns/local/identidock/redis -d value='{"host":"'$HOSTB'","port":6379}' | jq .
