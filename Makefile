.PHONY: docker-build docker-run

docker-build:
	docker build -t set-game .

docker-run: docker-build
	docker run -p 8080:8080 set-game

docker-run-it: docker-build
	docker run -it -p 8080:8080 --entrypoint /bin/bash set-game

build-binary: docker-build
	mkdir -p build
	docker create --name set-temp set-game
	docker cp set-temp:/app/setgame.servermain build/setgame
	docker rm set-temp
