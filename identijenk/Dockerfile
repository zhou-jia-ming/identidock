FROM jenkins/jenkins:latest

USER root
# apt使用清华的源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
RUN echo " deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch main contrib non-free \
    deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch main contrib non-free \
    deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-updates main contrib non-free \
    deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-updates main contrib non-free \
    deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-backports main contrib non-free \
    deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-backports main contrib non-free \
    deb http://mirrors.tuna.tsinghua.edu.cn/debian-security stretch/updates main contrib non-free \
    deb-src http://mirrors.tuna.tsinghua.edu.cn/debian-security stretch/updates main contrib non-free" \
    > /etc/apt/sources.list
# 安装https相关软件
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
# 下载gpg 并配置
RUN curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian/gpg | apt-key add -


# docker-ce源使用清华源
RUN add-apt-repository \
    "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian/ stretch stable" \
    && apt-get update && apt-get install sudo
RUN apt-get install -y --fix-missing docker-ce docker-ce-cli containerd.io

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN echo "127.0.0.1 updates.jenkins-ci.org" >> /etc/hosts
# 安装

RUN curl -L https://github.com/docker/compose/releases/download/1.25.1-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose; \
    chmod +x /usr/local/bin/docker-compose


# 用nginx把代理配置好， 等下安装插件用
RUN apt install -y nginx vim
RUN echo "location jenkins/plugins \
{   proxy_next_upstream http_502 http_504 error timeout invalid_header; \
    proxy_set_header Host mirrors.tuna.tsinghua.edu.cn; \
    proxy_set_header X-Real-IP $remote_addr; \
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; \
    rewrite /download/plugins(.*) /jenkins/plugins/$1 break; \
    proxy_pass https://mirrors.tuna.tsinghua.edu.cn; \
} " > /etc/nginx/conf.d/jenkins

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
# 由于网络问题，这里先注释掉，然后启动了jerkins再下载插件
#ENV JENKINS_UC https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json
#RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt




