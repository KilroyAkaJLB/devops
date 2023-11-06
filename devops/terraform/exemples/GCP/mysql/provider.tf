
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("/Users/adminjlb/Documents/DevOps/terraform/mysql/key.json")

  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}
