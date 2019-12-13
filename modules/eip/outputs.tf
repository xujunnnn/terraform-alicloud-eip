output "this_eip_id" {
  description = "The EIP ID."
  value = alicloud_eip.this.id
}

output "this_eip_name" {
  description = "The name of the EIP instance."
  value = alicloud_eip.this.name
}
output "this_eip_description" {
  value = alicloud_eip.this.description
}

output "this_eip_internet_charge_type" {
  value = alicloud_eip.this.internet_charge_type
}

output "this_eip_instance_charge_type" {
  value = alicloud_eip.this.instance_charge_type
}

output "this_eip_bandwidth" {
  description = "The elastic public network bandwidth."
  value = alicloud_eip.this.bandwidth
}

output "this_eip_isp" {
  value = alicloud_eip.this.isp
}


output "this_eip_status" {
  description = "The EIP current status."
  value = alicloud_eip.this.status
}

output "this_eip_address" {
  description = "The elastic ip address."
  value = alicloud_eip.this.ip_address
}

output "this_eip_resource_group_id" {
  value = alicloud_eip.this.resource_group_id
}

output "this_eip_tags" {
  value = alicloud_eip.this.tags
}



