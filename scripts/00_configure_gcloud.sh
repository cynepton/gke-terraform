#!/bin/bash

# This script is for setting up the gcloud cli locally to be able to run necessary gcloud commands
# to provision up the necessary GCP infrastructure for terraform.
# This script is especially useful when different test accounts and projects would be created and used frequently

# Path to service account file
SERVICE_ACCOUNT_KEYFILE_PATH="../.credentials/service_account.json"
# GCP project
PROJECT_ID="playground-s-11-1f6534cf"
DEFAULT_REGION="europe-west1"
DEFAULT_ZONE="europe-west1-c"

# Create a new gcloud configuration locally
gcloud config configurations create "$PROJECT_ID"

# Activate the service account for authentication
gcloud auth activate-service-account --key-file="$SERVICE_ACCOUNT_KEYFILE_PATH" --project="$PROJECT_ID"

# Set the default configuration to the new configuration
gcloud config configurations activate "$PROJECT_ID"

# Set the default project for gcloud commands in the new configuration
gcloud config set project "$PROJECT_ID"

# Set the default zone for gcloud commands in the new configuration
gcloud config set compute/zone $DEFAULT_ZONE

# Set the default region for gcloud commands in the new configuration
gcloud config set compute/region $DEFAULT_REGION
