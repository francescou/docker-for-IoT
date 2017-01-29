Grafana
===

docker service create \
  --name grafana \
  --network tick \
  --publish 3000:3000 \
  --constraint 'node.role==manager' \
  --mount type=bind,source=/grafana/,destination=/var/lib/grafana/ \
  --label traefik.port=3000 \
  --log-driver fluentd \
  --log-opt fluentd-address=127.0.0.1:24224 \
  --limit-cpu 1 \
  --limit-memory 64m \
  fg2it/grafana-armhf:v4.1.1
