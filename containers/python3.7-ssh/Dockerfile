FROM annalect/python:3.7-slim 
RUN apt-get install -yqq git-core openssh-client bindfs kmod && \
    mkdir -p /root/.ssh && chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts