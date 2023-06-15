#!/bin/bash

# Assign Permissions to retail groups
#
# Create Groups
#
#   gcloud identity groups create ${GROUP_EMAIL} --organization=${ORGANIZATION_ID} 
#
# https://cloud.google.com/retail/docs/iam
#
# Retail roles require the following GCP permissions:
#  - resourcemanager.projects.get
#  - resourcemanager.projects.list
#  - serviceusage.services.list
#  - serviceusage.services.get
#
# Apply the Service Usage Viewer role roles/serviceusage.serviceUsageViewer
#

source variables.env
randomnumber=`cat random.tmp`

#"${PRJPRE}-${PRJP}-retail-api-${randomnumber}"
#"${PRJPRE}-${PRJD}-retail-api-${randomnumber}"
#"${PRJPRE}-${PRJT}-retail-api-${randomnumber}"

# Set Project config variable to Common project
# "${PRJPRE}-${PRJC}-retail-${randomnumber}"
gcloud config set project "${PRJPRE}-${PRJC}-retail-${randomnumber}"

# Enable cloudidentity.googleapis.com service on Common project
gcloud services enable cloudidentity.googleapis.com  --project="${PRJPRE}-${PRJC}-retail-${randomnumber}"


#[retail-admin]
# Retail Admin Role 
#    roles/retail.admin
GROUP_EMAIL="retail-admin@${DOMAIN}"
gcloud identity groups create ${GROUP_EMAIL} --organization=${ORGANIZATION_ID}
PROJECT_ID="${PRJPRE}-${PRJP}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.admin
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer

PROJECT_ID="${PRJPRE}-${PRJD}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.admin
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer

PROJECT_ID="${PRJPRE}-${PRJT}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.admin
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer


#[retail-editor]
# Retail Editor Role
#    roles/retail.editor
GROUP_EMAIL="retail-editor@${DOMAIN}"
gcloud identity groups create ${GROUP_EMAIL} --organization=${ORGANIZATION_ID}
PROJECT_ID="${PRJPRE}-${PRJP}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer

PROJECT_ID="${PRJPRE}-${PRJD}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer

PROJECT_ID="${PRJPRE}-${PRJT}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer


#[retail-viewer]
# Retail Viewer Role
#    roles/retail.viewer
GROUP_EMAIL="retail-viewer@${DOMAIN}"
gcloud identity groups create ${GROUP_EMAIL} --organization=${ORGANIZATION_ID}
PROJECT_ID="${PRJPRE}-${PRJP}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer

PROJECT_ID="${PRJPRE}-${PRJD}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer

PROJECT_ID="${PRJPRE}-${PRJT}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer


## Custom Groups
#

#[retail-merchandising]
# Retail Editor role
#  All environments
#    roles/retail.editor
GROUP_EMAIL="retail-merchandising@${DOMAIN}"
gcloud identity groups create ${GROUP_EMAIL} --organization=${ORGANIZATION_ID}
#PROD
PROJECT_ID="${PRJPRE}-${PRJP}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer

#DEV
PROJECT_ID="${PRJPRE}-${PRJD}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer

#TEST
PROJECT_ID="${PRJPRE}-${PRJT}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer


#[retail-developer]
# Retail Developer role
#  NON-PROD
#    roles/retail.admin
#  PROD
#    roles/retail.viewer
#  ALL Projects
#    roles/monitoring.viewer
#    roles/monitoring.editor
#    roles/logging.viewer

GROUP_EMAIL="retail-developer@${DOMAIN}"
gcloud identity groups create ${GROUP_EMAIL} --organization=${ORGANIZATION_ID}
#PROD
PROJECT_ID="${PRJPRE}-${PRJP}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/logging.viewer

#DEV
PROJECT_ID="${PRJPRE}-${PRJD}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.admin
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/logging.viewer

#TEST
PROJECT_ID="${PRJPRE}-${PRJT}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.admin
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/logging.viewer


#[retail-operations]
# Retail Developer role
#  ALL Projects
#    roles/retail.viewer
#    roles/monitoring.viewer
#    roles/monitoring.editor
#    roles/logging.viewer

GROUP_EMAIL="retail-operations@${DOMAIN}"
gcloud identity groups create ${GROUP_EMAIL} --organization=${ORGANIZATION_ID}
#PROD
PROJECT_ID="${PRJPRE}-${PRJP}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/logging.viewer

#DEV
PROJECT_ID="${PRJPRE}-${PRJD}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/logging.viewer

#TEST
PROJECT_ID="${PRJPRE}-${PRJT}-retail-api-${randomnumber}"
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/retail.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/serviceusage.serviceUsageViewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.viewer
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/monitoring.editor
gcloud projects add-iam-policy-binding "${PROJECT_ID}" --member=group:${GROUP_EMAIL} --role=roles/logging.viewer

