# Volumes handler in host

## Create 
docker volume create demo_volume

## See details 
docker volume inspect demo_volume

## Start container with volume
docker container run -it -v demo_volume:/demo centos:7 bash

## Check volume mounted 
$ cat /proc/self/mountinfo | grep demo

## Create file in extenal volume
$ echo 'Hello persistent' > /demo/data.txt

## Drop container 
docker container rm -f <container ID>

## Create new container
docker container run  -v demo_volume:/demo centos:7 bash

## See file
$ cat /demo/data.txt

## Drop volume
docker volume rm demo_volume


# Mount host path
docker container run -d -v /home/local/app:/usr/share/nginx/html -p 8080:80 ngix
