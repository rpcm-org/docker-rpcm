FROM rpcmorg/fivem
MAINTAINER celestian "petr.celestian@gmail.com"

COPY . /app/fivem
WORKDIR /app/fivem

RUN apk add --no-cache lua5.3 lua5.3-sql-mysql

ARG RPCM_LICENSEKEY
ARG RPCM_HOSTNAME
ARG RPCM_MAXCLIENTS
ARG RPCM_DB_ROOT_PASSWORD
ARG RPCM_DB_NAME
ARG RPCM_DB_USER
ARG RPCM_DB_PASS

RUN ./docker/git_clone_branch.sh https://github.com/rpcm-org/rpcm.git server-data/resources/rpcm user_dev

# Expose FiveM port
EXPOSE 30120
EXPOSE 30120/udp


ENTRYPOINT ["docker/entrypoint.sh"]
