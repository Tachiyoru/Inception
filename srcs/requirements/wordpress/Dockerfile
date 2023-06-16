FROM	debian:buster

RUN		apt update

RUN		apt-get install -y wget
RUN		apt-get install -y php7.3 php-fpm php-mysql mariadb-client;

COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN		wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.2-fr_FR.tar.gz && rm wordpress-6.2-fr_FR.tar.gz
# RUN		chown -R root:root /var/www/wordpress

COPY	/tools/setup_wordpress.sh /usr/local/bin/
RUN		chmod +x /usr/local/bin/setup_wordpress.sh
