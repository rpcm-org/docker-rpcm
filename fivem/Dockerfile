FROM alpine:3.8
MAINTAINER celestian "petr.celestian@gmail.com"

RUN apk add --no-cache bash wget xz git mariadb-client

COPY . /app/fivem
WORKDIR /app/fivem

# To check last FiveM version, please visit:
# http://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
ARG RPCM_FIVEM_VERSION='807-a33d6db066568046a9a99b14b0fccb03bb978e2f'

ARG RPCM_LICENSEKEY
ARG RPCM_HOSTNAME
ARG RPCM_MAXCLIENTS
ARG RPCM_DB_ROOT_PASSWORD
ARG RPCM_DB_NAME
ARG RPCM_DB_USER
ARG RPCM_DB_PASS

RUN docker/build.sh

# FiveM server
RUN wget http://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${RPCM_FIVEM_VERSION}/fx.tar.xz
RUN tar xf ./fx.tar.xz \
    --exclude alpine/dev \
    --exclude alpine/proc \
    --exclude alpine/run \
    --exclude alpine/sys \
    -C ./server
RUN rm -f ./fx.tar.xz

# CFX-SERVER-DATA
# branch: master | hash: 1624342
RUN git clone https://github.com/citizenfx/cfx-server-data server-data

# FIVEM-MYSQL-ASYNC
# branch: master | hash: 296a2c6
RUN git clone https://github.com/brouznouf/fivem-mysql-async server-data/resources/mysql-async

# Expose FiveM port
EXPOSE 30120
EXPOSE 30120/udp


ENTRYPOINT ["docker/entrypoint.sh"]
