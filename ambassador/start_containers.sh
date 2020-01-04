eval $(docker-machine env redis-host)
docker-compose -f redis-host.yml  up -d

eval $(docker-machine env identidock-host)
redis_url=$(docker-machine ip redis-host)

sed -i .bak "s/placeholder/$redis_url/g" identidock-host.yml
docker-compose -f identidock-host.yml  up -d

