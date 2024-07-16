

resource "kubernetes_config_map" "wshabitation" {
  metadata {
    name      = "wshabitation-configmap"
    namespace = var.namespace
  }

  data = {
    MARIADB_HOST     = var.mariadb_config.host
    MARIADB_PORT     = var.wshabitation.mariadb_port
    MARIADB_DATABASE = var.wshabitation.mariadb_dbname
  }
}

resource "kubernetes_secret" "wshabitation" {
  metadata {
    name      = "wshabitation-secret"
    namespace = var.namespace
  }

  data = {
    MARIADB_USER     = var.mariadb_config.username
    MARIADB_PASSWORD = var.mariadb_config.password
  }
}

resource "kubernetes_deployment" "wshabitation" {
  metadata {
    name      = "wshabitation-deployment"
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
        app = "wshabitation"
      }
    }
    template {
      metadata {
        labels = {
          app                           = "wshabitation"
          "app.kubernetes.io/component" = "web-service"
        }
      }

      spec {
        container {
          name  = "wshabitation"
          image = "registry.gitlab.com/rentahouse1/wshabitation/${var.wshabitation.image_version}"

          port {
            container_port = 8080
          }

          env {
            name  = "SPRING_PROFILES_ACTIVE"
            value = var.wshabitation.profile
          }

          env {
            name = "MARIADB_HOST"

            value_from {
              config_map_key_ref {
                key  = "MARIADB_HOST"
                name = "wshabitation-configmap"
              }
            }
          }

          env {
            name = "MARIADB_PORT"

            value_from {
              config_map_key_ref {
                key  = "MARIADB_PORT"
                name = "wshabitation-configmap"
              }
            }
          }

          env {
            name = "MARIADB_DATABASE"

            value_from {
              config_map_key_ref {
                key  = "MARIADB_DATABASE"
                name = "wshabitation-configmap"
              }
            }
          }

          env {
            name = "MARIADB_USER"

            value_from {
              secret_key_ref {
                key  = "MARIADB_USER"
                name = "wshabitation-secret"
              }
            }
          }

          env {
            name = "MARIADB_PASSWORD"

            value_from {
              secret_key_ref {
                key  = "MARIADB_PASSWORD"
                name = "wshabitation-secret"
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
    kubernetes_config_map.wshabitation,
    kubernetes_secret.wshabitation
  ]
}

resource "kubernetes_service" "wshabitation" {
  metadata {
    labels = {
      app = "wshabitation-service"
    }
    name      = "wshabitation-service"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = "wshabitation"
    }
    session_affinity = "ClientIP"
    port {
      name        = "wshabitation-metrics"
      #node_port   = var.wshabitation.service_nodeport
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }

  depends_on = [
    kubernetes_deployment.wshabitation
  ]
}
