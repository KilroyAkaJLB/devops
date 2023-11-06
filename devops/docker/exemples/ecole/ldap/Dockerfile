FROM osixia/openldap:1.5.0


# Variable d'environements
# Variables
ENV LDAP_ORGANISATION="EPSI Montpellier"
ENV LDAP_DOMAIN="montpellier.lan"
ENV LDAP_ADMIN_PASSWORD="abcd4ABCD"
ENV LDAP_CONFIG_PASSWORD="abcd4ABCD"

# Script LDAP
COPY ./target/initialisation.ldif /app/
COPY ./target/populateLdap.sh /app/

# Lancement du script
RUN chmod +x /app/populateLdap.sh

