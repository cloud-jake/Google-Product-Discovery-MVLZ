#!/bin/bash
#
# Create Projects
#
# https://cloud.google.com/resource-manager/docs/creating-managing-projects#gcloud
#
# gcloud projects create $PROJECT_ID --folder=$FOLDER_ID

source variables.env

# Create Project - 6-30 characters
gcloud projects create "${PROJECT_ID}" --folder=$FOLDER_ID
gcloud beta billing projects link "${PROJECT_ID}" --billing-account=$BILLING_ID

gcloud services enable \
       billingbudgets.googleapis.com \
       --project="${PROJECT_ID}"

gcloud billing budgets create --billing-account=$BILLING_ID \
       --display-name="budget-${PROJECT_ID}" \
       --budget-amount=1 \
       --calendar-period=month \
       --threshold-rule=percent=0.5 \
       --threshold-rule=percent=0.75 \
       --threshold-rule=percent=1.0,basis=current-spend \
       --filter-projects="projects/${PROJECT_ID}"