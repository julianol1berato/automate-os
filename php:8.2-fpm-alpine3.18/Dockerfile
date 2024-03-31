#Dockerfile
FROM php:8.2-fpm-alpine3.18
RUN apk add --no-cache zip libzip-dev libpng-dev tzdata shadow icu-dev libjpeg-turbo-dev freetype-dev oniguruma-dev \
    && docker-php-ext-configure intl && docker-php-ext-configure zip && docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
      --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd intl zip pdo pdo_mysql exif mysqli bcmath mbstring \
    && apk del --no-cache oniguruma-dev \
    && rm -rf /tmp/* \
    && docker-php-ext-enable exif gd mysqli pdo_mysql mysqli intl
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN chown -R www-data:www-data /var/www/

CMD ["php-fpm"]
EXPOSE 9000
