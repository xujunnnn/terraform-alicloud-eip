# alicloud_eip


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|allocation_id|The allocation EIP ID.| string|  |yes|
|instance_id|The ID of the ECS or SLB instance or Nat Gateway.|string|   |yes|
|instance_type|The type of cloud product that the eip instance to bind.|string|""|no|
|private_ip_address|The private IP address in the network segment of the vswitch which has been assigned.|string|""|no|

## Outputs

| Name | Description |
|------|-------------|
| this_eip_association_instance_id | The instance id associated with the eip |
| this_eip_association_instance_type | The instance type associated with the eip |