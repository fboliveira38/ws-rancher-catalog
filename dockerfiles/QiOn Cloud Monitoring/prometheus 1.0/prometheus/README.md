# Prometheus-Alpine

## To run this image, execute:
```
# docker container run -d -e NODE_EXPORTER_MONITORING="'node-exporter:9100' , '0.0.0.0:9100', '0.0.0.0:9100'" -e CADVISOR_MONITORING="'cadvisor:8080' , '0.0.0.0:8080', '0.0.0.0:8080'" --name prometheus -p 9090:9090 infraws/monitoring:prometheus-1.1.1
```

Open http://your_ip:9090 to access the interface of Prometheus.

## To view the logs, execute:
```
# docker container logs -f <container_id>
```

## To create a swarm service, execute:
```
# docker service create --name prometheus -p 9090:9090 infraws/monitoring:prometheus-1.1.1
```
