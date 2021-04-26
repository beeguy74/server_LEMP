FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    nginx \
    php php-mysqli php-fpm\
    mariadb-server\
    openssl

COPY srcs/start.sh ./

CMD bash start.sh

EXPOSE 80 443