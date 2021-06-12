FROM amazonlinux:latest

ENV PGBOUNCER_VERSION="1.15.0"

RUN yum -y update && \
    yum -y install git tar gcc openssl-devel openssl-perl openssl-static libevent-devel pam pam-devel wget

RUN wget -O pgbouncer.tar.gz https://www.pgbouncer.org/downloads/files/$PGBOUNCER_VERSION/pgbouncer-${PGBOUNCER_VERSION}.tar.gz && \
    tar -xvxf pgbouncer.tar.gz && \
    cd pgbouncer-${PGBOUNCER_VERSION} && \
    ./configure --prefix=/usr/local --with-pam && \
    make && \
    make install && \
    cd .. && \
    rm -rf pgbouncer.tar.gz pgbouncer-${PGBOUNCER_VERSION}

CMD ["sleep", "infinity"]

