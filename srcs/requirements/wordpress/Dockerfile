FROM    debian:bullseye

WORKDIR /var/www/html

RUN     apt-get update -y && apt-get upgrade -y \
    &&  apt-get install -y wget \
    &&  apt-get install -y php7.4 php-fpm php-mysql mariadb-client \
    &&  wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz \
    &&  tar -xvf wordpress-6.4.2-fr_FR.tar.gz \
    &&  cp -rf wordpress/* . && rm -rf wordpress wordpress-6.4.2-fr_FR.tar.gz \
    &&  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    &&  chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
    &&  sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf \
    &&  mkdir -p /run/php &&  chown -R root:root /run/php/ && service php7.4-fpm restart

COPY    ./conf/auto_config.sh /tmp/auto_config.sh

CMD     ["bash", "/tmp/auto_config.sh"]
