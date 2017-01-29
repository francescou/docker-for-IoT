MQTT broker (mosca)
===

```
docker service create \
  --name mosca \
  --network tick \
  --publish 1883:1883 \
  --log-driver fluentd \
  --log-opt fluentd-address=127.0.0.1:24224 \
  --limit-cpu 1 \
  --limit-memory 64m \
  francescou/mosca:v2.1.0
```