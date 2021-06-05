all-up:
	@docker-compose -f docker-compose.yml -f docker-compose.dev.yml \
	up -d --build

all-down:
	@docker-compose -f docker-compose.yml -f docker-compose.dev.yml down -v

all-restart:
	make all-down
	make all-up

all-up-prod:
	@docker-compose -f docker-compose.yml -f docker-compose.prod.yml \
	up -d --build

all-down-prod:
	@docker-compose -f docker-compose.yml -f docker-compose.prod.yml down -v

all-restart-prod:
	make all-down-prod
	make all-up-prod

game-build:
	@docker build -t ctgame ./services/game

game-up:
	make game-build
	make game-down
	@docker network create --driver bridge game-nw
	@docker run -d --name redis --expose 6379 --network game-nw redis:6-alpine
	@docker run -dp 80:5000 --env-file .env.dev -v "${pwd}/services/game:/usr/src/app" --network game-nw --name ctg ctgame

game-down:
	-@docker network disconnect game-nw ctg
	-@docker network disconnect game-nw redis
	-@docker network rm game-nw
	-@docker rm -f redis
	-@docker rm -f ctg

game-debug:
	@docker-compose -f docker-compose.yml -f docker-compose.debug.yml up -d --build game

frontend-build:
	@docker build -t ctfrontend ./services/frontend

frontend-up:
	make frontend-build
	make frontend-down
	@docker run -dp 80:5000 --env-file .env.dev -v "${pwd}/services/frontend:/usr/src/app" --name ctf ctfrontend

frontend-down:
	-@docker rm -f ctf

frontend-debug:
	@docker-compose -f docker-compose.yml -f docker-compose.debug.yml up -d --build frontend

traefik-up:
	@docker-compose -f docker-compose.traefik.yml up -d --build

traefik-down:
	@docker-compose -f docker-compose.traefik.yml down -v




# to test-run interactive alpine session
# docker run -it -v "$(pwd):/app" alpine /bin/sh

# to debug a container when all is running
	# comment out the container that isn't desire in docker-compose.debug.yml
	# in debug container, make sure to not expose any port that interrupts other containers.
	# Run:
	# docker-compose -f .\docker-compose.yml -f .\docker-compose.dev.yml -f .\docker-compose.debug.yml up -d --build
	# Connect it with vscode debugger.
