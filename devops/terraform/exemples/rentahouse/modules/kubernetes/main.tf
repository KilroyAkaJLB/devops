

// Création du namespace
resource "kubernetes_namespace" "rentahouse" {
  metadata {
    name = var.namespace
  }
}
