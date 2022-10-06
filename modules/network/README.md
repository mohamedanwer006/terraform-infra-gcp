GCP Custom VPC Module
===

This module creates a custom VPC with a subnet and a firewall rule.

Usage
---

```v
module "vpc" {
  source      = "./modules/network"
  vpc_name    = "vpc_name"
  subnet_name = "subnet_name"
  subnet_cidr = "subnet_cidr"
  region      = "region"

}
```