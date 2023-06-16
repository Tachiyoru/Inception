#!/bin/sh

service mysql start;

# SET USER
mysql -e "CREATE DATABASE IF DONT EXIST \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF DONT EXIST \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# SET ROOT
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_sqfe
