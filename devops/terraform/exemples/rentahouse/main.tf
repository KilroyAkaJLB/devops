terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.24.0"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }

    rabbitmq = {
      source = "cyrilgdn/rabbitmq"
      version = "1.8.0"
    }
  }
}

# Connection à kube
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Connection Docker
provider "docker" {
  #host = "unix:///var/run/docker.sock"
  host     = "ssh://root@192.168.1.7:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

# Connection RabbitMQ
provider "rabbitmq" {
  endpoint = var.rabbitmq_server_address
  username = var.rabbitmq_server_user
  password = var.rabbitmq_server_password
}

module "docker" {
  source = "./modules/docker"

  docker_config             = var.docker_config
  database_config           = var.database_config
  db_rentahouse             = [
    { name = var.wshabitation.mariadb_dbname, external_port = var.wshabitation.mariadb_port },
    { name = var.wslocation.mariadb_dbname, external_port = var.wslocation.mariadb_port },
    { name = var.wslocuser.mariadb_dbname, external_port = var.wslocuser.mariadb_port },
  ]
  docker_container_prefix   = var.docker_container_prefix
}

module "kubernetes" {
  source = "./modules/kubernetes"

  namespace      = var.namespace

  mariadb_config = {
    host     = var.docker_config.host
    username = var.database_config.user_login
    password = var.database_config.user_password
  }
  wshabitation     = var.wshabitation
  wslocation     = var.wslocation
  wslocuser      = var.wslocuser
}

module "rabbitmq" {
  source = "./modules/rabbitmq"

  rabbitmq_server_address   = var.rabbitmq_server_address
  rabbitmq_vhost_name       = var.rabbitmq_vhost_name
  rabbitmq_server_user      = var.rabbitmq_server_user
  rabbitmq_server_password  = var.rabbitmq_server_password
}
