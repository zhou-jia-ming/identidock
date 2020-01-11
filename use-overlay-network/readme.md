## this tutor is about docker network

### check network:
    $docker netowrk ls

### create db network using bridge driver
    $docker network create --attachable --driver overlay db



### create db service
    $docker service create --network db --publish 6379:6379 --name redis redis:3.0


### check services
    $docker service ls

### test redis
     $docker run --network db -it redis:3.0 redis-cli -h redis ping
     if your run in different network container link fail.
     $docker run  -it redis:3.0 redis-cli -h redis ping
     > Could not connect to Redis at redis:6379: Name or service not known

### scale redis
    $docker service scale redis=5
    # check out the task number
    $docker service ps redis


========================================================

use technic above on consul machine.
create a network and start redis service on consul-1
start identidock and dnmonster on consul-2,
without any config like /etc/resolve.conf or IP:port on consult
the container can connect each other naturally like on the same host.