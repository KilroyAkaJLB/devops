
resource "kubernetes_service" "wshabitation-service" {
  metadata {
    name      = "${var.application-name}-service"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = var.application-name
    }

    port {
      protocol    = "TCP"
      port        = 8080
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
