resource "digitalocean_database_connection_pool" "pool-01" {
  cluster_id = digitalocean_database_cluster.postgres-example.id
  name       = "pool-01"
  mode       = "transaction"
  size       = 20
  db_name    = "defaultdb"
  user       = "doadmin"
}

resource "digitalocean_database_cluster" "postgres-example" {
  name       = "example-postgres-cluster"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}


resource "digitalocean_database_db" "database-example" {
  cluster_id = digitalocean_database_cluster.postgres-example.id
  name       = "db-example"
}
