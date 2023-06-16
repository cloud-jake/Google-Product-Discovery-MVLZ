#!/bin/bash

# Create Service Acount and Assign Permissions

# gcloud iam service-accounts create $SERVICE_ACCOUNT \
#    --description="Service account for XXXXX" \
#    --display-name="XXXX" \
#    --project=$PROJECT_ID

source variables.env


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
