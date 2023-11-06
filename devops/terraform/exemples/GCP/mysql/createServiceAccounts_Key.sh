#!/bin/bash

# Création du ServiceAccount et Permission
gcloud iam service-accounts create sa-terraform --display-name "Terraform service account"

# Ajout du rôle au ServiceAccount
gcloud projects add-iam-policy-binding rentahouse34800 \
  --member="serviceAccount:sa-terraform@rentahouse34800.iam.gserviceaccount.com" \
  --role="roles/cloudsql.admin"

# Création de la clé du service
gcloud iam service-accounts keys create ./key.json \
  --iam-account sa-terraform@rentahouse34800.iam.gserviceaccount.com
