FROM postgres:12

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install wget iputils-ping && \
    wget https://github.com/zubkov-andrei/pg_profile/releases/download/0.3.6/pg_profile--0.3.6.tar.gz && \
    tar xzf pg_profile--0.3.6.tar.gz --directory $(pg_config --sharedir)/extension && \
    apt-get -y purge wget && \
    apt-get update && \
    apt-get clean all && \
    apt-get -y autoremove --purge && \
    unset DEBIAN_FRONTEND && \
    echo 'alias nocomments="sed -e :a -re '"'"'s/<!--.*?-->//g;/<!--/N;//ba'"'"' | grep -v -P '"'"'^\s*(#|;|$)'"'"'"' >> ~/.bashrc

RUN mkdir -p /var/lib/postgresql/backups && \
    chown -R 999:999 /var/lib/postgresql/backups && \
    chmod 777 /var/lib/postgresql/backups
	
COPY *.sh /var/lib/postgresql/

RUN chown 999:999 /var/lib/postgresql/* && \
    chmod 700 /var/lib/postgresql/*.sh

VOLUME /var/lib/postgresql/backups

WORKDIR /var/lib/postgresql
