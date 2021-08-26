# Docker-Swarm
## Bootstrapping the nodes
Leader:
```sh
docker swarm init
```
Worker:
```sh
docker swarm join --token SWMTKN-1-35...y2neeposi4ou 10.0.16.204:2377
```
## Creating Swarm service
```sh
docker service create --replicas=5 --name=www --publish=8080:80 nginx
```
## Inspecting Swarm cluster
```sh
docker node ls
```
```sh
docker node inspect sgxi2ho9rs2dtlrqojuuftuqu --pretty
```
```sh
docker service ls
```
```sh
docker service ps www
```
```sh
docker service inspect www --pretty
```
## Scaling Swarm service
```sh
docker service scale www=5
```
```sh
docker service update --replicas=5 www
```
## Global Swarm services
Global Swarm services are essentially the same as Kubernetes DaemonSets. The service instructs each node to run one such task.
```sh
docker service create --name=runsOnEveryNode --mode=global -dt ubuntu
```
## Draining Swarm nodes
```sh
docker node update --availability=drain swarm03
```
```sh
docker node update --availability=active swarm03
```
## Locking Swarm cluster
The Swarm certificates are located ```/var/lib/docker/swarm/certificates```.
* swarm-node.crt
* swarm-node.key
* swarm-root-ca.crt
```sh
docker swarm update --autolock=true
```
Fetching the key:
```sh
docker swarm unlock-key
```
Rotating the key:
```sh
docker swarm unlock-key --rotate
```
## Mounting volumes in Swarm
```sh
docker service create --name=www --mount=type=volume,source=myvolume,target=/mypath nginx
```
## Scheduling Swarm services
```sh
docker node update --label-add=regions=nl-ams swarm02
swarm02
``` 
```sh
docker node inspect swarm02 --format='{{.Spec.Labels}}'
```
```sh
docker service create --name=www --constraint=node.labels.regions=nl-ams --replicas=3 nginx
``` 