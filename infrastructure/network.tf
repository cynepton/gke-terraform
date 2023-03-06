# Create the production network
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "production_network" {
  name                    = var.production_network_name
  auto_create_subnetworks = false
  description             = "Managed by Terraform."
}

# Create the private subnetwork
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "production_subnet" {
  name          = var.production_subnet_name
  ip_cidr_range = var.production_subnet_cidr_range
  network       = google_compute_network.production_network.self_link
  description   = "Managed by Terraform."
}