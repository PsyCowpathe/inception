FROM	debian:buster

EXPOSE	9000

RUN	apt-get update -y

RUN	apt-get install -y curl

RUN	apt-get	install -y php7.3 \
			   php7.3-fpm \
			   php7.3-mysql \
			   php-common \
			   php7.3-json \
			   php7.3-readline

RUN	mkdir -p /var/www/html && \
	mkdir -p /run/php/php7.3-fpm

COPY	conf/wp-config.php /

COPY	conf/www.conf /etc/php/7.3/fpm/pool.d

COPY	tools/init.sh ./

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN	chmod +x wp-cli.phar init.sh
RUN	mv wp-cli.phar /usr/local/bin/wp

CMD	./init.sh
