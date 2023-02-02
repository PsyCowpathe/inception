OUTPUT=$(sudo docker container ps -aq)
sudo docker stop ${OUTPUT}

sudo docker system prune -a -f

OUTPUT=$(sudo docker images -aq)
sudo docker rmi -f ${OUTPUT}

OP=$(sudo docker volume ls -q)
sudo docker volume rm ${OP}
