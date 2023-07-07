#!/bin/bash

sleep 10
if ! wp core is-installed --allow-root  ; then
    wp core download --allow-root --force
    echo "HERE1"
    wp config create --dbname=wordpress --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root --force
    echo "HERE2"
    wp core install --url="sleon.42.fr" --title="Inception" \
    --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL --allow-root 
    wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD --allow-root 
    wp config shuffle-salts --allow-root 
    echo "Wordpress's installation complete"
fi

if wp core is-installed --allow-root  ; then
    echo "Wordpress is installed"
else
    echo "Wordpress's installation failed"
fi

set -x
echo $PWD
