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
Or dans mon projet Rent A House, j'ai plusieurs microservices, une application mobile et une application web.  
L'utilisation de **Terraform** a pallié à ce problème. De plus Terraform me permet aussi de déployer mes conteneurs Docker pour mes bases de données.

Tous mes déploiements sont fait sur Kubernetes (`On-Premises avec VMware`) que j'ai mis en place. 
La suite logique du 'On-Premises' a été l'utilisation du **Cloud avec GCP et AWS**. J'ai donc fait quelques tests de mise en place
de mon projet sur GCP et AWS.

## Docker
J'ai d'abord utilisé Docker pour mon travail afin de déployer des microservices (ASP.Net Core, Spring Boot), des sites web (Angular) et 
différents services (GLPI, LAMP, OpenLDAP, Rabbit MQ, ...).
Voir les [exemples de fichiers](../devops/docker/exemples/ecole).

Avec mon projet Rent A House, j'utilise Docker pour le DNS (Bind9), les bases de données, le Reverse Proxy (nginx) et des GitLab Runner (Flutter, Kubernetes, ...).  
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
J'ai d'abord déployé Kubernetes avec 1 master et 3 nœuds pour ma première version.. Mais pour avoir une meilleure disponibilité, j'ai augmenté le déploiement avec 
**3 masters et 3 nœuds avec HAProxy et KeepAlived** selon les [recommendations pour kubeadm](https://github.com/kubernetes/kubeadm/blob/main/docs/ha-considerations.md).  
Pour ma deuxième version de cluster Kubernetes, j'ai déployé 3 masters et 9 nœuds.
Pourquoi 9 nœuds me direz-vous ? pour pouvoir faire des tests de déploiements avec 
- les labels
- les propriétés "node selector" et "node affinity"
- les propriétés "Taint et Tolerations"
- la montée en charge Horizontale 
- la montée en charge verticale

Comme c'est une installation On-Premises, plusieurs services n'étaient pas installés (contrairement à une solution Cloud comme GCP) :
- **Stockage statique **
  - Méthode : [installation d'un provisionner local](https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner/blob/master/helm/README.md)
  - Voir les [exemples de fichiers](../devops/kubernetes/exemple/global/storage/static) avec un stockage NFS.
- **Stockage dynamique par défaut**
  - Méthode : [Installation d'un provisionner NFS](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)
  - Voir les [exemples de fichiers](../devops/kubernetes/exemple/global/storage/dynamic) avec un stockage NFS.
- Load Balancer : mise en place [Ingress](../devops/kubernetes/exemple/global/ingress) . Je fais des patchs pour l'adresse IP.
- Gateway API : mise en place de [nginx-gateway-fabric](../devops/kubernetes/exemple/global/gateway-api/nginx)
- Dashboard (Observabilité)
    - Méthode : [Installation du dashboard de Kubernetes](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)
    - Voir la [création du ServiceAccount et la liaison de rôle](../devops/kubernetes/exemple/global/dashboard)


Kubernetes me sert donc pour déployer les services de mon projet [Rent A House](projet/presentation.md) :
- Microservice [Habitation](../devops/kubernetes/exemple/rentahouse/wshabitation/baremetal)
- Microservice [Location](../devops/kubernetes/exemple/rentahouse/wslocation/baremetal)
- Microservice [LocationUtilisateurs](../devops/kubernetes/exemple/rentahouse/wslocuser/baremetal)
- [API Gateway](../devops/kubernetes/exemple/rentahouse/apigateway)
- RabbitMQ Cluster
  - Méthode : [Installation](https://github.com/rabbitmq/cluster-operator) 
  - [Mise en place](../devops/kubernetes/exemple/rentahouse/rabbitmq)

Afin de monitorer les services, j'ai mis en place Prometheus Cluster :
- Méthode : [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)
- [Mise en place](../devops/kubernetes/exemple/global/prometheus)
- Cela inclut AlertManager (alerte par mail) et Grafana (Dashboards pour l'ensemble des services et des applications de RentAHouse)

Pour Prometheus, j'ai mis en place des **ScrapeConfig** cAdvisor pour Docker, HAProxy, node-exporter et les bases de données MySQL.

### Helm
J'utilise Helm pour l'installation de certains services tels que Prometheus et RabbitMQ.

## Terraform
Pour la mise en place de l'architecture, j'utilise VMware ESXi et vCenter. J'ai donc utilisé Terraform pour créer et configurer les machines virtuelles.  
Voir les [exemples de fichiers](../devops/terraform/exemples/kubernetes/vmware/k8snodes).  

Afin de déployer, en un seul "clic", les applications du projet RentAHouse, j'ai utilisé Terraform pour automatiser ce déploiement.
Cela permet de :
- déployer les bases de données sous Docker
- déployer les services sous Kubernetes
- déployer la configuration de RabbitMQ

Voir les [exemples de fichiers](../devops/terraform/exemples/rentahouse).


## Google Cloud Plateform
Pour aller plus loin dans la philosophie DevOps, j'ai testé le déploiement de mon projet RentAHouse dans GCP.  
J'ai modifié le service WSHabitation pour qu'il utilise :
- Une base de données MYSQL ([en sidecar](../devops/kubernetes/exemple/rentahouse/wshabitation/gcp))
- Un espace de stockage [Buket](../devops/terraform/exemples/GCP/storage-bucket) 

## Amazon Web Services
Pour enrichir mes connaissances du cloud, j'ai fait différents tests sur AWS :
- déploiement d'une instance EC2, d'un VPC, d'une base de données RDS avec [Terraform](../devops/terraform/exemples/AWS/terraform/tutorial-ec2-vps-rds-terraform) et [Ansible](../devops/terraform/exemples/AWS/terraform/tutorial-ec2-vps-rds-ansible) pour les services Apache et PHP 
- les fonctions [lambdas](../devops/terraform/exemples/AWS/lambda)


## Azure
Non testé pour l'instant, à suivre donc.
