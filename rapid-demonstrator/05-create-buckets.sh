#!/bin/bash

# Create Storage Buckets
# gsutil mb -l ${LOCATION} gs://${PROJECT_ID}-name


source variables.env

PROJECT_ID="${PROJECT_NAME}-rapid-demo" 
GCS_EVENT="${PROJECT_ID}-event"
GCS_CATALOG="${PROJECT_ID}-catalog"
GCS_TEMP="${PROJECT_ID}-temp"
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_EVENT}
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_CATALOG}
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_TEMP}