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

variable "vpc_self_link" {
  
}

#variable "nginx_core_autoscaler.instance_group" {
#  description = "Instance group for Nginx core"
#  type        = string
#}

#variable "github_core.instance_group" {
#  description = "Instance group for GitHub core"
#  type        = string
#}
