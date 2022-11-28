#!/usr/bin/bash 


pg_ctlcluster 12 main start
pg_ctlcluster 12 main reload
pg_ctlcluster 12 main stop


