docker-compose -f prod-with-logging.yml up -d
curl -s localhost > /dev/null
docker-compose -f prod-with-logging.yml logs logstash