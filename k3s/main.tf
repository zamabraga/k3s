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


resource "kubernetes_namespace" "postgresql" {
  metadata {
    annotations = {
      name = "postgresql"
    }

    labels = {
      mylabel = "postgresql"
    }

    name = "postgresql"
  }
}
