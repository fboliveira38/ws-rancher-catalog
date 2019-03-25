#!/bin/sh

IP=`ifconfig | grep inet | grep broad | cut -d " " -f10`
NIFI_URL="nifi.wssim.com.br"

echo "$IP   $NIFI_URL" >> /etc/hosts

# sed -i -e "s|^nifi.web.http.host=.*$|nifi.web.http.host=$(ifconfig | grep inet | grep broad | cut -d " " -f10)|" conf/nifi.properties
sed -i -e "s|^nifi.web.https.host=.*$|nifi.web.https.host=$NIFI_URL|" conf/nifi.properties
sed -i -e "s|^nifi.cluster.node.address=.*$|nifi.cluster.node.address=$(ifconfig | grep inet | grep broad | cut -d " " -f10)|" conf/nifi.properties
sed -i -e "s|^nifi.remote.input.host=.*$|nifi.remote.input.host=$(ifconfig | grep inet | grep broad | cut -d " " -f10)|" conf/nifi.properties

/opt/nifi/bin/nifi.sh start

tailf logs/*