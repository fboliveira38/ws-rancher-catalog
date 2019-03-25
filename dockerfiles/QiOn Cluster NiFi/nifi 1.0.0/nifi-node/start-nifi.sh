#!/bin/sh

IP=`ifconfig | grep inet | grep broad | cut -d " " -f10`

echo "$IP   $NIFI_URL" >> /etc/hosts

sed -i -e "s|^nifi.web.http.host=.*$|nifi.web.http.host=$IP|" conf/nifi.properties
sed -i -e "s|^nifi.web.https.host=.*$|nifi.web.https.host=$NIFI_URL|" conf/nifi.properties
sed -i -e "s|^nifi.cluster.node.address=.*$|nifi.cluster.node.address=$IP|" conf/nifi.properties
sed -i -e "s|^nifi.remote.input.host=.*$|nifi.remote.input.host=$NIFI_URL|" conf/nifi.properties

tailf $NIFI_HOME/logs/* &

/opt/nifi/bin/nifi.sh run
