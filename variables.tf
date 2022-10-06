#------------------------------------------------------------------------------#
#                                    Variables                                 #
#------------------------------------------------------------------------------#

variable "project_id" {
  type    = string
  default = "anwer-gcp"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "default region us-central1"
}


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



#---------------------------#
#     vm variables          #
#---------------------------#

# vm name
variable "vm_name" {
  type    = string
  default = "test-vm"
}

# vm type
variable "vm_type" {
  type    = string
  default = "e2-micro"
}

# OS image
variable "vm_image" {
  default = "centos-cloud/centos-7"
  type    = string

}

# VM Zone
variable "vm_zone" {
  type    = string
  default = "us-central1-a"
}

# Tags
variable "tags" {
  type    = set(string)
  default = ["test-vm"]
}



