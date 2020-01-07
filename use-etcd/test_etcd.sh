HOSTA=$(docker-machine ip etcd-1)
HOSTB=$(docker-machine ip etcd-2)
HOSTA=$(docker-machine ip etcd-1)

curl -s http://$HOSTA:2379/v2/keys/service_name -XPUT -d value="service_address" |jq '.'
curl -s http://$HOSTB:2379/v2/keys/service_name | jq '.'
# test with docker
docker run binocarlos/etcdctl -C ${HOSTB}:2379 get service_name
