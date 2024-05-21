variable "region" {
  description = "The region in which to create the resources"
  type = string
}

variable "project_id" {
  description = "The region in which to create the resources"
  type = string
  
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

variable "nginx_machine_type" {
  description = "The machine type for the VMs"
  type        = string
  default     = "n1-standard-1"
}

variable "nginx_image" {
  description = "The image to use for the VMs"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}


variable "github_machine_type" {
  description = "The machine type for the VMs"
  type        = string
  default     = "n1-standard-1"
}

variable "github_image" {
  description = "The image to use for the VMs"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "nginx_backend_name" {
  description = "Name of the Nginx backend service"
  type        = string
}

variable "github_backend_name" {
  description = "Name of the GitHub backend service"
  type        = string
}

variable "url_map_name" {
  description = "Name of the URL map"
  type        = string
}

variable "path_matcher_name" {
  description = "Name of the path matcher"
  type        = string
}

variable "lb_proxy_name" {
  description = "Name of the load balancer proxy"
  type        = string
}

variable "github_proxy_name" {
  description = "Name of the GitHub TCP proxy"
  type        = string
}

variable "http_lb_name" {
  description = "Name of the HTTP load balancer"
  type        = string
}

variable "https_lb_name" {
  description = "Name of the HTTPS load balancer"
  type        = string
}

variable "custom_https_lb_name" {
  description = "Name of the custom HTTPS load balancer"
  type        = string
}

variable "github_ssh_lb_name" {
  description = "Name of the GitHub SSH load balancer"
  type        = string
}
