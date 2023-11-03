all : up

up : 
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps
fclean : down
	@docker container prune --force
	@docker image prune --force --all
	@docker network prune --force
	@docker volume rm mariadb
	@docker volume rm wordpress
	@sudo rm -fr ~/data/mariadb/* 
	@sudo rm -fr ~/data/wordpress/*
