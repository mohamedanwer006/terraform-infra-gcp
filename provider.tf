#------------------------------------------------------------#
#                    Provider Configuration                  #   
#------------------------------------------------------------#

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.39.0"
    }
  }
}


provider "google" {
  # Configuration options
  project     = "anwer-gcp"
  region      = "us-central1"
  credentials = "/home/mohamed/.config/gcloud/application_default_credentials.json"
}
