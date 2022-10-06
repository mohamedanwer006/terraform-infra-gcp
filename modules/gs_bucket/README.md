GCP google storage bucket module
===

This module creates a google storage bucket

Usage
---

```tf

module "gs_bucket" {
    source = "./modules/gs_bucket"
    bucket_name = "gs-bucket-name"
    region = "us-central1"
    storage_class = "STANDARD"
    versioning_enabled = false
}

```