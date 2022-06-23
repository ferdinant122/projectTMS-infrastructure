variable "cluster_name" {
  description = "The name of the kubernetes cluster to create"
  type        = string
}

variable "cluster_version" {
  description = "The version of the kubernetes cluster to create"
  type        = string
}

variable "region" {
  description = "The digital ocean region slug for where to create resources"
  type        = string
}

variable "min_nodes" {
  description = "The minimum number of nodes in the default pool"
  type        = number
}

variable "max_nodes" {
  description = "The maximum number of nodes in the default pool"
  type        = number
}

variable "default_node_size" {
  description = "The default digital ocean node slug for each node in the default pool"
  type        = string
}

variable "do_token" {
  description = "Token for access Digital Ocean"
  type        = string
}