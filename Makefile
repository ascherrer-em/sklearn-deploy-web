THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: help build up down stop restart logs

help:
	make -pRrq  -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

build:
	docker-compose -f docker-compose.yml build $(c)
	docker-compose -f docker-compose.yml run --rm frontend-build yarn
	docker-compose -f docker-compose.yml run --rm frontend-build yarn build

up:
	docker-compose -f docker-compose.yml up -d $(c)

down:
	docker-compose -f docker-compose.yml down $(c)

stop:
	docker-compose -f docker-compose.yml stop $(c)

restart:
	docker-compose -f docker-compose.yml stop $(c)
	docker-compose -f docker-compose.yml up -d $(c)

logs:
	docker-compose -f docker-compose.yml logs --tail=100 -f $(c)

run:
	docker-compose -f docker-compose.yml up -d nginx

debug:
	docker-compose -f docker-compose.yml up -d nginx
	docker-compose -f docker-compose.yml logs --tail=100 -f
