
locals {
  database_init_sql_file = "/docker/container/${var.docker_container_prefix}-terraform"
  db_timezone            = "Europe/Paris"
}


resource "docker_image" "mariadb" {
  name = "mariadb:10.7"
}

resource "docker_network" "private_network" {
  name = "dbrh-test-network"
}

resource "null_resource" "database_init_sql" {
  connection {
    host     = var.docker_config.host
    type     = "ssh"
    port     = var.docker_config.port_ssh
    user     = "root"
    #password =
    private_key = file(var.docker_config.private_key_file)
    agent = "false"
  }

  # Création du répertoire
  provisioner "remote-exec" {
    inline = [
      "mkdir -p ${local.database_init_sql_file}"
    ]
  }
  # Copie des fichiers
  provisioner "file" {
    source      = "${path.module}/databases/"
    destination = local.database_init_sql_file

  }
}

resource "docker_container" "databases" {
  for_each = { for db in var.db_rentahouse : db.name => db }

  image        = docker_image.mariadb.image_id
  name         = "${var.docker_container_prefix}${each.value.name}"
  restart      = "always"
  network_mode = docker_network.private_network.name

  ports {
    internal = 3306
    external = each.value.external_port
  }
  mounts {
    type   = "bind"
    target = "/docker-entrypoint-initdb.d/init.sql"
    source = "${local.database_init_sql_file}/${each.key}.sql"
  }

  env = [
    "MARIADB_ROOT_PASSWORD=${var.database_config.root_password}",
    "MARIADB_DATABASE=${each.key}",
    "MARIADB_USER=${var.database_config.user_login}",
    "MARIADB_PASSWORD=${var.database_config.user_password}",
    "TZ=${local.db_timezone}"
  ]

  depends_on = [
    null_resource.database_init_sql
  ]
}
