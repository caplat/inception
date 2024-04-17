FROM 	debian:bullseye

RUN	apt update -y \
	&& apt upgrade -y \
	&& apt-get install mariadb-server -y \
	&& mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld

COPY 	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY 	conf/script.sh /etc/mysql/script.sh

RUN chmod +x /etc/mysql/script.sh

ENTRYPOINT ["/bin/bash", "/etc/mysql/script.sh"]

CMD ["mysqld"]
