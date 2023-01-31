all	:	up

up	:
		mkdir -p ~/data/inception_db
		mkdir -p ~/data/inception_wp
		docker-compose -f srcs/docker-compose.yml up --build

stop	:
		docker-compose  -f srcs/docker-compose.yml stop

down	:
		docker-compose -f srcs/docker-compose.yml down

destroy	:	
		docker-compose -f srcs/docker-compose.yml down
		sudo rm -rf ~/data/inception_db/*
		sudo rm -rf ~/data/inception_wp/*
		docker system prune -a -f --volumes
