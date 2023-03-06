#!/bin/bash

# Script to setup the required infrastructure needed before terraform can start managing infrastructure
# This only needs to be run once when the account is created.
# The gcloud and gsutil cli tools should have already been setup

PROJECT_ID="playground-s-11-120b47be"
DEFAULT_REGION="europe-west1"

# Create cloud storage bucket for storing terraform state
gsutil mb -p $PROJECT_ID -l $DEFAULT_REGION gs://$PROJECT_ID-tfstate
# Enable Object versioning on the bucket
gsutil versioning set on gs://$PROJECT_ID-tfstate