#!/bin/sh
set -e

# set up the database for the first time only
wait-for-it ${DB_HOST}:3306 -- echo "database is up"
IS_FIRST_TIME=$(mysql -h ${DB_HOST} -u ${DB_USERNAME} -p${DB_PASSWORD} -N -B -e "select count(*) from information_schema.tables where table_name='migrations'")
if [ "${IS_FIRST_TIME}" -eq 0 ]; then
    gosu www-data php artisan migrate --seed
    # TODO generate an initial api token for the admin user
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- php "$@"
fi

exec "$@"
