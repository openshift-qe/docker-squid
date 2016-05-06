FROM centos
MAINTAINER openshift-qe

ENV SQUID_VERSION=3.3.8 \
    SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

RUN yum install -y squid
RUN chmod -R 777 /var/spool/squid
RUN chmod -R 777 /var/log/squid
RUN chmod 777 /etc/squid/squid.conf
RUN chmod -R 777 /var/run
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
VOLUME ["${SQUID_CACHE_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
