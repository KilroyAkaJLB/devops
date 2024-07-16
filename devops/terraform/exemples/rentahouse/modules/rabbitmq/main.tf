terraform {
  required_providers {
    rabbitmq = {
      source = "cyrilgdn/rabbitmq"
      version = "1.8.0"
    }
  }
}

# Create a virtual host
resource "rabbitmq_vhost" "vhostname" {
  name = var.rabbitmq_vhost_name
}

resource "rabbitmq_permissions" "user" {
  user  = var.rabbitmq_server_user
  vhost = rabbitmq_vhost.vhostname.name

  permissions {
    configure = ".*"
    write     = ".*"
    read      = ".*"
  }
}

resource "rabbitmq_exchange" "rentahouse" {
  name  = "rentahouse.topic"
  vhost = rabbitmq_permissions.user.vhost

  settings {
    type        = "topic"
    durable     = true
    auto_delete = false
  }
}

resource "rabbitmq_queue" "habitation" {
  name  = "rentahouse.habitation"
  vhost = rabbitmq_permissions.user.vhost

  settings {
    durable     = true
    auto_delete = false
    arguments = {
      "x-queue-type" : "classic",
    }
  }
}

resource "rabbitmq_queue" "location" {
  name  = "rentahouse.location"
  vhost = rabbitmq_permissions.user.vhost

  settings {
    durable     = true
    auto_delete = false
    arguments = {
      "x-queue-type" : "classic",
    }
  }
}

resource "rabbitmq_queue" "locuser" {
  name  = "rentahouse.locuser"
  vhost = rabbitmq_permissions.user.vhost

  settings {
    durable     = true
    auto_delete = false
    arguments = {
      "x-queue-type" : "classic",
    }
  }
}

resource "rabbitmq_binding" "habitation" {
  source           = rabbitmq_exchange.rentahouse.name
  vhost            = rabbitmq_vhost.vhostname.name
  destination      = rabbitmq_queue.habitation.name
  destination_type = "queue"
  routing_key      = "rentahouse.habitation.key"
}

resource "rabbitmq_binding" "location" {
  source           = rabbitmq_exchange.rentahouse.name
  vhost            = rabbitmq_vhost.vhostname.name
  destination      = rabbitmq_queue.location.name
  destination_type = "queue"
  routing_key      = "rentahouse.location.key"
}

resource "rabbitmq_binding" "locuser" {
  source           = rabbitmq_exchange.rentahouse.name
  vhost            = rabbitmq_vhost.vhostname.name
  destination      = rabbitmq_queue.locuser.name
  destination_type = "queue"
  routing_key      = "rentahouse.locuser.key"
}
