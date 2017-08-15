#!/bin/bash
mkdir -p ./web

if [ ! -f ./docker ]; then ln -s ./vendor/stackinstance/docker-centos/docker ./; fi
if [ ! -f ./docker-compose.yml ]; then cp -R ./vendor/stackinstance/docker-centos/docker-compose.yml ./; fi
if [ ! -f ./project.cfg ]; then cp -R ./vendor/stackinstance/docker-centos/project.cfg ./; fi
if [ ! -f ./extra.sh ]; then cp -R ./vendor/stackinstance/docker-centos/extra.sh ./; fi
