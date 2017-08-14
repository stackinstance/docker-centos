#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/bootstrap.sh"
docker exec -t -i -u apache $DOCKERIMAGE"_1" /bin/bash -c 'cd /var/www ; exec bash'
