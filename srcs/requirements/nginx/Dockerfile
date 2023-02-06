#Specify the base image we use for building the container
FROM debian:buster


#Run update and upgrade then install nginx 

RUN apt-get upgrade -y \
&& apt-get update -y \
&& apt-get install -y nginx

#Install openssl then use it for generating signed certificate and private key (for nginx SSL) 

RUN apt-get install -y openssl \
&& openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Lyon/O=42/OU=42/CN=agirona" -newkey rsa:4096 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt

#Copy the nginx.conf from host to the container

COPY conf/nginx.conf /etc/nginx/sites-enabled

#Open port 443

EXPOSE 443

#Avoid nginx to run in background wich prevent the container to stop at the end of execution

CMD [ "nginx", "-g", "daemon off;" ]
