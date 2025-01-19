FROM php:8.3-fpm

ENV USER=sam

ENV APP_ENV=dev

# Install required packages
RUN apt-get update && apt-get install -y \
        sudo \
        unzip

# Add user
RUN useradd -ms /bin/bash $USER && \
    adduser $USER sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


RUN \
    apt-get update && apt-get -y install wget && apt-get -y install nano && apt-get -y install sudo &&\
    docker-php-ext-install pdo_mysql &&\
    apt-get install -y git nano && \
    echo '- Installing composer ...' && \
    EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"; \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
    php composer-setup.php --quiet --install-dir=/bin --filename=composer && \
    composer --version && \
    rm composer-setup.php

RUN apt-get install -y librabbitmq-dev && \
    pecl install amqp-1.11.0 && docker-php-ext-enable amqp

RUN apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/*
    
#COPY config/supervisor/ /etc/supervisor/
COPY config/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

USER $USER

WORKDIR /var/www