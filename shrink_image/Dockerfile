FROM debian:wheezy

# dd 用于备份一个文件 if是input file , of是output file
# /dev/zero不断产生0 count=1表示复制1个块， bs表示字节数

RUN dd if=/dev/zero of=/bigfile count=1 bs=50MB
# 为了减少docker image的大小，应该在上一条语句后加入 && rm /bigfile
# 可以通过docker build -t filetest . && docker history filetest 查看docker image的每一层增加的大小。
RUN rm /bigfile



# 当不得不缩小镜像大小时，还可以使用先export 再import的方法，缺点是镜像只有一层，不能和其他有相同父级的镜像共享空间
# docker create identidock:latest
# docker export $(docker ps -lq) | docker import -
# xxxxxxxxxxxxxxx
# docker tag xxxxxxxxxxx identidock:import
