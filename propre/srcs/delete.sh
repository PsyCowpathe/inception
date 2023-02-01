sudo docker system prune -a -f
OUTPUT=$(sudo docker images -aq)
sudo docker rmi -f ${OUTPUT}
