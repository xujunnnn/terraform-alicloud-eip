# terraform-alicloud-eip
[中文文档]（README-ZH.md）

Terraform module which creates Eip(elastic IP resource) and associate the eip with a cloud instance on Alibaba Cloud.

These types of resources are supported:

* [Elastic IP ](https://www.terraform.io/docs/providers/alicloud/r/eip.html)
* [Alicloud EIP Association](https://www.terraform.io/docs/providers/alicloud/r/eip_association.html)
----------------------

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf

```hcl
module "eip" {
  source = "terraform-alicloud-modules/eip/alicloud"
  # The instance id to associate with the eip
  instance_id = "i-i2x9ke4tkk"
}
```

Create a eip and associate the eip with a SLB(server load balancer).
```hcl
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

  instance_id = alicloud_slb.default.id
}
```

2. Setting `region`, `access_key` and `secret_key` values through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

3. Get up and running

* Init phase

        terraform init

* Planning phase

        terraform plan

* Apply phase

        terraform apply

* Destroy

        terraform destroy

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name  | The name of the EIP instance. This name can have a string of 2 to 128 characters, must contain only alphanumeric characters or hyphens, such as -,.,_, and must not begin or end with a hyphen, and must not begin with http:// or https://. | string  | terraform-alicloud-eip  | no |
| description  | Description of the EIP instance, This description can have a string of 2 to 256 characters, It cannot begin with http:// or https://. Default value is null. | string  |""|   no  |
|bandwidth|Maximum bandwidth to the elastic public network, measured in Mbps (Mega bit per second). Default to 5 Mbps.|int|5|no|
|internet_charge_type|Internet charge type of the EIP, Valid values are PayByBandwidth, PayByTraffic. Default to PayByTraffic.|string|"PayByTraffic"|no|
|instance_charge_type|Elastic IP instance charge type. Valid values are PrePaid and PostPaid. Default to PostPaid.|string|"PostPaid"|no|
|period|The duration that you will buy the resource, in month. It is valid when instance_charge_type is PrePaid.Default to 1. Valid values: [1-9, 12, 24, 36]. At present, the provider does not support modify period and you can do that via web console.|int|1|no|
|isp|The line type of the Elastic IP instance. Default to BGP. Other type of the isp need to open a whitelist.|string|"BGP"|no|
|instance_id|The ID of the ECS or SLB instance or Nat Gateway.|string|   |yes|
|instance_type|The type of cloud product that the eip instance to bind.|string|""|no|
|private_ip_address|The private IP address in the network segment of the vswitch which has been assigned.|string|""|no|
|resource_group_id| The Id of resource group which the eip belongs to |string|""|no|
|tags| A mapping of tags to assign to the resource. |map(string)|{}|no|

## Outputs

| Name | Description |
|------|-------------|
| this_eip_id  | The eip id created  |
| this_eip_name  | The eip name created  |
| this_eip_description  | Description of the EIP instance  |
| this_eip_internet_charge_type|Internet charge type of the EIP|
| this_eip_instance_charge_type|Elastic IP instance charge type|
| this_eip_bandwidth|The elastic public network bandwidth |
| this_eip_isp |The line type of the Elastic IP instance |
| this_eip_status| The current status of the eip | 
| this_eip_address| The elastic ip address |
| this_eip_resource_group_id| The Id of resource group which the eip belongs to |
| this_eip_tags | Tags assigned to the eip|
| this_eip_association_instance_id | The instance id associated with the eip |
| this_eip_association_instance_type | The instance type associated with the eip |

Authors
---------
Created and maintained by jun Xu.(@xj56, vega.xj@alibaba-inc.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)

