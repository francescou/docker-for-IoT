FROM hypriot/rpi-alpine:3.4

ENV INFLUXDB_VERSION 1.1.1

WORKDIR /opt/

ADD https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}_linux_armhf.tar.gz .

RUN tar -xzf influxdb-${INFLUXDB_VERSION}_linux_armhf.tar.gz
RUN cp -a influxdb-${INFLUXDB_VERSION}-1/usr/bin/* /usr/bin/

COPY influxdb.conf /etc/influxdb/influxdb.conf

EXPOSE 8086

VOLUME /var/lib/influxdb

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd"]
