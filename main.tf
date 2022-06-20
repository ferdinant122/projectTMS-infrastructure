provider "digitalocean"{
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = var.k8s_clustername
  region  = var.region
  version = var.k8s_version

  tags = ["k8s"]

  # This default node pool is mandatory
  node_pool {
    name       = var.k8s_poolname
    size       = "s-2vcpu-2gb"
    auto_scale = false
    node_count = var.k8s_count
    tags       = ["node-pool-tag"]
  }

}

output "cluster-id" {
  value = digitalocean_kubernetes_cluster.kubernetes_cluster.id
}

resource "digitalocean_droplet" "web" {
  name   = "web-1"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-20-04-x64"
  region = "fra1"
}

resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-1"
  region = "fra1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [digitalocean_droplet.web.id]
}
