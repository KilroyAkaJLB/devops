#!/bin/bash

# Copie des fichiers necessaires a promotheus et grafana
scp -r prometheus root@dockermain:/nfsexport/supervision/
scp -r grafana root@dockermain:/nfsexport/supervision/

# Arret de la stack
docker stack rm supervision-app

# Lancement de la stack
docker stack deploy -c prometheus-stack.yml supervision-app
