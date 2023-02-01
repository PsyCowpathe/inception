FROM		debian:buster

EXPOSE		3306

RUN		apt-get update -y
RUN		apt-get upgrade -y
RUN		apt-get install -y mariadb-server
RUN		apt-get install -y procps

RUN		rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY		conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY		tools/init.sh ./
COPY		tools/init_db.sql ./

RUN		mkdir -p /var/run/mysqld/

RUN		chown -R mysql:mysql /var/lib/mysql && \
		chmod 777 /var/lib/* && \
		chmod +x init.sh

CMD		"./init.sh"
