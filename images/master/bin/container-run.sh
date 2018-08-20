#!/usr/bin/env bash

docker run \
    -d \
    -i \
    -t \
    --name jenkins-master \
    -p 8080:8080 \
    -p 50000:50000 \
    --restart on-failure \
    467873314609.dkr.ecr.ap-southeast-1.amazonaws.com/pdax-jenkins:2.121.2 \
    -v $(which docker):/usr/bin/docker \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /root/workspace \
    jenkins-master &&\
    docker logs -f jenkins-master;
