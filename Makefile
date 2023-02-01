COMPOSE_FILE = srcs/docker-compose.yml
WP_VOLUME = /home/sohan/data/wordpress
MARIADB_VOLUME = /home/sohan/data/mariadb
HOST_FILE = /etc/hosts
HOST_IP = 127.0.0.1
HOST_DOMAIN = sohan.42.fr

up : clean 
	@sudo mkdir -p ${WP_VOLUME}
	@sudo mkdir -p ${MARIADB_VOLUME}
	@sudo grep -qxF "${HOST_IP} ${HOST_DOMAIN}" ${HOST_FILE} || echo "${HOST_IP} ${HOST_DOMAIN}" >> ${HOST_FILE}
	sudo docker-compose -f ${COMPOSE_FILE} up --build -d

down:
	@sudo docker-compose -f ${COMPOSE_FILE} down --rmi all --remove-orphans

clean :
	@sudo rm -rf ${WP_VOLUME}/*
	@sudo rm -rf ${MARIADB_VOLUME}/*

re : down up

.PHONY: up down clean re