provider "google" {
  project = "slovink-hyperscalers"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### module-vpc
#####==============================================================================
module "vpc" {
  source                                    = "git::https://github.com/slovink/terraform-google-network.git?ref=feature/upgrade-repo"
  name                                      = "app"
  environment                               = "test1"
  routing_mode                              = "REGIONAL"
  mtu                                       = 1500
  network_firewall_policy_enforcement_order = "BEFORE_CLASSIC_FIREWALL"
}

#####==============================================================================
##### module-subnetwork
#####==============================================================================
module "subnet" {
  source        = "../"
  name          = "application"
  environment   = "testing"
  subnet_names  = ["subnet-a", "subnet-b"]
  region        = "asia-northeast1"
  network       = module.vpc.vpc_id
  ip_cidr_range = ["10.10.1.0/24", "10.10.5.0/24"]
}