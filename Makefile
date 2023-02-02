COMPOSE_FILE = srcs/docker-compose.yml
WP_VOLUME = /home/sohan/data/wordpress
MARIADB_VOLUME = /home/sohan/data/mariadb

up : 
	@sudo mkdir -p ${WP_VOLUME}
	@sudo mkdir -p ${MARIADB_VOLUME}
	sudo docker compose -f ${COMPOSE_FILE} up -d

down :
	@sudo docker compose -f ${COMPOSE_FILE} down

rdown :
	@sudo docker compose -f ${COMPOSE_FILE} down --rmi all --remove-orphans

clean : rdown
	@sudo rm -rf ${WP_VOLUME}/*
	@sudo rm -rf ${MARIADB_VOLUME}/*

re : down up

rre : rdown up

.PHONY: up down clean re rre rdown