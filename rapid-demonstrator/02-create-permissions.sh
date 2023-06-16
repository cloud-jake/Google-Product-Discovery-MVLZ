#!/bin/bash

source variables.env

# Assign Project Creator role to Principals
# roles/resourcemanager.projectCreator

gcloud projects add-iam-policy-binding $PROJECT_ID --member=${type}:${id1} --role=roles/owner
gcloud projects add-iam-policy-binding $PROJECT_ID --member=${type}:${id2} --role=roles/owner
