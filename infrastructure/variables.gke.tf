variable "production_cluster_name" {
  type        = string
  description = "The name of the production GKE cluster."
  default     = "production-cluster"
}

variable "apps_node_pool_name" {
  description = "The name of the applications node pool"
  type        = string
  default     = "apps_node_pool"
}