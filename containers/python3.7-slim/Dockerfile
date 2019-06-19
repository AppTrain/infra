FROM python:3.7-slim
LABEL maintainer="Annalect"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

RUN apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends curl \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && pip3 install virtualenv

#RUN which python && which python3
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m virtualenv --python=/usr/local/bin/python3 $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"