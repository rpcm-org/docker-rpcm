FROM python:3.6-alpine
MAINTAINER celestian "petr.celestian@gmail.com"

RUN apk add --no-cache bash git

COPY . /app/rapid
WORKDIR /app/rapid

ARG RPCM_DB_FILE

RUN mkdir -p /app/rapid/var/
RUN ./docker/git_clone_branch.sh https://github.com/rpcm-org/rapid.git source
RUN cp -r source/* .
RUN rm -fr source
RUN tox -re py36

ENTRYPOINT ["docker/entrypoint.sh"]
