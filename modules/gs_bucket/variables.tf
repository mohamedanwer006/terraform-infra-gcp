#------------------------------------------------------------------------------#
#                                  gs variables                                #
#------------------------------------------------------------------------------#

variable "bucket_name" {
  type    = string
  description = "The name of the bucket will be ( bucket_name + random_id_8bytes )"
}

variable "region" {
    type = string
}

variable "storage_class" {
    type = string
    default = "STANDARD"
}

variable "versioning_enabled" {
    type = bool 
    default = false
}

