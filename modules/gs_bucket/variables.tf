#------------------------------------------------------------------------------#
#                                  gs variables                                #
#------------------------------------------------------------------------------#

variable "bucket_name" {
  type    = string
  description = "the name of the bucket will be ( bucket_name + UUID )"
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

