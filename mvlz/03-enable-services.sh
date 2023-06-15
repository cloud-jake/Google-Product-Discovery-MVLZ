#!/bin/bash
#
# Enable Services
#
# https://cloud.google.com/resource-manager/docs/creating-managing-projects#gcloud
#
# gcloud services enable  

source variables.env
randomnumber=`cat random.tmp`

# Enable Services for Common Project
gcloud services enable \
       cloudbuild.googleapis.com \
       composer.googleapis.com \
       storage-component.googleapis.com \
       logging.googleapis.com \
       monitoring.googleapis.com \
       cloudresourcemanager.googleapis.com --project="${PRJPRE}-${PRJC}-retail-${randomnumber}"


# Enable Services for API Projects
gcloud services enable \
       logging.googleapis.com \
       monitoring.googleapis.com \
       retail.googleapis.com --project="${PRJPRE}-${PRJP}-retail-api-${randomnumber}"

gcloud services enable \
       logging.googleapis.com \
       monitoring.googleapis.com \
       retail.googleapis.com --project="${PRJPRE}-${PRJD}-retail-api-${randomnumber}"

gcloud services enable \
       logging.googleapis.com \
       monitoring.googleapis.com \
       retail.googleapis.com --project="${PRJPRE}-${PRJT}-retail-api-${randomnumber}"
                     

# Enable Services for Data Projects

gcloud services enable \
       dataflow.googleapis.com \
       bigquery.googleapis.com \
       bigquerystorage.googleapis.com \
       storage.googleapis.com --project="${PRJPRE}-${PRJP}-retail-api-${randomnumber}"

gcloud services enable \
       dataflow.googleapis.com \
       bigquery.googleapis.com \
       bigquerystorage.googleapis.com \
       storage.googleapis.com --project="${PRJPRE}-${PRJD}-retail-api-${randomnumber}"

gcloud services enable \
       dataflow.googleapis.com \
       bigquery.googleapis.com \
       bigquerystorage.googleapis.com \
       storage.googleapis.com --project="${PRJPRE}-${PRJT}-retail-api-${randomnumber}"


