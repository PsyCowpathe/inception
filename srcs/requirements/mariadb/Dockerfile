FROM	debian:buster

RUN apt-get upgrade -y \
&& apt-get update -y \
&& apt-get install -y procps \
&& apt-get install -y mariadb-server

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY tools/init.sh ./
COPY tools/init_db.sql ./

RUN mkdir -p /var/run/mysqld/

RUN chown -R mysql:mysql /var/lib/mysql \
&& chmod 777 /var/lib/* \
&& chmod +x init.sh 

EXPOSE 3306

CMD "./init.sh"
