# La philosophie DevOps

Le projet **Rent A House** m'a permis de mettre en œuvre la philosophie DevOps.

## Introduction
Dans le cadre de mon travail, j'ai eu à développer et déployer des sites web et des microservices.
Dans les débuts, ces déploiements étaient fait manuellement. Le côté répétitif et chronophage de ces déploiements m'a amené vers **Docker**.  
Les Dockerfile et les docker-compose m'ont enlevé la partie packaging, mais pas la partie déploiement sur le serveur.

Le **CI/CD avec Gitlab** m'a permis de faire le déploiement manuel et le déploiement automatique sur les serveurs en utilisant Docker.

Venait alors le problème de la disponibilité de l'application. Naturellement, je me suis tourné vers **Docker Swarm**. J'étais dans la continuité Docker.  
Cependant, le déploiement sur plusieurs nœuds a impliqué, par exemple, l'utilisation de stockage partagé.
Le déploiement de NFS sur plusieurs machines étant, lui-aussi répétitif, je me suis alors tourné vers **Ansible**.

Voulant améliorer la disponibilité des applications, je me suis alors orienté vers **Kubernetes**.  
Avec le CI/CD de Gitlab, je pouvais compiler, tester, packager et déployer n'importe quelle application sur Kubernetes 
avec mon GitLab Runner Kubernetes. Mais je n'avais pas le moyen d'automatiser le déploiement de toutes les applications.
Or dans mon projet Rent A House, j'ai plusieurs microservices et une application web.  
L'utilisation de **Terraform** a pallié ce problème. De plus Terraform me permet aussi de déployer mes conteneurs Docker pour mes bases de données.

Tous mes déploiements sont fait sur Kubernetes (`On-Premises avec VMware`) que j'ai mis en place. 
La suite logique du 'On-Premises' a été l'utilisation du **Cloud avec GCP et AWS**. J'ai donc fait quelques tests de mise en place
de mon projet sur GCP et AWS.

## Docker
J'ai d'abord utilisé Docker pour mon travail afin de déployer des microservices (ASP.Net Core, Spring Boot), des sites web (Angular) et 
différents services (GLPI, LAMP, OpenLDAP, Rabbit MQ, ...).
Voir les [exemples de fichiers](../devops/docker/exemples/ecole).

Avec mon projet Rent A House, j'utilise Docker pour le DNS (Bind9), les bases de données, le Reverse Proxy (nginx) et un GitLab Runner (Flutter).  
J'ai aussi utilisé Docker pour le monitoring (Prometheus, Grafana), ce monitoring est ensuite passé sous Docker Swarm.
Voir les [exemples de fichiers](../devops/docker/exemples/kilroy).

## Docker Swarm
Pour la haute disponibilité, j'ai utilisé Docker Swarm avec 1 master et 3 nœuds. J'ai ensuite déployé le microservice 
WSHabitation (voir les [exemples de fichiers](../devops/docker/exemples/kilroy/wshabitation-stack)) et 
le monitoring (Prometheus, Grafana), ce monitoring est maintenant sous kubernetes (voir les [exemples de fichiers](../devops/docker/exemples/kilroy/supervision-stack)).

## Ansible
Du fait d'utiliser plusieurs nœuds pour la haute disponibilité, j'ai utilisé Ansible pour automatiser le déploiement de services 
tels que NTP, Maria DB, Docker, nginx et Node Exporter.
Voir les [exemples de fichiers](../devops/ansible/exemples).

## Kubernetes
J'ai d'abord déployé Kubernetes avec 1 master et 3 nœuds. Mais pour avoir une meilleure disponibilité, j'ai déployé kubernetes avec 
**3 masters et 3 nœuds avec HAProxy et KeepAlived** selon les [recommendations pour kubeadm](https://github.com/kubernetes/kubeadm/blob/main/docs/ha-considerations.md).

Comme c'est une installation On-Premises, plusieurs services n'étaient pas installés (contrairement à une solution Cloud comme GCP) :
- **Stockage local**
  - Méthode : [installation d'un provisionner local](https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner/blob/master/helm/README.md)
  - Voir les [exemples de fichiers](../devops/kubernetes/exemple/global/storage/static).
- **Stockage par défaut**
  - Méthode : [Installation d'un provisionner NFS](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)
  - Voir les [exemples de fichiers](../devops/kubernetes/exemple/global/storage/dynamic).
- Load Balancer : je n'ai pas installé de service tel que [MetalLB](https://metallb.universe.tf/). Je fais des patchs pour l'adresse IP.
- Dashboard (Observabilité)
    - Méthode : [Installation du dashboard de Kubernetes](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)
    - Voir la [création du ServiceAccount et la liaison de rôle](../devops/kubernetes/exemple/global/dashboard)

Pour améliorer le LoadBalancing des applications, j'ai mis en place **Ingress**.

Kubernetes me sert donc pour déployer les services de mon projet [Rent A House](projet/presentation.md) :
- Microservice [Habitation](../devops/kubernetes/exemple/rentahouse/wshabitation)
- Microservice [Location](../devops/kubernetes/exemple/rentahouse/wslocation)
- Microservice [LocationUtilisateurs](../devops/kubernetes/exemple/rentahouse/wslocuser)
- [API Gateway](../devops/kubernetes/exemple/rentahouse/apigateway)
- RabbitMQ Cluster
  - Méthode : [Installation](https://github.com/rabbitmq/cluster-operator) 
  - [Mise en place](../devops/kubernetes/exemple/rentahouse/rabbitmq)

Afin de monitorer les services, j'ai mis en place Prometheus Cluster :
- Méthode : [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)
- [Mise en place](../devops/kubernetes/exemple/global/prometheus)

Pour Prometheus, j'ai mis en place des **ScrapeConfig** pour les serveurs Docker, le serveur nginx et les bases de données MySQL.

### Helm
J'utilise Helm pour l'installation de certains services tels que Prometheus et RabbitMQ.

## Terraform

## Google Cloud Plateform

## Amazon Web Services

## Azure
