#!/bin/bash

set -eu -o pipefail

CONTEXT=$(pwd)
WORKDIR=/var/devtest
DBD=$WORKDIR/dbd.sh
DATA_DIR=$CONTEXT/tst_dump

export PGHOST="127.0.0.1"
export PGPORT="54320"
export PGDATABASE="testdb"
export PGUSER="postgres"
export PGPASSWORD=$(openssl rand -base64 16)
echo "*****************"

#  stop
docker stop dbdtest || true && docker rm -f dbdtest || true
rm -rf $DATA_DIR

# build
#docker build -t dbdtest .
docker run -d --name dbdtest -e POSTGRES_DB=$PGDATABASE -e POSTGRES_USER=$PGUSER -e POSTGRES_PASSWORD=$PGPASSWORD -p 54320:5432 postgres:10.7
echo "waiting for docker/postgres ..."
sleep 5
#docker run -d --name dbdtest -e POSTGRES_PASSWORD=$PGPASSWORD -p 54320:5432 -v pgdata:/var/lib/postgresql/data dbdtest

pg_restore -d $PGDATABASE dvdrental.tar
. dbd.sh

# stop
docker stop dbdtest || true && docker rm -f dbdtest || true

# unset $PGHOST
# unset $PGPORT
# unset $PGUSER
# unset $PGPASSWORD
