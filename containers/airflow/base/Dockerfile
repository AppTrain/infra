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
        libpq-dev \
        default-libmysqlclient-dev \
        build-essential \
        #tools
        git \
        freetds-bin \        
        postgresql-client \
        apt-utils \
        curl \
        rsync \
        netcat \
        locales \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && mkdir /base

COPY pyproject.toml /base
WORKDIR /base
RUN poetry install