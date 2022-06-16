data "digitalocean_kubernetes_versions" "dkproject" {
  version_prefix = "1.22."
}

resource "digitalocean_kubernetes_cluster" "dkcluster" {
  name         = "dkcluster"
  region       = "fra1"
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.example.latest_version

  maintenance_policy {
    start_time  = "04:00"
    day         = "sunday"
  }

  node_pool {
    name       = "default"
    size       = "s-1vcpu-2gb"
    node_count = 3
  }
}
