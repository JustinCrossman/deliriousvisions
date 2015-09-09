# Dockerfile

# CentOS: specific version
FROM centos:latest

MAINTAINER Justin Crossman

# Best practice for security
RUN yum -y update && yum clean all

ADD repo/nginx.repo /etc/yum.repos.d/nginx.repo
ADD repo/remi.repo /etc/yum.repos.d/remi.repo

# Nginx: current version (warning: always watch for breaking features)
RUN yum -y install nginx

# PHP: current version (warning: always watch for breaking features)
RUN yum -y --enablerepo=remi,remi-php56 --skip-broken install php php-fpm php-common php-mbstring php-pdo

# Supervisor: current version (warning: always watch for breaking features)
RUN yum install -y python-setuptools
RUN easy_install pip
RUN pip install supervisor

# Mapping: local nginx config files
ADD nginx/config/nginx.conf /etc/nginx/nginx.conf
ADD nginx/config/default.conf /etc/nginx/conf.d/default.conf

# Mapping: local supervisor config files
ADD ["supervisord/config/supervisord.conf", "/etc/"]

EXPOSE 80

CMD ["supervisord", "-n"]
