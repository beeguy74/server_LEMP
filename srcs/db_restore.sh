#!/bin/bash

service mysql stop
tar xvfz /tmp/mysql_backup.tar.gz -C /
chown -R mysql:mysql /var/lib/mysql
service mysql start