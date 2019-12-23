provider "alicloud" {
  version              = ">=1.56.0"
  region               = var.region != "" ? var.region : null
  configuration_source = "xujunnnn/terraform-alicloud-eip"
}

module "eip" {
  source = "./modules/eip"

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

module "eip-association" {
  source = "./modules/eip-association"

  allocation_id      = module.eip.this_eip_id
  instance_id        = var.instance_id
  instance_type      = var.instance_type
  private_ip_address = var.private_ip_address
}

