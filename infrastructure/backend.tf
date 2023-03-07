# Terraform Settings Block
terraform {
  #  Specify the required terraform version
  required_version = ">= 1.3.9"

  # Define the configuration for the terraform state backend
  backend "gcs" {
    bucket      = "playground-s-11-9e97ce95-tfstate"
    prefix      = "prod/tfstate"
    credentials = "../.credentials/service_account.json"
  }

  # Define required providers
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.55.0"
    }
  }
}