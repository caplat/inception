echo "running auto_config.sh"
sleep 10

if [ -f /var/www/html/wp-config.php ]; then
	echo "wordpress is already configured"
	echo "done."
	/usr/sbin/php-fpm7.4 -F
fi

wp config create --allow-root \
--dbname=$DATABASE \
--dbuser=$USER \
--dbpass=$USER_PASSWORD \
--dbhost=mariadb \
#--path='/var/www/wordpress'

wp core install --allow-root \
--url=$HOSTNAME \
--title="Inception" \
--admin_user=$ROOT_NAME \
--admin_password=$ROOT_PASSWORD 

wp user create --allow-root \
--role=author \
--user_pass=$USER_PASSWORD

echo "done."

/usr/sbin/php-fpm7.4 -F
