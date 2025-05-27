provider "google" {
  project = "testing-gcp-ops"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### module-vpc
#####==============================================================================
module "vpc" {
  source                                    = "git::https://github.com/slovink/terraform-google-network.git?ref=v1.0.0"
  name                                      = "ops"
  environment                               = "test"
  routing_mode                              = "REGIONAL"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
}

#####==============================================================================
##### module-subnetwork
#####==============================================================================
module "subnet" {
  source        = "../"
  name          = "ops"
  environment   = "test"
  subnet_names  = ["subnet-1", "subnet-2"]
  gcp_region    = "asia-northeast1"
  network       = module.vpc.id
  ip_cidr_range = ["10.10.1.0/24", "10.10.5.0/24"]
}