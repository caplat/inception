FROM debian:bullseye

RUN    apt update -y \
       && apt upgrade -y \
       && apt install nginx -y \
       && apt install openssl -y \
       && apt install vim -y

RUN    mkdir -p /etc/nginx/ssl

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/inception.key \
        -out /etc/nginx/ssl/inception.crt \
        -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=acaplat.42.fr/UID=acaplat"

COPY    conf/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN     chmod -R 755 /var/www/html

RUN     chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
