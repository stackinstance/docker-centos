#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/bootstrap.sh"
docker exec -t -i -u root $DOCKERIMAGE"_1" bash
