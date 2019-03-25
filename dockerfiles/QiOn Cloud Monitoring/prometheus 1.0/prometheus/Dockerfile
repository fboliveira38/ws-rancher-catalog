FROM alpine

LABEL maintainer="fabio.oliveira@wssim.com.br"
LABEL version="1.1"

ENV prometheus_version 2.1.0

ADD conf/prometheus.yml /etc/prometheus/
ADD conf/alert.rules /etc/prometheus/
ADD conf/start.sh /etc/init.d/start.sh

RUN adduser -s /bin/false -D -H prometheus \
    && apk update \
    && apk --no-cache add curl \
    && curl -LO https://github.com/prometheus/prometheus/releases/download/v${prometheus_version}/prometheus-${prometheus_version}.linux-amd64.tar.gz \
    && tar -xvzf prometheus-${prometheus_version}.linux-amd64.tar.gz \
    && mkdir -p /etc/prometheus /var/lib/prometheus \
    && cp prometheus-${prometheus_version}.linux-amd64/promtool /usr/local/bin/ \
    && cp prometheus-${prometheus_version}.linux-amd64/prometheus /usr/local/bin/ \
    && cp -R prometheus-${prometheus_version}.linux-amd64/console_libraries/ /etc/prometheus/ \
    && cp -R prometheus-${prometheus_version}.linux-amd64/consoles/ /etc/prometheus/ \
    && chmod +x /etc/init.d/start.sh \
    && rm -rf prometheus-${prometheus_version}.linux-amd64* \
    && chown prometheus:prometheus /usr/local/bin/prometheus \
    && chown prometheus:prometheus /usr/local/bin/promtool \
    && chown prometheus:prometheus /etc/init.d/start.sh \
    && chown -R prometheus:prometheus /etc/prometheus \
    && chown prometheus:prometheus /var/lib/prometheus \
    && echo "127.0.0.1  prometheus" >> /etc/hosts \
    && apk del curl

VOLUME /var/lib/prometheus

USER prometheus

ENTRYPOINT /etc/init.d/start.sh

EXPOSE 9090
