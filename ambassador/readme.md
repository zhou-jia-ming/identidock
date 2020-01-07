This is a example of using ambassador continer to connect to two continer in different machine through network

single-alone structure

    :app -> redis

now

    :app --> redis-ambassador ---network---> redis-ambassador --> redis

