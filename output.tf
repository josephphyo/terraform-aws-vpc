output "vpc_arn" {
  value       = aws_vpc.regional_vpc.arn
  description = "VPC_ARN"
}

output "public_subnet_id" {
  value       = aws_subnet.public[*].id
  description = "Public Subnet ID"
}

output "private_subnet_id" {
  value       = aws_subnet.private[*].id
  description = "Private Subnet ID"
}
