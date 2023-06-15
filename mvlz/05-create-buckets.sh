#!/bin/bash

# Create Storage Buckets
# gsutil mb -l ${LOCATION} gs://${PROJECT_ID}-name


source variables.env
randomnumber=`cat random.tmp`

#"${PRJPRE}-${PRJP}-retail-api-${randomnumber}"
#"${PRJPRE}-${PRJD}-retail-api-${randomnumber}"
#"${PRJPRE}-${PRJT}-retail-api-${randomnumber}"

PROJECT_ID="${PRJPRE}-${PRJP}-retail-api-${randomnumber}"
GCS_EVENT="${PROJECT_ID}-event"
GCS_CATALOG="${PROJECT_ID}-catalog"
GCS_TEMP="${PROJECT_ID}-temp"
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_EVENT}
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_CATALOG}
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_TEMP}

PROJECT_ID="${PRJPRE}-${PRJD}-retail-api-${randomnumber}"
GCS_EVENT="${PROJECT_ID}-event"
GCS_CATALOG="${PROJECT_ID}-catalog"
GCS_TEMP="${PROJECT_ID}-temp"
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_EVENT}
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_CATALOG}
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_TEMP}

PROJECT_ID="${PRJPRE}-${PRJT}-retail-api-${randomnumber}"
GCS_EVENT="${PROJECT_ID}-event"
GCS_CATALOG="${PROJECT_ID}-catalog"
GCS_TEMP="${PROJECT_ID}-temp"
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_EVENT}
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_CATALOG}
gsutil mb -l ${LOCATION} -p ${PROJECT_ID} gs://${GCS_TEMP}
