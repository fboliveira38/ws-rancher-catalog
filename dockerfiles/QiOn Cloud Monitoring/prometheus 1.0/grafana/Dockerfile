FROM alpine

LABEL maintainer="fabio.oliveira@wssim.com.br"
LABEL version="1.0"

ENV grafana_version 4.6.3
ENV GF_INSTALL_PLUGINS grafana-clock-panel,grafana-piechart-panel,camptocamp-prometheus-alertmanager-datasource,vonage-status-panel
ENV GF_SECURITY_ADMIN_PASSWORD wealth

RUN apk update \
	&& apk add openssl curl \ 
	&& curl -o /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub \
	&& curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk \
	&& curl -LO https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${grafana_version}.linux-x64.tar.gz \
	&& apk add glibc-2.23-r3.apk \
	&& tar xzvf grafana-${grafana_version}.linux-x64.tar.gz \
	&& mv grafana-${grafana_version}/ grafana/ \
	&& mkdir -p grafana/data/plugins \
	&& adduser -s /bin/false -D -H grafana \
	&& chown -R grafana:grafana grafana/ \
	&& rm -rf grafana-${grafana_version}.linux-x64.tar.gz \
	&& rm -rf glibc-2.23-r3.apk \
	&& apk del curl openssl 

WORKDIR /grafana

EXPOSE 3000

USER grafana

CMD ["./bin/grafana-server"]