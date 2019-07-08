set -e 

echo "*****************"
echo $PACKER_BUILD_NAME

pg_isready -d $CLONE_DB
echo "Database $PGHOST is ready"

psql -d $CLONE_DB -c "select now();"
echo "Database $PGHOST check 2 complete"