#!/bin/bash
#
# Create Projects
#
# https://cloud.google.com/resource-manager/docs/creating-managing-projects#gcloud
#
# gcloud projects create $PROJECT_ID --folder=$FOLDER_ID

source variables.env

# Create Project - 6-30 characters
gcloud projects create "${PROJECT_NAME}-rapid-demo" --folder=$FOLDER_ID
gcloud beta billing projects link "${PROJECT_NAME}-rapid-demo" --billing-account=$BILLING_ID
