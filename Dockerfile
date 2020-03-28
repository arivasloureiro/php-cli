FROM php:7.4-cli-buster
RUN apt-get update && apt-get -y install \
        libmcrypt-dev \
        libicu-dev \
        libxml2-dev \
        libzip-dev \
        gnupg \
        libonig-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install pdo_mysql zip bcmath xmlrpc

#COMPOSER
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer global require "phpunit/phpunit" && \
    composer clearcache
ENV PATH /root/.composer/vendor/bin:$PATH
RUN ln -s /root/.composer/vendor/bin/phpunit /usr/bin/phpunit