#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/bootstrap.sh"
docker stop $(docker ps -a -q)
docker-compose --project-name $PROJECTNAME up -d
