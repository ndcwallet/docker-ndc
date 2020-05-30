#!/bin/sh

# This script sets up the base ndcd.conf file to be used by the ndcd process. It only has
# an effect if there is no ndc.conf file in ndcd's work directory.
#
# The options it sets can be tweaked by setting environmental variables when creating the docker
# container.
#

set -e

if [ -e "/root/.ndc/ndc.conf" ]; then
    exit 0
fi

if [ -z ${ENABLE_WALLET:+x} ]; then
    echo "disablewallet=1" >> "/root/.ndc/ndc.conf"
fi

if [ ! -z ${MAX_CONNECTIONS:+x} ]; then
    echo "maxconnections=${MAX_CONNECTIONS}" >> "/root/.ndc/ndc.conf"
fi

if [ ! -z ${RPC_SERVER:+x} ]; then
    RPC_USER=${RPC_USER:-ndcrpc}
    RPC_PASSWORD=${RPC_PASSWORD:-$(dd if=/dev/urandom bs=20 count=1 2>/dev/null | base64)}

    echo "server=1" >> "/root/.ndc/ndc.conf"
    echo "rpcuser=${RPC_USER}" >> "/root/.ndc/ndc.conf"
    echo "rpcpassword=${RPC_PASSWORD}" >> "/root/.ndc/ndc.conf"
fi;
