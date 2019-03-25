FROM infraws/monitoring:nifi-base-1.1.0

LABEL maintainer="fabio.oliveira@wssim.com.br"
LABEL version="1.1.0"

RUN yum install -y bind-utils

ADD ./start-nifi.sh .

ENTRYPOINT ["sh", "-c"] 
CMD ["/opt/nifi/start-nifi.sh"]