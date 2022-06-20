variable "do_token" {
  default = ${{ secrets.DIGITALOCEAN_ACCESS_TOKEN }}
}

variable "region" {
  default = "fra1"
}

variable "k8s_clustername" {
  default = "dk-cluster-test"
}

variable "k8s_version" {
  default = "1.22.8-do.1"
}

variable "k8s_poolname" {
  default = "worker-pool"
}

variable "k8s_count" {
  default = "3"
}
