<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform GCP SUBNET
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create SUBNET resource on GCP.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>






## Prerequisites

This module has a few dependencies:

- [Terraform 1.x.x](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/slovink/terraform-gcp-subnet/releases).


### Simple Example
Here is an example of how you can use this module in your inventory structure:
  ```hcl

module "subnet" {
  source = "../"

  name        = "dev"
  environment = var.environment
  label_order = var.label_order

  google_compute_subnetwork_enabled  = true
  google_compute_firewall_enabled    = true
  google_compute_router_nat_enabled  = true
  module_enabled                     = true
  network                            = module.vpc.vpc_id
  project_id                         = ""
  private_ip_google_access           = true
  allow                              = [{ "protocol" : "tcp", "ports" : ["1-65535"] }]
  source_ranges                      = ["10.10.0.0/16"]
  asn                                = 64514
  nat_ip_allocate_option             = "MANUAL_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  filter                             = "ERRORS_ONLY"
  dest_range                         = "0.0.0.0/0"
  next_hop_gateway                   = "default-internet-gateway"
  priority                           = 1000
  secondary_ip_ranges                = [{ "range_name" : "services", "ip_cidr_range" : "10.1.0.0/16" }, { "range_name" : "pods", "ip_cidr_range" : "10.3.0.0/16" }]
}
  ```



## Feedback
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/slovink/terraform-gcp-subnet/issues), or feel free to drop us an email at [devops@slovink.com](mailto:devops@slovink.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/slovink/terraform-gcp-subnet)!
