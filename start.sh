#!/usr/bin/bash 


pg_ctlcluster 12 main start && su - postgres -c "psql -c 'create extension postgis;'" && pg_ctlcluster 12 main stop


# su - postgres -c "psql"
# pg_ctlcluster 12 main start
# postgres
su - postgres -c "PATH=$PATH:/usr/lib/postgresql/12/bin && export PGDATA=/etc/postgresql/12/main && postgres" 