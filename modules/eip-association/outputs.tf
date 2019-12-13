output "this_eip_association_id" {
  description = "The allocation EIP ID."
  value = alicloud_eip_association.this.allocation_id
}

output "this_eip_association_instance_id" {
  description = "The ID of the ECS or SLB instance or Nat Gateway."
  value = alicloud_eip_association.this.instance_id
}

output "this_eip_association_instance_type" {
  value = alicloud_eip_association.this.instance_type
}
