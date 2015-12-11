FROM centos:centos7
MAINTAINER Greco Rubio <greco@paradigma.com.mx>

LABEL License=GPLv2
LABEL Version=1.0.0

LABEL Build docker build --rm -t paradigma/c7-mariadb .

RUN yum -y install --setopt=tsflags=nodocs epel-release && \ 
    yum -y install --setopt=tsflags=nodocs mariadb-server bind-utils pwgen psmisc hostname && \ 
    yum -y erase vim-minimal && \
    yum -y update && yum clean all

ADD my.cnf /etc/my.cnf

RUN chmod 777 -R /var/lib/mysql

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld_safe"]
