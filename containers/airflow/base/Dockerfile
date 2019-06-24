FROM annalect/python:3.7-slim
LABEL maintainer="Annalect"

RUN apt-get install -yqq --no-install-recommends \
        freetds-dev \
        libkrb5-dev \
        libsasl2-dev \
        libssl-dev \
        libffi-dev \
        libpq-dev \
        git \
        freetds-bin \
        build-essential \
        default-libmysqlclient-dev \
        #postgresql-client \
        apt-utils \
        curl \
        rsync \
        netcat \
        locales \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && mkdir /base