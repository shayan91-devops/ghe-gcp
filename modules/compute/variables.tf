variable "region" {
  description = "The region where the resources will be created"
  type        = string
  default     = "us-central1"
}

variable "nginx_machine_type" {
  description = "The machine type for the nginx"
  type        = string
  default     = "n1-standard-1"
}

variable "nginx_image" {
  description = "The image to use for the nginx"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "github_machine_type" {
  description = "The machine type for the github"
  type = string
  default = "n1-standard-1"
}

variable "github_image" {
  description = "The image to use for the github"
  type = string
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "nginx_zone" {
  description = "The zone for the nginx_core VM"
  type        = string
  default     = "us-central1-a"
}

variable "github_zone" {
  description = "The zone for the github_core VM"
  type        = string
  default     = "us-central1-b"
}

variable "vpc_self_link" {
  description = "Self link of the VPC network"
  type        = string
}

