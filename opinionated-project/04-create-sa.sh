#!/bin/bash

source variables.env

# Define Project ID 
# PROJECT_ID=""

# Create Service Acount and Assign Permissions

# Reference:
# - Retail Search Technical Integration Document | PSO | Y22
# - 3.3 Access Management
# - https://docs.google.com/document/d/1Whmfh0oetvv6YhsCHraIdTmUcD57arWuB2RWvm8fhek/edit?resourcekey=0-QhkLlomLYElE1WM-XHqNWA#heading=h.2hz0qnjeyzmp

# gcloud iam service-accounts create $SERVICE_ACCOUNT \
#    --description="Service account for XXXXX" \
#    --display-name="XXXX" \
#    --project=$PROJECT_ID

#[Search]
# Call Retail API 
#    roles/retail.viewer
#    -Retail Search Project 


SA="retail-search"
SA_FULL="${SA}@${PROJECT_ID}.iam.gserviceaccount.com"                     
gcloud iam service-accounts create ${SA} \
       --description="Service account to call Retail API" \
       --display-name="${SA}" --project="${PROJECT_ID}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/retail.viewer



#[User Event Pipeline] 
# Streaming from Web Analytics to BigQuery 
#    roles/bigquery.dataEditor
#    -User Events Table (BigQuery)
#
#    roles/retail.editor
#    -Retail Search Project

SA="retail-user-event-pipeline"
SA_FULL="${SA}@${PROJECT_ID}.iam.gserviceaccount.com" 
gcloud iam service-accounts create ${SA} \
       --description="Service account for User Event Pipeline" \
       --display-name="${SA}" --project="${PROJECT_ID}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/bigquery.dataEditor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/retail.editor



#[Index Manager]
# Manage BQ
#    roles/bigquery.dataEditor
#    -Catalog Table (BigQuery)
#    -Audit Table (BigQuery)
#
#   roles/retail.editor
#   -Retail Search Project 
#
#   roles/pubsub.subscriber
#   -Catalog Event Topic

SA="retail-index-manager"
SA_FULL="${SA}@${PROJECT_ID}.iam.gserviceaccount.com"
gcloud iam service-accounts create ${SA} \
       --description="Service account for BQ Index Manager" \
       --display-name="${SA}" --project="${PROJECT_ID}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/bigquery.dataEditor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/retail.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/pubsub.subscriber


#[Automation SA]
# Service account to deploy Retail Search via Infrastructure as Code templates 
# (for example, Terraform, Deployment Manager) 
# Exact permissions depend on services deployed, this is illustrative. 

#   All roles on Project
#
#   roles/bigquery.dataEditor
#   roles/dataflow.admin
#   roles/pubsub.admin
#   roles/logging.admin
#   roles/monitoring.admin
#   roles/compute.networkAdmin

SA="retail-automation-sa"
SA_FULL="${SA}@${PROJECT_ID}.iam.gserviceaccount.com"
gcloud iam service-accounts create ${SA} \
       --description="Service account for Automation" \
       --display-name="${SA}" --project="${PROJECT_ID}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/bigquery.dataEditor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/dataflow.admin
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/pubsub.admin
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/pubsub.admin
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/logging.admin
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=serviceAccount:$SA_FULL --role=roles/compute.networkAdmin
