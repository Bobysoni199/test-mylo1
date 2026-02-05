variable "cluster_id" {
  type = string
}

variable "service_name" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "name_prefix" {
  type = string
}
# variable "mylo1_tags" {
#   description = " tags from root"
#   type        = map(string)
# }