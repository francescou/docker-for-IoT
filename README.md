# docker-for-IoT
Docker for Internet of Things


## modules

- **nodemcu-ldr** lua code to run on NodeMCU ESP8266. Publish LDR sensor data on MQTT
- **nodemcu-rgb** lua code to run on NodeMCU ESP8266. Subscribe to MQTT *sensors/ldr* and *status/switch* topics, then automatically adapt the light color
- **switch** light switch web application