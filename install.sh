#!/bin/bash
mkdir -p ./web
ln -s ./vendor/stackinstance/docker-centos/docker ./
cp -R ./vendor/stackinstance/docker-centos/docker-compose.yml ./
cp -R ./vendor/stackinstance/docker-centos/project.cfg ./
if [ ! -f ./extra.sh ]; then cp -R ./vendor/stackinstance/docker-centos/extra.sh ./; fi
