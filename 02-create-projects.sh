#!/bin/bash
#
# Create Projects
#
# https://cloud.google.com/resource-manager/docs/creating-managing-projects#gcloud
#
# gcloud projects create PROJECT_ID --folder=FOLDER_ID
# gcloud beta billing projects link PROJECT_ID --billing-account=BILLING_ID

source variables.env

# Create Common Project
gcloud projects create "${PRJPRE}-${PRJC}-retail-${randomnumber}" --folder=$FOLDER_ID
gcloud beta billing projects link "${PRJPRE}-${PRJC}-retail-${randomnumber}" --billing-account=$BILLING_ID


# Create API Projects
gcloud projects create "${PRJPRE}-${PRJP}-retail-api-${randomnumber}" --folder=$FOLDER_ID
gcloud projects create "${PRJPRE}-${PRJD}-retail-api-${randomnumber}" --folder=$FOLDER_ID
gcloud projects create "${PRJPRE}-${PRJT}-retail-api-${randomnumber}" --folder=$FOLDER_ID

gcloud beta billing projects link "${PRJPRE}-${PRJP}-retail-api-${randomnumber}" --billing-account=$BILLING_ID
gcloud beta billing projects link "${PRJPRE}-${PRJD}-retail-api-${randomnumber}" --billing-account=$BILLING_ID
gcloud beta billing projects link "${PRJPRE}-${PRJT}-retail-api-${randomnumber}" --billing-account=$BILLING_ID

#Create Data Projects
gcloud projects create "${PRJPRE}-${PRJP}-retail-data-${randomnumber}" --folder=$FOLDER_ID
gcloud projects create "${PRJPRE}-${PRJD}-retail-data-${randomnumber}" --folder=$FOLDER_ID
gcloud projects create "${PRJPRE}-${PRJT}-retail-data-${randomnumber}" --folder=$FOLDER_ID

gcloud beta billing projects link "${PRJPRE}-${PRJP}-retail-data-${randomnumber}" --billing-account=$BILLING_ID
gcloud beta billing projects link "${PRJPRE}-${PRJD}-retail-data-${randomnumber}" --billing-account=$BILLING_ID
gcloud beta billing projects link "${PRJPRE}-${PRJT}-retail-data-${randomnumber}" --billing-account=$BILLING_ID
