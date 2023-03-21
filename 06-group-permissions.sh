#!/bin/bash

# Assign Permissions to retail groups
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


source variables.env
randomnumber=`cat random.tmp`

#"${PRJPRE}-${PRJP}-retail-api-${randomnumber}"
#"${PRJPRE}-${PRJD}-retail-api-${randomnumber}"
#"${PRJPRE}-${PRJT}-retail-api-${randomnumber}"


#[retail-admin]
# Retail Admin Role 
#    roles/retail.admin
GROUP_EMAIL="retail-admin@${DOMAIN}"

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

