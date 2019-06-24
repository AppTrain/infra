## *************************************
## build aws cli virtual environment
## *************************************
FROM annalect/python:3.7-slim as awscli
RUN pip3 install virtualenv \
    && python3 -m virtualenv --python=/usr/local/bin/python3 /opt/awscli
ENV PATH="/opt/awscli/bin:$PATH"
RUN pip install awscli 

## *************************************
## build image for airflow
## *************************************
FROM annalect/airflow-base as airflow
LABEL maintainer="Annalect"
# Creating virtualenv annalect-airflow-py3.7 in /root/.cache/pypoetry/virtualenvs
ENV PATH="/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/bin:$PATH"
ENV AIRFLOW_HOME=/usr/local/airflow

COPY --from=awscli /opt/awscli /opt/awscli
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