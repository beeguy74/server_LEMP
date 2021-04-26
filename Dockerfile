FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    nginx \
    php php-mysql php-mbstring php-fpm\
    mariadb-server\
    openssl

RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

COPY srcs/start.sh ./

CMD bash start.sh

EXPOSE 80 443