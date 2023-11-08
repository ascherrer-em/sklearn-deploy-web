#!/bin/bash

docker-compose down 

docker-compose build
docker-compose run frontend-build yarn
docker-compose run frontend-build yarn build

docker-compose up -d nginx
