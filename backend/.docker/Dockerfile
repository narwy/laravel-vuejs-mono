FROM php:7.4-fpm

WORKDIR /var/www

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    zlib1g-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    graphviz \
    locales \
    vim \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-source delete

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY /backend/.docker/config/php/local.ini /usr/local/etc/php/conf.d/local.ini

COPY /backend/.docker/scripts/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

COPY /backend/.docker/scripts/build.sh /build.sh
RUN chmod +x /build.sh

EXPOSE 9000

CMD ["php-fpm"]