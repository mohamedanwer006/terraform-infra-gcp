#------------------------------------------------------------#
#                    Provider Configuration                  #   
#------------------------------------------------------------#

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.39.0"
    }
  }
}


provider "google" {
  # Configuration options
  project     = var.project_id
  region      = var.region
  credentials = "/home/mohamed/.config/gcloud/application_default_credentials.json"
}
