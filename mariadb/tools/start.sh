#!/bin/bash

set -x

mkdir -p /run/mysqld

service mariadb start

mysql <<EOF
CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO $DB_USER@'%' WITH GRANT OPTION;
CREATE USER IF NOT EXISTS $DB_SUPERUSER@'%' IDENTIFIED BY '${DB_SUPER_PASS}';
GRANT ALL PRIVILEGES ON *.* TO $DB_SUPERUSER@'%' WITH GRANT OPTION;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
FLUSH PRIVILEGES;
EOF

service mariadb stop 

mysqld