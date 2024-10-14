#!/bin/bash

#req — это команда означающая «создай сертификат».
#x509 — это формат сертификата. x509 является актуальным стандартом.
#days — срок действия сертификата.
#nodes — означает «no DES» или «no data encryption algorithm». То есть это значит не шифровать данные.
#newkey — создает новый закрытый ключ по определенному алгоритму в нашем случае это алгоритм RSA. После двоеточия задается длина ключа.
#keyout — записывает наш новосозданный ключ в указанный файл (если его нет, то он создается)..
#out — записывать наш сертификат в указанный файл (если его нет, то он создается).
#subj — описание нашего сертификата.

# Path to the wp-config.php file

WP_CONFIG="wp-config.php"

# Проверка наличия переменной окружения с паролем
if [ -z "$DB_PASSWORD" ]; then
    echo "Переменная окружения DB_PASSWORD не установлена."
    echo "Установите переменную и повторите попытку."
    exit 1
fi

# Проверяем, существует ли файл конфигурации
if [ ! -f "$WP_CONFIG" ]; then
    echo "Файл $WP_CONFIG не найден."
    exit 1
fi

# Замена строки с паролем в файле конфигурации
sed -i "s/define('DB_PASSWORD', '.*');/define('DB_PASSWORD', '$DB_PASSWORD');/" "$WP_CONFIG"

# Проверка, что команда sed выполнилась без ошибок
if [ $? -eq 0 ]; then
    echo "Пароль в файле $WP_CONFIG успешно обновлен."
else
    echo "Ошибка при обновлении пароля."
fi

openssl req -x509 -days 365 -nodes \
-newkey rsa:2048 \
-keyout /etc/ssl/nginx.key \
-out /etc/ssl/nginx.crt \
-subj "/C=RU/ST=Moscow/L=Moscow/O=21/OU=swquinc/CN=tphung"

chmod +x /db_backup.sh
chmod +x /db_restore.sh
chown -R mysql:mysql /var/lib/mysql
service mysql start
# i want to take user name and password from the .env for creating database
RESULT=$(mysql -u"$DB_USER" -p"$DB_PASSWORD" -e "SHOW DATABASES LIKE '$DB_NAME';" -s --skip-column-names)

if [ "$RESULT" == "$DB_NAME" ]; then
    echo "База данных $DB_NAME найдена."
else
    echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
    echo "UPDATE mysql.user SET PASSWORD=PASSWORD('$DB_PASSWORD') WHERE USER='root';" | mysql -u root --skip-password
    echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root --skip-password
    echo "FLUSH PRIVILEGES;" | mysql -u root -p$DB_PASSWORD

    # privilages for the database using password
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root -p$DB_PASSWORD
    echo "FLUSH PRIVILEGES;" | mysql -u root -p$DB_PASSWORD

fi

mkdir /var/www/html/phpmyadmin 
tar xvf phpMyAdmin-5.0.4-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin > /dev/null 2>&1
rm -rf phpMyAdmin-5.0.4-english.tar.gz
mv ./config.inc.php /var/www/html/phpmyadmin/config.inc.php

# mkdir /var/www/html/wordpress
# tar xzf latest.tar.gz -C /var/www/html > /dev/null 2>&1
# rm -rf latest.tar.gz

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root  --path=/var/www/html/wordpress/
mv ./wp-config.php /var/www/html/wordpress
wp core install --url=$SITE_URL --title=$SITE_TITTLE --admin_user=$SITE_ADMIN --admin_password=$SITE_PASSWORD --admin_email=$SITE_ADMIN_EMAIL --path=/var/www/html/wordpress/ --allow-root

# wp plugin install elementor  --activate --allow-root --path=/var/www/html/wordpress
wp plugin install /mysql_tmp/elementor.3.11.0.zip  --activate --allow-root --path=/var/www/html/wordpress
wp plugin install /mysql_tmp/elementor-PRO-3.12.3.zip --activate --allow-root --path=/var/www/html/wordpress
wp theme install /mysql_tmp/hello-elementor.2.9.0.zip  --activate --allow-root --path=/var/www/html/wordpress
# wp theme install /mysql_tmp/astra.4.6.1.zip --activate --allow-root --path=/var/www/html/wordpress
# wp plugin install /mysql_tmp/astra-addon.zip --activate --allow-root --path=/var/www/html/wordpress
# wp plugin install astra-sites --version=3.5.4 --activate --allow-root --path=/var/www/html/wordpress


cp ng.conf /etc/nginx/sites-available/default

rm -rf /var/www/html/index.nginx-debian.html

chown -R www-data:www-data /var/www/html/*


service php7.3-fpm start
service nginx start

bash