FROM percona:5.7.25
MAINTAINER ysykzheng <ysykart@gmail.com>

RUN apt-get update && yes N | apt-get install -y \
  --no-install-suggests percona-xtrabackup-24 \
  && rm -rf /var/lib/apt/lists/*
  
VOLUME /var/backup/mysql

CMD xtrabackup --backup --datadir /var/lib/mysql --target-dir=/target && \
    xtrabackup --prepare --target-dir=/target && \
    xtrabackup --prepare --target-dir=/target
