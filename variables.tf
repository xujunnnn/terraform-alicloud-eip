variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}

variable "name" {
  description = "The name of the EIP instance. This name can have a string of 2 to 128 characters, must contain only alphanumeric characters or hyphens, such as -,.,_, and must not begin or end with a hyphen, and must not begin with http:// or https://."
  default     = "alicloud-eip"
}
variable "description" {
  description = "Description of the EIP instance, This description can have a string of 2 to 256 characters, It cannot begin with http:// or https://. Default value is null."
  default     = "created_by_terraform"
}

variable "bandwidth" {
  description = "Maximum bandwidth to the elastic public network, measured in Mbps (Mega bit per second). Default to 5 Mbps."
  default     = 5
}

variable "internet_charge_type" {
  description = "Internet charge type of the EIP, Valid values are PayByBandwidth, PayByTraffic. Default to PayByTraffic."
  default     = "PayByTraffic"
}

variable "instance_charge_type" {
  description = "Elastic IP instance charge type. Valid values are PrePaid and PostPaid. Default to PostPaid."
  default     = "PostPaid"
}

variable "period" {
  description = "The duration that you will buy the resource, in month. It is valid when instance_charge_type is PrePaid.Default to 1. Valid values: [1-9, 12, 24, 36]. At present, the provider does not support modify period and you can do that via web console."
  default     = 1
}

variable "isp" {
  description = "The line type of the Elastic IP instance. Default to BGP. Other type of the isp need to open a whitelist."
  default     = "BGP"
}

variable "instance_id" {
  description = "The ID of the ECS or SLB instance or Nat Gateway."
}

variable "instance_type" {
  description = "The type of cloud product that the eip instance to bind."
  default     = ""
}

variable "private_ip_address" {
  description = "The private IP address in the network segment of the vswitch which has been assigned."
  default     = ""
}