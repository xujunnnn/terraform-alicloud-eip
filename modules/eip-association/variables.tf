variable "allocation_id" {
  description = "The allocation EIP ID."
}

variable "instance_id" {
  description = "The ID of the ECS or SLB instance or Nat Gateway."
}

variable "instance_type" {
  description = " The type of cloud product that the eip instance to bind."
  default = ""
}

variable "private_ip_address" {
  description = "The private IP address in the network segment of the vswitch which has been assigned."
  default = ""
}

