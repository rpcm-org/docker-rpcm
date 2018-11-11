FROM fedora:29
MAINTAINER celestian "petr.celestian@gmail.com"

RUN echo "fastestmirror=true" >> /etc/dnf/dnf.conf
RUN dnf update -y
RUN dnf install -y wget xz git mariadb; dnf clean all

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

# Expose FiveM port
EXPOSE 30120
EXPOSE 30120/udp


ENTRYPOINT ["docker/entrypoint.sh"]
