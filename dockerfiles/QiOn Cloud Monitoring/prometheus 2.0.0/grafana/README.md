# Grafana-Alpine

## To run this image, execute:
```
# docker container run -d --name grafana -p 3000:3000 infraws/monitoring:grafana-2.0.0
```

Open http://your_ip:3000 to access the interface of Prometheus.

## To view the logs, execute:
```
# docker container logs -f <container_id>
```

## To create a swarm service, execute:
```
# docker service create --name grafana -p 3000:3000 infraws/monitoring:grafana-2.0.0
```
