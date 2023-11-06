#!/bin/bash

if ! [ -x "$(command -v ldapmodify)" ]; then
  echo "Erreur: ldapmodify n'est pas installe."
  echo "Executer : sudo apt install ldap-utils"
  exit 1
fi

# Nom du container
CONTAINERNAME="testldap"

echo "Arret des containers"
# Liste des containers en cours
LISTIDS=$(docker ps -aqf "name=$CONTAINERNAME")
# Si la liste n'est pas vide ...
if [ ! -z $LISTIDS ] 
then
	# ... on arrete les containers
	docker container stop $(docker ps -aqf "name=$CONTAINERNAME")
fi

echo "Suppression des containers"
# Suppression du container si il existe
LISTIDS=$(docker ps -aqf "name=$CONTAINERNAME")
if [ ! -z $LISTIDS ] 
then
	docker container rm $(docker ps -aqf "name=$CONTAINERNAME")
fi

echo "Suppression de l'image"
# Suppression de l'image
LISTIDS=$(docker images -q $CONTAINERNAME)
if [ ! -z $LISTIDS ] 
then
	docker rmi $(docker images -q $CONTAINERNAME)
fi

echo "Création de l'image"
# Créer l'image Docker
docker build -t $CONTAINERNAME .

# !!!!
# !!!!!!!!!!!!        IMPORTANT        !!!!!!!!!!!!!!!
# !!!!

# Indiquer le repertoire des fichiers de configuration
DOCKERLDAPDIR=`pwd`

# Demarrage du container
echo "Démarrage du container"
docker run -p 3389:389 --detach --name $CONTAINERNAME $CONTAINERNAME

# Verification
echo "Vérification: exécuter la ligne suivante:"
ldapsearch -h localhost -p 3389 -D 'cn=admin,dc=montpellier,dc=lan' -w abcd4ABCD -b 'dc=montpellier,dc=lan' -s sub 'objectclass=*'
