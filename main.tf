terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = "dop_v1_22846706629dfdd1c3ed90bbe9e11b75115bdcc25755756161208354fd5794ba"
}


provider "kubernetes" {
  host  = resource.digitalocean_kubernetes_cluster.k8s.endpoint
  token = resource.digitalocean_kubernetes_cluster.k8s.kube_config[0].token
  cluster_ca_certificate = base64decode(
    resource.digitalocean_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
  )
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name   = "dk-cluster"
  region = "fra1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.22.8-do.1"

  node_pool {
    name = "dk-cluster-worker-pool"
    auto_scale = true
    # doctl kubernetes options sizes
    size       = "s-2vcpu-4gb"
    min_nodes  = 1
    max_nodes  = 5
  }
}

resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-dk"
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
  
 resource "digitalocean_database_connection_pool" "pool-db-dk" {
  cluster_id = digitalocean_database_cluster.postgres-example.id
  name       = "pool-db-dk"
  mode       = "transaction"
  size       = 20
  db_name    = "defaultdb"
  user       = "doadmin"
}

resource "digitalocean_database_cluster" "postgres-dk" {
  name       = "example-postgres-cluster"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}
