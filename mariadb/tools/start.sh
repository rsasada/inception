#!/bin/bash

set -x

mkdir -p /run/mysqld

service mariadb start

mysql <<-EOF
CREATE USER $DB_USER@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO $DB_USER@'%' WITH GRANT OPTION;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
FLUSH PRIVILEGES;
EOF

service mariadb stop 

mysqld