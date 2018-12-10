FROM alpine:3.8
MAINTAINER celestian "petr.celestian@gmail.com"

RUN apk add --no-cache bash wget xz git mariadb-client

COPY . /app/fivem
WORKDIR /app/fivem

# To check last FiveM version, please visit:
# http://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
ARG RPCM_FIVEM_VERSION='910-527e7123f4da2cf18512387a22d7ecb0f7db903a'

ARG RPCM_LICENSEKEY
ARG RPCM_HOSTNAME
ARG RPCM_MAXCLIENTS
ARG RPCM_DB_ROOT_PASSWORD
ARG RPCM_DB_NAME
ARG RPCM_DB_USER
ARG RPCM_DB_PASS

RUN docker/build.sh

# Expose FiveM port
EXPOSE 30120
EXPOSE 30120/udp


ENTRYPOINT ["docker/entrypoint.sh"]
