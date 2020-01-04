docker-machine create  -d   virtualbox --engine-registry-mirror $(docker info |grep ali) redis-host
docker-machine create  -d   virtualbox --engine-registry-mirror $(docker info |grep ali) identidock-host

