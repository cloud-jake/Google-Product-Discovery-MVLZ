#!/bin/bash
#
# Create Projects
#
# https://cloud.google.com/resource-manager/docs/creating-managing-projects#gcloud
#
# gcloud projects create $PROJECT_ID --folder=$FOLDER_ID

source variables.env

# Create Retail Project under Folder 
#gcloud projects create "${PROJECT_ID}" --folder=$FOLDER_ID

# Create Retail Project under Organization
#gcloud projects create "${PROJECT_ID}" --organization=$ORGANIZATION_ID

# Assign Billing Account to Project
#gcloud beta billing projects link "${PROJECT_ID}" --billing-account=$BILLING_ID


