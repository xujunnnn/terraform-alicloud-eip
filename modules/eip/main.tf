resource "alicloud_eip" "this" {
  name                 = var.name
  description          = var.description
  bandwidth            = var.bandwidth
  internet_charge_type = var.internet_charge_type
  instance_charge_type = var.instance_charge_type
  period               = var.period
  isp                  = var.isp
  resource_group_id    = var.resource_group_id
  tags                 = var.tags
}