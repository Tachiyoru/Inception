#!/bin/bash

echo BEGIN
cp /etc/wp-config.php .
wp core download --allow-root

echo PASS

until mysqladmin -hmysql -u$MYSQL_USER -p$MYSQL_PASSWORD ping;
do
	echo WAITING
	sleep 1
done
echo CONNECT

#                --- https://developer.wordpress.org/cli/commands/user/create/ ---
wp core install --url="rleseur.42.fr" --title="Inception"\
	--admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email="test@test.test" --allow-root

if [[ ! $(wp user get $WP_USER_LOGIN --allow-root) ]]
then
	wp user create $WP_USER_LOGIN inception@example.com --user_pass=$WP_USER_PASSWORD --allow-root
fi

echo GOOD

php-fpm7.3 -F -R
