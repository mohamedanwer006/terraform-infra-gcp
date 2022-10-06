#------------------------------------------------------------------------------#
#                                 BigQuery Dataset                             #
#------------------------------------------------------------------------------#

resource "google_bigquery_dataset" "bq_dataset" {
  dataset_id                  = "${var.dataset_name}${random_id.bq_random_id.hex}"
  friendly_name               = "${var.dataset_name}"
  description                 = "This dataset is private"
  location                    = "${var.region}"
 

  access {
    role          = "roles/bigquery.dataViewer"
    user_by_email = var.service_account_email
  }

}