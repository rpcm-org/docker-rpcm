#!/usr/bin/env bash

sleep 10

export RPCM_LOCAL_IP=`getent hosts fivem | awk '{ print $1 }'`
export RPCM_DB_IP=`getent hosts rpcm_db | awk '{ print $1 }'`

# Configuration
if [ ! -f config_initialized.mark ]; then
    cp conf/server.cfg.in server-data/server.cfg
    sed -i -e "s/{RPCM_HOSTNAME}/${RPCM_HOSTNAME}/g" server-data/server.cfg
    sed -i -e "s/{RPCM_MAXCLIENTS}/${RPCM_MAXCLIENTS}/g" server-data/server.cfg
    sed -i -e "s/{RPCM_LICENSEKEY}/${RPCM_LICENSEKEY}/g" server-data/server.cfg

    sed -i -e "s/{RPCM_DB_NAME}/${RPCM_DB_IP}/g" server-data/server.cfg
    sed -i -e "s/{RPCM_DB_NAME}/${RPCM_DB_NAME}/g" server-data/server.cfg
    sed -i -e "s/{RPCM_DB_USER}/${RPCM_DB_USER}/g" server-data/server.cfg
    sed -i -e "s/{RPCM_DB_PASS}/${RPCM_DB_PASS}/g" server-data/server.cfg

    touch mark.config
fi

# Database initialization
if [ ! -f mysql_initialized.mark ]; then

    cp server-data/resources/rpcm/sql/create_database.sql.in server-data/resources/rpcm/sql/create_database.sql
    cp server-data/resources/rpcm/sql/grant_user_to_database.sql.in server-data/resources/rpcm/sql/grant_user_to_database.sql

    sed -i -e "s/{RPCM_DB_NAME}/${RPCM_DB_NAME}/g" server-data/resources/rpcm/sql/create_database.sql
    sed -i -e "s/{RPCM_DB_CHARSET}/${RPCM_DB_CHARSET}/g" server-data/resources/rpcm/sql/create_database.sql
    sed -i -e "s/{RPCM_DB_COLLATE}/${RPCM_DB_COLLATE}/g" server-data/resources/rpcm/sql/create_database.sql

    sed -i -e "s/{RPCM_LOCAL_IP}/${RPCM_LOCAL_IP}/g" server-data/resources/rpcm/sql/grant_user_to_database.sql
    sed -i -e "s/{RPCM_DB_NAME}/${RPCM_DB_NAME}/g" server-data/resources/rpcm/sql/grant_user_to_database.sql
    sed -i -e "s/{RPCM_DB_USER}/${RPCM_DB_USER}/g" server-data/resources/rpcm/sql/grant_user_to_database.sql
    sed -i -e "s/{RPCM_DB_PASS}/${RPCM_DB_PASS}/g" server-data/resources/rpcm/sql/grant_user_to_database.sql

    mysql -h rpcm_db -u root --password=${RPCM_DB_ROOT_PASSWORD} < server-data/resources/rpcm/sql/create_database.sql >>import.log 2>&1
    mysql -h rpcm_db -u root --password=${RPCM_DB_ROOT_PASSWORD} < server-data/resources/rpcm/sql/grant_user_to_database.sql >>import.log 2>&1
    mysql -h rpcm_db -u root --password=${RPCM_DB_ROOT_PASSWORD} ${RPCM_DB_NAME} < server-data/resources/rpcm/sql/schema.sql >>import.log 2>&1

    touch mark.rpcm_db
    sleep 2
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
touch ../mark.rpcm
bash /app/fivem/server/run.sh +exec server.cfg >> ../fivem.log 2>&1
