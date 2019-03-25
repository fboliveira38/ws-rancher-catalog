FROM golang AS building

LABEL maintainer="fabio.oliveira@wssim.com.br"
LABEL version="1.1"

ENV exporter_version 0.15.2

RUN curl -LO https://github.com/prometheus/node_exporter/releases/download/v${exporter_version}/node_exporter-${exporter_version}.linux-amd64.tar.gz \
    && tar -xvzf node_exporter-${exporter_version}.linux-amd64.tar.gz  \
    && cp node_exporter-${exporter_version}.linux-amd64/node_exporter /tmp/

FROM alpine

COPY --from=building /tmp/node_exporter /usr/local/bin/

RUN adduser -s /bin/false -D -H node_exporter \
    && chown node_exporter:node_exporter /usr/local/bin/node_exporter

USER node_exporter

ENTRYPOINT /usr/local/bin/node_exporter

EXPOSE 9100