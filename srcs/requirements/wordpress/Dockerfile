FROM    debian:bullseye

WORKDIR /var/www/html

RUN     apt-get update -y && apt-get upgrade -y \
    	&&  apt-get install -y wget \
    	&&  apt-get install -y php7.4 php-fpm php-mysql mariadb-client \
    	&&  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    	&&  chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp \
    	&&  sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf \
    	&&  mkdir -p /run/php \
		&&  chown -R root:root /run/php/

COPY    ./conf/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

RUN chmod +w -R /var/log/

RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["/tmp/setup.sh"]
CMD [ "/bin/bash", "-c", "/usr/sbin/php-fpm7.4 -F" ]
