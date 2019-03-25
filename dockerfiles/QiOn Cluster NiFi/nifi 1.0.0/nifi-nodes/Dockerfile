FROM infraws/monitoring:nifi-base-1.0.0

LABEL maintainer="fabio.oliveira@wssim.com.br"
LABEL version="1.0.0"

ADD ./start-nifi.sh .

ENTRYPOINT ["sh", "-c"] 
CMD ["/opt/nifi/start-nifi.sh"]