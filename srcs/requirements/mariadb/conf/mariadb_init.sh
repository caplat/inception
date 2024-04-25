echo "Loading MariaDB initialization script..."
/etc/init.d/mariadb start

if [ -f ./db_configured ]; then
    echo "MariaDB is already configured."
else
    until mysqladmin ping &> /dev/null; do
        sleep 1
    done
    echo "Setting root password"
    mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${ROOT_PASSWORD}');"
    sleep 0.5

    echo "Flushing privileges"
    mysql -uroot -p"${ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
    sleep 0.5

    if [ -z "${DATABASE}" ]; then
        echo "Error: Database name not set."
        exit 1
    fi

    echo "Creating database '${DATABASE}' if it does not exist"
    mysql -uroot -p"${ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${DATABASE}\`;"
    sleep 0.5

    if [ -z "${USER}" ]; then
        echo "Error: User name not set."
        exit 1
    fi

    echo "Creating user '${USER}' if it does not exist"
    mysql -uroot -p"${ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${USER}'@'%' IDENTIFIED BY '${USER_PASSWORD}';"
    sleep 0.5

    echo "Granting privileges to '${USER}'"
    mysql -uroot -p"${ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${DATABASE}\`.* TO '${USER}'@'%';"
    sleep 0.5

    echo "Flushing privileges"
    mysql -uroot -p"${ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
    sleep 0.5

    touch db_configured
fi

echo "Shutting down MariaDB"
mysqladmin -uroot -p"${ROOT_PASSWORD}" shutdown

exec "$@"

