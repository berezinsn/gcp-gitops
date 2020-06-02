terraform {
  backend "gcs" {
    bucket = "infra-cicd-279015-tfstate"
    prefix = "env/prod"
  }
}
