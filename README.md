# GCP GitOps 
This repo implements GitOps approach with GCP Cloud Build and Terraform/Terragrunt

# NOTE 
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
