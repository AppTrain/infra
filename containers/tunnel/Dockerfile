FROM 348194362585.dkr.ecr.us-west-2.amazonaws.com/python:ssh

COPY keys/dev1_bastion /root/.annalect/ssh/dev1_bastion
COPY ssh.config /root/.ssh/config

EXPOSE 1-65535
CMD ssh -v -N -L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT bastion
