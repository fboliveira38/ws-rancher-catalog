#!/bin/sh

IP=`ifconfig | grep inet | grep broad | cut -d " " -f10`

echo "$IP   $NIFI_URL" >> /etc/hosts

sed -i s/hdfsmaster/$HDFS_HOST/g conf/core-site.xml

# sed -i -e "s|^nifi.web.http.host=.*$|nifi.web.http.host=$IP|" conf/nifi.properties
sed -i -e "s|^nifi.web.https.host=.*$|nifi.web.https.host=$NIFI_URL|" conf/nifi.properties
sed -i -e "s|^nifi.cluster.node.address=.*$|nifi.cluster.node.address=$NIFI_URL|" conf/nifi.properties
sed -i -e "s|^nifi.remote.input.host=.*$|nifi.remote.input.host=$NIFI_URL|" conf/nifi.properties
 
bin/nifi.sh run