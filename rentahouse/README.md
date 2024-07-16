# Le projet Rent A House
## Présentation
Le projet est né d'une idée simple : je devais faire un TD pour le cours mobile des 3ème année en Flutter.
Dans le cadre du TD, les données sont codées en dur dans l'application.

Je suis parti de ce TD pour réaliser une architecture complète intégrant le développement des applications et 
le déploiement de celles-ci.

Cette page présente l'architecture réseau/système et l'architecture logicielle.

Le projet est présenté [ici](projet/presentation.md)

## L'architecture système/réseau
[L'architecture utilisée](sysres.md) héberge entre autres Docker et Kubernetes, car il s'agit d'un laboratoire de test.

## L'architecture logicielle

Le projet Rent A House a
- une application mobile Flutter
- une application web Angular
- des microservices Spring Boot et ASP.Net Core Web API

[Voir le descriptif pour le développement](developpement.md).

## Les services DevOps

Les services DevOps sont présentés [ici](devops.md)