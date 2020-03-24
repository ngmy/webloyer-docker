#!/bin/sh
set -e

wait-for-it ${DB_HOST}:3306 -- echo "database is up"

gosu www-data php artisan queue:listen --timeout=0

exec "$@"
