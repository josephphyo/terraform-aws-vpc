## AWS VPC Terraform module
#### Terraform module which creates VPC resources on AWS.

##### Usage

```
module "vpc" {
  source  = "josephphyo/vpc/aws"
  version = "0.1.2"
  
  region = "us-east-1"
  vpc_cidr = "192.168.0.0/16"
  public_sn_cidr = ["192.168.1.0/24", "192.168.2.0/24"]
  private_sn_cidr = ["192.168.3.0/24", "192.168.4.0/24"]
  dest_cidr_block_public_route = "0.0.0.0/0"
  dest_cidr_block_private_route = "0.0.0.0/0"
  is_one_nat_gw = true
}

```

##### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> v1.0.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.regional_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | n/a | `string` | `""` | no |
| <a name="input_dest_cidr_block_private_route"></a> [dest\_cidr\_block\_private\_route](#input\_dest\_cidr\_block\_private\_route) | Private route to NAT gateway | `string` | n/a | yes |
| <a name="input_dest_cidr_block_public_route"></a> [dest\_cidr\_block\_public\_route](#input\_dest\_cidr\_block\_public\_route) | Public route to internet | `string` | n/a | yes |
| <a name="input_is_one_nat_gw"></a> [is\_one\_nat\_gw](#input\_is\_one\_nat\_gw) | Only Create One NAT on public subnet | `bool` | n/a | yes |
| <a name="input_private_sn_cidr"></a> [private\_sn\_cidr](#input\_private\_sn\_cidr) | CIDR block for private subnet | `list(string)` | n/a | yes |
| <a name="input_public_sn_cidr"></a> [public\_sn\_cidr](#input\_public\_sn\_cidr) | CIDR block for public subnet | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region Variable | `string` | n/a | yes |
| <a name="input_regional_tag"></a> [regional\_tag](#input\_regional\_tag) | Tagging Variable | `string` | `"regional"` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | n/a | `string` | `""` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_id"></a> [private\_subnet\_id](#output\_private\_subnet\_id) | Private Subnet ID |
| <a name="output_public_subnet_id"></a> [public\_subnet\_id](#output\_public\_subnet\_id) | Public Subnet ID |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | VPC\_ARN |
