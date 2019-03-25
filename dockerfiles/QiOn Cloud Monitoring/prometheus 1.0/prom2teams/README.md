# prom2teams-Alpine


## To run this image, execute:
```
# docker container run -d --name prom2teams -p 8089:8089 infraws/monitoring:prom2teams-1.1.1
```

Open http://your_ip:8089 to access the interface of Prom2Teams.

## To view the logs, execute:
```
# docker container logs -f <container_id>
```

## To create a swarm service, execute:
```
# docker service create --name prom2teams -p 8089:8089 infraws/monitoring:prom2teams-1.1.1
```

PS: Edit /etc/prom2teams/config.ini to put your Teams config.
