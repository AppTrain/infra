## *************************************
## build airflow virtual environment
## *************************************
FROM annalect/airflow-base as build
LABEL maintainer="Annalect"

COPY pyproject.toml /base
WORKDIR /base

RUN poetry install

## *************************************
## build aws cli virtual environment
## *************************************
FROM annalect/python:3.7-slim as awscli
RUN pip install awscli 

## *************************************
## build image for airflow
## *************************************
FROM annalect/python:3.7-slim as airflow
LABEL maintainer="Annalect"
ENV AIRFLOW_HOME=/usr/local/airflow

COPY --from=build /opt/venv /opt/venv
COPY --from=awscli /opt/venv /opt/awscli
COPY entrypoint.sh /opt/entrypoint.sh
RUN ls -las /opt \
    && ln -s /opt/awscli/bin/aws /usr/local/bin/aws \
    && useradd -ms /bin/bash -d ${AIRFLOW_HOME} airflow


#ENTRYPOINT /opt/entrypoint.sh


# EXPOSE 8080
# WORKDIR ${AIRFLOW_HOME}
# USER airflow
# CMD ["webserver"]
# COPY config/airflow.cfg ${AIRFLOW_USER_HOME}/airflow.cfg
# RUN chown -R airflow: ${AIRFLOW_USER_HOME}