## 记录一下
生成内网TLS证书命令
openssl req -newkey rsa:4096 -nodes -sha256 -keyout registry_certs/domain.key -x509 -days 365 -out registry_certs/domain.crt
