set -e

echo "*****************"
echo "$PACKER_BUILD_NAME -- SMP DJANGO CLONE"

sudo -u postgres psql -q -f /var/data/smp.sql
#sudo -u postgres pg_restore -e -O -x /var/data/smp.sql
sudo -u postgres psql -q -c "select * from information_schema.schemata;"
# echo "*****************"
# echo "Database $PGDATABASE at $PGHOST is ready"
