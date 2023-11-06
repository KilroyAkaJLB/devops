FROM php:7.3.9-apache

# Update system
RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

# Install useful tools
RUN apt-get -y install apt-utils dialog

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# PHP7 Extensions
RUN apt-get -y install default-mysql-client
RUN docker-php-ext-install pdo_mysql 

RUN docker-php-ext-install mbstring

# Copy userdir conf
COPY userdir.conf /etc/apache2/mods-available/

# Suppress error "AH00558: apache2: Could not reliably determine the server's fully qualified domain name"
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Enable apache modules
RUN a2enmod rewrite headers ssl userdir

