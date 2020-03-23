FROM php:7.2-fpm

RUN apt-get update \
  && apt-get install -y zlib1g-dev mariadb-client git \
  && docker-php-ext-install zip pdo_mysql bcmath

COPY php.ini /usr/local/etc/php/

# install composer
COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH ${PATH}:/composer/vendor/bin

# install prestissimo
RUN composer global require hirak/prestissimo

# install webloyer
WORKDIR /var/app/src/webloyer
RUN composer create-project ngmy/webloyer .
RUN chown -R www-data:www-data storage
RUN chown -R www-data:www-data bootstrap/cache
RUN ln -fns /var/app/src/webloyer /var/www/webloyer

COPY docker-php-entrypoint.sh /usr/local/bin/docker-php-entrypoint
RUN chmod +x /usr/local/bin/docker-php-entrypoint

ENTRYPOINT ["docker-php-entrypoint"]
CMD ["php-fpm"]
