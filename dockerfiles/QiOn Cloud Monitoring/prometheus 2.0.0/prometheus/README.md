# Prometheus-Alpine

## To run this image, execute:
```
# docker container run -d --name prometheus -p 9090:9090 infraws/monitoring:prometheus-2.0.0
```

Open http://your_ip:9090 to access the interface of Prometheus.

## To view the logs, execute:
```
# docker container logs -f <container_id>
```

## To create a swarm service, execute:
```
# docker service create --name prometheus -p 9090:9090 infraws/monitoring:prometheus-2.0.0
```
