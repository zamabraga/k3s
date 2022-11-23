resource "kubernetes_namespace" "main" {
  metadata {
    annotations = {
      name = "main"
    }

    labels = {
      mylabel = "main"
    }

    name = "main-nps"
  }
}

resource "kubernetes_namespace" "itw" {
  metadata {
    annotations = {
      name = "itw"
    }

    labels = {
      mylabel = "itw"
    }

    name = "itw"
  }
}
