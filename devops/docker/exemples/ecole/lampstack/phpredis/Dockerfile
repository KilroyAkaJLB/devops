FROM php:7.4-apache

# Update system
RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

# Install useful tools
RUN apt-get -y install apt-utils dialog libpng-dev libjpeg-dev libfreetype6-dev

# Use the default dev configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# PHP7 Extensions
RUN apt-get -y install default-mysql-client
RUN docker-php-ext-install pdo_mysql 
# RUN docker-php-ext-install mbstring

# Suppress error "AH00558: apache2: Could not reliably determine the server's fully qualified domain name"
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install Redis
RUN \
  curl 'http://pecl.php.net/get/redis-5.3.7.tgz' -o /tmp/redis-5.3.7.tgz  \
  && cd /tmp \
  && pecl install redis-5.3.7.tgz \
  && rm -rf redis-5.3.7.tgz \
  && docker-php-ext-enable redis
RUN echo 'extension=redis.so' >> "$PHP_INI_DIR/php.ini"

# Copy html and PHP file
COPY target/ /var/www/html/

