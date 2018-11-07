# Ocherstration with Docker Compose and Swarm

## Docker Compose
 Recommends to manager multiples containers in `single` machine (node)

 * Simple
 * Flexible
 * Readable

 You can isolated services in specify bridges, very usefull!

### Simple commands to use Docker Compose
````bash
docker-compose ps # see list of services
docker-compose up -d --build # up services of compose
docker-compose scale api=2 # increase scale
docker-compose logs --tail 20 --follow #  see logs
docker-compose down # down all containers
````


## Swarm
 Recommend to manager multiples containers in `multiples` machines (nodes)

 * More complexity (SWIM protols to undestand cost of updated)
 * Flexible
 * Readable
 * Native
 * Can reuse ``docker-compose.yml`` file

### Initialize network Swarm
````bash
docker swarm init  # in node-0 (manager host)
docker swarm join --token TOKEN_ID MANAGER_HOST_IP # in node-x (slave hosts)
docker swarm leave --force # to leave of network
````

### Confirm Swarm mode enable 
````bash
docker system info
````

### Commands
````bash
docker node ls # see you nodes in swarm network
docker service create --replicas 2 --name demo_swarm centos:7 ping google.com
docker service ps demo-swarm
docker service update demo_swarm --replicas=4
docker service rm $(docker service ls -q)
````


### Start Swarm with compose file
````bash
docker stack deploy -c=docker-compose.yml demo_app
docker stack service demo_app
docker stack rm demo_app
````

### Apply rules of Swarm in compose file
````yml
 webui:
  image: mbahiense/dockercoins_webui:1.0
  networks:
   - dockercoins
  deploy:
   replicas: `2`
````
 
