provider "google" {
  project = "local-concord-408802"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### module-vpc
#####==============================================================================
module "vpc" {
  source                                    = "slovink/vpc/google"
  version                                   = "1.0.1"
  name                                      = "app"
  environment                               = "test"
  routing_mode                              = "REGIONAL"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
}

#####==============================================================================
##### module-subnetwork
#####==============================================================================
module "subnet" {
  source        = "../"
  name          = "app"
  environment   = "test"
  subnet_names  = ["subnet-a", "subnet-b"]
  gcp_region    = "asia-northeast1"
  network       = module.vpc.vpc_id
  ip_cidr_range = ["10.10.1.0/24", "10.10.5.0/24"]
}