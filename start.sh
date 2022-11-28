#!/usr/bin/bash 


pg_ctlcluster 12 main start

su - postgres -c "psql -c 'create extension postgis;'"


su - postgres -c "psql"