# docker-rpcm

## Deploy

To deploy RP Crucial Mode with whole ecosystem, please follow those steps.

### Pre-Deploy

    # Clone repository
    git clone https://github.com/rpcm-org/docker-rpcm.git

    # Change the directory
    cd docker-rpcm/

    # Edit environemt variables
    cp contrib/rpcm.env .rpcm.env
    vim .rpcm.env

    # Create directory database files
    mkdir -p /srv/fivem/db

### First Deploy

    source .rpcm.env
    sudo docker-compose pull
    sudo -E docker-compose up -d --build

### Hints

    # To stop docker-compose ecosystem
    docker-compose down

    # Interactive bash in container
    sudo docker exec -ti <container> /usr/bin/bash

    # To remove database data
    sudo rm -fR /srv/fivem/db/*

## Docker containers

RP Crucial Mode project provides this docker container:
* [rpcmorg/fivem](https://hub.docker.com/r/rpcmorg/fivem/)

For more documentation please visit [rpcm-org.github.io](https://rpcm-org.github.io/).
