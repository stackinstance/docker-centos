#!/bin/bash
php ../../composer.phar update stackinstance/docker-centos
bash ../../vendor/stackinstance/docker-centos/install.sh

docker-compose --project-name project down
docker rmi project_php-apache
docker-compose --project-name project build --no-cache
docker-compose --project-name project up -d

docker exec -t -i -u apache project_php-apache_1 /bin/bash -c 'cd /var/www ; exec bash'
