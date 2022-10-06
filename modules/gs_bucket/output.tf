#------------------------------------------------------------------------------#
#                                    Output                                    #
#------------------------------------------------------------------------------#


output "bucket_uri" {
    value = google_storage_bucket.bucket.self_link
    description = "The URI of the created resource."
}

output "bucket_url" {
    value = google_storage_bucket.bucket.url
    description = "The base URL of the bucket, in the format gs://<bucket-name>."
}