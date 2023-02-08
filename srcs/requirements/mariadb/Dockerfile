#Specify the base image we use for building the container

FROM	debian:buster

#Run update and upgrade then install mariadb

RUN apt-get upgrade -y \
&& apt-get update -y \
&& apt-get install -y mariadb-server

#Delete original conf file of mariadb

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

#Copy mariadb conf file, init script and db init from host to container 

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY tools/init.sh ./

#Create file for database

RUN mkdir -p /var/run/mysqld/

#Setup file permission for user

RUN chown -R mysql:mysql /var/lib/mysql \
&& chmod 777 /var/lib/* \
&& chmod +x init.sh 

#Open port 3306

EXPOSE 3306

#Run init script

CMD "./init.sh"
