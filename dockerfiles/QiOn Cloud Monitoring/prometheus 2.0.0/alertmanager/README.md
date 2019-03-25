# AlertManager-Alpine


## To run this image, execute:
```
# docker container run -d --name alertmanager -p 9093:9093 infraws/monitoring:alertmanager-1.0
```

Open http://your_ip:9093 to access the interface of AlertManager.

## To view the logs, execute:
```
# docker container logs -f <container_id>
```

## To create a swarm service, execute:
```
# docker service create --name alertmanager -p 9093:9093 infraws/monitoring:alertmanager-1.0
```

PS: Edit /etc/alertmanager/config.yml to put your Slack's config.
