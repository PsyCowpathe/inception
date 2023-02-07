#Specify the base image we use for building the container

FROM debian:buster

#Run update and upgrade then install wget, curl, postfix, create file who will be used later then jump in the host shared folder to wget worpress, unzip it and rename it

RUN apt-get upgrade -y \
&& apt-get update -y \
&& apt-get install -y wget \
&& apt-get install -y curl \
&& apt-get install -y postfix \
&& mkdir -p /var/www/html \
&& mkdir -p /run/php/php7.3-fpm \
&& cd /var/www \
&& wget http://fr.wordpress.org/latest-fr_FR.tar.gz \
&& tar -xzvf latest-fr_FR.tar.gz \
&& mv wordpress wp

#Install all php lib required

RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-json php7.3-readline

#Copy config file from host to container

COPY conf/wp-config.php ./
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY tools/init.sh ./

#Install wp-cli, a wordpress command line interface to be used later in init script

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar init.sh
RUN mv wp-cli.phar /usr/local/bin/wp

#Give file propperty to user

RUN chown -R www-data. /var/www/html 

#Oppening port 9000

EXPOSE 9000

#Run the init script

CMD ./init.sh
