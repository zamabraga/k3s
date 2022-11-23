resource "kubernetes_namespace" "main" {
  metadata {
    annotations = {
      name = "k3s-project-dev"
    }

    labels = {
      mylabel = "k3s-project-dev"
    }

    name = "k3s-project-dev"
  }
}
