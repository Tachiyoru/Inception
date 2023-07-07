#!/bin/bash


if [ -f ./wp-config.php ]
then
    echo "Wordpress already installed, skipping download and configuration."
else
    wp core download --allow-root

    echo "HERE1"
    wp config create --dbname=wordpress --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
    echo "HERE2"
    wp core install --url="sleon.42.fr" --title="Inception" \
    --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root

    wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD --allow-root
fi

set -x
echo $PWD
