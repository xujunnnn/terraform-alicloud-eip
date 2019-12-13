# terraform-alicloud-eip
Terraform module which creates Eip(elastic IP resource) on Alibaba Cloud.

These types of resources are supported:

* [Elastic IP ](https://www.terraform.io/docs/providers/alicloud/r/eip.html)
* [Alicloud EIP Association](https://www.terraform.io/docs/providers/alicloud/r/eip_association.html)
----------------------

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf

```hcl
module "slb-server-group" {
  source = "terraform-alicloud-modules/slb-server-group/alicloud"
  # The instance id to associate with the eip
  instance_id = "i-i2x9ke4tkk"
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


- backend server

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| server_ids  | A list of backend server ids  | string  |     | yes |
| port  | The port used by the backend server  | int  |     | yes |
| weight | Weight of the backend server | int  | 100  | no  |
| type  | Type of the backend server  | string  | ecs  | no  |
## Outputs

| Name | Description |
|------|-------------|
| this_slb_server_group_id  | slb server group id created  |
| this_slb_server_group_name  | slb server group name  |
| this_slb_server_group_servers  | slb server group backend servers  |

Authors
---------
Created and maintained by jun Xu.(@xj56, vega.xj@alibaba-inc.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)

