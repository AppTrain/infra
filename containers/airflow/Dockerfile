FROM annalect/python:3.7-slim as build
LABEL maintainer="Annalect"

# Airflow
ARG AIRFLOW_VERSION=1.10.3
ARG AIRFLOW_USER_HOME=/usr/local/airflow
ARG AIRFLOW_DEPS=""
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

RUN useradd -ms /bin/bash -d ${AIRFLOW_HOME} airflow
WORKDIR ${AIRFLOW_HOME}

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
        apt-utils \
        curl \
        rsync \
        netcat \
        locales \
    && apt-get autoremove -yqq --purge \
    && apt-get clean

COPY pyproject.toml ${AIRFLOW_HOME}
RUN env && poetry install
        # setuptools \
        # wheel \
        # pytz \
        # pyOpenSSL \
        # ndg-httpsclient \
        # pyasn1 \
        # apache-airflow[crypto,celery,postgres,hive,jdbc,mysql,ssh${AIRFLOW_DEPS:+,}${AIRFLOW_DEPS}]==${AIRFLOW_VERSION} \
        # 'redis==3.2' \
     

# COPY script/entrypoint.sh /entrypoint.sh
# COPY config/airflow.cfg ${AIRFLOW_USER_HOME}/airflow.cfg
# RUN chown -R airflow: ${AIRFLOW_USER_HOME}
# EXPOSE 8080 5555 8793

# USER airflow
# WORKDIR ${AIRFLOW_USER_HOME}
# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["webserver"] # set default arg for entrypoint


FROM annalect/python:3.7-slim as airflow
LABEL maintainer="Annalect"
ENV AIRFLOW_HOME=/usr/local/airflow

COPY --from=build /opt/venv /opt/venv
WORKDIR ${AIRFLOW_HOME}
RUN useradd -ms /bin/bash -d ${AIRFLOW_HOME} airflow 
#RUN ls -las /opt/venv/bin && which python