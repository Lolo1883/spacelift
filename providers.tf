terraform {
  required_version = ">= 1.5"
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = ">=0.0.11"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=2.22.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.10.0"
    }
  }
}

provider "kind" {}

provider "docker" {}

provider "helm" {
  kubernetes {
    config_path = "${path.module}/kubeconfig.yaml"
  }
}
