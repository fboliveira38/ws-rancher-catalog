FROM centos:7

LABEL maintainer="fabio.oliveira@wssim.com.br"
LABEL version="1.1.0"

ENV NIFI_VERSION=1.5.0
ENV NIFI_HOME=/opt/nifi

ADD ./core-site.xml /mnt/conf/
ADD ./flow.xml.gz /mnt/conf/
ADD ./authorizers.xml /mnt/conf/
ADD ./cacert.pem /mnt/conf
ADD ./cert_server.pem /mnt/conf/
ADD ./cert_server.pfx /mnt/conf/
ADD ./hdfs-site.xml /mnt/conf/
ADD ./nifi.properties /mnt/conf/
ADD ./zookeeper.properties /mnt/conf/
ADD ./bootstrap.conf /mnt/conf/

# Picked recommended mirror from Apache for the distribution.
# Import the Apache NiFi release keys
RUN set -x \
        && curl -Lf https://dist.apache.org/repos/dist/release/nifi/KEYS -o /tmp/nifi-keys.txt \
        && gpg --import /tmp/nifi-keys.txt \
        && curl -Lf https://archive.apache.org/dist/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz -o /tmp/nifi-bin.tar.gz \
        && curl -Lf https://archive.apache.org/dist/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz.asc -o /tmp/nifi-bin.tar.gz.asc \
        && curl -Lf https://archive.apache.org/dist/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz.md5 -o /tmp/nifi-bin.tar.gz.md5 \
        && curl -Lf https://archive.apache.org/dist/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz.sha1 -o /tmp/nifi-bin.tar.gz.sha1 \
        && gpg --verify /tmp/nifi-bin.tar.gz.asc /tmp/nifi-bin.tar.gz \
        && echo "$(cat /tmp/nifi-bin.tar.gz.md5) /tmp/nifi-bin.tar.gz" | md5sum -c - \
        && echo "$(cat /tmp/nifi-bin.tar.gz.sha1) /tmp/nifi-bin.tar.gz" | sha1sum -c - \
#        && curl -Lf https://archive.apache.org/dist/nifi/$NIFI_VERSION/nifi-toolkit-$NIFI_VERSION-bin.tar.gz -o /tmp/nifi-toolkit-bin.tar.gz \
#        && curl -Lf https://archive.apache.org/dist/nifi/$NIFI_VERSION/nifi-toolkit-$NIFI_VERSION-bin.tar.gz.asc -o /tmp/nifi-toolkit-bin.tar.gz.asc \
#        && curl -Lf https://archive.apache.org/dist/nifi/$NIFI_VERSION/nifi-toolkit-$NIFI_VERSION-bin.tar.gz.md5 -o /tmp/nifi-toolkit-bin.tar.gz.md5 \
#        && curl -Lf https://archive.apache.org/dist/nifi/$NIFI_VERSION/nifi-toolkit-$NIFI_VERSION-bin.tar.gz.sha1 -o /tmp/nifi-toolkit-bin.tar.gz.sha1 \
#        && gpg --verify /tmp/nifi-toolkit-bin.tar.gz.asc /tmp/nifi-toolkit-bin.tar.gz \
#        && echo "$(cat /tmp/nifi-toolkit-bin.tar.gz.md5) /tmp/nifi-toolkit-bin.tar.gz" | md5sum -c - \
#        && echo "$(cat /tmp/nifi-toolkit-bin.tar.gz.sha1) /tmp/nifi-toolkit-bin.tar.gz" | sha1sum -c - \
        && mkdir -p $NIFI_HOME \
#        && mkdir -p $NIFI_HOME-toolkit \
        && tar -z -x -f /tmp/nifi-bin.tar.gz -C $NIFI_HOME --strip-components=1 \
#        && tar -z -x -f /tmp/nifi-toolkit-bin.tar.gz -C $NIFI_HOME-toolkit --strip-components=1 \
        && rm -rf /tmp/* \
        && groupadd nifi \
        && useradd -d /opt/nifi -r -g nifi nifi \
        && bash -c "mkdir -p $NIFI_HOME/{database_repository,flowfile_repository,content_repository,provenance_repository,data}" \
        && mv /mnt/conf/authorizers.xml $NIFI_HOME/data/ \
        && mv /mnt/conf/cert_server.pfx $NIFI_HOME/data/ \
        && mv /mnt/conf/flow.xml.gz $NIFI_HOME/data/ \
        && mv /mnt/conf/* $NIFI_HOME/conf/ \ 
        && mv $NIFI_HOME/conf/state-management.xml $NIFI_HOME/data/ \
        && mv $NIFI_HOME/conf/login-identity-providers.xml $NIFI_HOME/data/ \
        && yum install -y java-1.8.0-openjdk net-tools sudo \
        && mkdir -p $NIFI_HOME/logs/ \
        && touch $NIFI_HOME/logs/nifi-app.log $NIFI_HOME/logs/nifi-bootstrap.log $NIFI_HOME/logs/nifi-user.log \
        && keytool -import -noprompt -trustcacerts -file $NIFI_HOME/conf/cacert.pem -alias cacert -keystore $NIFI_HOME/data/truststore.jks -storepass Ws@18012001 \
        && keytool -importcert -alias cert_server -file $NIFI_HOME/conf/cert_server.pem -keystore $NIFI_HOME/data/truststore.jks -storepass Ws@18012001 \
#        && chown nifi:nifi -R $NIFI_HOME-toolkit \
        && chown nifi:nifi -R $NIFI_HOME

# These are the volumes (in order) for the following:
# 1) user access and flow controller history
# 2) FlowFile attributes and current state in the system
# 3) content for all the FlowFiles in the system
# 4) information related to Data Provenance
# You can find more information about the system properties here - https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#system_properties
# VOLUME ["$$NIFI_HOME/database_repository", \
#         "$$NIFI_HOME/flowfile_repository", \
#         "$$NIFI_HOME/content_repository", \
#         "$$NIFI_HOME/provenance_repository"]


# Open port 8081 for the HTTP listen
USER root
WORKDIR $NIFI_HOME
EXPOSE 8080 8081
ENTRYPOINT ["bin/nifi.sh"]
CMD ["run"]
