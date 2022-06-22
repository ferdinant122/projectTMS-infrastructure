variable "cluster_name" {
  description = "The name of the kubernetes cluster to create"
  type        = string
  default     = "dk-cluster-dev"
}

variable "cluster_version" {
  description = "The version of the kubernetes cluster to create"
  type        = string
  default     = "1.22.8-do.1"
}

variable "region" {
  description = "The digital ocean region slug for where to create resources"
  type        = string
  default     = "fra1"
}

variable "min_nodes" {
  description = "The minimum number of nodes in the default pool"
  type        = number
  default     = 3
}

variable "max_nodes" {
  description = "The maximum number of nodes in the default pool"
  type        = number
  default     = 3
}

variable "default_node_size" {
  description = "The default digital ocean node slug for each node in the default pool"
  type        = string
  default     = "s-2vcpu-4gb"
}
