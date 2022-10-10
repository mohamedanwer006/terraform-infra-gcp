#------------------------------------------------------------------------------#
#                                Dataset Variable                              #
#------------------------------------------------------------------------------#

variable "dataset_name" {
  type = string
}

variable "region" {
  type = string
}

variable "service_account_email" {
  type = string
}

variable "resource_count" {
  type= number
  default = 1
  description = "Number of instances of this resource, default=1"
}
