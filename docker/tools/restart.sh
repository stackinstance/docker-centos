#!/bin/bash
export COMPOSE_TLS_VERSION=TLSv1_2
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/bootstrap.sh"
docker-compose --project-name $PROJECTNAME stop
docker-compose --project-name $PROJECTNAME up -d
