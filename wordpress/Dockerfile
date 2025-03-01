FROM debian:12

RUN apt update \
	&& apt upgrade -y \
	&& apt install -y curl less mariadb-client unzip php8.2-fpm php-mysql \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/start.sh /
COPY ./www.conf /etc/php/8.2/fpm/pool.d

ENTRYPOINT [ "/start.sh" ]