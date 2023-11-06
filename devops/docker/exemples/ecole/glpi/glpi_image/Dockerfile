#On choisit une debian
FROM debian:11.3

# Pas d'interactivité
ENV DEBIAN_FRONTEND noninteractive

# Ports
EXPOSE 80 443


# Installation de apache et php7.4
RUN apt update \
&& apt install --yes --no-install-recommends \
apache2 \
php7.4 \
php7.4-mysql \
php7.4-ldap \
php7.4-xmlrpc \
php7.4-imap \
curl \
php7.4-curl \
php7.4-gd \
php7.4-fileinfo \
php7.4-mbstring \
php7.4-xml \
php7.4-apcu-bc \
php-cas \
php7.4-intl \
php7.4-zip \
php7.4-bz2 \
php7.4-json \
jq \
cron \
wget \
ca-certificates \
libldap-2.4-2 \
libldap-common \
libsasl2-2 \
libsasl2-modules \
libsasl2-modules-db \
&& rm -rf /var/lib/apt/lists/*

# Script d'installation GLPI
COPY glpi-start.sh /app/
RUN chmod +x /app/glpi-start.sh
ENTRYPOINT ["/app/glpi-start.sh"]

