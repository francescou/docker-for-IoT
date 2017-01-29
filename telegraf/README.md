Telegraf
===

docker service create \
  --name telegraf \
  --network tick \
  --log-driver fluentd \
  --log-opt fluentd-address=127.0.0.1:24224 \
  --limit-cpu 1 \
  --limit-memory 64m \
  francescou/telegraf:1.0
