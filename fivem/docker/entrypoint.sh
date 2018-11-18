#!/usr/bin/env bash

sleep 10

export RPCM_DB_IP=`getent hosts rpcm_db | awk '{ print $1 }'`

# Configuration
if [ ! -f config_initialized.mark ]; then
    cp conf/server.cfg.in server-data/server.cfg
    sed -i -e "s/{RPCM_HOSTNAME}/${RPCM_HOSTNAME}/g" server-data/server.cfg
    sed -i -e "s/{RPCM_MAXCLIENTS}/${RPCM_MAXCLIENTS}/g" server-data/server.cfg
    sed -i -e "s/{RPCM_LICENSEKEY}/${RPCM_LICENSEKEY}/g" server-data/server.cfg

    sed -i -e "s/{RPCM_DB_IP}/${RPCM_DB_IP}/g" server-data/server.cfg
    sed -i -e "s/{RPCM_DB_NAME}/${RPCM_DB_NAME}/g" server-data/server.cfg
    sed -i -e "s/{RPCM_DB_USER}/${RPCM_DB_USER}/g" server-data/server.cfg
    sed -i -e "s/{RPCM_DB_PASS}/${RPCM_DB_PASS}/g" server-data/server.cfg

    touch mark.config
fi

# Start and stop FiveM
cd server-data
bash /app/fivem/server/run.sh +exec server.cfg >> ../fivem.log  2>&1 &
echo $! > ../fivem_0.pid
sleep 10
kill -9 `cat ../fivem_0.pid`
rm ../fivem_0.pid
sleep 5

# Final start of FiveM
touch ../mark.fivem
bash /app/fivem/server/run.sh +exec server.cfg >> ../fivem.log 2>&1
