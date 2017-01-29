InfluxDB
===

docker service create \
  --name influxdb \
  --network tick \
  --publish 8086:8086 \
  --constraint 'node.role==manager' \
  --mount type=bind,source=/influxdb/,destination=/var/lib/influxdb/ \
  --label traefik.port=8086 \
  --log-driver fluentd \
  --log-opt fluentd-address=127.0.0.1:24224 \
  --limit-cpu 1 \
  --limit-memory 128m \
  francescou/influxdb:1.1
