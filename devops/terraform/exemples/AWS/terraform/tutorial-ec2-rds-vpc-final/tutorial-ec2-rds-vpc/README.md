# tutorial-ec2-rds-vps



## Getting started
### Liste des AZ disponibles
La région choisie est Europe-Stockholm   
`% aws ec2 describe-availability-zones --region="eu-north-1"`

### Connection
`% export AWS_ACCESS_KEY_ID="anaccesskey"`   
`% export AWS_SECRET_ACCESS_KEY="asecretkey"`

## Initialisation
`% terraform init`

### Création du workspace
`% terraform workspace new "tutorial-vpcec2rds"`

## Mise en oeuvre
### Vérification
`% terraform validate`   
`% terraform plan --var-file="tutorial.tfvars"`

### Exécution
`% terraform apply --var-file="tutorial.tfvars" --auto-approve`
