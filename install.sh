#!/bin/bash
mkdir -p ./web
ln -s ./vendor/stackinstance/docker-centos/docker ./
cp -R ./vendor/stackinstance/docker-centos/docker-compose.yml ./
cp -R ./vendor/stackinstance/docker-centos/extra.sh ./
