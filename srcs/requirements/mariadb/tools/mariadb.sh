#!/bin/bash

touch tmpf
chmod 755 tmpf

cat << EOF > tmpf
CREATE DATABASE inception;
FLUSH PRIVILEGES;
GRANT ALL ON *.* TO '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
SET PASSWORD FOR '$MYSQL_ROOT_USER'@'localhost'=PASSWORD('$MYSQL_ROOT_PASSWORD');
FLUSH PRIVILEGES ;
GRANT ALL ON inception.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
EOF

cat tmpf
mysqld --user=mysql --verbose --bootstrap < tmpf
rm tmpf

#mkdir /run/mysqld
#chmod 777 /run/mysqld

exec mysqld
