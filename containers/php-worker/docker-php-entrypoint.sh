#!/bin/sh
set -e

gosu www-data php artisan queue:listen --timeout=0

exec "$@"
