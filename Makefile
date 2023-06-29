all: up

up:
	mkdir -p ${HOME}/data/mysql
	mkdir -p ${HOME}/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build

clean: stop
	docker system prune -a -f --volumes

stop:
	docker-compose -f srcs/docker-compose.yml down

re: clean all

.PHONY: up clean stop re
