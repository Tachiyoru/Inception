# service mysql start;

# # SET USER
# mysql -e "CREATE DATABASE IF DONT EXIST \`${SQL_DATABASE}\`;"
# mysql -e "CREATE USER IF DONT EXIST \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# # SET ROOT
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# exec mysqld_sqfe
#!/bin/sh
service mysql start

echo "DROP DATABASE IF EXISTS test;" | mysql
echo "CREATE DATABASE $DATABASE_NAME;" | mysql

echo "CREATE USER '$DATABASE_LOGIN'@'%' IDENTIFIED BY '$DATABASE_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_LOGIN'@'%' IDENTIFIED BY '$DATABASE_PASSWORD';" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql


kill $(cat /var/run/mysqld/mysqld.pid)

exec mysqld
