variable "region" {
  type    = string
  default = "us-east-1"
}

variable "image" {
  default = "centos7"
  type    = string
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}
