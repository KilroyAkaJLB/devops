# terraform import

Afficher les modifications apportées : `terraform plan -var-file="staging.tfvars"`  

## Suprimmer des imports
Exemple pour le service wslocuser dans kubernetes  
Affichage de l'état :
`$ terraform state list "module.kubernetes.kubernetes_deployment.wslocuser"`  
Test de suppression : 
`$ terraform state rm -dry-run "module.kubernetes.kubernetes_deployment.wslocuser"`
Suppression : 
`$ terraform state rm "module.kubernetes.kubernetes_deployment.wslocuser"`

## Kubernetes
### Importer les déploiements
`$ terraform import -var-file="staging.tfvars"  module.kubernetes.kubernetes_namespace.rentahouse rah-staging`  
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_deployment.wshabitation rah-staging/wshabitation-deployment`  
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_deployment.wslocation rah-staging/wslocation-deployment`   
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_deployment.wslocuser rah-staging/wslocuser-deployment` 

### Importer les services
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_service.wshabitation rah-staging/wshabitation-service`  
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_service.wslocation rah-staging/wslocation-service`  
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_service.wslocuser rah-staging/wslocuser-service`

### Importer les secrets
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_secret.wshabitation rah-staging/wshabitation-secret`  
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_secret.wslocation rah-staging/wslocation-secret`  
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_secret.wslocuser rah-staging/wslocuser-secret` 

### Importer les ConfigMap
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_config_map.wshabitation rah-staging/wshabitation-configmap`  
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_config_map.wslocation rah-staging/wslocation-configmap`  
`$ terraform import -var-file="staging.tfvars" module.kubernetes.kubernetes_config_map.wslocuser rah-staging/wslocuser-configmap`  


## Docker
### Importer le réseau
Obtenir l'ID : ``$ ID = `dbrh-test-network --format "{{.ID}}"` ``  
`$ terraform import -var-file="staging.tfvars" module.docker.docker_network.private_network $CONTAINER_ID`

### Importer les bases de données
Obtenir l'ID : ``$ CONTAINER_ID=`docker inspect  stagingrhhabitation --format "{{.ID}}"` ``  
`$ terraform import -var-file="staging.tfvars" 'module.docker.docker_container.databases["rhhabitation"]' $CONTAINER_ID`  
Obtenir l'ID : ``$ CONTAINER_ID=`docker inspect  stagingrhlocation --format "{{.ID}}"` ``  
`$ terraform import -var-file="staging.tfvars" 'module.docker.docker_container.databases["rhlocation"]' $CONTAINER_ID`  
Obtenir l'ID : ``$ CONTAINER_ID=`docker inspect  stagingrhlocuser --format "{{.ID}}"` ``  
`$ terraform import -var-file="staging.tfvars" 'module.docker.docker_container.databases["rhlocuser"]' $CONTAINER_ID`


## RabbitMQ
### Importer le vhostname
`$ terraform import -var-file="staging.tfvars" module.rabbitmq.rabbitmq_vhost.vhostname <vhost_name>`  
Exemple : terraform import -var-file="staging.tfvars" module.rabbitmq.rabbitmq_vhost.vhostname staging
### Importer un exchange
`$terraform import -var-file="staging.tfvars" module.rabbitmq.rabbitmq_exchange.rentahouse rentahouse.topic@staging`  
### Importer une queue
`$terraform import -var-file="staging.tfvars" module.rabbitmq.rabbitmq_queue.habitation rentahouse.habitation@staging`  
### Importer un binding
Générique : `$terraform import -var-file="staging.tfvars" module.rabbitmq.rabbitmq_binding.<name> <vhost/source/destination/destination_type/properties_key>`  
Exemple : `$terraform import -var-file="staging.tfvars" module.rabbitmq.rabbitmq_binding.habitation staging/rentahouse.topic/rentahouse.habitation/queue/rentahouse.habitation.key`  



