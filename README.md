# docker-for-IoT
Docker for Internet of Things


## modules

- **fluentd** fluentd docker image for ARM
- **grafana** metrics dashboard
- **influxdb** time series database
- **mqtt-broker** mosca docker image for ARM
- **nodemcu-ldr** lua code to run on NodeMCU ESP8266. Publish LDR sensor data on MQTT
- **nodemcu-rgb** lua code to run on NodeMCU ESP8266. Subscribe to MQTT *sensors/ldr* and *status/switch* topics, then automatically adapt the light color
- **spy** monitor light value using websockets
- **switch** light switch web application
- **telegraf** metrics collector
- **traefik** dynamic reverse proxy

### overlay network

```
docker network create \
  --driver overlay \
  --subnet 10.0.9.0/24 tick
```