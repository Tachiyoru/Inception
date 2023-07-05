#!/bin/bash

while ! mariadb -h mariadb -u${MDB_USER} -p${MDB_PASS} ${MDB_DATABASE} &>/dev/null; do
	sleep 10
done

if [-f "/var/www/html/wp-config.php"]; then

	echo "wp-config.php found"
else
	wp core download --allow-root --locale=fr_FR
	wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=MARIADB:3306 --path=$WP_WEBSITE_PATH
	wp core install --allow-root --url=$WP_DOMAIN_NAME --title=$WP_WEBSITE_NAME --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL
	wp user create --allow-root $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASS

fi

mkdir /run/php

exec /usr/sbin/php-fpm7.3 -F -R


mkdir -p /var/www/html
chmod 777 /var/www/html
chown -R www-data:www-data /var/www/html/
cd /var/www/html
