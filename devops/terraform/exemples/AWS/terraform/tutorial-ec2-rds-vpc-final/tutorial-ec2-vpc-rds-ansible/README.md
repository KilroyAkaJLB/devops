

Vérification du playbook :
`% ansible-playbook --user admin --key-file /Users/adminjlb/Documents/DevOps/aws/keys/awsec2 -i inventory/tutorial_ec2rds.yaml --syntax-check playbook-apachephp.yaml`  

Exécution (Debian) :
`% ansible-playbook --user admin --key-file /Users/adminjlb/Documents/DevOps/aws/keys/awsec2 -i inventory/tutorial_ec2rds.yaml playbook-apachephp.yaml`
 