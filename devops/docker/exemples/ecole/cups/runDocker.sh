#!/bin/bash

docker run --mount type=bind,source="/docker/server/cupsd/conf",target="/etc/cups/ppd"  -v /var/run/dbus:/var/run/dbus  -p 631:631 -d --name cupsd --restart always olbat/cupsd

