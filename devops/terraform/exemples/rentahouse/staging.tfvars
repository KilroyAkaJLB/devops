
# Docker properties
docker_config = {
  host = "192.168.1.7"
  port = 22
  private_key_file = "/Users/adminjlb/.ssh/id_rsa"
}

docker_container_prefix = "staging"

database_config = {
  root_password = "abcd4ABCD"
  user_login    = "adminrh"
  user_password = "abcd4ABCD"
}

# Kubernetes properties
namespace       = "rah-staging"

wshabitation = {
  image_version    = "epic-interaction-microservice:latest"
  service_nodeport = 31611
  mariadb_port     = 3511
  mariadb_dbname   = "rhhabitation"
  profile          = "staging"
}
wslocation = {
  image_version    = "epic-interaction-microservice:latest"
  service_nodeport = 31612
  mariadb_port     = 3512
  mariadb_dbname   = "rhlocation"
  profile          = "Staging"
}
wslocuser = {
  image_version    = "epic-interaction-microservice:latest"
  service_nodeport = 31613
  mariadb_port     = 3513
  mariadb_dbname   = "rhlocuser"
  profile          = "staging"
}
