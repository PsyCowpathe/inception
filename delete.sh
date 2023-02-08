OUTPUT=$(sudo docker container ps -aq)
if [ "$OUTPUT" != "" ]
then
	sudo docker stop ${OUTPUT}
fi

sudo docker system prune -a -f

OUTPUT=$(sudo docker images -aq)
if [ "$OUTPUT" != "" ]
then
	sudo docker rmi --force ${OUTPUT}
fi

OP=$(sudo docker volume ls -q)
if [ "$OP" != "" ]
then
	sudo docker volume rm ${OP}
fi
