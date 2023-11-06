# Rent A House
## Présentation
« Rent A House » est un ensemble d’applications permettant de gérer les locations d’un point de vue agence immobilière (maison mère et succursales) comme d’un point de vue client final.
Remarque : les maisons/appartements sont appelés aussi “biens”.
### Les agences immobilières
Elles gèrent les biens avec une application web.
La maison mère
La maison mère a son propre site web permettant de gérer les biens de toutes les succursales.
Les succursales
Une succursale ne peut gérer que son portefeuille de biens.
### Le client final
Le client final peut gérer ses locations avec une application mobile, voir tous les biens disponibles puis faire une location et gérer son profil.

## Les applications
### Pour les agences immobilières
Ces applications sont appelées “Gestion de location de biens”.
#### La maison mère
Cette application va permettre de :
- Sélectionner une, plusieurs ou toutes les succursales, ajouter, modifier et supprimer les succursales
- Lister les biens
- Valider/invalider un bien ajouté par une succursale
- Rechercher/trier les biens
- Lister les locations
- Rechercher/trier les locations
- Voir un Dashboard des biens et des locations pour les succursales
#### Les succursales
Cette application va permettre de :
- Lister les biens
- Ajouter (pour validation), modifier, supprimer un bien (lui appartenant)
- Rechercher/trier les biens
- Lister les locations
- Rechercher/trier les locations
- Ajouter une location pour un utilisateur donné
- Modifier, supprimer une location (avant la date de début)
- Résilier une location (après la date de début)
- Voir un Dashboard des biens, des utilisateurs et des locations
L’application ne gère pas les utilisateurs

### Pour le client final
Une application mobile va permettre de gérer les locations de biens. Cette application est la partie “cliente” de l’application Angular “Gestion de location de biens”.

Nous allons utiliser les SDK Flutter et Dart.

Cette application va permettre de :
- Se connecter / Créer son profil
- Lister les biens
- Rechercher/trier les biens
- Lister ses locations
- Rechercher/trier ses locations
- Ajouter une location
- Modifier, supprimer une location (avant la date de début)
- Voir un Dashboard des biens et de ses locations

#### Les versions
##### Version 1
Cette version permet de :
- Se connecter
- Voir son profil
- Lister les biens
- Ajouter une location
- Voir les locations en cours



## Partie technique
### Applications pour la succursale et les agences
Pour cette partie « Front », nous allons développer deux applications web en Angular/Typescript avec l’IDE WebStorm. Ces applications se connecteront aux microservices.

### Les microservices
La partie « back » est constituée d’un ensemble de Web Service de type REST API organisée en microservices.

Les Web Service sont développés avec Spring Boot/Java et ASP.Net Core Web API/C#.

Les bases de données sont sous MySQL/MariaDB.

#### Le microservice Habitation
Technos utilisées :
- Spring Boot/Java (version 2.7 et 3)
- MySQL
- JWT
- docker

##### Version 1.0
Permet de :
- faire le CRUD pour les types d’habitations
- faire le CRUD pour les habitations
- faire le lien (méthodes POST et PUT) avec les “éléments” et les options payantes
- faire le Read (méthodes GET) pour les options payantes
- faire le Read (méthodes GET) pour les “éléments” de l’habitation
- faire les tests sur le contrôleur Habitation et la classe Habitation
##### Version 1.1
Permet de :
- faire l'ajout d'images pour une habitation
##### Version 1.2
Permet de :
- faire la suppression d'une habitation en vérifiant 
si aucune location et/ou utilisateur n'est lié (utilisation  d'un service Message Queueing)

#### Le microservice Location
Technos utilisées :
- ASP.Net Core Web API
- MySQL
- JWT
- docker

##### Version 1.0
Permet de :
- faire le CRUD pour les locations
- faire le Read (méthodes GET) pour les règlements et relances

#### Le microservice LocUsers
Technos utilisées :
- Spring Boot/Java (version 2.7 et 3)
- MySQL
- JWT
- docker

##### Version 1.0
Permet de :
- faire le CRUD pour les utilisateurs
- gérer la ville avec une API externe

##### Version 1.1
Permet de :
- faire la suppression d'un utilisateur en vérifiant
  si aucune location n'est liée (utilisation  d'un service Message Queueing)
