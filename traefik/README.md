Traefik
===

docker service create \
    --name traefik \
    --network tick \
    --publish 80:80 \
    --publish 9090:8080 \
    --constraint 'node.role==manager' \
    --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock,readonly=true  \
    --log-driver fluentd \
    --log-opt fluentd-address=127.0.0.1:24224 \
    --limit-cpu 1 \
    --limit-memory 64m \
    hypriot/rpi-traefik:v1.1.2 \
    --logLevel=DEBUG \
    --docker \
    --docker.swarmmode \
    --docker.domain=traefik \
    --docker.watch \
    --web
