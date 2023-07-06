#!/bin/bash
service mysql start

echo "CREATE DATABASE IF NOT EXISTS Wordpress ;" > db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql
echo "GRANT ALL ON *.* TO '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql
echo "CREATE USER IF NOT EXIST '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> db1.sql
echo "GRANT ALL ON Wordpress.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"  >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql
mysqld < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)
echo "AAAAAAAAAAAAAAAAAAAAAAAAAA"

exec mysqld