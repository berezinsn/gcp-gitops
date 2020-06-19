# GCP GitOps 
This repo implements GitOps approach with GCP Cloud Build and Terraform/Terragrunt

# Preparation note 
To start using SA, please, do the following:

1. Create GCP SA, grenerate the key, rename to account.json and place this in the root of the project in ./auth dir
2. Bind your credentials:
   ```sh
   GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/auth/account.json
   export GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/auth/account.json
   ```
3. Activate service account with JSON creds file
   ```sh
   gcloud auth activate-service-account --key-file=${GOOGLE_APPLICATION_CREDENTIALS}
   ```
4. Check authorized account (to check the correct account has been choosed)
   ```sh
   gcloud auth list
   ```
5. Determine the project you'd like to work with
   ```sh
   gcloud config set project PROJECT_ID
   ```
6. Prepare a bucket for TF states with a versioning enabled
   ```sh
   PROJECT_ID=$(gcloud config get-value project)
   gsutil mb gs://${PROJECT_ID}-tfstate
   gsutil versioning set on gs://${PROJECT_ID}-tfstate
   ```
7. Use manage.sh file for local testing

# Important note
Read the Cloud Build output log. If you job fails on the Plan step, please, check Cloud Build accout permissions.
Cloud Build executes your builds using a service account, a special Google account that executes builds on your behalf. The email for the Cloud Build service account is [PROJECT_NUMBER]@cloudbuild.gserviceaccount.com


# Permissions of the custom Role for the Cloud Build

- compute.networks.create
- compute.networks.get
- compute.networks.delete
- compute.subnetworks.create
- compute.networks.updatePolicy
- compute.subnetworks.get
- compute.subnetworks.delete
- compute.firewalls.create
- compute.zones.get
