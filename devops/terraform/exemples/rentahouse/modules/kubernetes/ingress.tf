
/*variable "webservices" {
  type = list(object({
    name          = string
    service_name  = string
    service_port  = string
  }))
}*/
locals {
  webservices = [
    { name = "wshabitation", service_name = kubernetes_service.wshabitation.metadata.0.name, service_port = kubernetes_service.wshabitation.spec.0.port.0.port },
    { name = "wslocation", service_name = kubernetes_service.wslocation.metadata.0.name, service_port = kubernetes_service.wslocation.spec.0.port.0.port },
    { name = "wslocuser", service_name = kubernetes_service.wslocuser.metadata.0.name, service_port = kubernetes_service.wslocuser.spec.0.port.0.port },
  ]
}

resource "kubernetes_ingress_v1" "webservices" {
  for_each = {for ws in local.webservices : ws.name => ws }

  metadata {
    name = each.key
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "${each.key}.${var.namespace}.kube.kilroy.devops.lan"
      http {
        path {
          path = "/"
          backend {
            service {
              name = each.value.service_name
              port {
                number = each.value.service_port
              }
            }
          }
        }
      }
    }
  }
}

/*resource "kubernetes_ingress_v1" "wshabitation" {
  metadata {
    name = "wshabitation"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "wshabitation.kube.kilroy.devops.lan"
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.wshabitation.metadata.0.name
              port {
                number = kubernetes_service.wshabitation.spec.0.port.0.port
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "location" {
  metadata {
    name = "wslocation"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "wslocation.kube.kilroy.devops.lan"
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.wslocation.metadata.0.name
              port {
                number = kubernetes_service.wslocation.spec.0.port.0.port
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "locuser" {
  metadata {
    name = "wslocuser"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "wslocuser.kube.kilroy.devops.lan"
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.wslocuser.metadata.0.name
              port {
                number = kubernetes_service.wslocuser.spec.0.port.0.port
              }
            }
          }
        }
      }
    }
  }
}
*/