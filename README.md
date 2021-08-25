# Docker-Swarm

## Bootstrapping the nodes
Leader:
```sh
docker swarm init --advertise-addr 10.0.16.204
```
Worker:
```sh
docker swarm join --token SWMTKN-1-35...y2neeposi4ou 10.0.16.204:2377
```
Note the IPs might differ.
## Creating Swarm service
```sh
docker service create --name=www --replicas=2 nginx
```
## Inspecting Swarm cluster
```sh
docker node ls
```
```sh
docker service ls
```
```sh
docker service ps www
```
## Scaling Swarm service
```sh
docker service scale www=5
docker service update --replicas=5 www
```
## Global Swarm services
Global Swarm services are essentially the same as Kubernetes DaemonSets. The service instructs each node to run one such task.
```sh
docker service create --name=runsOnEveryNode --mode=global -dt ubuntu
```