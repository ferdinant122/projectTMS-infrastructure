resource "digitalocean_kubernetes_cluster" "dk-cluster" {
  name    = "dk-cluster"
  region  = "fra1"
  version = "1.22.8-do.1"

  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }
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

resource "digitalocean_database_cluster" "postgres-dk" {
  name       = "dk-postgres-cluster"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}

