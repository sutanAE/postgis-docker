FROM ubuntu:22.04


ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get upgrade



RUN apt-get install -y \
    curl \
    systemd \
    wget

RUN apt-get install -y gnupg

RUN apt-get install -y lsb-release
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update 


RUN apt-get install -y \
    postgresql-12  \
    postgresql-client-12 \
    libpq-dev \ 
    postgresql-server-dev-12 \
    postgresql-12-postgis 

USER postgres psql -c 'create extension postgis;'

USER root


RUN mkdir /scripts /data 
COPY start.sh /scripts 

COPY ./pg_hba.conf /etc/postgresql/12/main
COPY ./postgresql.conf /etc/postgresql/12/main

COPY ./reload.sh /scripts



RUN sh /scripts/reload.sh 


CMD ["bash", "/scripts/start.sh"]
