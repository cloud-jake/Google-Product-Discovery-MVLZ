#!/bin/bash
#
# Enable Services
#
# https://cloud.google.com/resource-manager/docs/creating-managing-projects#gcloud
#
# gcloud services enable  

source variables.env

# Define Project ID 
# PROJECT_ID=""

# Enable services for Retail Project
gcloud services enable \
       logging.googleapis.com \
       monitoring.googleapis.com \
       retail.googleapis.com --project="${PROJECT_ID}"
