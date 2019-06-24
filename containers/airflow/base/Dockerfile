FROM annalect/python:3.7-slim
LABEL maintainer="Annalect"

RUN mkdir -p /usr/share/man/man1 \
    && mkdir -p /usr/share/man/man7 \
    && apt-get install -yqq --no-install-recommends \
        freetds-dev \
        libkrb5-dev \
        libsasl2-dev \
        libssl-dev \
        libffi-dev \
        #libpq-dev \
        default-libmysqlclient-dev \
        build-essential \
        #tools
        ca-certificates \
        gpg \
        git \
        freetds-bin \        
        #postgresql-client \
        apt-utils \
        curl \
        rsync \
        netcat \
        locales \
    && curl -s -N https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && echo deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main > /etc/apt/sources.list.d/pgdg.list \
    && apt-get update \
    && apt-get install -yqq --no-install-recommends postgresql-client-11 libpq-dev \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && mkdir /base

COPY pyproject.toml /base
WORKDIR /base
RUN poetry install