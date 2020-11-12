.PHONY: build-dependencies docker-build docker-dev-environment

SHELL := bash

all: build-dependencies docker-build docker-dev-environment


run-dependencies:
	@docker-compose -f docker/docker-compose.yml up -d --build


stop-dependencies:
	@docker-compose -f docker/docker-compose.yml down


stop-dependencies-removing-volumes:
	@docker-compose -f docker/docker-compose.yml down -v


docker-build:
	@docker build -t locust-tests -f docker/Dockerfile .


docker-dev-environment: docker-build
	docker run --network host \
				--rm \
				-it \
				--mount type=bind,src=${PWD},target=/locust-tests \
				locust-tests sh
