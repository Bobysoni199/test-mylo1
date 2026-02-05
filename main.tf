module "vpc" {
  source = "./modules/vpc-s3-module"

  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  mylo1_tagstags = var.mylo1_tags
  name_prefix = var.name_prefix
  
}

module "backend" {
  source = "./modules/backend-module"

  bucket_name           = var.bucket_name
  dynamodb_table_name   = var.dynamodb_table_name
  region                = var.region

  mylo1_tags = var.mylo1_tags
  name_prefix = var.name_prefix
}

module "ecs_sg" {
  source = "./modules/security-group-module-ecs"

  name   = "ecs-sg"
  vpc_id = module.vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

      
    }
  ]
  name_prefix = var.name_prefix
}

module "ecs_cluster" {
  source       = "./modules/ecs-module"
  cluster_name = "wtw-cluster"
  name_prefix = var.name_prefix
}

module "ecs_service" {
  source = "./modules/ecs-service-module"

  service_name       = "wtw-service"
  cluster_id         = module.ecs_cluster.cluster_id
  subnets            = module.vpc.private_subnet_ids
  security_group_id  = module.ecs_sg.sg_id

 name_prefix = var.name_prefix
}
# module "rds" {
#   count = var.enable_rds ? 1 : 0

#   source = "./modules/db-module"

#   name_prefix = var.name_prefix
#   vpc_id      = module.vpc.vpc_id
#   subnet_ids  = module.vpc.private_subnet_ids

#   db_name     = "backenddb"
#   db_username = "admin"
#   db_password = var.db_password

#   mylo1_tags  = var.mylo1_tags
# }

# module "aurora" {
#   source = "./modules/aurora-import-module"

#   cluster_identifier   = "wtw-aurora-cluster"
#   database_name        = "wtwdb"
#   master_username      = "postgres"
#   master_password      = "TEMP_PASSWORD_DO_NOT_CHANGE"

#   db_subnet_group_name = "wtw-db-subnet"
#   security_group_ids   = ["sg-0abc123456789"]

#   mylo1_tags = var.mylo1_tags
# }

# module "app_bucket" {
#   source      = "./modules/s3-import-module"
#   bucket_name = "wtw-backend"
#   mylo1_tags  = var.mylo1_tags
# }
# module "ecr_backend" {
#   source     = "./modules/ecr"
#   repo_name  = "wtw-backend"
#   mylo1_tags = var.mylo1_tags
# }

# module "ecr_enterprise" {
#   source     = "./modules/ecr"
#   repo_name  = "wtw-enterprise"
#   mylo1_tags = var.mylo1_tags
# }
