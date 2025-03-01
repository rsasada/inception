
FROM debian:12

RUN set -x \
	&& groupadd --system -g 101 nginx \
	&& useradd --system --gid nginx --no-create-home --home /nonexistent --comment "nginx user" --shell /bin/false --uid 202 nginx \
	&& apt update \
	&& apt -y install nginx openssl curl \
	&& mkdir -p /etc/nginx/ssl \
	&& cd etc/nginx/ssl \
	&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out inception.crt \
	-keyout inception.key \
	-subj "/C=JP/ST=Tokyo/L=city/O=42tokyo" \
	&& chmod 600 /etc/nginx/ssl/inception.key \
	&& chown www-data:www-data /etc/nginx/ssl/inception.key \
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log 

COPY  ./nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;"]