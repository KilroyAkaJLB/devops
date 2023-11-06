#!/bin/sh

docker run -d -p "80:80" -v /var/www/html:/app -v /var/lib/mysql:/var/lib/mysql -v /home/users/ldap:/home/users/ldap --name=lamp epsi/lamp:latest
