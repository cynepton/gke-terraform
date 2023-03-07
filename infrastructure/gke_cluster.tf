# Provision the GKE cluster
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "production" {
  name        = "production_cluster"
  location    = var.region
  description = "Managed by Terraform. Production kubernetes cluster."

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network = google_compute_network.production_network.self_link
}

# Create a service account for the node pool
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "apps_node_pool" {
  account_id   = "apps_node_pool_sa"
  display_name = "Apps Node Pool Service Account"
  description  = "Managed by Terraform. Service Account for the apps node pool."
}

# Create the node pool for the applications
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "apps_node_pool" {
  name    = var.apps_node_pool_name
  cluster = google_container_cluster.production.id

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }
}