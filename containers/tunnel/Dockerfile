FROM 348194362585.dkr.ecr.us-west-2.amazonaws.com/python:ssh
# anna is short for annalectual

RUN groupadd anna && \ 
    useradd -g anna anna && \
    mkdir -p /home/anna/.ssh 
    
COPY keys/entrypoint /home/anna/.ssh/entrypoint
COPY ssh.config /home/anna/.ssh/config
RUN chown -R anna:anna /home/anna

USER anna
ENTRYPOINT [ "ssh" ]
#CMD [ "-L", "*:5432:somedb.build-ops.out.accuenplatform.com:5432", "bastion" ]
