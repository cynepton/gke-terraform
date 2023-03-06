variable "production_network_name" {
  description = "The name for the production VPC"
  type        = string
  default     = "production-network"
}

variable "production_subnet_name" {
  description = "The name for the private subnet in the production network."
  type        = string
  default     = "production-subnetwork"
}

variable "production_subnet_cidr_range" {
  type        = string
  description = "The range of IPv4 internal addresses that are owned by this subnetwork. Ranges must be unique and non-overlapping within a network."
  default     = "10.0.0.0/15"
}