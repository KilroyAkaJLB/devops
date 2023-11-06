#!/bin/bash

docker run -d --hostname=rabbitmq -e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=AP@ssw0rd -p 15672:15672 -p 5672:5672 --name rabbitmq rabbitmq:management
