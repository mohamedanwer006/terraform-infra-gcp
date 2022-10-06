#------------------------------------------------------------------------------#
#                                 gs bucket                                    #
#------------------------------------------------------------------------------#

resource "google_storage_bucket" "bucket" {
    
  name          = "${var.bucket_name}-${random_id.gs_random_id.hex}"
  location      = var.region
  force_destroy = true # force destroy bucket even if it's not empty

  #  When you enable uniform bucket-level access on a bucket, Access Control Lists (ACLs) are disabled,
  #  and only bucket-level Identity and Access Management (IAM) permissions grant access to that bucket
  #  and the objects it contains. You revoke all access granted by object ACLs and the ability to 
  #  administrate permissions using bucket ACLs.
  uniform_bucket_level_access = true

  storage_class = var.storage_class

  versioning {
    enabled = var.versioning_enabled
  }
}
