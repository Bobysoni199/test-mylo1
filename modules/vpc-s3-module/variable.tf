variable "vpc_cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "mylo1_tagstags" {
  description = "Common tags from root"
  type        = map(string)
}

variable "name_prefix" {
  type = string
}