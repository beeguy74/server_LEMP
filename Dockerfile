FROM debian:buster


# i want to apt-get php version 7.4
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    nginx \
    php-fpm php-curl php-mysql php-xml \
    mariadb-server \
    openssl \
    vim

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz && \
    wget https://wordpress.org/latest.tar.gz && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

COPY ./srcs ./

CMD bash start.sh


EXPOSE 80 443