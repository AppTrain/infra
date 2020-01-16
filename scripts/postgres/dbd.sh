#!/bin/bash
# source infra/scripts/postgres/dbd.sh

set -eu -o pipefail

# needed environment variables
test $PGHOST
test $PGPORT
test $PGDATABASE
test $PGUSER
test $PGPASSWORD

echo "*****************"
#echo "$PACKER_BUILD_NAME -- SMP $TARGET_DATABASE"

echo "HOST: $PGHOST PORT: $PGPORT"
#dig $PGHOST

# just a few sanity checks/debug
pg_isready
psql -c "\l"
psql -c "\dt"
psql -c "select now();"

echo "*****************"
pg_dump -j 16 -F d -f $DATA_DIR
pg_dumpall --roles-only > $DATA_DIR/roles.sql
echo "db dump complete"
