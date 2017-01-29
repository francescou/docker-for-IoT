fluentd
===

```
docker service create \
  --name fluentd \
  --network tick \
  --publish 24224:24224 \
  --constraint 'node.role==manager' \
  --mount type=bind,source=/logs/,destination=/fluentd/log/ \
  --limit-cpu 1 \
  --limit-memory 64m \
  francesco/fluentd:v0.12
```