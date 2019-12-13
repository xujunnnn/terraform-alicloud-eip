# terraform-alicloud-eip
该模块用于创建一个阿里云的弹性IP并将改弹性IP绑定至指定的SLB/ECS/NAT网关等实例

该模块支持以下类型的资源:

* [Elastic IP ](https://www.terraform.io/docs/providers/alicloud/r/eip.html)
* [Alicloud EIP Association](https://www.terraform.io/docs/providers/alicloud/r/eip_association.html)
----------------------

用例
-----
通过如下步骤在您的资源文件中应用该模块

1. 新建main.tf文，并在资源文件中通过引入如下代码来使用该模块:

```hcl
module "eip" {
  source = "terraform-alicloud-modules/eip/alicloud"
  # 需要绑定eip的ecs实例id
  instance_id = "i-i2x9ke4tkk"
}
```

您还可以通过使用一下代码来创建一个VPC类型的SLB实例，并为该实例分配一个弹性公网IP.
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

2. 在环境变量中设置一下字段:

    - ALICLOUD_ACCESS_KEY (您的阿里云账号ak)
    - ALICLOUD_SECRET_KEY (您的阿里云账号sk)
    - ALICLOUD_REGION (资源所在地域)

3. 运行以下命令：

* 初始化:

        terraform init

* 预览待创建资源:

        terraform plan

* 创建资源:

        terraform apply

* 销毁资源:

        terraform destroy

## 输入

| 名称 | 描述信息 | 参数类型 | 默认值 | 是否必传 |
|------|-------------|:----:|:-----:|:-----:|
| name  | 弹性公网IP实例的名称 | string  | terraform-alicloud-eip  | 否 |
| description  | 弹性公网IP实例的描述信息 | string  |""|   否  |
|bandwidth|弹性公网IP的最大带宽限制，单位为 Mbps |int|5|否|
|internet_charge_type| 弹性公网IP的网络计费类型, 包含按流量计费（PayByTraffic）,按带宽计费（PayByBandWidth）|string|"PayByTraffic"|否|
|instance_charge_type|弹性公网IP实例的实例计费类型, 包含预付费（PrePaid）,后付费（PostPaid）.|string|"PostPaid"|no|
|period|对于预付费类型实例的购买周期|int|1|否|
|isp|网络链路类型，默认为BGP类型，其他类型需要单独申请开通白名单.|string|"BGP"|否|
|instance_id|弹性公网IP绑定的资源id|string| 无  |是|
|instance_type|弹性公网IP绑定的资源类型.|string|""|否|
|private_ip_address|弹性公网IP所占用的用户私网IP|string|""|否|
|resource_group_id| 实例所属的资源组id |string|""|否|
|tags| 实例关联的标签列表. |map(string)|{}|否|

## Outputs

| 名称 | 描述信息 |
|------|-------------|
| this_eip_id  | 被创建的弹性公网IP实例的ID  |
| this_eip_name  | 被创建的弹性公网IP实例的名称  |
| this_eip_description  | 被创建的弹性公网IP实例的描述信息 |
| this_eip_internet_charge_type|实例的网络计费类型|
| this_eip_instance_charge_type|实例的资源计费类型|
| this_eip_bandwidth|弹性公网IP的最大带宽 |
| this_eip_isp |实例的线路类型 |
| this_eip_status| 实例的运行状态 | 
| this_eip_address| 弹性公网实例的IP地址 |
| this_eip_resource_group_id| 实例所属的资源组id |
| this_eip_tags | 实例关联的标签列表|
| this_eip_association_instance_id | 弹性公网IP所关联资源的资源ID |
| this_eip_association_instance_type | 弹性公网IP所关联资源的资源类型 |

作者信息
---------
该模块有 jun Xu 创建并维护.(@xj56, vega.xj@alibaba-inc.com)

参考链接
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)

