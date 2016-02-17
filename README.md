# Delirious Visions

The testing fields for Justin Crossman, *Delirious Visions, LLC*

This is an instance of CentOS (docker centos:latest), with [nginx](http://nginx.org), [php](http://php.net) including php-fpm, [python setup tools](https://pypi.python.org/pypi/setuptools), [pip](https://pypi.python.org/pypi/pip) and [supervisor](http://supervisord.org).

Config files are mapped to files included in: [https://github.com/JustinCrossman/deliriousvisions.git](https://github.com/JustinCrossman/deliriousvisions.git)

## Update February 17, 2016

Now including [Node.js](https://nodejs.org/en/), [npm](https://www.npmjs.com/), and [Bower](http://bower.io/).

Configured for (simultaneous) [Laravel 5](https://laravel.com) application and [AngularJS](https://angularjs.org) w/ [Maverick](http://themeforest.net/item/maverick-responsive-admin-with-angularjs/11336355) applications. Applications included with [https://github.com/JustinCrossman/deliriousvisions.git](https://github.com/JustinCrossman/deliriousvisions.git) under `/html` (see `/nginx/config`).

## Installation

- Install [Docker](https://www.docker.com/)
- $ `docker pull centos:latest`
- $ `docker pull justincrossman/deliriousvisions`
- Install Git
- $ `git clone https://github.com/JustinCrossman/deliriousvisions.git`
- Set local permissions: e.g. host machine equivilant: chmod 777 -R /var/www/html/portal/storage

## Running The Project

$ `docker run --name web -d -p 8000:80 -v [your_local_path_to_html]:/var/www/html justincrossman/web`

$ `docker exec -it web bash`

Point your local browser to `http://192.168.99.100:8000/`

Set local host file entries:

`192.168.99.100 dv.dev`

`192.168.99.100  laravel.dv.dev`

`192.168.99.100  angular.dv.dev`