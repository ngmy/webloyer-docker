#!/bin/sh
set -e

wait-for-it ${DB_HOST}:3306 -- echo "database is up"

while [ true ]
do
    gosu www-data php artisan schedule:run --no-interaction &
    sleep 60
done

exec "$@"
