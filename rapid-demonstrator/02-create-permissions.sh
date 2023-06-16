#!/bin/bash

source variables.env

# Assign Project Creator role to Principals
# roles/resourcemanager.projectCreator

gcloud resource-manager folders add-iam-policy-binding $FOLDER_ID --member=${type}:${id1} --role=roles/resourcemanager.projectCreator
gcloud resource-manager folders add-iam-policy-binding $FOLDER_ID --member=${type}:${id2} --role=roles/resourcemanager.projectCreator
