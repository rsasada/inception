FROM debian:12

RUN apt update \
	&& apt upgrade -y \
	&& apt install -y mariadb-server \
	&& rm -rf /var/lib/apt/lists/* 
COPY ./tools/start.sh /
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT [ "/start.sh" ]