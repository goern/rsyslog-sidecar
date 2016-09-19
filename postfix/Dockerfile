FROM centos/systemd

MAINTAINER "Christoph Görn" <goern@redhat.com>

RUN yum -y install --setopt=tsflags=nodocs postfix && \
    yum clean all && \
    rm -rf /var/cache/yum/* && \
    systemctl enable postfix.service

COPY main.cf /etc/postfix/main.cf

EXPOSE 25

CMD ["/usr/sbin/init"]
