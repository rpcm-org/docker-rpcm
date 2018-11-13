FROM rpcmorg/fivem
MAINTAINER celestian "petr.celestian@gmail.com"

RUN apk add --no-cache bash git mariadb-client

COPY . /app/fivem
WORKDIR /app/fivem

ARG RPCM_LICENSEKEY
ARG RPCM_HOSTNAME
ARG RPCM_MAXCLIENTS
ARG RPCM_DB_ROOT_PASSWORD
ARG RPCM_DB_NAME
ARG RPCM_DB_USER
ARG RPCM_DB_PASS

RUN git clone https://github.com/rpcm-org/rpcm.git server-data/resources/rpcm

# Expose FiveM port
EXPOSE 30120
EXPOSE 30120/udp


ENTRYPOINT ["docker/entrypoint.sh"]
