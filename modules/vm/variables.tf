#------------------------------------------------------------------------------#
#                                Variables                                     #
#------------------------------------------------------------------------------#

# vm name
variable "vm_name" {
    type = string
}       

# vm type
variable "vm_type" {
    type = string
}

# OS image
variable "vm_image" {
    type = string
}

# Zone
variable "zone" {
    type = string
}

# Tags
variable "tags" {
    type = set(string)
}

# Network name
variable "network_name" {
    type = string
}

# Subnet name
variable "subnet_name" {
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
