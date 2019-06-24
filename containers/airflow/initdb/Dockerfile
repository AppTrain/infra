FROM annalect/airflow:1.10.3
LABEL maintainer="Annalect"
ENV AIRFLOW_HOME=/usr/local/airflow

COPY airflow.cfg ${AIRFLOW_HOME}/airflow.cfg
USER airflow
#RUN airflow initdb

