FROM 348194362585.dkr.ecr.us-west-2.amazonaws.com/python:latest
RUN apt-get install -yqq build-essential libpq5 libpq-dev && \
    pip install "pgcli==2.1.1"
CMD pgcli