HOSTA=$(docker-machine ip etcd-1)
HOSTB=$(docker-machine ip etcd-2)


sed -i .bak -e "s/placeholderA/$HOSTA/g" -e "s/placeholderB/$HOSTB/g" etcd-2.yml
sed -i .bak -e "s/placeholderA/$HOSTA/g" -e "s/placeholderB/$HOSTB/g" etcd-1.yml

eval $(docker-machine env etcd-1)
docker-compose -f etcd-1.yml up -d
eval $(docker-machine env etcd-2)
docker-compose -f etcd-2.yml up -d
HOSTA=$(docker-machine ip etcd-1)
curl -s http://$HOSTA:2379/v2/members | jq