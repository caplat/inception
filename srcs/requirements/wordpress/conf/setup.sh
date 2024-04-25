#!/bin/bash

echo "running auto_config.sh"
sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
    echo "wp-config.php not found. Creating..."

wp core download --locale=fr_FR --path='/var/www/htm'

wp config create --allow-root \
--dbname=${DATABASE} \
--dbuser=${USER} \
--dbpass=${USER_PASSWORD} \
--dbhost=mariadb \
# --path='/var/www/html'

wp core install --allow-root \
--url=${HOSTNAME} \
--title="Inception" \
--admin_user=${ROOT_NAME} \
--admin_password=${ROOT_PASSWORD} \
--admin_email=adm@acaplat.fr

# wp user create --allow-root \
# ${USER} ${USER}@${HOSTNAME} \
# --role=author \
# --user_pass=${USER_PASSWORD}
# wp theme activate --allow-root twentytwentytwo
# wp plugin update --allow-root --all

fi
id
which php-fpm7.4
echo "done."

exec "$@"