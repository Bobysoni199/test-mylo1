name_prefix = "backend-mylo1"

enable_rds = true
db_password = "StrongPassword123!"

mylo1_tags = {
  Env     = "prod"
  Project = "WTW"
  Owner   = "Mylo1"
  Layer   = "backend"
  Author  = "Terraform"
  User    = "DevOps-Admin"
}

vpc_cidr        = "10.0.0.0/16"
azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

bucket_name         = "my-terraform-state-mumbai-backend"
dynamodb_table_name = "terraform-state-lock-backend"
region              = "ap-south-1"





