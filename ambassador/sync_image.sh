echo "sync image between docker-machine and host..."
docker save python:3.7 | docker $(docker-machine config identidock-host) load
docker save amouat/dnmonster:1.0 | docker $(docker-machine config identidock-host) load
echo "sync done"
