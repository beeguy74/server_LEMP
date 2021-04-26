service php7.3-fpm start

mkdir /var/www/html/phpMyAdmin

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
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root

service nginx start

bash