#!/bin/sh

chown -R :www-data /var/www/html/wordpress

wp-cli core download
wp-cli config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_USER_PASSWORD} --locale=en_DB
wp-cli core install --url=$DOMAIN_NAME --title=inception --admin_user=WP_ADMIN_USERNAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

sed -i 's|^listen = 127.0.0.1:9000$|listen = 9000|g' /etc/php8/php-fpm.d/www.conf

exec php-fpm8 -F -R