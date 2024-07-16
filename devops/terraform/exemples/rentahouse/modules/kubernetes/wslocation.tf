
resource "kubernetes_config_map" "wslocation" {
  metadata {
    name      = "wslocation-configmap"
    namespace = var.namespace
  }

  data = {
    MARIADB_HOST     = var.mariadb_config.host
    MARIADB_PORT     = var.wslocation.mariadb_port
    MARIADB_DATABASE = var.wslocation.mariadb_dbname
  }
}

resource "kubernetes_secret" "wslocation" {
  metadata {
    name      = "wslocation-secret"
    namespace = var.namespace
  }

  data = {
    MARIADB_USER     = var.mariadb_config.username
    MARIADB_PASSWORD = var.mariadb_config.password
  }
}

resource "kubernetes_deployment" "wslocation" {
  metadata {
    name      = "wslocation-deployment"
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
        app = "wslocation"
      }
    }

    template {
      metadata {
        labels = {
          app                           = "wslocation"
          "app.kubernetes.io/component" = "web-service"
        }
      }

      spec {
        container {
          name  = "wslocation"
          image = "registry.gitlab.com/rentahouse1/wslocation/${var.wslocation.image_version}"

          port {
            container_port = 80
          }

          env {
            name  = "ASPNETCORE_ENVIRONMENT"
            value = var.wslocation.profile
          }

          env {
            name = "MARIADB_HOST"

            value_from {
              config_map_key_ref {
                key  = "MARIADB_HOST"
                name = "wslocation-configmap"
              }
            }
          }

          env {
            name = "MARIADB_PORT"

            value_from {
              config_map_key_ref {
                key  = "MARIADB_PORT"
                name = "wslocation-configmap"
              }
            }
          }

          env {
            name = "MARIADB_DATABASE"

            value_from {
              config_map_key_ref {
                key  = "MARIADB_DATABASE"
                name = "wslocation-configmap"
              }
            }
          }

          env {
            name = "MARIADB_USER"

            value_from {
              secret_key_ref {
                key  = "MARIADB_USER"
                name = "wslocation-secret"
              }
            }
          }

          env {
            name = "MARIADB_PASSWORD"

            value_from {
              secret_key_ref {
                key  = "MARIADB_PASSWORD"
                name = "wslocation-secret"
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
              path = "/healthz/liveness"
              port = 80
            }

            initial_delay_seconds = 10
            period_seconds        = 120
          }

          readiness_probe {
            http_get {
              path = "/healthz/readiness"
              port = 80
            }

            initial_delay_seconds = 10
            period_seconds        = 120
          }
        }
      }
    }
  }

  depends_on = [
    kubernetes_config_map.wslocation,
    kubernetes_secret.wslocation
  ]
}

resource "kubernetes_service" "wslocation" {
  metadata {
    labels = {
      app = "wslocation-service"
    }
    name      = "wslocation-service"
    namespace = var.namespace
  }
  spec {
    session_affinity = "ClientIP"
    port {
      name        = "wslocation-metrics"
      node_port   = var.wslocation.service_nodeport
      port        = 80
      target_port = 80
    }

    selector = {
      app = "wslocation"
    }

    type = "NodePort"
  }

  depends_on = [
    kubernetes_deployment.wslocation
  ]
}