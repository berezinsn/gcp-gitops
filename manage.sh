#!/bin/bash

set -ex

# https://cloud.google.com/docs/authentication/production#obtaining_and_providing_service_account_credentials_manually
GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/auth/account.json
export GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/auth/account.json

# activate service account with JSON creds file
gcloud auth activate-service-account --key-file=${GOOGLE_APPLICATION_CREDENTIALS}

# show authorized account (to check the correct account has been choosed)
gcloud auth list

cd ./env/dev/ 
#terraform init 
#terraform plan -var-file="terrafrom.tfvars"
#terraform apply -var-file="terrafrom.tfvars" -auto-approve
terraform destroy -var-file="terrafrom.tfvars" -auto-approve

cd ../prod
#terraform init
#terraform plan -var-file="terrafrom.tfvars"
#terraform apply -var-file="terrafrom.tfvars" -auto-approve
terraform destroy -var-file="terrafrom.tfvars" -auto-approve

