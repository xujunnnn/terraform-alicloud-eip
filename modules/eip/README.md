# alicloud_eip


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