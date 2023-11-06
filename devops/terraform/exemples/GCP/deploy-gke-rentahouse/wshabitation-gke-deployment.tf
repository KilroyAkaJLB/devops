
resource "kubernetes_deployment" "wshabitation" {
  metadata {
    name      = "${var.application-name}-deployment"
    namespace = var.namespace

    labels = {
      App = "${var.namespace}-${var.application-name}"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = var.application-name
      }
    }
    template {
      metadata {
        labels = {
          app = var.application-name
        }
      }
      spec {
        container {
          image = "registry.gitlab.com/kilroywashere.devops/wshabitation/main"
          name  = var.application-name

          env {
            name   = "SPRING_PROFILES_ACTIVE"
            value  = "gcp"
          }

          port {
            container_port = 8080
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

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "200m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }

}
