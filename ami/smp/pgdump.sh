set -e 

echo "*****************"
echo "$PACKER_BUILD_NAME -- SMP DJANGO CLONE"

dig $PGHOST
pg_isready
psql -c "select now();"
echo "*****************"
echo "Database $PGDATABASE at $PGHOST is ready"

sudo mkdir -p /var/data
sudo chown -R ubuntu:ubuntu /var/data
pg_dump > /var/data/smp.sql