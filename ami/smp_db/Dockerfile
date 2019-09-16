FROM postgres:10

WORKDIR /app
COPY /var/data/smp.sql smp.sql
RUN psql -f smp.sql
