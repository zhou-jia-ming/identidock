eval $(docker-machine env etcd-1)
docker run --dns $(docker inspect -f '{{.NetworkSettings.IPAddress}}' dns) -it redis:3.0 redis-cli -h redis.identidock.local ping

# or docker run --dns $(docker inspect -f '{{.NetworkSettings.IPAddress}}' dns) \
#               --dns-search identidock.local -it redis:3.0 redis-cli -h redis ping

# you can also login the vm to config dns and dns-search by:
# docker-machine ssh etcd-1
# echo -e "domain identidock.local \nnameserver " \
# $(docker inspect -f {{.NetworkSettings.IPAddress}} dns) > /etc/resolv.conf
# then test:
#   docker run redis:3.0 redis-cli -h redis ping
# but remember if you restart the vm , resolv.conf will be recreated.


# Use dig to query dns info

docker exec -it dns dig @localhost SRV redis.identidock.local
