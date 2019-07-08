set -e 

echo "*****************"
echo $PACKER_BUILD_NAME

pg_isready -d $CLONE_DB
psql -d $CLONE_DB -c "select now();"
echo "*****************"
echo "Database $PGHOST is ready"

sudo mkdir -p /var/data
sudo chown -R ubuntu:ubuntu /var/data
pg_dump -d $ClONE_DB > /var/data/smp.sql