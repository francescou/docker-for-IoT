spy
===

docker service create \
  --name socket \
  --network tick \
  --publish 8180:8180 \
  --label traefik.port=8180 \
  --log-driver fluentd \
  --log-opt fluentd-address=127.0.0.1:24224 \
  --limit-cpu 1 \
  --limit-memory 64m \
  francescou/spy:1.0
