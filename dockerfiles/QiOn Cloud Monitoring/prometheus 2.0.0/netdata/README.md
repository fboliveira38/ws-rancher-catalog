# Netdata

## To run this image, execute:
```
# docker container run -d --name netdata -v /proc:/host/proc:ro -v /sys:/host/sys:ro -v /var/run/docker.sock:/var/run/docker.sock:ro --cap-add SYS_PTRACE --env NETDATA_PORT=19999 -p 19999:19999 infraws/monitoring:netdata-2.0.0
```

Open http://your_ip:19999 to access the interface of Prometheus.

## To view the logs, execute:
```
# docker container logs -f <container_id>
```

## To create a swarm service, execute:
```
# docker service create --name netdata -p 19999:19999 infraws/monitoring:netdata-2.0.0
```
