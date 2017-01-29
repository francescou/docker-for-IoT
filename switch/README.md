switch
===

docker service create \
  --name switch \
  --network tick \
  --publish 5000:5000 \
  --label traefik.port=5000 \
  --log-driver fluentd \
  --log-opt fluentd-address=127.0.0.1:24224 \
  --limit-cpu 1 \
  --limit-memory 64m \
  francescou/switch:1.0
