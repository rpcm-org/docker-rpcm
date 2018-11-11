#!/usr/bin/env bash

mkdir -p /app/fivem/server
mkdir -p /app/fivem/server-data

# FiveM server
wget http://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${RPCM_FIVEM_VERSION}/fx.tar.xz
tar xf ./fx.tar.xz \
    --exclude alpine/dev \
    --exclude alpine/proc \
    --exclude alpine/run \
    --exclude alpine/sys \
    -C ./server
rm -f ./fx.tar.xz

# branch: master | hash: '1624342'
git clone https://github.com/citizenfx/cfx-server-data server-data
