terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = "dop_v1_4a2d38233587c1574a2eb9925af81b0d618a0ef50f150e1406ed87930e3a8f2c"
}

resource "digitalocean_kubernetes_cluster" "dk-cluster" {
  name   = "dk-cluste"
  region = "fra1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.22.8-do.1"

  node_pool {
    name       = "dk-worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3

    taint {
      key    = "workloadKind"
      value  = "database"
      effect = "NoSchedule"
    }
  }
}
