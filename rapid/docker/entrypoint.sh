#!/usr/bin/env bash

python setup.py develop
python utils.py db_init ${RPCM_DB_FILE}
uwsgi \
    --http 0.0.0.0:80 \
    --wsgi-file main.py \
    --callable app \
    --master \
    --processes 5 \
    --logto /app/rapid/var/rapid.log \
    --pidfile /tmp/rapid.pid
