# docker-rpcm

## Deploy

To deploy RP Crucial Mode with whole ecosystem, please follow those steps.

### Pre-Deploy

    # Edit environemt variables
    cp contrib/rpcm.env .rpcm.env
    vim .rpcm.env

    # Create directory database files
    mkdir -p /srv/fivem/db

### First Deploy

    git clone https://github.com/rpcm-org/docker-rpcm.git
    source .rpcm.env
    sudo -E docker-compose up -d --build

### Hints

    # interactive bash in container
    sudo docker exec -ti <container> /usr/bin/bash

    # to remove database data
    sudo rm -fR /srv/fivem/db/*

## Docker containers

RP Crucial Mode project provides this docker container:
* [rpcmorg/fivem](https://hub.docker.com/r/rpcmorg/fivem/)

For more documentation please visit [rpcm-org.github.io](https://rpcm-org.github.io/).
