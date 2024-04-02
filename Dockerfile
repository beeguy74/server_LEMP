FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    nginx \
    php-fpm php-mysql php-xml \
    mariadb-server \
    openssl \
    vim

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz && \
    wget https://wordpress.org/latest.tar.gz

COPY ./srcs ./

CMD bash start.sh


EXPOSE 80 443