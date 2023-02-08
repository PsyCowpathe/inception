all : up

up :
	sudo mkdir -p ~/data/inception_db
	sudo mkdir -p ~/data/inception_wp
	sudo docker compose -f srcs/docker-compose.yml up --build

clean :
	sh delete.sh

fclean : clean
	sudo rm -rf ~/data/inception_wp/*
	sudo rm -rf ~/data/inception_db/*
