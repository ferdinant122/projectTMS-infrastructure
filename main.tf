terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.7.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.1"
    }
  }
}

data "github_actions_public_key" "example_public_key" {
  repository = "ferdinant122/projectTMS-infrastructure"
}

resource "github_actions_secret" "DO_secret" {
  repository      = "ferdinant122/projectTMS-infrastructure"
  secret_name     = "DIGITALOCEAN_ACCESS_TOKEN"
  encrypted_value = var.some_encrypted_secret_string
}


provider "digitalocean" {
  token = data.github_actions_public_key
}

provider "kubernetes" {
  host  = digitalocean_kubernetes_cluster.default_cluster.endpoint
  token = digitalocean_kubernetes_cluster.default_cluster.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.default_cluster.kube_config[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    host  = digitalocean_kubernetes_cluster.default_cluster.endpoint
    token = digitalocean_kubernetes_cluster.default_cluster.kube_config[0].token
    cluster_ca_certificate = base64decode(
      digitalocean_kubernetes_cluster.default_cluster.kube_config[0].cluster_ca_certificate
    )
  }
}
