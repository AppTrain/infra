FROM annalect/python:3.7-ssh as build
# anna is short for annalectual

RUN groupadd anna && \ 
    useradd -g anna anna && \
    mkdir -p /home/anna/.ssh 
    
COPY keys/entrypoint /home/anna/.ssh/entrypoint
COPY keys/smp_dev_db_2019_07 /home/anna/.ssh/database
COPY ssh.config /home/anna/.ssh/config
RUN chown -R anna:anna /home/anna

USER anna
ENTRYPOINT [ "ssh" ]
#CMD [ "-L", "*:5432:somedb.build-ops.out.accuenplatform.com:5432", "bastion" ]


# RUN mkdir /home/anna/.ssh && \
#     mkdir /home/anna/.ssh-external && \
#     echo "bindfs#/home/anna/.ssh-external /home/anna/.ssh fuse force-user=anna,foce-group=anna,perms=0700 0 0" >> /etc/fstab && \
#     chown -R anna:anna /home/anna/.ssh-external
