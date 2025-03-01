include .env
all: up

up:
	mkdir -p /Users/rintaro/risasada/inception/data/wp
	mkdir -p /Users/rintaro/risasada/inception/data/db
	docker-compose build
	docker-compose up

down:
	@docker-compose down

clean:
	@docker-compose -f down
	@-docker network rm `docker network ls -q`
	@-docker network rm $(docker network ls -q --filter type=custom)
	@-docker rmi -f `docker images -qa`
	@-docker volume rm `docker volume ls -q`
	@-docker network rm `docker network ls -q`
	@rm -rf /Users/rintaro/risasada
	@docker volume prune -f
	@-docker system prune -f
	@echo "clean finished"

.PHONY: up down clean