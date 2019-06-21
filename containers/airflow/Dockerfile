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

# COPY script/entrypoint.sh /entrypoint.sh
# COPY config/airflow.cfg ${AIRFLOW_USER_HOME}/airflow.cfg
# RUN chown -R airflow: ${AIRFLOW_USER_HOME}
# EXPOSE 8080 5555 8793

# USER airflow
# WORKDIR ${AIRFLOW_USER_HOME}
# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["webserver"] # set default arg for entrypoint

## *************************************
## build image for airflow
## *************************************
FROM annalect/python:3.7-slim as airflow
LABEL maintainer="Annalect"
ENV AIRFLOW_HOME=/usr/local/airflow

COPY --from=build /opt/venv /opt/venv
COPY --from=awscli /opt/venv /opt/awscli
RUN ls -las /opt/awscli/bin
RUN ln -s /opt/awscli/bin/aws /usr/local/bin/aws
# COPY entrypoint.sh /entrypoint.sh
# RUN useradd -ms /bin/bash -d ${AIRFLOW_HOME} airflow
# EXPOSE 8080

# WORKDIR ${AIRFLOW_HOME}
# USER airflow
# ENTRYPOINT /entrypoint.sh
# CMD ["webserver"]

#RUN ls -las /opt/venv/bin && which python

# COPY script/entrypoint.sh /entrypoint.sh
# COPY config/airflow.cfg ${AIRFLOW_USER_HOME}/airflow.cfg

# RUN chown -R airflow: ${AIRFLOW_USER_HOME}

# EXPOSE 8080 5555 8793

# USER airflow
# WORKDIR ${AIRFLOW_USER_HOME}
# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["webserver"] # set default arg for entrypoint