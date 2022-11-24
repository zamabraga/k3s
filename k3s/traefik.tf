# resource "helm_release" "traefik" {
#   name       = "traefik"
#   repository = "https://traefik.github.io/charts"
#   chart      = "traefik"
#   version    = "20.5.2"
#   namespace  = kubernetes_namespace.traefik.metadata.0.name
#   values = [
#     "${file("./yaml/traefik-values.yaml")}"
#   ]
# }

# resource "kubernetes_namespace" "traefik" {
#   metadata {
#     annotations = {
#       name = "traefik-v2"
#     }

#     labels = {
#       mylabel = "traefik-v2"
#     }

#     name = "traefik-v2"
#   }
# }
