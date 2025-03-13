#!/bin/bash

set -x

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

cd /var/www/html

wp core download --allow-root

wp config create --allow-root \
  --dbname=$DB_NAME \
  --dbuser=$DB_USER \
  --dbpass=$DB_PASSWORD \
  --dbhost=mariadb

wp core install --allow-root \
  --url=$DOMAIN_NAME \
  --title=Inception \
  --admin_user=$WP_ADMIN_USER \
  --admin_password=$WP_ADMIN_PWD \
  --admin_email=info@example.com

wp user create $WP_USER user@example.com \
--role=editor \
--user_pass=$WP_PWD \
--allow-root

php-fpm8.2 -F