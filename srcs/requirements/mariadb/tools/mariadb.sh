#!/bin/bash
service mysql start;

#SET USER
mysql -e "CREATE DATABASE \`${MYSQL_DATABASE}\`;"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE USER IF DONT EXIST \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

#SET ROOT
mysql -e "ALTER USER '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p ${MYSQL_ROOT_PASSWORD} shutdown

exec mysqld
