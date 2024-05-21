variable "region" {
  description = "The region in which to create the resources"
  type = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "The name of the VPC to create"
  type = string
  default     = "my-vpc"
}

variable "vpc_cidr" {
  description = "The CIDR range for the VPC (e.g., 172.31.0.0/16)"
  default     = "172.31.0.0/16"
}

variable "subnet_name" {
  description = "The name of the subnet to create"
  default     = "public-subnet"
}

variable "subnet_cidr" {
  description = "The CIDR range for the subnet (e.g., 172.31.1.0/24)"
  default     = "172.31.1.0/24"
}
