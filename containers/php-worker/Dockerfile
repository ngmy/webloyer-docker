FROM php:7.2-fpm

RUN apt-get update \
  && apt-get install -y zlib1g-dev gosu \
  && docker-php-ext-install zip pdo_mysql bcmath

COPY php.ini /usr/local/etc/php/

WORKDIR /var/app/src/webloyer

COPY docker-php-entrypoint.sh /usr/local/bin/docker-php-entrypoint
RUN chmod +x /usr/local/bin/docker-php-entrypoint

ENTRYPOINT ["docker-php-entrypoint"]
