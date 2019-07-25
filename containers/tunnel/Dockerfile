FROM 348194362585.dkr.ecr.us-west-2.amazonaws.com/python:ssh
    
COPY keys/entrypoint /root/.annalect/ssh/entrypoint
COPY ssh.config /root/.ssh/config

EXPOSE 1-65535
CMD ssh -N -L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT bastion
