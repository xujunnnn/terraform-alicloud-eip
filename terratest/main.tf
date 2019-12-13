data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  name       = "eip-example"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id            = alicloud_vpc.default.id
  cidr_block        = "172.16.0.0/16"
  availability_zone = data.alicloud_zones.default.zones[0].id
  name              = "eip-example"
}

resource "alicloud_slb" "default" {
  name          = "eip-example"
  vswitch_id    = alicloud_vswitch.default.id
  specification = "slb.s1.small"
}

module "eip" {
  source = "../"

  instance_id          = length(var.instance_id) == 0 ? alicloud_slb.default.id : var.instance_id
  name                 = var.name
  description          = var.description
  bandwidth            = var.bandwidth
  internet_charge_type = var.internet_charge_type
  instance_charge_type = var.instance_charge_type
  period               = var.period
  isp                  = length(var.isp) == 0 ? "" : var.isp
  instance_type        = length(var.instance_type) == 0 ? "" : var.instance_type

}
