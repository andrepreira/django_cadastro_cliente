SHELL := /bin/bash

.PHONY: nginx logs

db:
	docker-compose --env-file ./.env up -d db

app:
	docker-compose --env-file ./.env up -d app

nginx:
	docker-compose --env-file ./.env up -d nginx

logs:
	docker-compose --env-file ./.env up -d logs

db-build:
	docker-compose --env-file ./.env up -d --build db

app-build:
	docker-compose --env-file ./.env up -d --build app

nginx-build:
	docker-compose --env-file ./.env up -d --build nginx