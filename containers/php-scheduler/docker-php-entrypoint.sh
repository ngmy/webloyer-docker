#!/bin/sh
set -e

while [ true ]
do
    gosu www-data php artisan schedule:run --no-interaction &
    sleep 60
done

exec "$@"
