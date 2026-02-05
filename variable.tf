variable "mylo1_tags" {
  description = "tags for all AWS resources"
  type        = map(string)

  default = {
    Env     = "prod"
    Project = "WTW"
    Owner   = "Mylo1"
    Author  = "Terraform"
    User    = "DevOps-Admin"
  }
}
# variables.tf in root module

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public Subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private Subnet CIDRs"
  type        = list(string)
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "bucket_name" {
  description = "Terraform backend S3 bucket name"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Terraform backend DynamoDB table name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "enable_rds" {
  description = "Enable RDS only for backend"
  type        = bool
  default     = false
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

