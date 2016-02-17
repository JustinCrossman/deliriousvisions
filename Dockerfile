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
RUN yum -y --enablerepo=remi,remi-php56,remi-7,remi-7-php56 --skip-broken install php php-fpm php-common php-mbstring php-pdo

# Supervisor: current version (warning: always watch for breaking features)
RUN yum install -y python-setuptools
RUN easy_install pip
RUN pip install supervisor

# Git
RUN yum -y install git

# Ruby
RUN yum -y install ruby

# NodeJS
#RUN rpm --import http://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
#RUN curl -O https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#RUN rpm -ivh epel-release-6-8.noarch.rpm
RUN yum -y install epel-release
RUN yum -y --enablerepo=epel install nodejs npm

# Mapping: local nginx config files
ADD nginx/config/nginx.conf /etc/nginx/nginx.conf
ADD nginx/config/default.conf /etc/nginx/conf.d/default.conf
ADD nginx/config/common/common.conf /etc/nginx/conf.d/common/common.conf

# Mapping: local supervisor config files
ADD ["supervisord/config/supervisord.conf", "/etc/"]

# 2016 02 17 - Updates for NodeJS
RUN yum -y install wget
RUN wget http://nodejs.org/dist/v0.12.9/node-v0.12.9-linux-x64.tar.gz
RUN tar -xzvf node-v0.12.9-linux-x64.tar.gz
RUN mv node-v0.12.9-linux-x64 /node
RUN ln -s /node/bin/npm /usr/sbin/npm
RUN ln -s /node/bin/node /usr/sbin/node
RUN npm install -g --unsafe-perm npm

# 2016 02 17 - Install Global Packages
RUN npm install -g bower
RUN npm install -g grunt
RUN npm install -g karma@0.12.0
ADD html/angularjs/package.json /var/www/html/angularjs/package.json
ADD html/angularjs/bower.json /var/www/html/angularjs/bower.json
RUN npm install /var/www/html/angularjs/
RUN bower install --allow-root --force-latest /var/www/html/angularjs/
RUN mv -f /bower_components/ /var/www/html/angularjs/bower_components/

EXPOSE 80

CMD ["supervisord", "-n"]
