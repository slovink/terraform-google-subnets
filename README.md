<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform google subnets
</h1>

<p align="center" style="font-size: 1.2rem;">
    Terraform module to create subnets resource on google.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.7.4-green" alt="Terraform">
</a>
<a href="https://github.com/slovink/terraform-google-subnets/blob/main/LICENSE">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>

</p>
<p align="center">

<a href='https://www.facebook.com/Slovink.in=https://github.com/slovink/terraform-lables'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/company/101534993/admin/feed/posts/=https://github.com/slovink/terraform-lables'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>

# Terraform-google-subnet
# Terraform Google Cloud Subnet Module

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [Author](#author)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)


## Introduction

This project deploys a Google Cloud infrastructure using Terraform to create Subnet .


## Usage

To get started, make sure you have configured your GCP provider. You can use the following code as a starting point:
## Example: subnets
```hcl
module "subnet" {
  source        = "git::https://github.com/slovink/terraform-google-subnets.git?ref=v1.0.0"
  name          = "ops"
  environment   = "test"
  subnet_names  = ["subnet-1", "subnet-2"]
  gcp_region    = "asia-northeast1"
  network       = module.vpc.vpc_id
  ip_cidr_range = ["10.10.1.0/24", "10.10.5.0/24"]
}
```
Make sure to configure the variables according to your requirements.


## Examples
For detailed examples on how to use this module, please refer to the [Examples](https://github.com/slovink/terraform-google-subnets/tree/master/example) directory within this repository.

## Author
Your Name Replace **MIT** and **slovink** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/slovink/terraform-google-subnets/blob/master/LICENSE) file for details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.9.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50.0, < 5.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.50.0, < 5.11.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::https://github.com/slovink/terraform-google-labels.git | add-precommit-136 |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_route.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route) | resource |
| [google_compute_router.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address"></a> [address](#input\_address) | List of addresses. | `list(string)` | `[]` | no |
| <a name="input_address_enabled"></a> [address\_enabled](#input\_address\_enabled) | Enable or disable address functionality. | `bool` | `true` | no |
| <a name="input_address_type"></a> [address\_type](#input\_address\_type) | Type of address to reserve (INTERNAL or EXTERNAL). | `string` | `"EXTERNAL"` | no |
| <a name="input_asn"></a> [asn](#input\_asn) | Local BGP Autonomous System Number (ASN). | `number` | `64514` | no |
| <a name="input_bgp_advertise_mode"></a> [bgp\_advertise\_mode](#input\_bgp\_advertise\_mode) | BGP advertisement mode (DEFAULT or CUSTOM). | `string` | `"CUSTOM"` | no |
| <a name="input_bgp_advertised_groups"></a> [bgp\_advertised\_groups](#input\_bgp\_advertised\_groups) | List of prefix groups to advertise in custom mode. | `list(string)` | `[]` | no |
| <a name="input_bgp_advertised_ip_ranges"></a> [bgp\_advertised\_ip\_ranges](#input\_bgp\_advertised\_ip\_ranges) | List of individual IP ranges to advertise in custom mode. | <pre>list(object({<br>    range       = string<br>    description = string<br>  }))</pre> | `[]` | no |
| <a name="input_bgp_keepalive_interval"></a> [bgp\_keepalive\_interval](#input\_bgp\_keepalive\_interval) | Interval in seconds between BGP keepalive messages. | `number` | `20` | no |
| <a name="input_description"></a> [description](#input\_description) | Optional description of the VPC. | `string` | `""` | no |
| <a name="input_drain_nat_ips"></a> [drain\_nat\_ips](#input\_drain\_nat\_ips) | A list of URLs of the IP resources to be drained. These IPs must be valid static external IPs that have been assigned to the NAT. | `list(string)` | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable or disable main functionality. | `bool` | `true` | no |
| <a name="input_encrypted_interconnect_router"></a> [encrypted\_interconnect\_router](#input\_encrypted\_interconnect\_router) | Indicates if the router is dedicated for encrypted VLAN attachments. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g., `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_icmp_idle_timeout_sec"></a> [icmp\_idle\_timeout\_sec](#input\_icmp\_idle\_timeout\_sec) | Timeout for ICMP connections (in seconds). | `number` | `30` | no |
| <a name="input_ip_cidr_range"></a> [ip\_cidr\_range](#input\_ip\_cidr\_range) | The range of internal addresses owned by this subnetwork. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | IP version (IPV4 or IPV6). | `string` | `"IPV4"` | no |
| <a name="input_ipv6_access_type"></a> [ipv6\_access\_type](#input\_ipv6\_access\_type) | IPv6 access type for the subnetwork. | `string` | `"EXTERNAL"` | no |
| <a name="input_ipv6_endpoint_type"></a> [ipv6\_endpoint\_type](#input\_ipv6\_endpoint\_type) | Endpoint type of the address (VM or NETLB). | `bool` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Order of labels for organizing resources. | `list(string)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_log_config"></a> [log\_config](#input\_log\_config) | Logging options for subnetwork flow logs. | <pre>object({<br>    enable               = optional(bool, false)<br>    aggregation_interval = optional(string)<br>    flow_sampling        = optional(number)<br>    metadata             = optional(string)<br>    metadata_fields      = optional(list(string))<br>    filter_expr          = optional(string)<br>  })</pre> | <pre>{<br>  "aggregation_interval": null,<br>  "enable": false,<br>  "filter_expr": null,<br>  "flow_sampling": null,<br>  "metadata": null,<br>  "metadata_fields": []<br>}</pre> | no |
| <a name="input_log_enable"></a> [log\_enable](#input\_log\_enable) | Enable or disable logging for NAT. | `bool` | `true` | no |
| <a name="input_log_filter"></a> [log\_filter](#input\_log\_filter) | Log filtering option (ERRORS\_ONLY, TRANSLATIONS\_ONLY, ALL). | `string` | `"ALL"` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'slovink | `string` | `"slovink"` | no |
| <a name="input_module_timeouts"></a> [module\_timeouts](#input\_module\_timeouts) | Timeout configurations for operations. | `any` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource, provided by the client when initially creating the resource. | `string` | `""` | no |
| <a name="input_nat_ip_allocate_option"></a> [nat\_ip\_allocate\_option](#input\_nat\_ip\_allocate\_option) | Specifies how NAT IPs should be allocated. Options are AUTO\_ONLY or MANUAL\_ONLY. | `string` | `"AUTO_ONLY"` | no |
| <a name="input_network"></a> [network](#input\_network) | The VPC network the subnets belong to. | `string` | `""` | no |
| <a name="input_network_tier"></a> [network\_tier](#input\_network\_tier) | Networking tier (PREMIUM or STANDARD). | `string` | `"PREMIUM"` | no |
| <a name="input_private_ip_google_access"></a> [private\_ip\_google\_access](#input\_private\_ip\_google\_access) | Enable private IP Google access for the subnetwork. | `bool` | `true` | no |
| <a name="input_private_ipv6_google_access"></a> [private\_ipv6\_google\_access](#input\_private\_ipv6\_google\_access) | Enable private IPv6 Google access for the subnetwork. | `bool` | `false` | no |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | Purpose of the resource (e.g., PRIVATE\_RFC\_1918, PRIVATE\_SERVICE\_CONNECT). | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Google Cloud region for the subnetwork. | `string` | `""` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repository. | `string` | `"https://github.com/slovink/terraform-google-subnet"` | no |
| <a name="input_route_enabled"></a> [route\_enabled](#input\_route\_enabled) | Flag to enable the route | `bool` | `true` | no |
| <a name="input_router_enabled"></a> [router\_enabled](#input\_router\_enabled) | Enable or disable the router. | `bool` | `true` | no |
| <a name="input_router_nat_enabled"></a> [router\_nat\_enabled](#input\_router\_nat\_enabled) | Enable or disable NAT functionality for the router. | `bool` | `true` | no |
| <a name="input_routes"></a> [routes](#input\_routes) | Map of routes to be created | <pre>map(object({<br>    description            = string<br>    tags                   = string<br>    destination_range      = string<br>    next_hop_internet      = string<br>    next_hop_ip            = string<br>    next_hop_instance      = string<br>    next_hop_instance_zone = string<br>    next_hop_vpn_tunnel    = string<br>    next_hop_ilb           = string<br>    priority               = number<br>  }))</pre> | <pre>{<br>  "route": {<br>    "description": "Subnet route to example",<br>    "destination_range": "0.0.0.0/0",<br>    "next_hop_ilb": null,<br>    "next_hop_instance": null,<br>    "next_hop_instance_zone": null,<br>    "next_hop_internet": "true",<br>    "next_hop_ip": null,<br>    "next_hop_vpn_tunnel": null,<br>    "priority": 1000,<br>    "tags": "test1 , test2"<br>  }<br>}</pre> | no |
| <a name="input_secondary_ip_ranges"></a> [secondary\_ip\_ranges](#input\_secondary\_ip\_ranges) | Secondary IP ranges for the subnetwork. | <pre>map(list(object({<br>    range_name    = string<br>    ip_cidr_range = string<br>  })))</pre> | `{}` | no |
| <a name="input_source_subnetwork_ip_ranges_to_nat"></a> [source\_subnetwork\_ip\_ranges\_to\_nat](#input\_source\_subnetwork\_ip\_ranges\_to\_nat) | NAT configuration per subnetwork. | `string` | `"ALL_SUBNETWORKS_ALL_IP_RANGES"` | no |
| <a name="input_stack_type"></a> [stack\_type](#input\_stack\_type) | Stack type (e.g., IPV4\_ONLY, IPV6\_ONLY, IPV4\_IPV6). | `string` | `"IPV4_ONLY"` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | The names of the subnets. | `list(string)` | `[]` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | URL of the subnetwork to reserve the address in. | `string` | `null` | no |
| <a name="input_subnetworks"></a> [subnetworks](#input\_subnetworks) | List of subnetworks with NAT configurations. | <pre>list(object({<br>    name                     = string<br>    source_ip_ranges_to_nat  = string<br>    secondary_ip_range_names = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_tcp_established_idle_timeout_sec"></a> [tcp\_established\_idle\_timeout\_sec](#input\_tcp\_established\_idle\_timeout\_sec) | Timeout for TCP established connections (in seconds). | `number` | `1200` | no |
| <a name="input_tcp_time_wait_timeout_sec"></a> [tcp\_time\_wait\_timeout\_sec](#input\_tcp\_time\_wait\_timeout\_sec) | Timeout for TCP connections in TIME\_WAIT state (in seconds). | `number` | `120` | no |
| <a name="input_tcp_transitory_idle_timeout_sec"></a> [tcp\_transitory\_idle\_timeout\_sec](#input\_tcp\_transitory\_idle\_timeout\_sec) | Timeout for TCP transitory connections (in seconds). | `number` | `30` | no |
| <a name="input_udp_idle_timeout_sec"></a> [udp\_idle\_timeout\_sec](#input\_udp\_idle\_timeout\_sec) | Timeout for UDP connections (in seconds). | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_creation_timestamp"></a> [address\_creation\_timestamp](#output\_address\_creation\_timestamp) | Creation timestamp of the GCP address in RFC3339 format. |
| <a name="output_address_effective_labels"></a> [address\_effective\_labels](#output\_address\_effective\_labels) | All labels (key/value pairs) currently applied to the resource. |
| <a name="output_address_id"></a> [address\_id](#output\_address\_id) | The ID of the GCP address in the format: projects/{{project}}/regions/{{region}}/addresses/{{name}} |
| <a name="output_address_name"></a> [address\_name](#output\_address\_name) | The name of the GCP address. |
| <a name="output_address_project"></a> [address\_project](#output\_address\_project) | The project of the GCP address. |
| <a name="output_address_region"></a> [address\_region](#output\_address\_region) | The region of the GCP address. |
| <a name="output_address_self_link"></a> [address\_self\_link](#output\_address\_self\_link) | The self\_link of the GCP address resource. |
| <a name="output_address_terraform_labels"></a> [address\_terraform\_labels](#output\_address\_terraform\_labels) | Labels that are directly configured on the resource, including default labels. |
| <a name="output_address_users"></a> [address\_users](#output\_address\_users) | The resources using this address. |
| <a name="output_route_id"></a> [route\_id](#output\_route\_id) | The name of the GCP route. |
| <a name="output_route_next_hop_network"></a> [route\_next\_hop\_network](#output\_route\_next\_hop\_network) | The next hop network of the GCP route. |
| <a name="output_route_self_link"></a> [route\_self\_link](#output\_route\_self\_link) | The self-link of the GCP route. |
| <a name="output_router_creation_timestamp"></a> [router\_creation\_timestamp](#output\_router\_creation\_timestamp) | The timestamp when the GCP router was created. |
| <a name="output_router_id"></a> [router\_id](#output\_router\_id) | The ID of the GCP router. |
| <a name="output_router_nat_id"></a> [router\_nat\_id](#output\_router\_nat\_id) | The project of the GCP router NAT configuration. |
| <a name="output_router_nat_name"></a> [router\_nat\_name](#output\_router\_nat\_name) | The name of the GCP router NAT configuration. |
| <a name="output_router_nat_region"></a> [router\_nat\_region](#output\_router\_nat\_region) | The region of the GCP router NAT configuration. |
| <a name="output_router_nat_router"></a> [router\_nat\_router](#output\_router\_nat\_router) | The router associated with the GCP router NAT configuration. |
| <a name="output_router_self_link"></a> [router\_self\_link](#output\_router\_self\_link) | The self-link of the GCP router. |
| <a name="output_subnet_creation_timestamp"></a> [subnet\_creation\_timestamp](#output\_subnet\_creation\_timestamp) | The timestamp when the GCP subnetwork was created. |
| <a name="output_subnet_external_ipv6_prefix"></a> [subnet\_external\_ipv6\_prefix](#output\_subnet\_external\_ipv6\_prefix) | The external IPv6 prefix of the GCP subnetwork. |
| <a name="output_subnet_gateway_address"></a> [subnet\_gateway\_address](#output\_subnet\_gateway\_address) | The gateway address of the GCP subnetwork. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the GCP subnetwork. |
| <a name="output_subnet_ipv6_cidr_range"></a> [subnet\_ipv6\_cidr\_range](#output\_subnet\_ipv6\_cidr\_range) | The IPv6 CIDR range of the GCP subnetwork. |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | The name of the GCP subnetwork. |
| <a name="output_subnet_self_link"></a> [subnet\_self\_link](#output\_subnet\_self\_link) | The self-link of the GCP subnetwork. |
<!-- END_TF_DOCS -->