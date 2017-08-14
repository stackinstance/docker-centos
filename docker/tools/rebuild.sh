#!/bin/bash
php ../../composer.phar update stackinstance/docker-centos
bash ../../vendor/stackinstance/docker-centos/install.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/bootstrap.sh"

read -p "Project '$PROJECTNAME' will be rebuild, the db will be deleted, type 'yes' to continue "
if [ "$REPLY" != "yes" ]; then
   exit
fi

docker-compose --project-name $PROJECTNAME down
docker rmi $DOCKERIMAGE
docker-compose --project-name $PROJECTNAME build --no-cache
docker-compose --project-name $PROJECTNAME up -d
docker exec -t -i -u apache $DOCKERIMAGE"_1" /bin/bash -c 'cd /var/www ; exec bash'
