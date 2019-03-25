FROM alpine

LABEL maintainer="fabio.oliveira@wssim.com.br"
LABEL version="2.0.0"

ENV alertmanager_version 0.14.0

ADD conf/config.yml /etc/alertmanager/

RUN apk --no-cache add curl \
    && curl -LO https://github.com/prometheus/alertmanager/releases/download/v${alertmanager_version}/alertmanager-${alertmanager_version}.linux-amd64.tar.gz \
    && tar -xvzf alertmanager-${alertmanager_version}.linux-amd64.tar.gz \
    && cp alertmanager-${alertmanager_version}.linux-amd64/alertmanager /bin \
    && cp alertmanager-${alertmanager_version}.linux-amd64/amtool /bin \
    && mkdir /var/lib/alertmanager \
    && adduser -s /bin/false -D -H prometheus \
    && chown prometheus:prometheus /bin/alertmanager \
    && chown prometheus:prometheus /bin/amtool \
    && chown -R prometheus:prometheus /etc/alertmanager \
    && chown prometheus:prometheus /var/lib/alertmanager \ 
    && rm -rf alertmanager-${alertmanager_version}.linux-amd64* 

USER prometheus

EXPOSE 9093

WORKDIR /var/lib/alertmanager

ENTRYPOINT alertmanager --config.file /etc/alertmanager/config.yml --storage.path /var/lib/alertmanager
