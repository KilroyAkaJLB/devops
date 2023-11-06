#!/bin/bash

if ! [ -x "$(command -v ldapmodify)" ]; then
  echo "Erreur: ldapmodify n'est pas installe."
  echo "Executer : sudo apt install ldap-utils"
  exit 1
fi

# Initialisation des données LDAP
echo "Initialisation des données LDAP"
ldapmodify -x -D "cn=admin,dc=montpellier,dc=lan" -w abcd4ABCD -f /app/initialisation.ldif

