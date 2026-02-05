variable "cluster_identifier" {
  type = string
}

variable "engine_version" {
  type    = string
  default = "13.9"
}

variable "database_name" {
  type = string
}

variable "master_username" {
  type = string
}

variable "master_password" {
  type      = string
  sensitive = true
}

variable "db_subnet_group_name" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "instance_class" {
  type    = string
  default = "db.t3.medium"
}

variable "mylo1_tags" {
  type = map(string)
}
