#!/bin/bash

cd frontend
yarn build

cd ..
docker-compose up -d nginx
