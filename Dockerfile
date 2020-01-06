FROM phpdockerio/php74-fpm:latest
WORKDIR "/application"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php7.4-mysql php7.4-pgsql php-redis php7.4-sqlite3 php-xdebug php7.4-gd php-imagick php7.4-imap php7.4-intl php-mongodb php7.4-soap php7.4-tidy php7.4-xmlrpc php7.4-xsl \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
