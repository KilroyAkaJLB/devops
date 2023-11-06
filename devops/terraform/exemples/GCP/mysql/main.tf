
resource "google_sql_database_instance" "main" {
  name = "tftest-instance"
  database_version = "MYSQL_8_0"
  region = "${var.region}"

  settings {
    availability_type = "ZONAL"
    disk_autoresize   = true
    disk_type         = "PD_HDD"
    tier              = "db-f1-micro"

    backup_configuration {
      enabled            = true
      start_time         = "04:00"
      binary_log_enabled = true
    }
  }

  root_password = "ap@ssw0rd"
}

resource "google_sql_database" "database" {
  name = "tftestdb"
  instance = "${google_sql_database_instance.main.name}"
  charset = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  name = "tfuser"
  instance = "${google_sql_database_instance.main.name}"
  host = "%"
  password = "ap@ssw0rd"
}
