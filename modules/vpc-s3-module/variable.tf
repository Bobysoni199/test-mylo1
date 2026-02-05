variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "name_prefix" {
  description = "Prefix for naming AWS resources"
  type        = string
  default     = "wtw"
}

variable "bucket_name" {
  description = "S3 bucket name for Terraform backend"
  type        = string
  default     = "wtw-terraform-state-bucket"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
  default     = "wtw-terraform-locks"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
  default     = "TempPassword123!"
}

variable "mylo1_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Project = "wtw"
    Env     = "dev"
  }
}
