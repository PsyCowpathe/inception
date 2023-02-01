OUTPUT=$(sudo docker container ps -aq)
sudo docker stop ${OUTPUT}

sudo docker system prune -a -f

OUTPUT=$(sudo docker images -aq)
sudo docker rmi -f ${OUTPUT}

OP=$(sudo docker volume ls -q)
sudo docker volume rm ${OP}

sudo rm -rf /home/agirona/data/inception_wp/*
sudo rm -rf /home/agirona/data/inception_db/*

