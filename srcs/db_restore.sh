#!/bin/bash

service mysql stop
tar xvfz /mysql_tmp/mysql_backup.tar.gz -C /
tar xvfz /mysql_tmp/images_backup.tar.gz -C /
chown -R mysql:mysql /var/www/html/wordpress/wp-content/uploads
chown -R mysql:mysql /var/lib/mysql
service mysql start