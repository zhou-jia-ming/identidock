
# run this command manually
# docker-machine ssh weave-redis
# sudo curl -sL git.io/weave -o /usr/local/bin/weave
# sudo chmod a+x /usr/local/bin/weave && weave launch

# eval $(weave env)
# docker run --name redis -d redis:3.0
# exit

# docker-machine ssh weave-identidock
# sudo curl -sL git.io/weave -o /usr/local/bin/weave
# sudo chmod a+x /usr/local/bin/weave && weave launch

# exit
#docker-machine ssh weave-identidock \
# "weave launch $(docker-machine ip weave-redis)"

# test if redis client can connect to redis server

# docker-machine ssh weave-identidock
# eval $(weave env)
# docker run redis:3.0 redis-cli -h redis ping

# start the app
# docker run --name dnmonster -d amouat/dnmonster:1.0
# docker run --name identidock -d -p 80:9090  jiaming0docker/identidock:2.0
#

# test app
# curl $(docker-machine ip weave-identidock)
# curl -s $(docker-machine ip weave-identidock)/monster/gordon | head -c 4