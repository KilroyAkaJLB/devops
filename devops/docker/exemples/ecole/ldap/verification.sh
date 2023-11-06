#!/bin/bash

if ! [ -x "$(command -v ldapmodify)" ]; then
  echo "Erreur: ldapmodify n'est pas installe."
  echo "Executer : sudo apt install ldap-utils"
  exit 1
fi

# Verification
echo "Vérification: exécution de la ligne suivante:"
echo "ldapsearch -h localhost -p 3389 -D 'cn=admin,dc=montpellier,dc=lan' -w abcd4ABCD -b 'dc=montpellier,dc=lan' -s sub 'objectclass=*'"

ldapsearch -h localhost -p 3389 -D 'cn=admin,dc=montpellier,dc=lan' -w abcd4ABCD -b 'dc=montpellier,dc=lan' -s sub 'objectclass=*'
