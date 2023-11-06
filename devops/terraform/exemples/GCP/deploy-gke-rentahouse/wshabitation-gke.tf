# Deploy wshabitation web service

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}


provider "kubernetes" {
  config_path = "~/.kube/config"
}

#provider "kubernetes" {
#  host    = google_container_cluster.default.endpoint
#  token   = data.google_client_config.current.access_token
#  client_certificate = base64decode(
#    google_container_cluster.default.master_auth[0].client_certificate,
#  )
#  client_key = base64decode(google_container_cluster.default.master_auth[0].client_key)
#  cluster_ca_certificate = base64decode(
#    google_container_cluster.default.master_auth[0].cluster_ca_certificate,
#  )
#}
