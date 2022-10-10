#------------------------------------------------------------------------------#
#                                 BigQuery Dataset                             #
#------------------------------------------------------------------------------#

resource "google_bigquery_dataset" "bq_dataset" {
  dataset_id                  = "${var.dataset_name}${count.index}${random_id.bq_random_id.hex}"
  friendly_name               = "${var.dataset_name}${count.index}"
  description                 = "This dataset is private"
  location                    = "${var.region}"
  count = var.resource_count
  access {
    role          = "READER"
    user_by_email = var.service_account_email
  }

}