#!/bin/bash

# Il faut fixer manuellement l'adresse du LB car aucun LB n'est installé pour l'instant
kubectl patch svc rabbitmq-rentahouse -n rabbitmq-system -p '{"spec": {"type": "LoadBalancer", "externalIPs":["192.168.1.40"]}}'