all : up

up :
	sudo mkdir -p ~/data/inception_db
	sudo mkdir -p ~/data/inception_wb
	sudo docker compose -f srcs/docker-compose.yml up --build

clean :
	sh delete.sh

fclean : clean
	sudo rm -rf /home/agirona/data/inception_wp/*
	sudo rm -rf /home/agirona/data/inception_db/*
