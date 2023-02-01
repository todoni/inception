#!/bin/sh

chown -R :www-data /var/www/html/wordpress

if [ ! -f "/var/www/html/wordpress/index.php" ]; then
    wp-cli core download
    wp-cli config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=${MYSQL_HOST} --locale=en_DB
    wp-cli core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email
    wp-cli user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_USER_PASSWORD
fi

sed -i 's|^listen = 127.0.0.1:9000$|listen = 9000|g' /etc/php8/php-fpm.d/www.conf

exec php-fpm8 -F -R