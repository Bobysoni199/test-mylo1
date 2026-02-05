variable "bucket_name" {
  type = string
}

variable "dynamodb_table_name" {
  type = string
}

variable "region" {
  type = string
}

variable "mylo1_tags" {
  description = " tags from root"
  type        = map(string)
}

variable "name_prefix" {
  type = string
}