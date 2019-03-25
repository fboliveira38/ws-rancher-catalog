FROM python:3.5-alpine

LABEL maintainer="fabio.oliveira@wssim.com.br"
LABEL version="2.0.0"

ADD conf/config.ini /etc/prom2teams/
ADD conf/start.sh /etc/init.d/

RUN adduser -s /bin/false -D -H prom2teams \
    && chown -R prom2teams:prom2teams /etc/prom2teams \
    && chown -R prom2teams:prom2teams /etc/init.d/start.sh \
    && chmod +x /etc/init.d/start.sh \
    && pip3 install prom2teams

USER prom2teams

EXPOSE 8089

WORKDIR /etc/prom2teams

ENTRYPOINT /etc/init.d/start.sh
