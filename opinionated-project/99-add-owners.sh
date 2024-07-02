#!/bin/bash

source variables.env

type="user"

# Assign owner role to principals
gcloud projects add-iam-policy-binding $PROJECT_ID --member=${type}:${id} --role=roles/owner
