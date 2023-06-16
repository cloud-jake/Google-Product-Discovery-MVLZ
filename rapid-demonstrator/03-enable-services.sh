#!/bin/bash
#
# Enable Services
#
# https://cloud.google.com/resource-manager/docs/creating-managing-projects#gcloud
#
# gcloud services enable  

source variables.env

# Enable Services for Project
gcloud services enable \
       cloudbuild.googleapis.com \
       composer.googleapis.com \
       storage-component.googleapis.com \
       logging.googleapis.com \
       monitoring.googleapis.com \
       retail.googleapis.com \
       cloudresourcemanager.googleapis.com --project="${PROJECT_NAME}-rapid-demo"

