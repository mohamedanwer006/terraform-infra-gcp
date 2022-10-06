GCP bigQuery dataset module
===
This module creates a bigQuery dataset

Usage
---


```tf

module "bq_dataset" {
  source                = "./modules/bigquery"
  count                 = 3
  dataset_name          = "bq_dataset_${count.index}_"
  region                = var.region
  service_account_email = google_service_account.bq_sa.email

}
```
