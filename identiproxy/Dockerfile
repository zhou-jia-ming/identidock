FROM nginx:1.7

COPY default.conf /etc/nginx/conf.d/default.conf
# Build this container
# docker build -t identiproxy:0.1 .

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

# after delete identidock thing use this command to build
# docker build -t proxy:0.1 .


