FROM hypriot/rpi-alpine:3.4

ENV TELEGRAF_VERSION 1.1.2

WORKDIR /opt/

ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz . 

RUN tar -xvf telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz

RUN mv telegraf/usr/bin/telegraf /usr/bin/
RUN mv telegraf/etc/telegraf/ /etc/

EXPOSE 8125/udp 8092/udp 8094

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]

COPY telegraf.conf /etc/telegraf/telegraf.conf
