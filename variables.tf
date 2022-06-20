variable "do_token" {
  default = "dop_v1_587ed131ae530fd7060ab61ef602cf562d713976f7285bcf06004733c165515d"
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
