sed -i "s/node-exporter-config/$NODE_EXPORTER_MONITORING/" /etc/prometheus/prometheus.yml
sed -i "s/cadvisor-config/$CADVISOR_MONITORING/" /etc/prometheus/prometheus.yml

/usr/local/bin/prometheus --config.file /etc/prometheus/prometheus.yml --storage.tsdb.path /var/lib/prometheus/ --web.console.libraries=/etc/prometheus/console_libraries --web.console.templates=/etc/prometheus/consoles