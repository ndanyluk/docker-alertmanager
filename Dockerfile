FROM alpine:3.9.3

COPY amtool                /bin/amtool
COPY alertmanager          /bin/alertmanager
COPY alertmanager.yml      /etc/alertmanager/alertmanager.yml
COPY docker-entrypoint.sh  /etc/alertmanager/

RUN mkdir -p /alertmanager && \
    chown -R 1000.1000 etc/alertmanager /alertmanager

USER        1000
EXPOSE      9093
VOLUME      [ "/alertmanager" ]
WORKDIR     /alertmanager
ENTRYPOINT  [ "/etc/alertmanager/docker-entrypoint.sh" ]
CMD         [ "--config.file=/etc/alertmanager/alertmanager.yml", \
              "--storage.path=/alertmanager" ]
