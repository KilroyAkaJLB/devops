
resource "kubernetes_config_map" "wslocuser" {
  metadata {
    name      = "wslocuser-configmap"
    namespace = var.namespace
  }

  data = {
    MARIADB_HOST     = var.mariadb_config.host
    MARIADB_PORT     = var.wslocuser.mariadb_port
    MARIADB_DATABASE = var.wslocuser.mariadb_dbname
  }
}

resource "kubernetes_secret" "wslocuser" {
  metadata {
    name      = "wslocuser-secret"
    namespace = var.namespace
  }

  data = {
    MARIADB_USER     = var.mariadb_config.username
    MARIADB_PASSWORD = var.mariadb_config.password
  }
}

resource "kubernetes_deployment" "wslocuser" {
  metadata {
    name      = "wslocuser-deployment"
    namespace = var.namespace
    labels = {
      "app.kubernetes.io/component" = "web-service"
      "app.kubernetes.io/part-of"   = var.namespace
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "wslocuser"
      }
    }

    template {
      metadata {
        labels = {
          app                           = "wslocuser"
          "app.kubernetes.io/component" = "web-service"
        }
      }

      spec {
        container {
          name  = "wslocuser"
          image = "registry.gitlab.com/rentahouse1/wslocuser/${var.wslocuser.image_version}"

          port {
            container_port = 8080
          }

          env {
            name  = "SPRING_PROFILES_ACTIVE"
            value = var.wslocuser.profile
          }

          env {
            name = "MARIADB_HOST"

            value_from {
              config_map_key_ref {
                key  = "MARIADB_HOST"
                name = "wslocuser-configmap"
              }
            }
          }

          env {
            name = "MARIADB_PORT"

            value_from {
              config_map_key_ref {
                key  = "MARIADB_PORT"
                name = "wslocuser-configmap"
              }
            }
          }

          env {
            name = "MARIADB_DATABASE"

            value_from {
              config_map_key_ref {
                key  = "MARIADB_DATABASE"
                name = "wslocuser-configmap"
              }
            }
          }

          env {
            name = "MARIADB_USER"

            value_from {
              secret_key_ref {
                key  = "MARIADB_USER"
                name = "wslocuser-secret"
              }
            }
          }

          env {
            name = "MARIADB_PASSWORD"

            value_from {
              secret_key_ref {
                key  = "MARIADB_PASSWORD"
                name = "wslocuser-secret"
              }
            }
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/actuator/health/liveness"
              port = 8080
            }

            initial_delay_seconds = 10
            period_seconds        = 120
          }

          readiness_probe {
            http_get {
              path = "/actuator/health/readiness"
              port = 8080
            }

            initial_delay_seconds = 10
            period_seconds        = 120
          }
        }
      }
    }
  }

  depends_on = [
    kubernetes_config_map.wslocuser,
    kubernetes_secret.wslocuser
  ]
}

resource "kubernetes_service" "wslocuser" {
  metadata {
    labels = {
      app = "wslocuser-service"
    }
    name      = "wslocuser-service"
    namespace = var.namespace
  }
  spec {
    session_affinity = "ClientIP"
    port {
      name        = "wslocuser-metrics"
      node_port   = var.wslocuser.service_nodeport
      port        = 8080
      target_port = 8080
    }

    selector = {
      app = "wslocuser"
    }

    type = "NodePort"
  }

  depends_on = [
    kubernetes_deployment.wslocuser
  ]
}
