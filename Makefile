up:
	sudo mkdir -p /home/acaplat/data/mariadb
	sudo mkdir -p /home/acaplat/data/wordpress
	docker-compose -f srcs/docker-compose.yml up -d

build:
	sudo mkdir -p /home/acaplat/data/mariadb
	sudo mkdir -p /home/acaplat/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	sudo rm -rf /home/acaplat/data/mariadb
	sudo rm -rf /home/acaplat/data/wordpress
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress
	docker system prune -f

logs:
	docker-compose -f srcs/docker-compose.yml logs