FROM centos:centos7

MAINTAINER "Christoph Görn" <goern@redhat.com>

RUN yum -y install --setopt=tsflags=nodocs rsyslog && \
    yum clean all && \
    rm -rf /var/cache/yum/*

COPY rsyslog.conf /etc/rsyslog.conf

ENTRYPOINT [ "rsyslogd" ]
CMD [ "-n", "-f", "/etc/rsyslog.conf", "-i", "/tmp/rsyslog.pid" ]
