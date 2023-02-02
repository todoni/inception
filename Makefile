COMPOSE_FILE = srcs/docker-compose.yml
WP_VOLUME = /home/sohan/data/wordpress
MARIADB_VOLUME = /home/sohan/data/mariadb
LOCALHOST = 127.0.0.1
DOMAIN = sohan.42.fr
LOCAL_DNS_FILE = /etc/hosts

up : 
	@sudo mkdir -p ${WP_VOLUME}
	@sudo mkdir -p ${MARIADB_VOLUME}
	@sudo grep -qxF "${LOCALHOST} ${DOMAIN}" ${LOCAL_DNS_FILE} || echo "${LOCALHOST} ${DOMAIN}" >> ${LOCAL_DNS_FILE}
	@sudo docker compose -f ${COMPOSE_FILE} up -d

down :
	@sudo docker compose -f ${COMPOSE_FILE} down

rdown :
	@sudo docker compose -f ${COMPOSE_FILE} down --rmi all --remove-orphans

clean : rdown
	@sudo rm -rf ${WP_VOLUME}
	@sudo rm -rf ${MARIADB_VOLUME}

re : down up

rre : rdown up

f : clean up

.PHONY: up down clean re rre rdown f