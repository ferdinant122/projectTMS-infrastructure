terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.9.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4.1"
    }
  }
}


provider "digitalocean" {
  token = var.do_token
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubectl" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}