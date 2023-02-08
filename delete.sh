#OUTPUT=$(sudo docker container ps -aq)
#sudo docker stop ${OUTPUT}

#sudo docker system prune -a -f

OUTPUT=$(sudo docker images -aq)
if [ "$OUTPUT" != "" ]
then
	sudo docker rmi --force ${OUTPUT}
fi

OUTPUT=$(sudo docker volume ls -q)
if [ "$OUTPUT" != "" ]
then
	sudo docker volume rm ${OUTPUT}
fi
