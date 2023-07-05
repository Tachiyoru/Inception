all: up

up:
	mkdir -p ${HOME}/data/mysql
	mkdir -p ${HOME}/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build

clean: stop
	docker system prune -a -f --volumes

clear: clean
	rm -rf /run/mkdir
	docker volume rm srcs_wordpress srcs_mariadb

stop:
	docker-compose -f srcs/docker-compose.yml down

re: clean all

show:
	docker ps
	docker volume ls -q
	docker container ls -q

.PHONY: up clean stop re
