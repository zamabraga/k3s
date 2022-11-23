terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.16.0"
    }
  }
}

provider "kubernetes" {
  config_path = "./k3s.yaml"
}
