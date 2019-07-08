set -e 

echo "*****************"
echo $PACKER_BUILD_NAME

pg_isready -d $CLONE_DB
psql -d $CLONE_DB -c "select now();"
echo "*****************"
echo "Database $PGHOST is ready"

pg_dump -d $ClONE_DB /tmp/dump.sql
