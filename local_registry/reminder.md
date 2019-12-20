## 记录一下

###生成内网TLS证书命令
openssl req -newkey rsa:4096 -nodes -sha256 -keyout registry_certs/domain.key -x509 -days 365 -out registry_certs/domain.crt
## 也可使用docker secret生成

### 要使用这个自己搭建的registry服务的Linux机器需要执行以下命令添加证书
sudo mkdir /etc/docker/certs.d/test-docker-reg\:5000
sudo cp ca.crt /etc/docker/certs.d/test-docker-reg\:5000/

### mac上不同
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ca.crt

在/etc/hosts内加入
192.168.xx.xx <your_domain_name>
