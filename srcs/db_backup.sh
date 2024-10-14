#!/bin/bash

tar cvfz /mysql_tmp/mysql_backup.tar.gz /var/lib/mysql/
tar cvfz /mysql_tmp/images_backup.tar.gz /var/www/html/wordpress/wp-content/uploads/
