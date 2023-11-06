#!/bin/bash

if [[ -z "${TIMEZONE}" ]]; then
	echo "TIMEZONE is unset"; 
else 
	echo "date.timezone = \"$TIMEZONE\"" > /etc/php/7.4/apache2/conf.d/timezone.ini;
	echo "date.timezone = \"$TIMEZONE\"" > /etc/php/7.4/cli/conf.d/timezone.ini;
fi

SRC_GLPI="https://github.com/glpi-project/glpi/releases/download/9.5.7/glpi-9.5.7.tgz"
TAR_GLPI="glpi-9.5.7.tgz"
FOLDER_GLPI=glpi/
FOLDER_WEB=/var/www/html/


# Téléchargement et extraction des sources de GLPI
wget -P ${FOLDER_WEB} ${SRC_GLPI}
tar -xzf ${FOLDER_WEB}${TAR_GLPI} -C ${FOLDER_WEB}
rm -Rf ${FOLDER_WEB}${TAR_GLPI}
chown -R www-data:www-data ${FOLDER_WEB}${FOLDER_GLPI}
chmod -R 775 ${FOLDER_WEB}${FOLDER_GLPI}


# Modification du vhost par défaut
echo -e "<VirtualHost *:80>\n\tDocumentRoot /var/www/html/glpi\n\n\t<Directory /var/www/html/glpi>\n\t\tAllowOverride All\n\t\tOrder Allow,Deny\n\t\tAllow from all\n\t</Directory>\n\n\tErrorLog /var/log/apache2/error-glpi.log\n\tLogLevel warn\n\tCustomLog /var/log/apache2/access-glpi.log combined\n</VirtualHost>" > /etc/apache2/sites-available/000-default.conf

# Add scheduled task by cron and enable
echo "*/2 * * * * www-data /usr/bin/php /var/www/html/glpi/front/cron.php &>/dev/null" >> /etc/cron.d/glpi
#Start cron service
service cron start

# Activation du module rewrite d'apache
a2enmod rewrite && service apache2 restart && service apache2 stop

# Lancement du service apache au premier plan
/usr/sbin/apache2ctl -D FOREGROUND

