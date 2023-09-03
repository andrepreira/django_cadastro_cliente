include .env

SHELL := /bin/bash
version ?= latest
APP_NAME=meu-site-profissional
IMAGE=$(DOCKER_USER)/$(APP_NAME):$(version)

.PHONY: nginx logs

publish: image
	docker push $(IMAGE)

docker-login:
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASSWORD)

image: docker-login
	docker build -t $(IMAGE) .

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