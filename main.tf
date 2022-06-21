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

provider "digitalocean" {
  token = "dop_v1_4ccd1b68cf7e73682383424f0b6626ead1d91596c25db4d2eb8cd659818a4603"
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
