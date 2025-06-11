
# Outputs for google_compute_subnetwork
output "subnet_id" {
  description = "The ID of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork1[*].id)
}

output "subnet_name" {
  description = "The name of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork1[*].name)
}

output "subnet_creation_timestamp" {
  description = "The timestamp when the GCP subnetwork was created."
  value       = join("", google_compute_subnetwork.subnetwork1[*].creation_timestamp)
}

output "subnet_gateway_address" {
  description = "The gateway address of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork1[*].gateway_address)
}

output "subnet_ipv6_cidr_range" {
  description = "The IPv6 CIDR range of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork1[*].ipv6_cidr_range)
}

output "subnet_external_ipv6_prefix" {
  description = "The external IPv6 prefix of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork1[*].external_ipv6_prefix)
}

output "subnet_self_link" {
  description = "The self-link of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork1[*].self_link)
}

# Outputs for google_compute_route
output "route_id" {
  description = "The name of the GCP route."
  value       = [for r in google_compute_route.default1 : r.name]
}

output "route_next_hop_network" {
  description = "The next hop network of the GCP route."
  value       = [for r in google_compute_route.default1 : r.next_hop_gateway]
}

output "route_self_link" {
  description = "The self-link of the GCP route."
  value       = [for r in google_compute_route.default1 : r.self_link]
}

# Outputs for google_compute_router
output "router_id" {
  description = "The ID of the GCP router."
  value       = [for r in google_compute_router.default1 : r.id]
}

output "router_creation_timestamp" {
  description = "The timestamp when the GCP router was created."
  value       = join("", google_compute_router.default1[*].creation_timestamp)
}

output "router_self_link" {
  description = "The self-link of the GCP router."
  value       = join("", google_compute_router.default1[*].self_link)
}

# Outputs for google_compute_address
output "address_name" {
  description = "The name of the GCP address."
  value       = join("", google_compute_address.default1[*].name)
}

output "address_project" {
  description = "The project of the GCP address."
  value       = join("", google_compute_address.default1[*].project)
}

output "address_region" {
  description = "The region of the GCP address."
  value       = join("", google_compute_address.default1[*].region)
}

output "address_id" {
  description = "The ID of the GCP address in the format: projects/{{project}}/regions/{{region}}/addresses/{{name}}"
  value       = join("", google_compute_address.default1[*].id)
}

output "address_self_link" {
  description = "The self_link of the GCP address resource."
  value       = join("", google_compute_address.default1[*].self_link)
}

output "address_users" {
  description = "The resources using this address."
  value       = length(google_compute_address.default1) > 0 ? join("", google_compute_address.default1[0].users) : null
}

output "address_ip" {
  description = "The IP address that is reserved."
  value       = length(google_compute_address.default1) > 0 ? google_compute_address.default1[0].address : null
}

output "address_terraform_labels" {
  description = "Labels that are directly configured on the resource, including default labels."
  value = try(
    join(", ", [
      for k, v in lookup(google_compute_address.default1[0], "labels", {}) : "${k}=${v}"
    ]),
    "No labels"
  )
}

output "address_effective_labels" {
  description = "All labels (key/value pairs) currently applied to the resource."
  value = try(
    join(", ", [
      for k, v in lookup(google_compute_address.default1[0], "labels", {}) : "${k}=${v}"
    ]),
    "No labels"
  )
}

output "address_creation_timestamp" {
  description = "Creation timestamp of the GCP address in RFC3339 format."
  value       = join("", google_compute_address.default1[*].creation_timestamp)
}

# Outputs for google_compute_router_nat
output "router_nat_id" {
  description = "The project of the GCP router NAT configuration."
  value       = join("", google_compute_router_nat.nat[*].id)
}

output "router_nat_name" {
  description = "The name of the GCP router NAT configuration."
  value       = join("", google_compute_router_nat.nat[*].name)
}

output "router_nat_router" {
  description = "The router associated with the GCP router NAT configuration."
  value       = join("", google_compute_router_nat.nat[*].router)
}

output "router_nat_region" {
  description = "The region of the GCP router NAT configuration."
  value       = join("", google_compute_router_nat.nat[*].region)
}

#
#output "network_name" {
#  value = google_compute_network.
#}
#
#output "self_link" {
#  value = google_compute_network.vpc.self_link
#}
