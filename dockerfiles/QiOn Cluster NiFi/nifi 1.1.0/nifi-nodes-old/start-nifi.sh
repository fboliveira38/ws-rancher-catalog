#!/bin/sh

IP=`ifconfig | grep inet | grep broad | cut -d " " -f10`
NIFI_IP=`nslookup nifi-node | grep "Address" | cut -d " " -f 2`
NIFI_IP=`echo $NIFI_IP | cut -d " " -f 3`

echo "$NIFI_IP   $NIFI_URL" >> /etc/hosts

# sed -i -e "s|^nifi.web.http.host=.*$|nifi.web.http.host=$IP|" conf/nifi.properties
sed -i -e "s|^nifi.web.https.host=.*$|nifi.web.https.host=$IP|" conf/nifi.properties
sed -i -e "s|^nifi.cluster.node.address=.*$|nifi.cluster.node.address=$IP|" conf/nifi.properties
sed -i -e "s|^nifi.remote.input.host=.*$|nifi.remote.input.host=$IP|" conf/nifi.properties

/opt/nifi/bin/nifi.sh start

tailf logs/*
