# Delirious Visions

The testing fields for Justin Crossman, *Delirious Visions, LLC*

This is an instance of CentOS (docker centos:latest), with [nginx](http://nginx.org), php including php-fpm, all [Laravel 5](http://laravel.com) requirements, [python setup tools](https://pypi.python.org/pypi/setuptools), [pip](https://pypi.python.org/pypi/pip) and [supervisor](http://supervisord.org).

Config files are mapped to files included in: [https://github.com/JustinCrossman/deliriousvisions.git](https://github.com/JustinCrossman/deliriousvisions.git)

## Installation

- Install [Docker](https://www.docker.com/)
- $ `docker pull justincrossman/deliriousvisions`
- Install Git
- $ `git clone https://github.com/JustinCrossman/deliriousvisions.git`
- Set local permissions: e.g. host machine equivilant: chmod 777 -R /var/www/html/portal/storage

## Running The Project

$ `docker run --name web -d -p 8000:80 -v [your_local_path_to_html]:/var/www/html justincrossman/web`

$ `docker exec -it web bash`

Point your local browser to `http://192.168.99.100:8000/`