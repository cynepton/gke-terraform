#!/bin/bash

# Script to setup the required infrastructure needed before terraform can start managing infrastructure
# This only needs to be run once when the account is created.
# The gcloud and gsutil cli tools should have already been setup

PROJECT_ID="$1"
echo "Using GCP project: $1"
DEFAULT_REGION="$2:-europe-west1"
echo "Using default region: $2"

# Create cloud storage bucket for storing terraform state
gsutil mb -p $PROJECT_ID -l $DEFAULT_REGION gs://$PROJECT_ID-tfstate
# Enable Object versioning on the bucket
gsutil versioning set on gs://$PROJECT_ID-tfstate