FROM debian:buster

RUN apt-get upgrade -y \
&& apt-get update -y \
&& apt-get install -y nginx

RUN apt-get install -y openssl \
&& openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Lyon/O=42/OU=42/CN=agirona" -newkey rsa:4096 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt

COPY conf/nginx.conf /etc/nginx/sites-enabled

EXPOSE 443

CMD	[ "nginx", "-g", "daemon off;" ]

#ENTRYPOINT echo "ntm"
