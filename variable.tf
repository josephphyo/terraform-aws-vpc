variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}
variable "public_sn_cidr" {
  type        = list(string)
  description = "CIDR block for public subnet"
}

variable "private_sn_cidr" {
  type        = list(string)
  description = "CIDR block for private subnet"
}

variable "dest_cidr_block_public_route" {
  type        = string
  description = "Public route to internet"

}

variable "dest_cidr_block_private_route" {
  type        = string
  description = "Private route to NAT gateway"

}

variable "is_one_nat_gw" {
  type        = bool
  description = "Only Create One NAT on public subnet"
}

variable "regional_tag" {
  type        = string
  default     = "regional"
  description = "Tagging Variable"
}