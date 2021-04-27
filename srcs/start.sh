#!/bin/bash

#req — это команда означающая «создай сертификат».
#x509 — это формат сертификата. x509 является актуальным стандартом.
#days — срок действия сертификата.
#nodes — означает «no DES» или «no data encryption algorithm». То есть это значит не шифровать данные.
#newkey — создает новый закрытый ключ по определенному алгоритму в нашем случае это алгоритм RSA. После двоеточия задается длина ключа.
#keyout — записывает наш новосозданный ключ в указанный файл (если его нет, то он создается)..
#out — записывать наш сертификат в указанный файл (если его нет, то он создается).
#subj — описание нашего сертификата.

openssl req -x509 -days 365 -nodes \
-newkey rsa:2048 \
-keyout /etc/ssl/nginx.key \
-out /etc/ssl/nginx.crt \
-subj "/C=RU/ST=Moscow/L=Moscow/O=21/OU=swquinc/CN=tphung"

service mysql start

echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root --skip-password
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mkdir /var/www/html/phpmyadmin 
tar xvf phpMyAdmin-5.0.4-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
rm -rf phpMyAdmin-5.0.4-english.tar.gz
mv ./config.inc.php /var/www/html/phpmyadmin/config.inc.php

mkdir /var/www/html/wordpress
tar xzf latest.tar.gz -C /var/www/html
rm -rf latest.tar.gz
mv ./wp-config.php /var/www/html/wordpress

cp ng.conf /etc/nginx/sites-available/default

rm -rf /var/www/html/index.nginx-debian.html

chown -R www-data:www-data /var/www/html/*


service php7.3-fpm start
service nginx start

bash