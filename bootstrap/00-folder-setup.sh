#!/bin/bash
#
# Create folder structure within an organization
# and apply permissions to specified Principals
#
# gcloud resource-manager folders create \
#   --display-name=[FOLDER] \
#   --organization=[ORGANIZATION_ID]

# Name of Folder (3-30 characters)
#       123456789012345678901234567890
FOLDER="nnnnnnnn-Product-Discovery"

# Organization Number
ORGANIZATION_ID=""


# Principals for IAM roles
id1=""
id2=""

# Principal Type
type="user"
#type="group"


#####
# Uncomment the following if your account does not have permission 
# to create a folder in the specified organization
#
# myid="youremail@domain.com"
# gcloud organizations add-iam-policy-binding $organization  --member=user:$myid --role=roles/resourcemanager.folderAdmin

############################################################
# Create a folder at the Organization Level
gcloud resource-manager folders create \
   --display-name=$FOLDER \
   --organization=$ORGANIZATION_ID

FOLDER_ID=`gcloud resource-manager folders list --organization=$ORGANIZATION_ID --filter="display_name:${FOLDER}"  --format="value(name)"`
 
gcloud resource-manager folders add-iam-policy-binding $FOLDER_ID --member=$type:$id1 --role=roles/owner
gcloud resource-manager folders add-iam-policy-binding $FOLDER_ID --member=$type:$id2 --role=roles/owner
gcloud resource-manager folders add-iam-policy-binding $FOLDER_ID --member=$type:$id1 --role=roles/resourcemanager.folderAdmin
gcloud resource-manager folders add-iam-policy-binding $FOLDER_ID --member=$type:$id2 --role=roles/resourcemanager.folderAdmin

echo ""
echo "##############################################"
echo "Provide the following folder info to Kin+Carta" 
echo "FOLDER_ID=${FOLDER_ID}"
