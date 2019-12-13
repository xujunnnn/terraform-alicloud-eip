output "this_eip_id" {
  description = "The EIP ID."
  value       = module.eip.this_eip_id
}

output "this_eip_name" {
  description = "The name of the EIP instance."
  value       = module.eip.this_eip_name
}
output "this_eip_description" {
  value = module.eip.this_eip_description
}

output "this_eip_internet_charge_type" {
  value = module.eip.this_eip_internet_charge_type
}

output "this_eip_instance_charge_type" {
  value = module.eip.this_eip_instance_charge_type
}

output "this_eip_bandwidth" {
  description = "The elastic public network bandwidth."
  value       = module.eip.this_eip_bandwidth
}

output "this_eip_isp" {
  value = module.eip.this_eip_isp
}


output "this_eip_status" {
  description = "The EIP current status."
  value       = module.eip.this_eip_status
}

output "this_eip_address" {
  description = "The elastic ip address."
  value       = module.eip.this_eip_address
}

output "this_eip_resource_group_id" {
  value = module.eip.this_eip_resource_group_id
}

output "this_eip_tags" {
  value = module.eip.this_eip_tags
}

output "this_eip_association_instance_id" {
  value = module.eip-association.this_eip_association_instance_id
}

output "this_eip_association_instance_type" {
  value = module.eip-association.this_eip_association_instance_type
}
