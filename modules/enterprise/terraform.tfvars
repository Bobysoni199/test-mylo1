name_prefix = "enterprise-mylo1"

enable_rds = false
mylo1_tags = {
  Env     = "prod"
  Project = "WTW"
  Owner   = "Mylo1"
  Layer   = "enterprise"
  Author  = "Terraform"
  User    = "DevOps-Admin"
  
}

vpc_cidr        = "10.1.0.0/16"
azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
public_subnets  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnets = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]

bucket_name         = "my-terraform-state-mumbai-enterprise"
dynamodb_table_name = "terraform-state-lock-enterprise"
region              = "ap-south-1"



