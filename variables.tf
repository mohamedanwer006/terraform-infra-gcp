#------------------------------------------------------------------------------#
#                                    Variables                                 #
#------------------------------------------------------------------------------#


#---------------------------#
#     Network variables     #
#---------------------------#

variable "vpc_name" {
  type    = string
  default = "vois-network"
}

variable "subnet_name" {
  type    = string
  default = "vois-subnet"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "default region us-central1"
}


