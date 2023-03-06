# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#project
variable "project" {
  description = "The default GCP project to manage resources in. If another project is specified on a resource, it will take precedence"
  type        = string
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#region
variable "region" {
  description = "The default region to manage resources in. If another region is specified on a regional resource, it will take precedence"
  type        = string
  default     = "europe-west1"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#credentials
variable "credentials_file" {
  type        = string
  description = "Path to a service account key file in JSON format."
  default     = "../.credentials/service_account.json"
}