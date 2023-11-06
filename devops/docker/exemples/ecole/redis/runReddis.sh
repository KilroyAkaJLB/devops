#!/bin/bash

docker run --name redis -d \
    -v ./redis-data:/data \
    -v ./redis-conf:/usr/local/etc/redis.conf \
    redis:7.0.12
 #   /usr/local/etc/redis.conf
